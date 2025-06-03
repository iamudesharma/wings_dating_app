import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/const/http_templete.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/services/chat_services.dart';
import 'package:wings_dating_app/src/model/album_model.dart';
part 'albums_repo.g.dart';

@Riverpod(keepAlive: true)
class SharedAlbum extends _$SharedAlbum {
  @override
  FutureOr<List<GetMessageResponse>> build() async {
    final searchMap = await ref.read(chatClientProvider).search(
        Filter.and([
          Filter.equal("type", "messaging"),
          Filter.in_('members', [ref.read(chatClientProvider).state.currentUser!.id]),
        ]),
        messageFilters: Filter.and([
          Filter.equal("attachments.type", "album"),
          Filter.notEqual("user.id", ref.read(chatClientProvider).state.currentUser!.id)
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
    final currentUserId = ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;

    try {
      final response = await httpTemplate.post("/albums", body: albumList.toJson());

      if (response["code"] == 200) {
        // final albumList = response["data"] as List<dynamic>;

        // final data = albumList.map((e) => UserAlbumModel.fromJson(e)).toList();
        return UserAlbumModel.fromJson(response["data"]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
    // final data = await ref.read(albumProvider).doc(albumList.id).set(albumList);

    // return data;
  }

  Future<UserAlbumModel?> updateAlbum(UserAlbumModel albumList) async {
    final currentUserId = ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;

    try {
      final response = await httpTemplate.put("/albums/${albumList.id}", body: albumList.toJson());

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

  Future<List<UserAlbumModel>> getAllAlbums({String? id}) async {
    final currentUserId = ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;

    final response = await httpTemplate.get("/albums/user/${id ?? currentUserId}");

    if (response["code"] == 200) {
      final albumList = response["data"] as List<dynamic>;

      final data = albumList.map((e) => UserAlbumModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception("Failed to fetch albums: ${response["message"]}");
    }
  }

  Future<UserAlbumModel> getAlbumsById(String id) async {
    final response = await httpTemplate.get("/albums/$id?userId="
        "${ref.read(Dependency.firebaseAuthProvider).currentUser!.uid}");

    if (response["code"] == 200) {
      // final albumList = response["data"] as List<dynamic>;

      // final data = albumList.map((e) => UserAlbumModel.fromJson(e)).toList();
      return UserAlbumModel.fromJson(response["data"]);
    } else {
      throw Exception("Failed to fetch albums: ${response["message"]}");
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
