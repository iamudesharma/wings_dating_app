// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlbumOwnerModel _$AlbumOwnerModelFromJson(Map<String, dynamic> json) =>
    _AlbumOwnerModel(
      id: json['id'] as String,
      username: json['username'] as String,
      profilePicture: json['profilePicture'] as String,
    );

const _$AlbumOwnerModelFieldMap = <String, String>{
  'id': 'id',
  'username': 'username',
  'profilePicture': 'profilePicture',
};

// ignore: unused_element
abstract class _$AlbumOwnerModelPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? username(String instance) => instance;
  // ignore: unused_element
  static Object? profilePicture(String instance) => instance;
}

Map<String, dynamic> _$AlbumOwnerModelToJson(_AlbumOwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profilePicture': instance.profilePicture,
    };
