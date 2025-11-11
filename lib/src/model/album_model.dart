import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wings_dating_app/src/model/album_owner_model.dart';

part 'album_model.g.dart';

part 'album_model.freezed.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class UserAlbumModel with _$UserAlbumModel {
  const UserAlbumModel({
    required this.ownerId,
    required this.name,
    this.photos = const <String>[],
    this.sharedWith = const <String>[],
    required this.createdAt,
    required this.updatedAt,
    this.isShared = false,
    this.owner,
    this.id,
  });
  @override
  final String ownerId;
  @override
  final String name;
  @override
  final List<String> photos;
  @override
  final List<String> sharedWith;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final bool isShared;
  @override
  final AlbumOwnerModel? owner;
  @override
  final String? id;

  factory UserAlbumModel.fromJson(Map<String, dynamic> json) {
    final map = Map<String, dynamic>.from(json);
    map['id'] = map['id'] ?? map['_id'];
    return _$UserAlbumModelFromJson(map);
  }

  Map<String, dynamic> toJson() => _$UserAlbumModelToJson(this);
}
