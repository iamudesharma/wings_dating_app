import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_dating_app/src/model/album_owner_model.dart';
// import 'package:wings_dating_app/src/model/user_models.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
abstract class UserAlbumModel with _$UserAlbumModel {
  @JsonSerializable(
    explicitToJson: true,
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
  )
  const factory UserAlbumModel({
    required String ownerId,
    required String name,
    @Default([]) List<String> photos,
    @Default([]) List<String> sharedWith,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isShared,
    AlbumOwnerModel? owner,
    @JsonKey(name: "_id") String? id,
  }) = _UserAlbumModel;

  factory UserAlbumModel.fromJson(Map<String, dynamic> json) => _$UserAlbumModelFromJson(json);
}
