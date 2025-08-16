// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_privacy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPrivacy _$UserPrivacyFromJson(Map<String, dynamic> json) => UserPrivacy(
      id: json['id'] as String,
      userId: json['userId'] as String,
      profileVisibility:
          $enumDecode(_$ProfileVisibilityEnumMap, json['profileVisibility']),
      locationPrivacy:
          $enumDecode(_$LocationPrivacyEnumMap, json['locationPrivacy']),
      showOnlineStatus: json['showOnlineStatus'] as bool,
      showLastSeen: json['showLastSeen'] as bool,
      showProfileViews: json['showProfileViews'] as bool,
      showDistance: json['showDistance'] as bool,
      showAge: json['showAge'] as bool,
      showInterests: json['showInterests'] as bool,
      allowMessagesFrom:
          $enumDecode(_$ProfileVisibilityEnumMap, json['allowMessagesFrom']),
      allowLikesFrom:
          $enumDecode(_$ProfileVisibilityEnumMap, json['allowLikesFrom']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserPrivacyToJson(UserPrivacy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'profileVisibility':
          _$ProfileVisibilityEnumMap[instance.profileVisibility]!,
      'locationPrivacy': _$LocationPrivacyEnumMap[instance.locationPrivacy]!,
      'showOnlineStatus': instance.showOnlineStatus,
      'showLastSeen': instance.showLastSeen,
      'showProfileViews': instance.showProfileViews,
      'showDistance': instance.showDistance,
      'showAge': instance.showAge,
      'showInterests': instance.showInterests,
      'allowMessagesFrom':
          _$ProfileVisibilityEnumMap[instance.allowMessagesFrom]!,
      'allowLikesFrom': _$ProfileVisibilityEnumMap[instance.allowLikesFrom]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ProfileVisibilityEnumMap = {
  ProfileVisibility.public: 'public',
  ProfileVisibility.friends: 'friends',
  ProfileVisibility.private: 'private',
};

const _$LocationPrivacyEnumMap = {
  LocationPrivacy.exact: 'exact',
  LocationPrivacy.approximate: 'approximate',
  LocationPrivacy.hidden: 'hidden',
};

PrivacyUpdateRequest _$PrivacyUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    PrivacyUpdateRequest(
      profileVisibility: $enumDecodeNullable(
          _$ProfileVisibilityEnumMap, json['profileVisibility']),
      locationPrivacy: $enumDecodeNullable(
          _$LocationPrivacyEnumMap, json['locationPrivacy']),
      showOnlineStatus: json['showOnlineStatus'] as bool?,
      showLastSeen: json['showLastSeen'] as bool?,
      showProfileViews: json['showProfileViews'] as bool?,
      showDistance: json['showDistance'] as bool?,
      showAge: json['showAge'] as bool?,
      showInterests: json['showInterests'] as bool?,
      allowMessagesFrom: $enumDecodeNullable(
          _$ProfileVisibilityEnumMap, json['allowMessagesFrom']),
      allowLikesFrom: $enumDecodeNullable(
          _$ProfileVisibilityEnumMap, json['allowLikesFrom']),
    );

Map<String, dynamic> _$PrivacyUpdateRequestToJson(
        PrivacyUpdateRequest instance) =>
    <String, dynamic>{
      if (_$ProfileVisibilityEnumMap[instance.profileVisibility]
          case final value?)
        'profileVisibility': value,
      if (_$LocationPrivacyEnumMap[instance.locationPrivacy] case final value?)
        'locationPrivacy': value,
      if (instance.showOnlineStatus case final value?)
        'showOnlineStatus': value,
      if (instance.showLastSeen case final value?) 'showLastSeen': value,
      if (instance.showProfileViews case final value?)
        'showProfileViews': value,
      if (instance.showDistance case final value?) 'showDistance': value,
      if (instance.showAge case final value?) 'showAge': value,
      if (instance.showInterests case final value?) 'showInterests': value,
      if (_$ProfileVisibilityEnumMap[instance.allowMessagesFrom]
          case final value?)
        'allowMessagesFrom': value,
      if (_$ProfileVisibilityEnumMap[instance.allowLikesFrom] case final value?)
        'allowLikesFrom': value,
    };
