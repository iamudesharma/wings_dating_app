// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_access_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlbumAccessRequestModel _$AlbumAccessRequestModelFromJson(
        Map<String, dynamic> json) =>
    _AlbumAccessRequestModel(
      albumId: json['albumId'] as String,
      requesterId: json['requesterId'] as String,
      message: json['message'] as String,
      status:
          $enumDecodeNullable(_$AccessRequestStatusEnumMap, json['status']) ??
              AccessRequestStatus.pending,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

const _$AlbumAccessRequestModelFieldMap = <String, String>{
  'albumId': 'albumId',
  'requesterId': 'requesterId',
  'message': 'message',
  'status': 'status',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
};

// ignore: unused_element
abstract class _$AlbumAccessRequestModelPerFieldToJson {
  // ignore: unused_element
  static Object? albumId(String instance) => instance;
  // ignore: unused_element
  static Object? requesterId(String instance) => instance;
  // ignore: unused_element
  static Object? message(String instance) => instance;
  // ignore: unused_element
  static Object? status(AccessRequestStatus instance) =>
      _$AccessRequestStatusEnumMap[instance]!;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => instance.toIso8601String();
  // ignore: unused_element
  static Object? updatedAt(DateTime instance) => instance.toIso8601String();
}

Map<String, dynamic> _$AlbumAccessRequestModelToJson(
        _AlbumAccessRequestModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'requesterId': instance.requesterId,
      'message': instance.message,
      'status': _$AccessRequestStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$AccessRequestStatusEnumMap = {
  AccessRequestStatus.pending: 'pending',
  AccessRequestStatus.approved: 'approved',
  AccessRequestStatus.rejected: 'rejected',
};
