import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/const/http_templete.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/services/chat_services.dart';
import 'package:wings_dating_app/src/model/album_model.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
part 'albums_repo.g.dart';

@Riverpod(keepAlive: true)
class SharedAlbum extends _$SharedAlbum {
  @override
  FutureOr<List<GetMessageResponse>> build() async {
    final searchMap = await ref.read(chatClientProvider).search(
        Filter.and([
          Filter.equal("type", "messaging"),
          Filter.in_(
              'members', [ref.read(chatClientProvider).state.currentUser!.id]),
        ]),
        messageFilters: Filter.and([
          Filter.equal("attachments.type", "album"),
          Filter.notEqual(
              "user.id", ref.read(chatClientProvider).state.currentUser!.id)
        ]));

    return searchMap.results;
  }
}

@riverpod
AlbumsRepo albumsRepo(Ref ref) {
  return AlbumsRepo(ref: ref);
}

HttpTemplate httpTemplate = HttpTemplate();

class AlbumsRepo {
  final Ref ref;
  AlbumsRepo({required this.ref});

  Future<UserAlbumModel?> addAlbum(UserAlbumModel albumList) async {
    try {
      // Send only required fields to backend to avoid jsonEncode(DateTime) issues
      final payload = {
        "ownerId": albumList.ownerId,
        "name": albumList.name,
        "photos": albumList.photos,
      };
      final response = await httpTemplate.post("/albums", body: payload);
      final code = response["code"];
      final isSuccess = code is int && code >= 200 && code < 300;
      if (isSuccess) {
        return UserAlbumModel.fromJson(response["data"]);
      }
      return null;
    } catch (e) {
      return null;
    }
    // final data = await ref.read(albumProvider).doc(albumList.id).set(albumList);

    // return data;
  }

