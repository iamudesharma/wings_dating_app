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
          const <String>[],
      sharedWith: (json['sharedWith'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isShared: json['isShared'] as bool? ?? false,
      owner: json['owner'] == null
          ? null
          : AlbumOwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

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
      'id': instance.id,
    };
