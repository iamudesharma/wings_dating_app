import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:wings_dating_app/src/model/user_models.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@Collection<AlbumListModel>('allbums')
@freezed
class AlbumListModel with _$AlbumListModel {
  @JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true,
  )
  const factory AlbumListModel({
    required List<String> imageUrls,
    required String name,
    required String userId,
    required String id,
  }) = _AlbumListModel;

  factory AlbumListModel.fromJson(Map<String, Object?> json) =>
      _$AlbumListModelFromJson(json);
}

// @Freezed(map: FreezedMapOptions.all, toStringOverride: true, toJson: true, fromJson: true)
// class AlbumModel with _$AlbumModel {
//   @JsonSerializable(
//     createToJson: true,
//     createFieldMap: true,
//     createPerFieldToJson: true,
//     explicitToJson: true,
//   )
//   const factory AlbumModel({
//     required String id,
//     required String path,
//   }) = _AlbumModel;

//   factory AlbumModel.fromJson(Map<String, Object?> json) => _$AlbumModelFromJson(json);
// }

final _albumRef = AlbumListModelCollectionReference();

// Define the provider that exposes the user collection reference.
final albumProvider = Provider<AlbumListModelCollectionReference>((ref) {
  return _albumRef;
});
