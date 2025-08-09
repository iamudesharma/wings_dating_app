import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_models.dart';

part 'user_engagement.freezed.dart';
part 'user_engagement.g.dart';

enum EngagementType {
  @JsonValue('profile_view')
  profileView,
  @JsonValue('profile_tap')
  profileTap,
  @JsonValue('like')
  like,
  @JsonValue('super_like')
  superLike,
  @JsonValue('match')
  match,
  @JsonValue('message')
  message,
}

enum NotificationType {
  @JsonValue('profile_view')
  profileView,
  @JsonValue('photo_verified')
  photoVerified,
  @JsonValue('photo_rejected')
  photoRejected,
  @JsonValue('profile_tap')
  profileTap,
  @JsonValue('like')
  like,
  @JsonValue('super_like')
  superLike,
  @JsonValue('match')
  match,
  @JsonValue('message')
  message,
}

@freezed
abstract class UserEngagement with _$UserEngagement {
  const factory UserEngagement({
    required String id,
    required String userId,
    required String targetUserId,
    required EngagementType type,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? viewDuration,
    String? viewSource,
    int? visitCount,
  }) = _UserEngagement;

  factory UserEngagement.fromJson(Map<String, dynamic> json) => _$UserEngagementFromJson(json);
}

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String userId,
    required NotificationType type,
    String? fromUserId,
    required String message,
    required bool isRead,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? readAt,
    UserModel? fromUser,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}

@freezed
abstract class TapResult with _$TapResult {
  const factory TapResult({
    required bool success,
    required String message,
    int? remainingTaps,
    List<String>? tappedBy,
    EngagementStatus? engagementStatus,
  }) = _TapResult;

  factory TapResult.fromJson(Map<String, dynamic> json) => _$TapResultFromJson(json);
}

@freezed
abstract class TapStats with _$TapStats {
  const factory TapStats({
    required int totalTaps,
    required int dailyTaps,
    required int remainingTaps,
    required List<String> tappedBy,
    required DateTime lastTapTime,
    EngagementStatus? engagementStatus,
  }) = _TapStats;

  factory TapStats.fromJson(Map<String, dynamic> json) => _$TapStatsFromJson(json);
}

@freezed
abstract class EngagementStatus with _$EngagementStatus {
  const factory EngagementStatus({
    required bool hasTapped,
    required bool hasLiked,
    required bool isMatched,
    DateTime? lastEngagement,
  }) = _EngagementStatus;

  factory EngagementStatus.fromJson(Map<String, dynamic> json) => _$EngagementStatusFromJson(json);
}

@freezed
abstract class ViewResult with _$ViewResult {
  const factory ViewResult({
    required int totalViews,
    required int uniqueViewers,
    required List<ViewerInfo> viewers,
  }) = _ViewResult;

  factory ViewResult.fromJson(Map<String, dynamic> json) => _$ViewResultFromJson(json);
}

@freezed
abstract class ViewerInfo with _$ViewerInfo {
  const factory ViewerInfo({
    required String userId,
    required int viewCount,
    required DateTime lastViewed,
    UserModel? user,
  }) = _ViewerInfo;

  factory ViewerInfo.fromJson(Map<String, dynamic> json) => _$ViewerInfoFromJson(json);
}

@freezed
abstract class MatchResult with _$MatchResult {
  const factory MatchResult({
    required String id,
    required String userId1,
    required String userId2,
    required DateTime createdAt,
    required bool isActive,
    UserModel? user1,
    UserModel? user2,
  }) = _MatchResult;

  factory MatchResult.fromJson(Map<String, dynamic> json) => _$MatchResultFromJson(json);
}
