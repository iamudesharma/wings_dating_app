import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/repo/albums_repo.dart';
import 'package:wings_dating_app/src/model/album_model.dart';

part 'album_controller.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class AlbumController extends _$AlbumController {
  @override
  FutureOr<UserAlbumModel> build(String id) async {
    try {
      final album = await ref.read(albumsRepoProvider).getAlbumsById(id);
      return album;
    } catch (e, st) {
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
    state = const AsyncLoading();
    try {
      final refreshedAlbum = await ref.read(albumsRepoProvider).getAlbumsById(albumId);
      state = AsyncData(refreshedAlbum);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addImageToAlbum(String imageUrl) async {
    final currentAlbum = state.value;
    if (currentAlbum == null) return;

    final updatedAlbum = currentAlbum.copyWith(
      photos: [...currentAlbum.photos, imageUrl],
      updatedAt: DateTime.now(),
    );

    state = const AsyncLoading();

    try {
      await ref.read(albumsRepoProvider).updateAlbum(updatedAlbum);
      state = AsyncData(updatedAlbum);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
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
    state = AsyncData(current.copyWith(photos: newPhotos, updatedAt: DateTime.now()));
    try {
      final updated = await ref.read(albumsRepoProvider).updatePhotos(
            albumId: current.id!,
            ownerId: current.ownerId,
            photos: newPhotos,
          );
      if (updated != null) {
        state = AsyncData(updated);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> reorderPhotos(List<String> ordered) async {
    final current = state.value;
    if (current == null || current.id == null) return;
    state = AsyncData(current.copyWith(photos: ordered, updatedAt: DateTime.now()));
    try {
      final updated = await ref.read(albumsRepoProvider).updatePhotos(
            albumId: current.id!,
            ownerId: current.ownerId,
            photos: ordered,
          );
      if (updated != null) {
        state = AsyncData(updated);
      }
    } catch (e, st) {
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

  Future<Map<String, dynamic>?> requestAccess(String message) async {
    final current = state.value;
    if (current == null || current.id == null) return null;
    try {
      final requesterId = ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
      final res = await ref.read(albumsRepoProvider).requestAccess(
            albumId: current.id!,
            requesterId: requesterId,
            message: message,
          );
      return res;
    } catch (e, st) {
      state = AsyncError(e, st);
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
