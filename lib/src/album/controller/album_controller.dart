import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/repo/albums_repo.dart';
import 'package:wings_dating_app/src/model/album_model.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

part 'album_controller.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class AlbumController extends _$AlbumController {
  // Track images we've optimistically added but the server might not show yet
  final Set<String> _pendingAdded = <String>{};
  // Cache the albumId passed to this provider so we can act even if state isn't loaded yet
  String? _albumIdCache;
  @override
  FutureOr<UserAlbumModel> build(String id) async {
    try {
      // cache provider argument for later mutations that don't need full state
      _albumIdCache = id;
      final album = await ref.read(albumsRepoProvider).getAlbumsById(id);
      return album;
    } catch (e, st) {
      // Check if updated is null or throws
      throw AsyncError(e, st);
    }
  }

  Future<void> createAlbum(UserAlbumModel album) async {
    state = const AsyncLoading();
    try {
      final addedAlbum = await ref.read(albumsRepoProvider).addAlbum(album);
      if (addedAlbum != null) {
        state = AsyncData(addedAlbum);
      } else {
        throw Exception('Failed to create album');
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refreshAlbum(String albumId) async {
    logger.i('[AlbumController] refreshAlbum: albumId=$albumId');
    final previous = state.value;
    try {
      final refreshedAlbum = await ref.read(albumsRepoProvider).getAlbumsById(albumId, bypassCache: true);
      logger.i('[AlbumController] refreshAlbum: fetched photos=${refreshedAlbum.photos.length}');

      // If we have previous state, avoid downgrading to a stale snapshot.
      if (previous != null) {
        final prevUpdated = previous.updatedAt.millisecondsSinceEpoch;
        final refUpdated = refreshedAlbum.updatedAt.millisecondsSinceEpoch;
        final missingPending = _pendingAdded.isNotEmpty &&
            _pendingAdded.any((p) => previous.photos.contains(p)) &&
            !_pendingAdded.any((p) => refreshedAlbum.photos.contains(p));
        final looksStale =
            refUpdated < prevUpdated || refreshedAlbum.photos.length < previous.photos.length || missingPending;
        if (looksStale) {
          logger.w(
              '[AlbumController] refreshAlbum: server snapshot looks stale (prevPhotos=${previous.photos.length}, refPhotos=${refreshedAlbum.photos.length}). Keeping current state and retrying shortly.');
          _retryRefreshAlbum(albumId, attemptsLeft: 3, delay: const Duration(seconds: 1));
          return;
        }
      }

      state = AsyncData(refreshedAlbum);
    } catch (e, st) {
      logger.e('[AlbumController] refreshAlbum error: $e', error: e, stackTrace: st);
      state = AsyncError(e, st);
    }
  }

  void _retryRefreshAlbum(String albumId, {required int attemptsLeft, required Duration delay}) {
    if (attemptsLeft <= 0) return;
    Future<void>.delayed(delay, () async {
      try {
        final retry = await ref.read(albumsRepoProvider).getAlbumsById(albumId, bypassCache: true);
        logger.i('[AlbumController] refreshAlbum retry (left=${attemptsLeft - 1}): photos=${retry.photos.length}');
        final current = state.value;
        if (current != null) {
          final curUpdated = current.updatedAt.millisecondsSinceEpoch;
          final retryUpdated = retry.updatedAt.millisecondsSinceEpoch;
          final missingPending = _pendingAdded.isNotEmpty &&
              _pendingAdded.any((p) => current.photos.contains(p)) &&
              !_pendingAdded.any((p) => retry.photos.contains(p));
          final stillStale = retryUpdated < curUpdated || retry.photos.length < current.photos.length || missingPending;
          if (stillStale) {
            _retryRefreshAlbum(albumId, attemptsLeft: attemptsLeft - 1, delay: delay);
            return;
          }
        }
        state = AsyncData(retry);
      } catch (e) {
        logger.w('[AlbumController] refreshAlbum retry failed: $e');
      }
    });
  }

  Future<void> addImageToAlbum(String imageUrl) async {
    final currentAlbum = state.value;
    if (currentAlbum == null) {
      logger.w('[AlbumController] addImageToAlbum called but currentAlbum is null. imageUrl=$imageUrl');
      return;
    }

    // Optimistic update
    final newPhotos = [...currentAlbum.photos, imageUrl];
    logger.i(
        '[AlbumController] addImageToAlbum: albumId=${currentAlbum.id} ownerId=${currentAlbum.ownerId} newCount=${newPhotos.length} addedUrl=${imageUrl.substring(0, imageUrl.length > 64 ? 64 : imageUrl.length)}');
    final optimistic = currentAlbum.copyWith(
      photos: newPhotos,
      updatedAt: DateTime.now(),
    );
    state = AsyncData(optimistic);
    _pendingAdded.add(imageUrl);

    try {
      // Read-modify-write with latest snapshot to avoid clobbering when local is stale
      List<String> basePhotos = newPhotos;
      try {
        final latest = await ref.read(albumsRepoProvider).getAlbumsById(currentAlbum.id!, bypassCache: true);
        final prevUpdated = currentAlbum.updatedAt.millisecondsSinceEpoch;
        final latestUpdated = latest.updatedAt.millisecondsSinceEpoch;
        final latestHasMore = latest.photos.length > currentAlbum.photos.length;
        final isLocalStale = latestUpdated > prevUpdated || latestHasMore;
        if (isLocalStale) {
          // Merge: start from latest, ensure our new URL is included at the end, dedupe while preserving order
          final seen = <String>{};
          final merged = <String>[];
          void addIfNew(String p) {
            if (seen.add(p)) merged.add(p);
          }

          for (final p in latest.photos) {
            addIfNew(p);
          }
          for (final p in currentAlbum.photos) {
            addIfNew(p);
          }
          addIfNew(imageUrl);
          basePhotos = merged;
          logger.w(
              '[AlbumController] addImageToAlbum: detected stale local base. Merged latest(${latest.photos.length}) + local(${currentAlbum.photos.length}) -> ${basePhotos.length}');
        }
      } catch (e) {
        // Best-effort: if latest fetch fails, proceed with optimistic list
        logger.w('[AlbumController] addImageToAlbum: latest fetch failed, proceeding with optimistic list. $e');
      }
      final updated = await ref.read(albumsRepoProvider).updatePhotos(
            albumId: currentAlbum.id!,
            ownerId: currentAlbum.ownerId,
            photos: basePhotos,
          );
      if (updated != null) {
        logger.i('[AlbumController] addImageToAlbum: server accepted. photos=${updated.photos.length}');
        state = AsyncData(updated);
        if (updated.photos.contains(imageUrl)) {
          _pendingAdded.remove(imageUrl);
        }
      } else {
        // Server returned null/empty. Don't immediately overwrite the optimistic
        // state with an older server snapshot. Try a short polling loop to allow
        // eventual consistency on the backend, and only replace optimistic state
        // if the authoritative album contains our uploaded URL.
        logger.w(
            '[AlbumController] addImageToAlbum: server returned null data. Will poll for update before rolling back.');
        // Keep optimistic state for now (already set above).
        _pollForPhotoPresence(currentAlbum.id!, imageUrl);
      }
    } catch (e, st) {
      // Log and rollback to previous album state instead of switching to AsyncError.
      // This keeps the UI stable and preserves the optimistic UI while avoiding
      // a full error screen when a transient network/backend error occurs.
      logger.e('[AlbumController] addImageToAlbum error: $e', error: e, stackTrace: st);
      // Keep optimistic state and attempt to refresh/poll — an immediate
      // AsyncError would make the UI go into an error state and hide the album.
      _pollForPhotoPresence(currentAlbum.id!, imageUrl);
    }
  }

  // Poll the server a few times for the newly uploaded photo to appear.
  // This handles eventual-consistency delays where storage upload is fast
  // but the backend DB update is applied slightly later.
  void _pollForPhotoPresence(String albumId, String imageUrl) async {
    const int maxAttempts = 6;
    const Duration delayBetween = Duration(seconds: 1);
    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        await Future.delayed(delayBetween);
        final refreshed = await ref.read(albumsRepoProvider).getAlbumsById(albumId, bypassCache: true);
        logger.i('[AlbumController] pollForPhotoPresence attempt=$attempt fetched=${refreshed.photos.length}');
        if (refreshed.photos.contains(imageUrl)) {
          logger.i('[AlbumController] pollForPhotoPresence: photo detected on server. Updating state.');
          state = AsyncData(refreshed);
          _pendingAdded.remove(imageUrl);
          return;
        }
      } catch (e) {
        logger.w('[AlbumController] pollForPhotoPresence attempt=$attempt error: $e');
      }
    }
    // If still not visible after polling, keep optimistic state as-is but
    // log a warning. The user can still see the photo locally; a future
    // refresh (manual or hot restart) will pick up the server state.
    logger.w('[AlbumController] pollForPhotoPresence: photo not found after polling; keeping optimistic UI.');
  }

  Future<void> rename(String name) async {
    final current = state.value;
    if (current == null || current.id == null) return;

    final ownerId = current.ownerId;
    final optimistic = current.copyWith(name: name, updatedAt: DateTime.now());
    state = AsyncData(optimistic);
    try {
      final updated = await ref.read(albumsRepoProvider).renameAlbum(
            albumId: current.id!,
            ownerId: ownerId,
            name: name,
          );
      if (updated != null) {
        state = AsyncData(updated);
      } else {
        state = AsyncData(current); // rollback
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> removePhotos(Set<String> removeUrls) async {
    final current = state.value;
    if (current == null || current.id == null) return;
    final newPhotos = current.photos.where((p) => !removeUrls.contains(p)).toList(growable: false);
    logger.i(
        '[AlbumController] removePhotos: albumId=${current.id} removeCount=${removeUrls.length} newCount=${newPhotos.length}');
    state = AsyncData(current.copyWith(photos: newPhotos, updatedAt: DateTime.now()));
    try {
      final updated = await ref.read(albumsRepoProvider).updatePhotos(
            albumId: current.id!,
            ownerId: current.ownerId,
            photos: newPhotos,
          );
      if (updated != null) {
        logger.i('[AlbumController] removePhotos: server accepted. photos=${updated.photos.length}');
        state = AsyncData(updated);
      }
    } catch (e, st) {
      logger.e('[AlbumController] removePhotos error: $e', error: e, stackTrace: st);
      state = AsyncError(e, st);
    }
  }

  Future<void> reorderPhotos(List<String> ordered) async {
    final current = state.value;
    if (current == null || current.id == null) return;
    logger.i('[AlbumController] reorderPhotos: albumId=${current.id} count=${ordered.length}');
    state = AsyncData(current.copyWith(photos: ordered, updatedAt: DateTime.now()));
    try {
      final updated = await ref.read(albumsRepoProvider).updatePhotos(
            albumId: current.id!,
            ownerId: current.ownerId,
            photos: ordered,
          );
      if (updated != null) {
        logger.i('[AlbumController] reorderPhotos: server accepted. photos=${updated.photos.length}');
        state = AsyncData(updated);
      }
    } catch (e, st) {
      logger.e('[AlbumController] reorderPhotos error: $e', error: e, stackTrace: st);
      state = AsyncError(e, st);
    }
  }

  Future<void> shareWith(String userId) async {
    final current = state.value;
    if (current == null || current.id == null) return;
    try {
      final updated = await ref.read(albumsRepoProvider).shareAlbum(
            albumId: current.id!,
            userId: userId,
          );
      if (updated != null) {
        state = AsyncData(updated);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> stopSharingWith(String userId) async {
    final current = state.value;
    if (current == null || current.id == null) return;
    try {
      final updated = await ref.read(albumsRepoProvider).stopSharing(
            albumId: current.id!,
            userId: userId,
          );
      if (updated != null) {
        state = AsyncData(updated);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<Map<String, dynamic>?> requestAccess(String message, {String? albumId}) async {
    try {
      // Prefer explicit albumId, then loaded state id, then cached provider arg
      final targetAlbumId = albumId ?? state.value?.id ?? _albumIdCache;
      if (targetAlbumId == null) {
        logger.w('[AlbumController] requestAccess called without a resolvable albumId. Aborting.');
        return null;
      }
      final requesterId = ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
      final res = await ref.read(albumsRepoProvider).requestAccess(
            albumId: targetAlbumId,
            requesterId: requesterId,
            message: message,
          );
      return res;
    } catch (e, st) {
      // Do not transition album state to error for a request mutation failure
      logger.e('[AlbumController] requestAccess error: $e', error: e, stackTrace: st);
      return null;
    }
  }

  // Owner-facing: approve or reject a pending access request
  Future<Map<String, dynamic>?> moderateAccessRequest({
    required String requestId,
    required String action, // 'approve' | 'reject'
  }) async {
    try {
      final res = await ref.read(albumsRepoProvider).moderateAlbumAccessRequest(requestId: requestId, action: action);
      // After approval, refresh album to reflect new sharedWith if applicable
      final current = state.value;
      if (current != null && current.id != null) {
        await refreshAlbum(current.id!);
      }
      return res;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }
}
