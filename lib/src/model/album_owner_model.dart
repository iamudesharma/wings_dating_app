import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_owner_model.freezed.dart';
part 'album_owner_model.g.dart';

@freezed
abstract class AlbumOwnerModel with _$AlbumOwnerModel {
  @JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true,
  )
  const factory AlbumOwnerModel({
    required String id,
    required String username,
    required String profilePicture,
  }) = _AlbumOwnerModel;

  factory AlbumOwnerModel.fromJson(Map<String, dynamic> json) => _$AlbumOwnerModelFromJson(json);
}
