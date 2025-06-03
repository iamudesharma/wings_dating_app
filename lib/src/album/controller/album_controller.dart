import 'package:riverpod_annotation/riverpod_annotation.dart';
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
}
