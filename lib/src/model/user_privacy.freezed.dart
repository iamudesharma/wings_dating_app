// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_privacy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPrivacy {
  String get id;
  String get userId;
  ProfileVisibility get profileVisibility;
  LocationPrivacy get locationPrivacy;
  bool get showOnlineStatus;
  bool get showLastSeen;
  bool get showProfileViews;
  bool get showDistance;
  bool get showAge;
  bool get showInterests;
  ProfileVisibility get allowMessagesFrom;
  ProfileVisibility get allowLikesFrom;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of UserPrivacy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserPrivacyCopyWith<UserPrivacy> get copyWith =>
      _$UserPrivacyCopyWithImpl<UserPrivacy>(this as UserPrivacy, _$identity);

  /// Serializes this UserPrivacy to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserPrivacy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.locationPrivacy, locationPrivacy) ||
                other.locationPrivacy == locationPrivacy) &&
            (identical(other.showOnlineStatus, showOnlineStatus) ||
                other.showOnlineStatus == showOnlineStatus) &&
            (identical(other.showLastSeen, showLastSeen) ||
                other.showLastSeen == showLastSeen) &&
            (identical(other.showProfileViews, showProfileViews) ||
                other.showProfileViews == showProfileViews) &&
            (identical(other.showDistance, showDistance) ||
                other.showDistance == showDistance) &&
            (identical(other.showAge, showAge) || other.showAge == showAge) &&
            (identical(other.showInterests, showInterests) ||
                other.showInterests == showInterests) &&
            (identical(other.allowMessagesFrom, allowMessagesFrom) ||
                other.allowMessagesFrom == allowMessagesFrom) &&
            (identical(other.allowLikesFrom, allowLikesFrom) ||
                other.allowLikesFrom == allowLikesFrom) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      profileVisibility,
      locationPrivacy,
      showOnlineStatus,
      showLastSeen,
      showProfileViews,
      showDistance,
      showAge,
      showInterests,
      allowMessagesFrom,
      allowLikesFrom,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'UserPrivacy(id: $id, userId: $userId, profileVisibility: $profileVisibility, locationPrivacy: $locationPrivacy, showOnlineStatus: $showOnlineStatus, showLastSeen: $showLastSeen, showProfileViews: $showProfileViews, showDistance: $showDistance, showAge: $showAge, showInterests: $showInterests, allowMessagesFrom: $allowMessagesFrom, allowLikesFrom: $allowLikesFrom, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $UserPrivacyCopyWith<$Res> {
  factory $UserPrivacyCopyWith(
          UserPrivacy value, $Res Function(UserPrivacy) _then) =
      _$UserPrivacyCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      ProfileVisibility profileVisibility,
      LocationPrivacy locationPrivacy,
      bool showOnlineStatus,
      bool showLastSeen,
      bool showProfileViews,
      bool showDistance,
      bool showAge,
      bool showInterests,
      ProfileVisibility allowMessagesFrom,
      ProfileVisibility allowLikesFrom,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserPrivacyCopyWithImpl<$Res> implements $UserPrivacyCopyWith<$Res> {
  _$UserPrivacyCopyWithImpl(this._self, this._then);

  final UserPrivacy _self;
  final $Res Function(UserPrivacy) _then;

  /// Create a copy of UserPrivacy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? profileVisibility = null,
    Object? locationPrivacy = null,
    Object? showOnlineStatus = null,
    Object? showLastSeen = null,
    Object? showProfileViews = null,
    Object? showDistance = null,
    Object? showAge = null,
    Object? showInterests = null,
    Object? allowMessagesFrom = null,
    Object? allowLikesFrom = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profileVisibility: null == profileVisibility
          ? _self.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility,
      locationPrivacy: null == locationPrivacy
          ? _self.locationPrivacy
          : locationPrivacy // ignore: cast_nullable_to_non_nullable
              as LocationPrivacy,
      showOnlineStatus: null == showOnlineStatus
          ? _self.showOnlineStatus
          : showOnlineStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      showLastSeen: null == showLastSeen
          ? _self.showLastSeen
          : showLastSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      showProfileViews: null == showProfileViews
          ? _self.showProfileViews
          : showProfileViews // ignore: cast_nullable_to_non_nullable
              as bool,
      showDistance: null == showDistance
          ? _self.showDistance
          : showDistance // ignore: cast_nullable_to_non_nullable
              as bool,
      showAge: null == showAge
          ? _self.showAge
          : showAge // ignore: cast_nullable_to_non_nullable
              as bool,
      showInterests: null == showInterests
          ? _self.showInterests
          : showInterests // ignore: cast_nullable_to_non_nullable
              as bool,
      allowMessagesFrom: null == allowMessagesFrom
          ? _self.allowMessagesFrom
          : allowMessagesFrom // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility,
      allowLikesFrom: null == allowLikesFrom
          ? _self.allowLikesFrom
          : allowLikesFrom // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserPrivacy implements UserPrivacy {
  const _UserPrivacy(
      {required this.id,
      required this.userId,
      required this.profileVisibility,
      required this.locationPrivacy,
      required this.showOnlineStatus,
      required this.showLastSeen,
      required this.showProfileViews,
      required this.showDistance,
      required this.showAge,
      required this.showInterests,
      required this.allowMessagesFrom,
      required this.allowLikesFrom,
      required this.createdAt,
      required this.updatedAt});
  factory _UserPrivacy.fromJson(Map<String, dynamic> json) =>
      _$UserPrivacyFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final ProfileVisibility profileVisibility;
  @override
  final LocationPrivacy locationPrivacy;
  @override
  final bool showOnlineStatus;
  @override
  final bool showLastSeen;
  @override
  final bool showProfileViews;
  @override
  final bool showDistance;
  @override
  final bool showAge;
  @override
  final bool showInterests;
  @override
  final ProfileVisibility allowMessagesFrom;
  @override
  final ProfileVisibility allowLikesFrom;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of UserPrivacy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserPrivacyCopyWith<_UserPrivacy> get copyWith =>
      __$UserPrivacyCopyWithImpl<_UserPrivacy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserPrivacyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserPrivacy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.locationPrivacy, locationPrivacy) ||
                other.locationPrivacy == locationPrivacy) &&
            (identical(other.showOnlineStatus, showOnlineStatus) ||
                other.showOnlineStatus == showOnlineStatus) &&
            (identical(other.showLastSeen, showLastSeen) ||
                other.showLastSeen == showLastSeen) &&
            (identical(other.showProfileViews, showProfileViews) ||
                other.showProfileViews == showProfileViews) &&
            (identical(other.showDistance, showDistance) ||
                other.showDistance == showDistance) &&
            (identical(other.showAge, showAge) || other.showAge == showAge) &&
            (identical(other.showInterests, showInterests) ||
                other.showInterests == showInterests) &&
            (identical(other.allowMessagesFrom, allowMessagesFrom) ||
                other.allowMessagesFrom == allowMessagesFrom) &&
            (identical(other.allowLikesFrom, allowLikesFrom) ||
                other.allowLikesFrom == allowLikesFrom) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      profileVisibility,
      locationPrivacy,
      showOnlineStatus,
      showLastSeen,
      showProfileViews,
      showDistance,
      showAge,
      showInterests,
      allowMessagesFrom,
      allowLikesFrom,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'UserPrivacy(id: $id, userId: $userId, profileVisibility: $profileVisibility, locationPrivacy: $locationPrivacy, showOnlineStatus: $showOnlineStatus, showLastSeen: $showLastSeen, showProfileViews: $showProfileViews, showDistance: $showDistance, showAge: $showAge, showInterests: $showInterests, allowMessagesFrom: $allowMessagesFrom, allowLikesFrom: $allowLikesFrom, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserPrivacyCopyWith<$Res>
    implements $UserPrivacyCopyWith<$Res> {
  factory _$UserPrivacyCopyWith(
          _UserPrivacy value, $Res Function(_UserPrivacy) _then) =
      __$UserPrivacyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      ProfileVisibility profileVisibility,
      LocationPrivacy locationPrivacy,
      bool showOnlineStatus,
      bool showLastSeen,
      bool showProfileViews,
      bool showDistance,
      bool showAge,
      bool showInterests,
      ProfileVisibility allowMessagesFrom,
      ProfileVisibility allowLikesFrom,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$UserPrivacyCopyWithImpl<$Res> implements _$UserPrivacyCopyWith<$Res> {
  __$UserPrivacyCopyWithImpl(this._self, this._then);

  final _UserPrivacy _self;
  final $Res Function(_UserPrivacy) _then;

  /// Create a copy of UserPrivacy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? profileVisibility = null,
    Object? locationPrivacy = null,
    Object? showOnlineStatus = null,
    Object? showLastSeen = null,
    Object? showProfileViews = null,
    Object? showDistance = null,
    Object? showAge = null,
    Object? showInterests = null,
    Object? allowMessagesFrom = null,
    Object? allowLikesFrom = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_UserPrivacy(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profileVisibility: null == profileVisibility
          ? _self.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility,
      locationPrivacy: null == locationPrivacy
          ? _self.locationPrivacy
          : locationPrivacy // ignore: cast_nullable_to_non_nullable
              as LocationPrivacy,
      showOnlineStatus: null == showOnlineStatus
          ? _self.showOnlineStatus
          : showOnlineStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      showLastSeen: null == showLastSeen
          ? _self.showLastSeen
          : showLastSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      showProfileViews: null == showProfileViews
          ? _self.showProfileViews
          : showProfileViews // ignore: cast_nullable_to_non_nullable
              as bool,
      showDistance: null == showDistance
          ? _self.showDistance
          : showDistance // ignore: cast_nullable_to_non_nullable
              as bool,
      showAge: null == showAge
          ? _self.showAge
          : showAge // ignore: cast_nullable_to_non_nullable
              as bool,
      showInterests: null == showInterests
          ? _self.showInterests
          : showInterests // ignore: cast_nullable_to_non_nullable
              as bool,
      allowMessagesFrom: null == allowMessagesFrom
          ? _self.allowMessagesFrom
          : allowMessagesFrom // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility,
      allowLikesFrom: null == allowLikesFrom
          ? _self.allowLikesFrom
          : allowLikesFrom // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$PrivacyUpdateRequest {
  ProfileVisibility? get profileVisibility;
  LocationPrivacy? get locationPrivacy;
  bool? get showOnlineStatus;
  bool? get showLastSeen;
  bool? get showProfileViews;
  bool? get showDistance;
  bool? get showAge;
  bool? get showInterests;
  ProfileVisibility? get allowMessagesFrom;
  ProfileVisibility? get allowLikesFrom;

  /// Create a copy of PrivacyUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrivacyUpdateRequestCopyWith<PrivacyUpdateRequest> get copyWith =>
      _$PrivacyUpdateRequestCopyWithImpl<PrivacyUpdateRequest>(
          this as PrivacyUpdateRequest, _$identity);

  /// Serializes this PrivacyUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrivacyUpdateRequest &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.locationPrivacy, locationPrivacy) ||
                other.locationPrivacy == locationPrivacy) &&
            (identical(other.showOnlineStatus, showOnlineStatus) ||
                other.showOnlineStatus == showOnlineStatus) &&
            (identical(other.showLastSeen, showLastSeen) ||
                other.showLastSeen == showLastSeen) &&
            (identical(other.showProfileViews, showProfileViews) ||
                other.showProfileViews == showProfileViews) &&
            (identical(other.showDistance, showDistance) ||
                other.showDistance == showDistance) &&
            (identical(other.showAge, showAge) || other.showAge == showAge) &&
            (identical(other.showInterests, showInterests) ||
                other.showInterests == showInterests) &&
            (identical(other.allowMessagesFrom, allowMessagesFrom) ||
                other.allowMessagesFrom == allowMessagesFrom) &&
            (identical(other.allowLikesFrom, allowLikesFrom) ||
                other.allowLikesFrom == allowLikesFrom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      profileVisibility,
      locationPrivacy,
      showOnlineStatus,
      showLastSeen,
      showProfileViews,
      showDistance,
      showAge,
      showInterests,
      allowMessagesFrom,
      allowLikesFrom);

  @override
  String toString() {
    return 'PrivacyUpdateRequest(profileVisibility: $profileVisibility, locationPrivacy: $locationPrivacy, showOnlineStatus: $showOnlineStatus, showLastSeen: $showLastSeen, showProfileViews: $showProfileViews, showDistance: $showDistance, showAge: $showAge, showInterests: $showInterests, allowMessagesFrom: $allowMessagesFrom, allowLikesFrom: $allowLikesFrom)';
  }
}

/// @nodoc
abstract mixin class $PrivacyUpdateRequestCopyWith<$Res> {
  factory $PrivacyUpdateRequestCopyWith(PrivacyUpdateRequest value,
          $Res Function(PrivacyUpdateRequest) _then) =
      _$PrivacyUpdateRequestCopyWithImpl;
  @useResult
  $Res call(
      {ProfileVisibility? profileVisibility,
      LocationPrivacy? locationPrivacy,
      bool? showOnlineStatus,
      bool? showLastSeen,
      bool? showProfileViews,
      bool? showDistance,
      bool? showAge,
      bool? showInterests,
      ProfileVisibility? allowMessagesFrom,
      ProfileVisibility? allowLikesFrom});
}

/// @nodoc
class _$PrivacyUpdateRequestCopyWithImpl<$Res>
    implements $PrivacyUpdateRequestCopyWith<$Res> {
  _$PrivacyUpdateRequestCopyWithImpl(this._self, this._then);

  final PrivacyUpdateRequest _self;
  final $Res Function(PrivacyUpdateRequest) _then;

  /// Create a copy of PrivacyUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileVisibility = freezed,
    Object? locationPrivacy = freezed,
    Object? showOnlineStatus = freezed,
    Object? showLastSeen = freezed,
    Object? showProfileViews = freezed,
    Object? showDistance = freezed,
    Object? showAge = freezed,
    Object? showInterests = freezed,
    Object? allowMessagesFrom = freezed,
    Object? allowLikesFrom = freezed,
  }) {
    return _then(_self.copyWith(
      profileVisibility: freezed == profileVisibility
          ? _self.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
      locationPrivacy: freezed == locationPrivacy
          ? _self.locationPrivacy
          : locationPrivacy // ignore: cast_nullable_to_non_nullable
              as LocationPrivacy?,
      showOnlineStatus: freezed == showOnlineStatus
          ? _self.showOnlineStatus
          : showOnlineStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      showLastSeen: freezed == showLastSeen
          ? _self.showLastSeen
          : showLastSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      showProfileViews: freezed == showProfileViews
          ? _self.showProfileViews
          : showProfileViews // ignore: cast_nullable_to_non_nullable
              as bool?,
      showDistance: freezed == showDistance
          ? _self.showDistance
          : showDistance // ignore: cast_nullable_to_non_nullable
              as bool?,
      showAge: freezed == showAge
          ? _self.showAge
          : showAge // ignore: cast_nullable_to_non_nullable
              as bool?,
      showInterests: freezed == showInterests
          ? _self.showInterests
          : showInterests // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowMessagesFrom: freezed == allowMessagesFrom
          ? _self.allowMessagesFrom
          : allowMessagesFrom // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
      allowLikesFrom: freezed == allowLikesFrom
          ? _self.allowLikesFrom
          : allowLikesFrom // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PrivacyUpdateRequest implements PrivacyUpdateRequest {
  const _PrivacyUpdateRequest(
      {this.profileVisibility,
      this.locationPrivacy,
      this.showOnlineStatus,
      this.showLastSeen,
      this.showProfileViews,
      this.showDistance,
      this.showAge,
      this.showInterests,
      this.allowMessagesFrom,
      this.allowLikesFrom});
  factory _PrivacyUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$PrivacyUpdateRequestFromJson(json);

  @override
  final ProfileVisibility? profileVisibility;
  @override
  final LocationPrivacy? locationPrivacy;
  @override
  final bool? showOnlineStatus;
  @override
  final bool? showLastSeen;
  @override
  final bool? showProfileViews;
  @override
  final bool? showDistance;
  @override
  final bool? showAge;
  @override
  final bool? showInterests;
  @override
  final ProfileVisibility? allowMessagesFrom;
  @override
  final ProfileVisibility? allowLikesFrom;

  /// Create a copy of PrivacyUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PrivacyUpdateRequestCopyWith<_PrivacyUpdateRequest> get copyWith =>
      __$PrivacyUpdateRequestCopyWithImpl<_PrivacyUpdateRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PrivacyUpdateRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PrivacyUpdateRequest &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.locationPrivacy, locationPrivacy) ||
                other.locationPrivacy == locationPrivacy) &&
            (identical(other.showOnlineStatus, showOnlineStatus) ||
                other.showOnlineStatus == showOnlineStatus) &&
            (identical(other.showLastSeen, showLastSeen) ||
                other.showLastSeen == showLastSeen) &&
            (identical(other.showProfileViews, showProfileViews) ||
                other.showProfileViews == showProfileViews) &&
            (identical(other.showDistance, showDistance) ||
                other.showDistance == showDistance) &&
            (identical(other.showAge, showAge) || other.showAge == showAge) &&
            (identical(other.showInterests, showInterests) ||
                other.showInterests == showInterests) &&
            (identical(other.allowMessagesFrom, allowMessagesFrom) ||
                other.allowMessagesFrom == allowMessagesFrom) &&
            (identical(other.allowLikesFrom, allowLikesFrom) ||
                other.allowLikesFrom == allowLikesFrom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      profileVisibility,
      locationPrivacy,
      showOnlineStatus,
      showLastSeen,
      showProfileViews,
      showDistance,
      showAge,
      showInterests,
      allowMessagesFrom,
      allowLikesFrom);

  @override
  String toString() {
    return 'PrivacyUpdateRequest(profileVisibility: $profileVisibility, locationPrivacy: $locationPrivacy, showOnlineStatus: $showOnlineStatus, showLastSeen: $showLastSeen, showProfileViews: $showProfileViews, showDistance: $showDistance, showAge: $showAge, showInterests: $showInterests, allowMessagesFrom: $allowMessagesFrom, allowLikesFrom: $allowLikesFrom)';
  }
}

