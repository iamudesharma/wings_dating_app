import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_analytics.freezed.dart';
part 'user_analytics.g.dart';

@freezed
abstract class UserAnalytics with _$UserAnalytics {
  const factory UserAnalytics({
    required String userId,
    required ProfileViewsAnalytics profileViews,
    required MatchesAnalytics matches,
    required MessagesAnalytics messages,
    required DiscoveryAnalytics discovery,
    required LocationAnalytics location,
    required DateTime lastUpdated,
    required DateTime createdAt,
    required DateTime updatedAt,
    double? matchRate,
  }) = _UserAnalytics;

  factory UserAnalytics.fromJson(Map<String, dynamic> json) =>
      _$UserAnalyticsFromJson(json);
}

@freezed
abstract class ProfileViewsAnalytics with _$ProfileViewsAnalytics {
  const factory ProfileViewsAnalytics({
    required int total,
    required int daily,
    required int weekly,
    required int monthly,
    required Map<String, int> byHour,
    required Map<String, int> byDay,
  }) = _ProfileViewsAnalytics;

  factory ProfileViewsAnalytics.fromJson(Map<String, dynamic> json) =>
      _$ProfileViewsAnalyticsFromJson(json);
}

@freezed
abstract class MatchesAnalytics with _$MatchesAnalytics {
  const factory MatchesAnalytics({
    required int total,
    required double rate,
    required int daily,
    required int weekly,
    required int monthly,
  }) = _MatchesAnalytics;

  factory MatchesAnalytics.fromJson(Map<String, dynamic> json) =>
      _$MatchesAnalyticsFromJson(json);
}

@freezed
abstract class MessagesAnalytics with _$MessagesAnalytics {
  const factory MessagesAnalytics({
    required int sent,
    required int received,
    required double responseRate,
    required double averageResponseTime,
  }) = _MessagesAnalytics;

  factory MessagesAnalytics.fromJson(Map<String, dynamic> json) =>
      _$MessagesAnalyticsFromJson(json);
}

@freezed
abstract class DiscoveryAnalytics with _$DiscoveryAnalytics {
  const factory DiscoveryAnalytics({
    required int likesGiven,
    required int likesReceived,
    required int superLikesGiven,
    required int superLikesReceived,
    required int rewindCount,
  }) = _DiscoveryAnalytics;

  factory DiscoveryAnalytics.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryAnalyticsFromJson(json);
}

@freezed
abstract class LocationAnalytics with _$LocationAnalytics {
  const factory LocationAnalytics({
    required Map<String, int> activeHours,
    required List<PopularLocation> popularLocations,
  }) = _LocationAnalytics;

  factory LocationAnalytics.fromJson(Map<String, dynamic> json) =>
      _$LocationAnalyticsFromJson(json);
}

@freezed
abstract class PopularLocation with _$PopularLocation {
  const factory PopularLocation({
    required List<double> coordinates,
    required int count,
  }) = _PopularLocation;

  factory PopularLocation.fromJson(Map<String, dynamic> json) =>
      _$PopularLocationFromJson(json);
}
