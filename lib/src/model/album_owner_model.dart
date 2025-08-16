import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_owner_model.g.dart';

part 'album_owner_model.freezed.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class AlbumOwnerModel with _$AlbumOwnerModel {
  const AlbumOwnerModel({
    required this.id,
    required this.username,
    required this.profilePicture,
  });
  @override
  final String id;
  @override
  final String username;
  @override
  final String profilePicture;

  factory AlbumOwnerModel.fromJson(Map<String, dynamic> json) {
    // Normalize nulls and support alternative payload keys
    final map = Map<String, dynamic>.from(json);
    map['id'] = (map['id'] ?? map['_id'] ?? '').toString();
    map['username'] = (map['username'] ?? map['name'] ?? '').toString();
    map['profilePicture'] =
        (map['profilePicture'] ?? map['profile_url'] ?? map['profileUrl'] ?? '')
            .toString();
    return _$AlbumOwnerModelFromJson(map);
  }

  Map<String, dynamic> toJson() => _$AlbumOwnerModelToJson(this);
}