/// @nodoc
abstract mixin class _$PrivacyUpdateRequestCopyWith<$Res>
    implements $PrivacyUpdateRequestCopyWith<$Res> {
  factory _$PrivacyUpdateRequestCopyWith(_PrivacyUpdateRequest value,
          $Res Function(_PrivacyUpdateRequest) _then) =
      __$PrivacyUpdateRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ProfileVisibility? profileVisibility,
      LocationPrivacy? locationPrivacy,
      bool? showOnlineStatus,
      bool? showLastSeen,
      bool? showProfileViews,
      bool? showDistance,
      bool? showAge,
      bool? showInterests,
      ProfileVisibility? allowMessagesFrom,
      ProfileVisibility? allowLikesFrom});
}

/// @nodoc
class __$PrivacyUpdateRequestCopyWithImpl<$Res>
    implements _$PrivacyUpdateRequestCopyWith<$Res> {
  __$PrivacyUpdateRequestCopyWithImpl(this._self, this._then);

  final _PrivacyUpdateRequest _self;
  final $Res Function(_PrivacyUpdateRequest) _then;

  /// Create a copy of PrivacyUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileVisibility = freezed,
    Object? locationPrivacy = freezed,
    Object? showOnlineStatus = freezed,
    Object? showLastSeen = freezed,
    Object? showProfileViews = freezed,
    Object? showDistance = freezed,
    Object? showAge = freezed,
    Object? showInterests = freezed,
    Object? allowMessagesFrom = freezed,
    Object? allowLikesFrom = freezed,
  }) {
    return _then(_PrivacyUpdateRequest(
      profileVisibility: freezed == profileVisibility
          ? _self.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
      locationPrivacy: freezed == locationPrivacy
          ? _self.locationPrivacy
          : locationPrivacy // ignore: cast_nullable_to_non_nullable
              as LocationPrivacy?,
      showOnlineStatus: freezed == showOnlineStatus
          ? _self.showOnlineStatus
          : showOnlineStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      showLastSeen: freezed == showLastSeen
          ? _self.showLastSeen
          : showLastSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      showProfileViews: freezed == showProfileViews
          ? _self.showProfileViews
          : showProfileViews // ignore: cast_nullable_to_non_nullable
              as bool?,
      showDistance: freezed == showDistance
          ? _self.showDistance
          : showDistance // ignore: cast_nullable_to_non_nullable
              as bool?,
      showAge: freezed == showAge
          ? _self.showAge
          : showAge // ignore: cast_nullable_to_non_nullable
              as bool?,
      showInterests: freezed == showInterests
          ? _self.showInterests
          : showInterests // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowMessagesFrom: freezed == allowMessagesFrom
          ? _self.allowMessagesFrom
          : allowMessagesFrom // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
      allowLikesFrom: freezed == allowLikesFrom
          ? _self.allowLikesFrom
          : allowLikesFrom // ignore: cast_nullable_to_non_nullable
              as ProfileVisibility?,
    ));
  }
}

// dart format on
