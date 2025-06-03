// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAlbumModel _$UserAlbumModelFromJson(Map<String, dynamic> json) =>
    _UserAlbumModel(
      ownerId: json['ownerId'] as String,
      name: json['name'] as String,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sharedWith: (json['sharedWith'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isShared: json['isShared'] as bool? ?? false,
      owner: json['owner'] == null
          ? null
          : AlbumOwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      id: json['_id'] as String?,
    );

const _$UserAlbumModelFieldMap = <String, String>{
  'ownerId': 'ownerId',
  'name': 'name',
  'photos': 'photos',
  'sharedWith': 'sharedWith',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
  'isShared': 'isShared',
  'owner': 'owner',
  'id': '_id',
};

// ignore: unused_element
abstract class _$UserAlbumModelPerFieldToJson {
  // ignore: unused_element
  static Object? ownerId(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? photos(List<String> instance) => instance;
  // ignore: unused_element
  static Object? sharedWith(List<String> instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => instance.toIso8601String();
  // ignore: unused_element
  static Object? updatedAt(DateTime instance) => instance.toIso8601String();
  // ignore: unused_element
  static Object? isShared(bool instance) => instance;
  // ignore: unused_element
  static Object? owner(AlbumOwnerModel? instance) => instance?.toJson();
  // ignore: unused_element
  static Object? id(String? instance) => instance;
}

Map<String, dynamic> _$UserAlbumModelToJson(_UserAlbumModel instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'name': instance.name,
      'photos': instance.photos,
      'sharedWith': instance.sharedWith,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isShared': instance.isShared,
      'owner': instance.owner?.toJson(),
      '_id': instance.id,
    };
