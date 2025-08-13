import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_dating_app/src/model/album_owner_model.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
abstract class UserAlbumModel with _$UserAlbumModel {
  factory UserAlbumModel({
    required String ownerId,
    required String name,
    @Default(<String>[]) List<String> photos,
    @Default(<String>[]) List<String> sharedWith,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isShared,
    AlbumOwnerModel? owner,
    String? id,
  }) = _UserAlbumModel;

  factory UserAlbumModel.fromJson(Map<String, dynamic> json) {
    final map = Map<String, dynamic>.from(json);
    // prefer `id` but fall back to `_id`
    map['id'] = map['id'] ?? map['_id'];
    return _$UserAlbumModelFromJson(map);
  }

  Map<String, dynamic> toJson() => _$UserAlbumModelToJson(this as _UserAlbumModel);
}
