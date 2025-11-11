import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_models.dart';

part 'engagement_models.freezed.dart';
part 'engagement_models.g.dart';

/// Engagement status model containing interaction states between users
@freezed
abstract class EngagementStatus with _$EngagementStatus {
  const factory EngagementStatus({
    @Default(false) bool hasTapped,
    @Default(false) bool hasLiked,
    @Default(false) bool hasSuperLiked,
    @Default(false) bool isMatch,
  }) = _EngagementStatus;

  factory EngagementStatus.fromJson(Map<String, dynamic> json) =>
      _$EngagementStatusFromJson(json);
}

/// Profile visit response model
@freezed
abstract class ProfileVisitResponse with _$ProfileVisitResponse {
  const factory ProfileVisitResponse({
    @Default('') String status,
    @Default('') String message,
    int? visitCount,
    EngagementStatus? engagementStatus,
  }) = _ProfileVisitResponse;

  factory ProfileVisitResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileVisitResponseFromJson(json);
}

/// Tap operation response model
@freezed
abstract class TapResponse with _$TapResponse {
  const factory TapResponse({
    @Default(false) bool success,
    @Default('') String message,
    int? remainingTaps,
    @Default([]) List<String> tappedBy,
  }) = _TapResponse;

  factory TapResponse.fromJson(Map<String, dynamic> json) =>
      _$TapResponseFromJson(json);
}

/// User tap statistics model
@freezed
abstract class UserTapStats with _$UserTapStats {
  const factory UserTapStats({
    @Default(false) bool success,
    @Default('') String message,
    @Default(0) int remainingTaps,
    @Default([]) List<String> tappedBy,
    EngagementStatus? engagementStatus,
  }) = _UserTapStats;

  factory UserTapStats.fromJson(Map<String, dynamic> json) =>
      _$UserTapStatsFromJson(json);
}

/// Tap details model for individual tap records
@freezed
abstract class TapDetails with _$TapDetails {
  const factory TapDetails({
    @Default('') String id,
    @Default('') String userId,
    @Default('') String targetUserId,
    required DateTime tappedAt,
    UserModel? user,
  }) = _TapDetails;

  factory TapDetails.fromJson(Map<String, dynamic> json) =>
      _$TapDetailsFromJson(json);
}

/// Paginated tap response model
@freezed
abstract class PaginatedTapResponse with _$PaginatedTapResponse {
  const factory PaginatedTapResponse({
    @Default([]) List<TapDetails> taps,
    @Default(0) int total,
    @Default(1) int page,
    @Default(1) int totalPages,
  }) = _PaginatedTapResponse;

  factory PaginatedTapResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTapResponseFromJson(json);
}

/// Profile view details model
@freezed
abstract class ProfileViewDetails with _$ProfileViewDetails {
  const factory ProfileViewDetails({
    @Default('') String id,
    @Default('') String userId,
    @Default('') String targetUserId,
    required DateTime viewedAt,
    @Default(1) int visitCount,
    UserModel? viewer,
    UserModel? user,
    int? viewDuration,
    String? viewSource,
  }) = _ProfileViewDetails;

  factory ProfileViewDetails.fromJson(Map<String, dynamic> json) =>
      _$ProfileViewDetailsFromJson(json);
}

/// Paginated profile views response model
@freezed
abstract class PaginatedProfileViewsResponse
    with _$PaginatedProfileViewsResponse {
  const factory PaginatedProfileViewsResponse({
    @Default([]) List<ProfileViewDetails> views,
    @Default(0) int total,
    @Default(1) int page,
    @Default(1) int totalPages,
  }) = _PaginatedProfileViewsResponse;

  factory PaginatedProfileViewsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProfileViewsResponseFromJson(json);
}

/// Visit record model - enhanced version of existing VisitModel
@freezed
abstract class VisitRecord with _$VisitRecord {
  const VisitRecord._();

  const factory VisitRecord({
    @Default('') String id,
    @Default('') String userId,
    @Default('') String targetUserId,
    required DateTime visitedAt,
    @Default(1) int visitCount,
    UserModel? user,
  }) = _VisitRecord;

  factory VisitRecord.fromJson(Map<String, dynamic> json) =>
      _$VisitRecordFromJson(json);

