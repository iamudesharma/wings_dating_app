// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAnalytics _$UserAnalyticsFromJson(Map<String, dynamic> json) =>
    _UserAnalytics(
      userId: json['userId'] as String,
      profileViews: ProfileViewsAnalytics.fromJson(
          json['profileViews'] as Map<String, dynamic>),
      matches:
          MatchesAnalytics.fromJson(json['matches'] as Map<String, dynamic>),
      messages:
          MessagesAnalytics.fromJson(json['messages'] as Map<String, dynamic>),
      discovery: DiscoveryAnalytics.fromJson(
          json['discovery'] as Map<String, dynamic>),
      location:
          LocationAnalytics.fromJson(json['location'] as Map<String, dynamic>),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      matchRate: (json['matchRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserAnalyticsToJson(_UserAnalytics instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'profileViews': instance.profileViews,
      'matches': instance.matches,
      'messages': instance.messages,
      'discovery': instance.discovery,
      'location': instance.location,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'matchRate': instance.matchRate,
    };

_ProfileViewsAnalytics _$ProfileViewsAnalyticsFromJson(
        Map<String, dynamic> json) =>
    _ProfileViewsAnalytics(
      total: (json['total'] as num).toInt(),
      daily: (json['daily'] as num).toInt(),
      weekly: (json['weekly'] as num).toInt(),
      monthly: (json['monthly'] as num).toInt(),
      byHour: Map<String, int>.from(json['byHour'] as Map),
      byDay: Map<String, int>.from(json['byDay'] as Map),
    );

Map<String, dynamic> _$ProfileViewsAnalyticsToJson(
        _ProfileViewsAnalytics instance) =>
    <String, dynamic>{
      'total': instance.total,
      'daily': instance.daily,
      'weekly': instance.weekly,
      'monthly': instance.monthly,
      'byHour': instance.byHour,
      'byDay': instance.byDay,
    };

_MatchesAnalytics _$MatchesAnalyticsFromJson(Map<String, dynamic> json) =>
    _MatchesAnalytics(
      total: (json['total'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
      daily: (json['daily'] as num).toInt(),
      weekly: (json['weekly'] as num).toInt(),
      monthly: (json['monthly'] as num).toInt(),
    );

Map<String, dynamic> _$MatchesAnalyticsToJson(_MatchesAnalytics instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rate': instance.rate,
      'daily': instance.daily,
      'weekly': instance.weekly,
      'monthly': instance.monthly,
    };

_MessagesAnalytics _$MessagesAnalyticsFromJson(Map<String, dynamic> json) =>
    _MessagesAnalytics(
      sent: (json['sent'] as num).toInt(),
      received: (json['received'] as num).toInt(),
      responseRate: (json['responseRate'] as num).toDouble(),
      averageResponseTime: (json['averageResponseTime'] as num).toDouble(),
    );

Map<String, dynamic> _$MessagesAnalyticsToJson(_MessagesAnalytics instance) =>
    <String, dynamic>{
      'sent': instance.sent,
      'received': instance.received,
      'responseRate': instance.responseRate,
      'averageResponseTime': instance.averageResponseTime,
    };

_DiscoveryAnalytics _$DiscoveryAnalyticsFromJson(Map<String, dynamic> json) =>
    _DiscoveryAnalytics(
      likesGiven: (json['likesGiven'] as num).toInt(),
      likesReceived: (json['likesReceived'] as num).toInt(),
      superLikesGiven: (json['superLikesGiven'] as num).toInt(),
      superLikesReceived: (json['superLikesReceived'] as num).toInt(),
      rewindCount: (json['rewindCount'] as num).toInt(),
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
      activeHours: Map<String, int>.from(json['activeHours'] as Map),
      popularLocations: (json['popularLocations'] as List<dynamic>)
          .map((e) => PopularLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationAnalyticsToJson(_LocationAnalytics instance) =>
    <String, dynamic>{
      'activeHours': instance.activeHours,
      'popularLocations': instance.popularLocations,
    };

_PopularLocation _$PopularLocationFromJson(Map<String, dynamic> json) =>
    _PopularLocation(
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$PopularLocationToJson(_PopularLocation instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'count': instance.count,
    };
