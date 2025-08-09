// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_access_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlbumAccessRequestModel _$AlbumAccessRequestModelFromJson(
        Map<String, dynamic> json) =>
    _AlbumAccessRequestModel(
      id: json['_id'] as String?,
      albumId: json['albumId'] as String,
      requesterId: json['requesterId'] as String,
      message: json['message'] as String,
      status:
          $enumDecodeNullable(_$AccessRequestStatusEnumMap, json['status']) ??
              AccessRequestStatus.pending,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      albumOwnerId: json['albumOwnerId'] as String?,
      moderatorId: json['moderatorId'] as String?,
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
      rejectionReason: json['rejectionReason'] as String?,
      requester: json['requester'] == null
          ? null
          : UserModel.fromJson(json['requester'] as Map<String, dynamic>),
      albumOwner: json['albumOwner'] == null
          ? null
          : UserModel.fromJson(json['albumOwner'] as Map<String, dynamic>),
      album: json['album'] == null
          ? null
          : UserAlbumModel.fromJson(json['album'] as Map<String, dynamic>),
    );

const _$AlbumAccessRequestModelFieldMap = <String, String>{
  'id': '_id',
  'albumId': 'albumId',
  'requesterId': 'requesterId',
  'message': 'message',
  'status': 'status',
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
  'albumOwnerId': 'albumOwnerId',
  'moderatorId': 'moderatorId',
  'respondedAt': 'respondedAt',
  'rejectionReason': 'rejectionReason',
  'requester': 'requester',
  'albumOwner': 'albumOwner',
  'album': 'album',
};

// ignore: unused_element
abstract class _$AlbumAccessRequestModelPerFieldToJson {
  // ignore: unused_element
  static Object? id(String? instance) => instance;
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
  // ignore: unused_element
  static Object? albumOwnerId(String? instance) => instance;
  // ignore: unused_element
  static Object? moderatorId(String? instance) => instance;
  // ignore: unused_element
  static Object? respondedAt(DateTime? instance) => instance?.toIso8601String();
  // ignore: unused_element
  static Object? rejectionReason(String? instance) => instance;
  // ignore: unused_element
  static Object? requester(UserModel? instance) => instance?.toJson();
  // ignore: unused_element
  static Object? albumOwner(UserModel? instance) => instance?.toJson();
  // ignore: unused_element
  static Object? album(UserAlbumModel? instance) => instance?.toJson();
}

Map<String, dynamic> _$AlbumAccessRequestModelToJson(
        _AlbumAccessRequestModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'albumId': instance.albumId,
      'requesterId': instance.requesterId,
      'message': instance.message,
      'status': _$AccessRequestStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'albumOwnerId': instance.albumOwnerId,
      'moderatorId': instance.moderatorId,
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'rejectionReason': instance.rejectionReason,
      'requester': instance.requester?.toJson(),
      'albumOwner': instance.albumOwner?.toJson(),
      'album': instance.album?.toJson(),
    };

const _$AccessRequestStatusEnumMap = {
  AccessRequestStatus.pending: 'pending',
  AccessRequestStatus.approved: 'approved',
  AccessRequestStatus.rejected: 'rejected',
};

_AlbumRequestStats _$AlbumRequestStatsFromJson(Map<String, dynamic> json) =>
    _AlbumRequestStats(
      totalRequests: (json['totalRequests'] as num).toInt(),
      pendingRequests: (json['pendingRequests'] as num).toInt(),
      approvedRequests: (json['approvedRequests'] as num).toInt(),
      rejectedRequests: (json['rejectedRequests'] as num).toInt(),
      requestsToday: (json['requestsToday'] as num).toInt(),
      requestsThisWeek: (json['requestsThisWeek'] as num).toInt(),
      requestsThisMonth: (json['requestsThisMonth'] as num).toInt(),
      averageResponseTime: (json['averageResponseTime'] as num).toDouble(),
    );

Map<String, dynamic> _$AlbumRequestStatsToJson(_AlbumRequestStats instance) =>
    <String, dynamic>{
      'totalRequests': instance.totalRequests,
      'pendingRequests': instance.pendingRequests,
      'approvedRequests': instance.approvedRequests,
      'rejectedRequests': instance.rejectedRequests,
      'requestsToday': instance.requestsToday,
      'requestsThisWeek': instance.requestsThisWeek,
      'requestsThisMonth': instance.requestsThisMonth,
      'averageResponseTime': instance.averageResponseTime,
    };