  /// Format visit count for display
  /// Shows exact count for 1-10, then "10+" for more than 10
  String get formattedVisitCount {
    if (visitCount <= 10) {
      return visitCount.toString();
    } else {
      return '10+';
    }
  }

  /// Get visit count display text
  String get visitCountText {
    if (visitCount == 1) {
      return 'Visited once';
    } else if (visitCount <= 10) {
      return 'Visited $visitCount times';
    } else {
      return 'Visited 10+ times';
    }
  }
}

/// Paginated visits response model
@freezed
abstract class PaginatedVisitsResponse with _$PaginatedVisitsResponse {
  const factory PaginatedVisitsResponse({
    @Default([]) List<VisitRecord> visits,
    @Default(0) int total,
    @Default(1) int page,
    @Default(1) int totalPages,
  }) = _PaginatedVisitsResponse;

  factory PaginatedVisitsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedVisitsResponseFromJson(json);
}

/// Favorite operation response model
@freezed
abstract class FavoriteResponse with _$FavoriteResponse {
  const factory FavoriteResponse({
    @Default('') String status,
    @Default('') String message,
  }) = _FavoriteResponse;

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);
}

/// User analytics response model
@freezed
abstract class UserAnalyticsResponse with _$UserAnalyticsResponse {
  const factory UserAnalyticsResponse({
    @Default('') String userId,
    required ProfileViewAnalytics profileViews,
    required MatchAnalytics matches,
    required MessageAnalytics messages,
    required DiscoveryAnalytics discovery,
    required LocationAnalytics location,
    required DateTime lastUpdated,
    double? matchRate,
  }) = _UserAnalyticsResponse;

  factory UserAnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAnalyticsResponseFromJson(json);
}

@freezed
abstract class ProfileViewAnalytics with _$ProfileViewAnalytics {
  const factory ProfileViewAnalytics({
    @Default(0) int total,
    @Default(0) int daily,
    @Default(0) int weekly,
    @Default(0) int monthly,
    @Default({}) Map<String, int> byHour,
    @Default({}) Map<String, int> byDay,
  }) = _ProfileViewAnalytics;

  factory ProfileViewAnalytics.fromJson(Map<String, dynamic> json) =>
      _$ProfileViewAnalyticsFromJson(json);
}

@freezed
abstract class MatchAnalytics with _$MatchAnalytics {
  const factory MatchAnalytics({
    @Default(0) int total,
    @Default(0.0) double rate,
    @Default(0) int daily,
    @Default(0) int weekly,
    @Default(0) int monthly,
  }) = _MatchAnalytics;

  factory MatchAnalytics.fromJson(Map<String, dynamic> json) =>
      _$MatchAnalyticsFromJson(json);
}

@freezed
abstract class MessageAnalytics with _$MessageAnalytics {
  const factory MessageAnalytics({
    @Default(0) int sent,
    @Default(0) int received,
    @Default(0.0) double responseRate,
    @Default(0.0) double averageResponseTime,
  }) = _MessageAnalytics;

  factory MessageAnalytics.fromJson(Map<String, dynamic> json) =>
      _$MessageAnalyticsFromJson(json);
}

@freezed
abstract class DiscoveryAnalytics with _$DiscoveryAnalytics {
  const factory DiscoveryAnalytics({
    @Default(0) int likesGiven,
    @Default(0) int likesReceived,
    @Default(0) int superLikesGiven,
    @Default(0) int superLikesReceived,
    @Default(0) int rewindCount,
  }) = _DiscoveryAnalytics;

  factory DiscoveryAnalytics.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryAnalyticsFromJson(json);
}

@freezed
abstract class LocationAnalytics with _$LocationAnalytics {
  const factory LocationAnalytics({
    @Default({}) Map<String, int> activeHours,
    @Default([]) List<PopularLocation> popularLocations,
  }) = _LocationAnalytics;

  factory LocationAnalytics.fromJson(Map<String, dynamic> json) =>
      _$LocationAnalyticsFromJson(json);
}

@freezed
abstract class PopularLocation with _$PopularLocation {
  const factory PopularLocation({
    @Default([]) List<double> coordinates,
    @Default(0) int count,
  }) = _PopularLocation;

  factory PopularLocation.fromJson(Map<String, dynamic> json) =>
      _$PopularLocationFromJson(json);
}
