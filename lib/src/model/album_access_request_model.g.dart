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

const _$AlbumRequestStatsFieldMap = <String, String>{
  'totalRequests': 'totalRequests',
  'pendingRequests': 'pendingRequests',
  'approvedRequests': 'approvedRequests',
  'rejectedRequests': 'rejectedRequests',
  'requestsToday': 'requestsToday',
  'requestsThisWeek': 'requestsThisWeek',
  'requestsThisMonth': 'requestsThisMonth',
  'averageResponseTime': 'averageResponseTime',
};

// ignore: unused_element
abstract class _$AlbumRequestStatsPerFieldToJson {
  // ignore: unused_element
  static Object? totalRequests(int instance) => instance;
  // ignore: unused_element
  static Object? pendingRequests(int instance) => instance;
  // ignore: unused_element
  static Object? approvedRequests(int instance) => instance;
  // ignore: unused_element
  static Object? rejectedRequests(int instance) => instance;
  // ignore: unused_element
  static Object? requestsToday(int instance) => instance;
  // ignore: unused_element
  static Object? requestsThisWeek(int instance) => instance;
  // ignore: unused_element
  static Object? requestsThisMonth(int instance) => instance;
  // ignore: unused_element
  static Object? averageResponseTime(double instance) => instance;
}

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
