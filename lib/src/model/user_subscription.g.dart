// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSubscription _$UserSubscriptionFromJson(Map<String, dynamic> json) =>
    _UserSubscription(
      id: json['id'] as String,
      userId: json['userId'] as String,
      plan: $enumDecode(_$SubscriptionPlanEnumMap, json['plan']),
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      features: SubscriptionFeatures.fromJson(
          json['features'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      transactionId: json['transactionId'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$UserSubscriptionToJson(_UserSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'plan': _$SubscriptionPlanEnumMap[instance.plan]!,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'features': instance.features,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'currency': instance.currency,
    };

const _$SubscriptionPlanEnumMap = {
  SubscriptionPlan.free: 'free',
  SubscriptionPlan.basic: 'basic',
  SubscriptionPlan.premium: 'premium',
  SubscriptionPlan.vip: 'vip',
};

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.inactive: 'inactive',
  SubscriptionStatus.cancelled: 'cancelled',
  SubscriptionStatus.expired: 'expired',
  SubscriptionStatus.pending: 'pending',
};

_SubscriptionFeatures _$SubscriptionFeaturesFromJson(
        Map<String, dynamic> json) =>
    _SubscriptionFeatures(
      unlimitedLikes: json['unlimitedLikes'] as bool,
      rewindSwipe: json['rewindSwipe'] as bool,
      whoLikedYou: json['whoLikedYou'] as bool,
      analytics: json['analytics'] as bool,
      prioritySupport: json['prioritySupport'] as bool,
      adFree: json['adFree'] as bool,
      superLikes: json['superLikes'] as bool,
      dailySuperLikes: (json['dailySuperLikes'] as num).toInt(),
      boosts: json['boosts'] as bool,
      monthlyBoosts: (json['monthlyBoosts'] as num).toInt(),
      readReceipts: json['readReceipts'] as bool,
    );

Map<String, dynamic> _$SubscriptionFeaturesToJson(
        _SubscriptionFeatures instance) =>
    <String, dynamic>{
      'unlimitedLikes': instance.unlimitedLikes,
      'rewindSwipe': instance.rewindSwipe,
      'whoLikedYou': instance.whoLikedYou,
      'analytics': instance.analytics,
      'prioritySupport': instance.prioritySupport,
      'adFree': instance.adFree,
      'superLikes': instance.superLikes,
      'dailySuperLikes': instance.dailySuperLikes,
      'boosts': instance.boosts,
      'monthlyBoosts': instance.monthlyBoosts,
      'readReceipts': instance.readReceipts,
    };

_SubscriptionStats _$SubscriptionStatsFromJson(Map<String, dynamic> json) =>
    _SubscriptionStats(
      totalSubscriptions: (json['totalSubscriptions'] as num).toInt(),
      activeSubscriptions: (json['activeSubscriptions'] as num).toInt(),
      planDistribution: Map<String, int>.from(json['planDistribution'] as Map),
      monthlyRevenue: (json['monthlyRevenue'] as num).toDouble(),
      averageLifetimeValue: (json['averageLifetimeValue'] as num).toDouble(),
    );

Map<String, dynamic> _$SubscriptionStatsToJson(_SubscriptionStats instance) =>
    <String, dynamic>{
      'totalSubscriptions': instance.totalSubscriptions,
      'activeSubscriptions': instance.activeSubscriptions,
      'planDistribution': instance.planDistribution,
      'monthlyRevenue': instance.monthlyRevenue,
      'averageLifetimeValue': instance.averageLifetimeValue,
    };
