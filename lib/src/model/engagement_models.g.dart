// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engagement_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EngagementStatus _$EngagementStatusFromJson(Map<String, dynamic> json) =>
    _EngagementStatus(
      hasTapped: json['hasTapped'] as bool? ?? false,
      hasLiked: json['hasLiked'] as bool? ?? false,
      hasSuperLiked: json['hasSuperLiked'] as bool? ?? false,
      isMatch: json['isMatch'] as bool? ?? false,
    );

Map<String, dynamic> _$EngagementStatusToJson(_EngagementStatus instance) =>
    <String, dynamic>{
      'hasTapped': instance.hasTapped,
      'hasLiked': instance.hasLiked,
      'hasSuperLiked': instance.hasSuperLiked,
      'isMatch': instance.isMatch,
    };

_ProfileVisitResponse _$ProfileVisitResponseFromJson(
  Map<String, dynamic> json,
) => _ProfileVisitResponse(
  status: json['status'] as String? ?? '',
  message: json['message'] as String? ?? '',
  visitCount: (json['visitCount'] as num?)?.toInt(),
  engagementStatus: json['engagementStatus'] == null
      ? null
      : EngagementStatus.fromJson(
          json['engagementStatus'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProfileVisitResponseToJson(
  _ProfileVisitResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'visitCount': instance.visitCount,
  'engagementStatus': instance.engagementStatus,
};

_TapResponse _$TapResponseFromJson(Map<String, dynamic> json) => _TapResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  remainingTaps: (json['remainingTaps'] as num?)?.toInt(),
  tappedBy:
      (json['tappedBy'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$TapResponseToJson(_TapResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'remainingTaps': instance.remainingTaps,
      'tappedBy': instance.tappedBy,
    };

_UserTapStats _$UserTapStatsFromJson(Map<String, dynamic> json) =>
    _UserTapStats(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      remainingTaps: (json['remainingTaps'] as num?)?.toInt() ?? 0,
      tappedBy:
          (json['tappedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      engagementStatus: json['engagementStatus'] == null
          ? null
          : EngagementStatus.fromJson(
              json['engagementStatus'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UserTapStatsToJson(_UserTapStats instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'remainingTaps': instance.remainingTaps,
      'tappedBy': instance.tappedBy,
      'engagementStatus': instance.engagementStatus,
    };

_TapDetails _$TapDetailsFromJson(Map<String, dynamic> json) => _TapDetails(
  id: json['id'] as String? ?? '',
  userId: json['userId'] as String? ?? '',
  targetUserId: json['targetUserId'] as String? ?? '',
  tappedAt: DateTime.parse(json['tappedAt'] as String),
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TapDetailsToJson(_TapDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'targetUserId': instance.targetUserId,
      'tappedAt': instance.tappedAt.toIso8601String(),
      'user': instance.user,
    };

_PaginatedTapResponse _$PaginatedTapResponseFromJson(
  Map<String, dynamic> json,
) => _PaginatedTapResponse(
  taps:
      (json['taps'] as List<dynamic>?)
          ?.map((e) => TapDetails.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$PaginatedTapResponseToJson(
  _PaginatedTapResponse instance,
) => <String, dynamic>{
  'taps': instance.taps,
  'total': instance.total,
  'page': instance.page,
  'totalPages': instance.totalPages,
};

_ProfileViewDetails _$ProfileViewDetailsFromJson(Map<String, dynamic> json) =>
    _ProfileViewDetails(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      targetUserId: json['targetUserId'] as String? ?? '',
      viewedAt: DateTime.parse(json['viewedAt'] as String),
      visitCount: (json['visitCount'] as num?)?.toInt() ?? 1,
      viewer: json['viewer'] == null
          ? null
          : UserModel.fromJson(json['viewer'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      viewDuration: (json['viewDuration'] as num?)?.toInt(),
      viewSource: json['viewSource'] as String?,
    );

Map<String, dynamic> _$ProfileViewDetailsToJson(_ProfileViewDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'targetUserId': instance.targetUserId,
      'viewedAt': instance.viewedAt.toIso8601String(),
      'visitCount': instance.visitCount,
      'viewer': instance.viewer,
      'user': instance.user,
      'viewDuration': instance.viewDuration,
      'viewSource': instance.viewSource,
    };

_PaginatedProfileViewsResponse _$PaginatedProfileViewsResponseFromJson(
  Map<String, dynamic> json,
) => _PaginatedProfileViewsResponse(
  views:
      (json['views'] as List<dynamic>?)
          ?.map((e) => ProfileViewDetails.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$PaginatedProfileViewsResponseToJson(
  _PaginatedProfileViewsResponse instance,
) => <String, dynamic>{
  'views': instance.views,
  'total': instance.total,
  'page': instance.page,
  'totalPages': instance.totalPages,
};

_VisitRecord _$VisitRecordFromJson(Map<String, dynamic> json) => _VisitRecord(
  id: json['id'] as String? ?? '',
  userId: json['userId'] as String? ?? '',
  targetUserId: json['targetUserId'] as String? ?? '',
  visitedAt: DateTime.parse(json['visitedAt'] as String),
  visitCount: (json['visitCount'] as num?)?.toInt() ?? 1,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VisitRecordToJson(_VisitRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'targetUserId': instance.targetUserId,
      'visitedAt': instance.visitedAt.toIso8601String(),
      'visitCount': instance.visitCount,
      'user': instance.user,
    };

_PaginatedVisitsResponse _$PaginatedVisitsResponseFromJson(
  Map<String, dynamic> json,
) => _PaginatedVisitsResponse(
  visits:
      (json['visits'] as List<dynamic>?)
          ?.map((e) => VisitRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$PaginatedVisitsResponseToJson(
  _PaginatedVisitsResponse instance,
) => <String, dynamic>{
  'visits': instance.visits,
  'total': instance.total,
  'page': instance.page,
  'totalPages': instance.totalPages,
};

_FavoriteResponse _$FavoriteResponseFromJson(Map<String, dynamic> json) =>
    _FavoriteResponse(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$FavoriteResponseToJson(_FavoriteResponse instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};

_UserAnalyticsResponse _$UserAnalyticsResponseFromJson(
  Map<String, dynamic> json,
) => _UserAnalyticsResponse(
  userId: json['userId'] as String? ?? '',
  profileViews: ProfileViewAnalytics.fromJson(
    json['profileViews'] as Map<String, dynamic>,
  ),
  matches: MatchAnalytics.fromJson(json['matches'] as Map<String, dynamic>),
  messages: MessageAnalytics.fromJson(json['messages'] as Map<String, dynamic>),
  discovery: DiscoveryAnalytics.fromJson(
    json['discovery'] as Map<String, dynamic>,
  ),
  location: LocationAnalytics.fromJson(
    json['location'] as Map<String, dynamic>,
  ),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  matchRate: (json['matchRate'] as num?)?.toDouble(),
);

Map<String, dynamic> _$UserAnalyticsResponseToJson(
  _UserAnalyticsResponse instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'profileViews': instance.profileViews,
  'matches': instance.matches,
  'messages': instance.messages,
  'discovery': instance.discovery,
  'location': instance.location,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'matchRate': instance.matchRate,
};

_ProfileViewAnalytics _$ProfileViewAnalyticsFromJson(
  Map<String, dynamic> json,
) => _ProfileViewAnalytics(
  total: (json['total'] as num?)?.toInt() ?? 0,
  daily: (json['daily'] as num?)?.toInt() ?? 0,
  weekly: (json['weekly'] as num?)?.toInt() ?? 0,
  monthly: (json['monthly'] as num?)?.toInt() ?? 0,
  byHour:
      (json['byHour'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
  byDay:
      (json['byDay'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
);

Map<String, dynamic> _$ProfileViewAnalyticsToJson(
  _ProfileViewAnalytics instance,
) => <String, dynamic>{
  'total': instance.total,
  'daily': instance.daily,
  'weekly': instance.weekly,
  'monthly': instance.monthly,
  'byHour': instance.byHour,
  'byDay': instance.byDay,
};

_MatchAnalytics _$MatchAnalyticsFromJson(Map<String, dynamic> json) =>
    _MatchAnalytics(
      total: (json['total'] as num?)?.toInt() ?? 0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      daily: (json['daily'] as num?)?.toInt() ?? 0,
      weekly: (json['weekly'] as num?)?.toInt() ?? 0,
      monthly: (json['monthly'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MatchAnalyticsToJson(_MatchAnalytics instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rate': instance.rate,
      'daily': instance.daily,
      'weekly': instance.weekly,
      'monthly': instance.monthly,
    };

_MessageAnalytics _$MessageAnalyticsFromJson(Map<String, dynamic> json) =>
    _MessageAnalytics(
      sent: (json['sent'] as num?)?.toInt() ?? 0,
      received: (json['received'] as num?)?.toInt() ?? 0,
      responseRate: (json['responseRate'] as num?)?.toDouble() ?? 0.0,
      averageResponseTime:
          (json['averageResponseTime'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$MessageAnalyticsToJson(_MessageAnalytics instance) =>
    <String, dynamic>{
      'sent': instance.sent,
      'received': instance.received,
      'responseRate': instance.responseRate,
      'averageResponseTime': instance.averageResponseTime,
    };

_DiscoveryAnalytics _$DiscoveryAnalyticsFromJson(Map<String, dynamic> json) =>
    _DiscoveryAnalytics(
      likesGiven: (json['likesGiven'] as num?)?.toInt() ?? 0,
      likesReceived: (json['likesReceived'] as num?)?.toInt() ?? 0,
      superLikesGiven: (json['superLikesGiven'] as num?)?.toInt() ?? 0,
      superLikesReceived: (json['superLikesReceived'] as num?)?.toInt() ?? 0,
      rewindCount: (json['rewindCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DiscoveryAnalyticsToJson(_DiscoveryAnalytics instance) =>
    <String, dynamic>{
      'likesGiven': instance.likesGiven,
      'likesReceived': instance.likesReceived,
      'superLikesGiven': instance.superLikesGiven,
      'superLikesReceived': instance.superLikesReceived,
      'rewindCount': instance.rewindCount,
    };

_LocationAnalytics _$LocationAnalyticsFromJson(Map<String, dynamic> json) =>
    _LocationAnalytics(
      activeHours:
          (json['activeHours'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      popularLocations:
          (json['popularLocations'] as List<dynamic>?)
              ?.map((e) => PopularLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LocationAnalyticsToJson(_LocationAnalytics instance) =>
    <String, dynamic>{
      'activeHours': instance.activeHours,
      'popularLocations': instance.popularLocations,
    };

_PopularLocation _$PopularLocationFromJson(Map<String, dynamic> json) =>
    _PopularLocation(
      coordinates:
          (json['coordinates'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PopularLocationToJson(_PopularLocation instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'count': instance.count,
    };
