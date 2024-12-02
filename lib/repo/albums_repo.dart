import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/dependency/dependenies.dart';
import 'package:wings_dating_app/src/model/album_model.dart';
part 'albums_repo.g.dart';

@riverpod
AlbumsRepo albumsRepo(Ref ref) {
  return AlbumsRepo(ref: ref);
}

class AlbumsRepo {
  final Ref ref;
  AlbumsRepo({required this.ref});

  Future addAlbum(AlbumListModel albumList) async {
    final data = await ref.read(albumProvider).doc(albumList.id).set(albumList);

    return data;
  }

  Future<List<AlbumListModel>> getAllAlbums() async {
    final data = await ref
        .read(albumProvider)
        .whereUserId(isEqualTo: ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
        .get();

    final albumList = data.docs.map((e) => e.data).toList();

    return albumList;
  }
}

@riverpod
class AlbumClass extends _$AlbumClass {
  @override
  build() async {
    return await ref.read(albumsRepoProvider).getAllAlbums();
  }

  Future add(AlbumListModel albumList) async {
    final data = await ref.read(albumsRepoProvider).addAlbum(albumList);
    return data;
  }

  Future delete(String id) async {
    // final data = await ref.read(albumProvider).;
    // return data;
  }

  Future update(AlbumListModel albumList) async {
    final data = await ref.read(albumProvider).doc(albumList.id).get();

    return data;
  }
}
