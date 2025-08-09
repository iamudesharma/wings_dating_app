// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_engagement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEngagement _$UserEngagementFromJson(Map<String, dynamic> json) =>
    _UserEngagement(
      id: json['id'] as String,
      userId: json['userId'] as String,
      targetUserId: json['targetUserId'] as String,
      type: $enumDecode(_$EngagementTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      viewDuration: (json['viewDuration'] as num?)?.toInt(),
      viewSource: json['viewSource'] as String?,
      visitCount: (json['visitCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserEngagementToJson(_UserEngagement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'targetUserId': instance.targetUserId,
      'type': _$EngagementTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'viewDuration': instance.viewDuration,
      'viewSource': instance.viewSource,
      'visitCount': instance.visitCount,
    };

const _$EngagementTypeEnumMap = {
  EngagementType.profileView: 'profile_view',
  EngagementType.profileTap: 'profile_tap',
  EngagementType.like: 'like',
  EngagementType.superLike: 'super_like',
  EngagementType.match: 'match',
  EngagementType.message: 'message',
};

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      fromUserId: json['fromUserId'] as String?,
      message: json['message'] as String,
      isRead: json['isRead'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      fromUser: json['fromUser'] == null
          ? null
          : UserModel.fromJson(json['fromUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'fromUserId': instance.fromUserId,
      'message': instance.message,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'fromUser': instance.fromUser,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.profileView: 'profile_view',
  NotificationType.photoVerified: 'photo_verified',
  NotificationType.photoRejected: 'photo_rejected',
  NotificationType.profileTap: 'profile_tap',
  NotificationType.like: 'like',
  NotificationType.superLike: 'super_like',
  NotificationType.match: 'match',
  NotificationType.message: 'message',
};

_TapResult _$TapResultFromJson(Map<String, dynamic> json) => _TapResult(
      success: json['success'] as bool,
      message: json['message'] as String,
      remainingTaps: (json['remainingTaps'] as num?)?.toInt(),
      tappedBy: (json['tappedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      engagementStatus: json['engagementStatus'] == null
          ? null
          : EngagementStatus.fromJson(
              json['engagementStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TapResultToJson(_TapResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'remainingTaps': instance.remainingTaps,
      'tappedBy': instance.tappedBy,
      'engagementStatus': instance.engagementStatus,
    };

_TapStats _$TapStatsFromJson(Map<String, dynamic> json) => _TapStats(
      totalTaps: (json['totalTaps'] as num).toInt(),
      dailyTaps: (json['dailyTaps'] as num).toInt(),
      remainingTaps: (json['remainingTaps'] as num).toInt(),
      tappedBy:
          (json['tappedBy'] as List<dynamic>).map((e) => e as String).toList(),
      lastTapTime: DateTime.parse(json['lastTapTime'] as String),
      engagementStatus: json['engagementStatus'] == null
          ? null
          : EngagementStatus.fromJson(
              json['engagementStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TapStatsToJson(_TapStats instance) => <String, dynamic>{
      'totalTaps': instance.totalTaps,
      'dailyTaps': instance.dailyTaps,
      'remainingTaps': instance.remainingTaps,
      'tappedBy': instance.tappedBy,
      'lastTapTime': instance.lastTapTime.toIso8601String(),
      'engagementStatus': instance.engagementStatus,
    };

_EngagementStatus _$EngagementStatusFromJson(Map<String, dynamic> json) =>
    _EngagementStatus(
      hasTapped: json['hasTapped'] as bool,
      hasLiked: json['hasLiked'] as bool,
      isMatched: json['isMatched'] as bool,
      lastEngagement: json['lastEngagement'] == null
          ? null
          : DateTime.parse(json['lastEngagement'] as String),
    );

Map<String, dynamic> _$EngagementStatusToJson(_EngagementStatus instance) =>
    <String, dynamic>{
      'hasTapped': instance.hasTapped,
      'hasLiked': instance.hasLiked,
      'isMatched': instance.isMatched,
      'lastEngagement': instance.lastEngagement?.toIso8601String(),
    };

_ViewResult _$ViewResultFromJson(Map<String, dynamic> json) => _ViewResult(
      totalViews: (json['totalViews'] as num).toInt(),
      uniqueViewers: (json['uniqueViewers'] as num).toInt(),
      viewers: (json['viewers'] as List<dynamic>)
          .map((e) => ViewerInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViewResultToJson(_ViewResult instance) =>
    <String, dynamic>{
      'totalViews': instance.totalViews,
      'uniqueViewers': instance.uniqueViewers,
      'viewers': instance.viewers,
    };

_ViewerInfo _$ViewerInfoFromJson(Map<String, dynamic> json) => _ViewerInfo(
      userId: json['userId'] as String,
      viewCount: (json['viewCount'] as num).toInt(),
      lastViewed: DateTime.parse(json['lastViewed'] as String),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewerInfoToJson(_ViewerInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'viewCount': instance.viewCount,
      'lastViewed': instance.lastViewed.toIso8601String(),
      'user': instance.user,
    };

_MatchResult _$MatchResultFromJson(Map<String, dynamic> json) => _MatchResult(
      id: json['id'] as String,
      userId1: json['userId1'] as String,
      userId2: json['userId2'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isActive: json['isActive'] as bool,
      user1: json['user1'] == null
          ? null
          : UserModel.fromJson(json['user1'] as Map<String, dynamic>),
      user2: json['user2'] == null
          ? null
          : UserModel.fromJson(json['user2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchResultToJson(_MatchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId1': instance.userId1,
      'userId2': instance.userId2,
      'createdAt': instance.createdAt.toIso8601String(),
      'isActive': instance.isActive,
      'user1': instance.user1,
      'user2': instance.user2,
    };
