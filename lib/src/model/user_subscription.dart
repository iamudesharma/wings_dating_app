import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_subscription.freezed.dart';
part 'user_subscription.g.dart';

enum SubscriptionPlan {
  @JsonValue('free')
  free,
  @JsonValue('basic')
  basic,
  @JsonValue('premium')
  premium,
  @JsonValue('vip')
  vip,
}

enum SubscriptionStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('expired')
  expired,
  @JsonValue('pending')
  pending,
}

@freezed
abstract class UserSubscription with _$UserSubscription {
  const factory UserSubscription({
    required String id,
    required String userId,
    required SubscriptionPlan plan,
    required SubscriptionStatus status,
    required DateTime startDate,
    required DateTime endDate,
    required SubscriptionFeatures features,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? transactionId,
    double? amount,
    String? currency,
  }) = _UserSubscription;

  factory UserSubscription.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionFromJson(json);
}

@freezed
abstract class SubscriptionFeatures with _$SubscriptionFeatures {
  const factory SubscriptionFeatures({
    required bool unlimitedLikes,
    required bool rewindSwipe,
    required bool whoLikedYou,
    required bool analytics,
    required bool prioritySupport,
    required bool adFree,
    required bool superLikes,
    required int dailySuperLikes,
    required bool boosts,
    required int monthlyBoosts,
    required bool readReceipts,
  }) = _SubscriptionFeatures;

  factory SubscriptionFeatures.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFeaturesFromJson(json);
}

@freezed
abstract class SubscriptionStats with _$SubscriptionStats {
  const factory SubscriptionStats({
    required int totalSubscriptions,
    required int activeSubscriptions,
    required Map<String, int> planDistribution,
    required double monthlyRevenue,
    required double averageLifetimeValue,
  }) = _SubscriptionStats;

  factory SubscriptionStats.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStatsFromJson(json);
}
