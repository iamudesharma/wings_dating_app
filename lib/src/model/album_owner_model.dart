import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_owner_model.freezed.dart';
part 'album_owner_model.g.dart';

@freezed
abstract class AlbumOwnerModel with _$AlbumOwnerModel {
  const factory AlbumOwnerModel({
    required String id,
    required String username,
    required String profilePicture,
  }) = _AlbumOwnerModel;

  factory AlbumOwnerModel.fromJson(Map<String, dynamic> json) {
    // Normalize nulls and support alternative payload keys
    final map = Map<String, dynamic>.from(json);
    map['id'] = (map['id'] ?? map['_id'] ?? '').toString();
    map['username'] = (map['username'] ?? map['name'] ?? '').toString();
    map['profilePicture'] =
        (map['profilePicture'] ?? map['profile_url'] ?? map['profileUrl'] ?? '').toString();
    return _$AlbumOwnerModelFromJson(map);
  }
}