  // Get albums shared with a user (viewer)
  Future<List<UserAlbumModel>> getSharedAlbums({String? userId}) async {
    final viewerId =
        userId ?? ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
    final response = await httpTemplate.get("/albums/shared/$viewerId");

    if (response["code"] == 200) {
      final albumList = response["data"] as List<dynamic>;
      return albumList.map((e) => UserAlbumModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch shared albums: ${response["message"]}");
    }
  }

  /// List album access requests for the current owner (filtered client-side)
  /// Uses the admin listing endpoint which returns enriched request objects:
  /// { data: [ { albumId, requesterId, status, album: {...}, albumOwner: {...} } ], ... }
  Future<List<Map<String, dynamic>>> listAlbumAccessRequestsForOwner({
    String status = 'pending',
    String? ownerId,
  }) async {
    final currentOwnerId =
        ownerId ?? ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
    final response =
        await httpTemplate.get("/api/admin/album-requests?status=$status");

    if (response["code"] == 200) {
      // The admin endpoint wraps the array under data.data
      final payload = Map<String, dynamic>.from(response["data"]);
      final List<dynamic> items =
          List<dynamic>.from(payload["data"] ?? const []);
      // Filter only requests where current user is the album owner
      final filtered = items
          .where((raw) {
            final m = Map<String, dynamic>.from(raw as Map);
            final albumOwner = m["albumOwner"] as Map<String, dynamic>?;
            final ownerIdFromItem =
                albumOwner != null ? albumOwner["id"] as String? : null;
            return ownerIdFromItem == currentOwnerId;
          })
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
      return filtered;
    } else {
      throw Exception(
          "Failed to fetch album access requests: ${response["message"]}");
    }
  }

  /// Approve or reject an album access request
  Future<Map<String, dynamic>?> moderateAlbumAccessRequest({
    required String requestId,
    required String action, // 'approve' | 'reject'
    String? moderatorId,
  }) async {
    final modId = moderatorId ??
        ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
    final response = await httpTemplate.post(
      "/api/admin/album-requests/$requestId/moderate",
      body: {"action": action, "moderatorId": modId},
    );
    if (response["code"] == 200) {
      return Map<String, dynamic>.from(response["data"]);
    }
    return null;
  }

  /// Get a pending access request for a particular album by the given requester
  /// Returns the enriched request map or null if none exists
  Future<Map<String, dynamic>?> getPendingRequestForAlbum({
    required String albumId,
    String? requesterId,
  }) async {
    final reqId = requesterId ??
        ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
    final response =
        await httpTemplate.get("/api/admin/album-requests?status=pending");
    if (response["code"] == 200) {
      final payload = Map<String, dynamic>.from(response["data"]);
      final List<dynamic> items =
          List<dynamic>.from(payload["data"] ?? const []);
      for (final raw in items) {
        final m = Map<String, dynamic>.from(raw as Map);
        final aId = (m["albumId"] ?? m["album"]?['_id'])?.toString();
        final rId = m["requesterId"]?.toString();
        if (aId == albumId && rId == reqId) {
          return m;
        }
      }
      // Fallback: consult consolidated access-state, which prefers the album with a pending request
      try {
        // We need the ownerId to call the endpoint; fetch album details
        final album = await getAlbumsById(albumId);
        final ownerId = album.owner?.id ?? album.ownerId;
        final state =
            await getAlbumAccessState(ownerId: ownerId, viewerId: reqId);
        if (state.pending && state.albumId == albumId) {
          return {
            "albumId": albumId,
            "requesterId": reqId,
            "status": "pending"
          };
        }
      } catch (_) {}
      return null;
    } else {
      throw Exception(
          "Failed to fetch album access requests: ${response["message"]}");
    }
  }

  Future<UserAlbumModel?> updateAlbum(UserAlbumModel albumList) async {
    try {
      final response = await httpTemplate.put("/albums/${albumList.id}",
          body: albumList.toJson());

      if (response["code"] == 200) {
        // final albumList = response["data"] as List<dynamic>;

        // final data = albumList.map((e) => UserAlbumModel.fromJson(e)).toList();
        return UserAlbumModel.fromJson(response["data"]);
      } else {
        throw Exception("Failed to add album: ${response["message"]}");
      }
    } catch (e) {
      print("Error updating album: $e");
      return null;
      // TODO
    }
    // final data = await ref.read(albumProvider).doc(albumList.id).set(albumList);

    // return data;
  }

  // Rename album (owner only)
  Future<UserAlbumModel?> renameAlbum({
    required String albumId,
    required String ownerId,
    required String name,
  }) async {
    try {
      logger.i(
          '[AlbumsRepo] renameAlbum: albumId=$albumId ownerId=$ownerId name="$name"');
      final body = {
        "ownerId": ownerId,
        "updates": {"name": name},
      };
      final response = await httpTemplate.put("/albums/$albumId", body: body);
      final code = response["code"];
      final isSuccess = response["status"] == 'success' ||
          (code is int && code >= 200 && code < 300);
      if (isSuccess) {
        final data = response["data"];
        if (data == null) {
          // Some endpoints might return 204/empty body. Fetch album.
          logger.i(
              '[AlbumsRepo] updatePhotos: success with empty body. Fetching album...');
          try {
            return await getAlbumsById(albumId, bypassCache: true);
          } catch (e) {
            logger.w(
                '[AlbumsRepo] updatePhotos: fetch after empty body failed: $e');
            return null;
          }
        }
        return UserAlbumModel.fromJson(data);
      }
      logger.w(
          '[AlbumsRepo] renameAlbum failed: code=$code message=${response["message"]} details=${response["details"]}');
      return null;
    } catch (e) {
      logger.e('[AlbumsRepo] renameAlbum exception: $e');
      return null;
    }
  }

  // Update full photos array (owner only)
  Future<UserAlbumModel?> updatePhotos({
    required String albumId,
    required String ownerId,
    required List<String> photos,
  }) async {
    try {
      logger.i(
          '[AlbumsRepo] updatePhotos: albumId=$albumId ownerId=$ownerId count=${photos.length}');
      final body = {
        "ownerId": ownerId,
        "updates": {"photos": photos},
      };
      final response = await httpTemplate.put("/albums/$albumId", body: body);
      final code = response["code"];
      final isSuccess = response["status"] == 'success' ||
          (code is int && code >= 200 && code < 300);
      if (isSuccess) {
        final data = response["data"];
        if (data == null) {
          // Some endpoints might return 204/empty body. Fetch album with cache-bypass.
          logger.i(
              '[AlbumsRepo] updatePhotos: success with empty body. Fetching album (bypassCache=true)...');
          try {
            return await getAlbumsById(albumId, bypassCache: true);
          } catch (e) {
            logger.w(
                '[AlbumsRepo] updatePhotos: fetch after empty body failed: $e');
            return null;
          }
        }
        return UserAlbumModel.fromJson(data);
      }
      logger.w(
          '[AlbumsRepo] updatePhotos failed: code=$code message=${response["message"]} details=${response["details"]}');
      return null;
    } catch (e) {
      logger.e('[AlbumsRepo] updatePhotos exception: $e');
      return null;
    }
  }

  // Share album with a user (owner only)
  Future<UserAlbumModel?> shareAlbum({
    required String albumId,
    required String userId,
  }) async {
    try {
      final response = await httpTemplate
          .post("/albums/$albumId/share", body: {"userId": userId});
      if (response["code"] == 200) {
        // Fetch enriched album shape (with owner/isShared flags)
        return await getAlbumsById(albumId);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Stop sharing album with a user (owner only)
  Future<UserAlbumModel?> stopSharing({
    required String albumId,
    required String userId,
  }) async {
    try {
      final response =
          await httpTemplate.delete("/albums/$albumId/share/$userId");
      if (response["code"] == 200) {
        // Fetch enriched album after mutation
        return await getAlbumsById(albumId);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Request access to someone else's album (non-owner)
  Future<Map<String, dynamic>?> requestAccess({
    required String albumId,
    required String requesterId,
    required String message,
  }) async {
    try {
      final response = await httpTemplate.post(
        "/albums/$albumId/request-access",
        body: {
          "requesterId": requesterId,
          if (message.trim().isNotEmpty) "message": message.trim(),
        },
      );
      // Treat any 2xx as success (server may return 200, 201, etc.)
      final code = response["code"];
      final isSuccess = response["status"] == 'success' ||
          (code is int && code >= 200 && code < 300);
      if (isSuccess) {
        return Map<String, dynamic>.from(response["data"]);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<UserAlbumModel>> getAllAlbums({String? id}) async {
    final currentUserId =
        ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
    final response =
        await httpTemplate.get("/albums/user/${id ?? currentUserId}");

    if (response["code"] == 200) {
      final albumList = response["data"] as List<dynamic>;

      final data = albumList.map((e) => UserAlbumModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception("Failed to fetch albums: ${response["message"]}");
    }
  }

  Future<UserAlbumModel> getAlbumsById(String id,
      {bool bypassCache = false}) async {
    final uid = ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
    final ts =
        bypassCache ? '&_ts=${DateTime.now().millisecondsSinceEpoch}' : '';
    final endpoint = "/albums/$id?userId=$uid$ts";
    logger.i(
        '[AlbumsRepo] getAlbumsById: id=$id bypassCache=$bypassCache endpoint=$endpoint');
    final response = await httpTemplate.get(endpoint);

    if (response["code"] == 200) {
      // final albumList = response["data"] as List<dynamic>;

      // final data = albumList.map((e) => UserAlbumModel.fromJson(e)).toList();
      return UserAlbumModel.fromJson(response["data"]);
    } else {
      throw Exception("Failed to fetch albums: ${response["message"]}");
    }
  }

  // Consolidated access state call to avoid multiple requests
  Future<
      ({
        String? albumId,
        bool hasAlbum,
        bool canView,
        bool pending,
        bool isOwner
      })> getAlbumAccessState({
    required String ownerId,
    String? viewerId,
  }) async {
    final vid =
        viewerId ?? ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;
    final response = await httpTemplate
        .get("/albums/access-state?ownerId=$ownerId&viewerId=$vid");
    if (response["code"] == 200) {
      final data = Map<String, dynamic>.from(response["data"]);
      return (
        albumId: data['albumId']?.toString(),
        hasAlbum: data['hasAlbum'] == true,
        canView: data['canView'] == true,
        pending: data['pending'] == true,
        isOwner: data['isOwner'] == true,
      );
    } else {
      throw Exception(
          "Failed to fetch album access state: ${response["message"]}");
    }
  }
}

@riverpod
class AlbumClass extends _$AlbumClass {
  @override
  build() async {
    return await ref.read(albumsRepoProvider).getAllAlbums();
  }

  Future add(UserAlbumModel albumList) async {
    final data = await ref.read(albumsRepoProvider).addAlbum(albumList);
    return data;
  }

  Future delete(String id) async {
    // final data = await ref.read(albumProvider).;
    // return data;
  }

  Future update(UserAlbumModel albumList) async {
    final data = await ref.read(albumsRepoProvider).updateAlbum(albumList);
    return data;
  }
}
