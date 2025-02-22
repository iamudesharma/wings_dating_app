import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/src/model/album_model.dart';

// part 'album_controller.g.dart';

part 'album_controller.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class AlbumController extends _$AlbumController {
  // List<String> albums = [];
  @override
  Future<AlbumListModel?> build(String? id) async {
    if (id == null) {
      return Future.value(null);
    } else {
      final albumList = await ref.read(albumProvider).doc(id).get();

      if (albumList.exists) {
        return albumList.data;
      }
      return Future.value(null);
    }
  }

  Future<void> addImage(String image) async {
    state = const AsyncLoading();

    await ref.read(albumProvider).doc(id).update(
      imageUrls: [...?state.value?.imageUrls, image],
    );
    // state = AsyncData(state..copyWith(imageUrls: [...?state.value?.imageUrls, image]));
    state = AsyncData(
        state.value?.copyWith(imageUrls: [...?state.value?.imageUrls, image]));
    // state = AsyncData(state);
    // Ensure that state.value is treated as List<String>
    // var newImage = [...(state.value as List<String>), image];
    // state = AsyncData(newImage);
    // state = AsyncData([...?state.value, image]);
  }

  Future<void> removeImage(String image) async {
    // state = const AsyncLoading();
    // // Ensure that state.value is treated as List<String>
    // var newTodos = state.value?..remove(image);
    // state = AsyncData(newTodos ?? []);
  }

  Future<void> createAlbum(AlbumListModel album) async {
    await ref.read(albumProvider).doc(album.id).set(album);
  }

  Future<void> updateAlbum(AlbumListModel album) async {
    await ref.read(albumProvider).doc(album.id).update(
          name: album.name,
        );

    state = AsyncData(album);
  }

  Future<bool> isAlbumExists(String id) async {
    final albumList = await ref.read(albumProvider).doc(id).get();
    return albumList.exists;
  }
}
