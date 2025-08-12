// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAnalytics {
  String get userId;
  ProfileViewsAnalytics get profileViews;
  MatchesAnalytics get matches;
  MessagesAnalytics get messages;
  DiscoveryAnalytics get discovery;
  LocationAnalytics get location;
  DateTime get lastUpdated;
  DateTime get createdAt;
  DateTime get updatedAt;
  double? get matchRate;

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAnalyticsCopyWith<UserAnalytics> get copyWith =>
      _$UserAnalyticsCopyWithImpl<UserAnalytics>(
          this as UserAnalytics, _$identity);

  /// Serializes this UserAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAnalytics &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profileViews, profileViews) ||
                other.profileViews == profileViews) &&
            (identical(other.matches, matches) || other.matches == matches) &&
            (identical(other.messages, messages) ||
                other.messages == messages) &&
            (identical(other.discovery, discovery) ||
                other.discovery == discovery) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.matchRate, matchRate) ||
                other.matchRate == matchRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      profileViews,
      matches,
      messages,
      discovery,
      location,
      lastUpdated,
      createdAt,
      updatedAt,
      matchRate);

  @override
  String toString() {
    return 'UserAnalytics(userId: $userId, profileViews: $profileViews, matches: $matches, messages: $messages, discovery: $discovery, location: $location, lastUpdated: $lastUpdated, createdAt: $createdAt, updatedAt: $updatedAt, matchRate: $matchRate)';
  }
}

/// @nodoc
abstract mixin class $UserAnalyticsCopyWith<$Res> {
  factory $UserAnalyticsCopyWith(
          UserAnalytics value, $Res Function(UserAnalytics) _then) =
      _$UserAnalyticsCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      ProfileViewsAnalytics profileViews,
      MatchesAnalytics matches,
      MessagesAnalytics messages,
      DiscoveryAnalytics discovery,
      LocationAnalytics location,
      DateTime lastUpdated,
      DateTime createdAt,
      DateTime updatedAt,
      double? matchRate});

  $ProfileViewsAnalyticsCopyWith<$Res> get profileViews;
  $MatchesAnalyticsCopyWith<$Res> get matches;
  $MessagesAnalyticsCopyWith<$Res> get messages;
  $DiscoveryAnalyticsCopyWith<$Res> get discovery;
  $LocationAnalyticsCopyWith<$Res> get location;
}

/// @nodoc
class _$UserAnalyticsCopyWithImpl<$Res>
    implements $UserAnalyticsCopyWith<$Res> {
  _$UserAnalyticsCopyWithImpl(this._self, this._then);

  final UserAnalytics _self;
  final $Res Function(UserAnalytics) _then;

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? profileViews = null,
    Object? matches = null,
    Object? messages = null,
    Object? discovery = null,
    Object? location = null,
    Object? lastUpdated = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? matchRate = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profileViews: null == profileViews
          ? _self.profileViews
          : profileViews // ignore: cast_nullable_to_non_nullable
              as ProfileViewsAnalytics,
      matches: null == matches
          ? _self.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as MatchesAnalytics,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as MessagesAnalytics,
      discovery: null == discovery
          ? _self.discovery
          : discovery // ignore: cast_nullable_to_non_nullable
              as DiscoveryAnalytics,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationAnalytics,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      matchRate: freezed == matchRate
          ? _self.matchRate
          : matchRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileViewsAnalyticsCopyWith<$Res> get profileViews {
    return $ProfileViewsAnalyticsCopyWith<$Res>(_self.profileViews, (value) {
      return _then(_self.copyWith(profileViews: value));
    });
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchesAnalyticsCopyWith<$Res> get matches {
    return $MatchesAnalyticsCopyWith<$Res>(_self.matches, (value) {
      return _then(_self.copyWith(matches: value));
    });
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessagesAnalyticsCopyWith<$Res> get messages {
    return $MessagesAnalyticsCopyWith<$Res>(_self.messages, (value) {
      return _then(_self.copyWith(messages: value));
    });
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscoveryAnalyticsCopyWith<$Res> get discovery {
    return $DiscoveryAnalyticsCopyWith<$Res>(_self.discovery, (value) {
      return _then(_self.copyWith(discovery: value));
    });
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationAnalyticsCopyWith<$Res> get location {
    return $LocationAnalyticsCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserAnalytics].
extension UserAnalyticsPatterns on UserAnalytics {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserAnalytics() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAnalytics():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAnalytics() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String userId,
            ProfileViewsAnalytics profileViews,
            MatchesAnalytics matches,
            MessagesAnalytics messages,
            DiscoveryAnalytics discovery,
            LocationAnalytics location,
            DateTime lastUpdated,
            DateTime createdAt,
            DateTime updatedAt,
            double? matchRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserAnalytics() when $default != null:
        return $default(
            _that.userId,
            _that.profileViews,
            _that.matches,
            _that.messages,
            _that.discovery,
            _that.location,
            _that.lastUpdated,
            _that.createdAt,
            _that.updatedAt,
            _that.matchRate);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String userId,
            ProfileViewsAnalytics profileViews,
            MatchesAnalytics matches,
            MessagesAnalytics messages,
            DiscoveryAnalytics discovery,
            LocationAnalytics location,
            DateTime lastUpdated,
            DateTime createdAt,
            DateTime updatedAt,
            double? matchRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAnalytics():
        return $default(
            _that.userId,
            _that.profileViews,
            _that.matches,
            _that.messages,
            _that.discovery,
            _that.location,
            _that.lastUpdated,
            _that.createdAt,
            _that.updatedAt,
            _that.matchRate);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String userId,
            ProfileViewsAnalytics profileViews,
            MatchesAnalytics matches,
            MessagesAnalytics messages,
            DiscoveryAnalytics discovery,
            LocationAnalytics location,
            DateTime lastUpdated,
            DateTime createdAt,
            DateTime updatedAt,
            double? matchRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAnalytics() when $default != null:
        return $default(
            _that.userId,
            _that.profileViews,
            _that.matches,
            _that.messages,
            _that.discovery,
            _that.location,
            _that.lastUpdated,
            _that.createdAt,
            _that.updatedAt,
            _that.matchRate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserAnalytics implements UserAnalytics {
  const _UserAnalytics(
      {required this.userId,
      required this.profileViews,
      required this.matches,
      required this.messages,
      required this.discovery,
      required this.location,
      required this.lastUpdated,
      required this.createdAt,
      required this.updatedAt,
      this.matchRate});
  factory _UserAnalytics.fromJson(Map<String, dynamic> json) =>
      _$UserAnalyticsFromJson(json);

  @override
  final String userId;
  @override
  final ProfileViewsAnalytics profileViews;
  @override
  final MatchesAnalytics matches;
  @override
  final MessagesAnalytics messages;
  @override
  final DiscoveryAnalytics discovery;
  @override
  final LocationAnalytics location;
  @override
  final DateTime lastUpdated;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final double? matchRate;

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAnalyticsCopyWith<_UserAnalytics> get copyWith =>
      __$UserAnalyticsCopyWithImpl<_UserAnalytics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAnalytics &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profileViews, profileViews) ||
                other.profileViews == profileViews) &&
            (identical(other.matches, matches) || other.matches == matches) &&
            (identical(other.messages, messages) ||
                other.messages == messages) &&
            (identical(other.discovery, discovery) ||
                other.discovery == discovery) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.matchRate, matchRate) ||
                other.matchRate == matchRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      profileViews,
      matches,
      messages,
      discovery,
      location,
      lastUpdated,
      createdAt,
      updatedAt,
      matchRate);

  @override
  String toString() {
    return 'UserAnalytics(userId: $userId, profileViews: $profileViews, matches: $matches, messages: $messages, discovery: $discovery, location: $location, lastUpdated: $lastUpdated, createdAt: $createdAt, updatedAt: $updatedAt, matchRate: $matchRate)';
  }
}

/// @nodoc
abstract mixin class _$UserAnalyticsCopyWith<$Res>
    implements $UserAnalyticsCopyWith<$Res> {
  factory _$UserAnalyticsCopyWith(
          _UserAnalytics value, $Res Function(_UserAnalytics) _then) =
      __$UserAnalyticsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      ProfileViewsAnalytics profileViews,
      MatchesAnalytics matches,
      MessagesAnalytics messages,
      DiscoveryAnalytics discovery,
      LocationAnalytics location,
      DateTime lastUpdated,
      DateTime createdAt,
      DateTime updatedAt,
      double? matchRate});

  @override
  $ProfileViewsAnalyticsCopyWith<$Res> get profileViews;
  @override
  $MatchesAnalyticsCopyWith<$Res> get matches;
  @override
  $MessagesAnalyticsCopyWith<$Res> get messages;
  @override
  $DiscoveryAnalyticsCopyWith<$Res> get discovery;
  @override
  $LocationAnalyticsCopyWith<$Res> get location;
}

/// @nodoc
class __$UserAnalyticsCopyWithImpl<$Res>
    implements _$UserAnalyticsCopyWith<$Res> {
  __$UserAnalyticsCopyWithImpl(this._self, this._then);

  final _UserAnalytics _self;
  final $Res Function(_UserAnalytics) _then;

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? profileViews = null,
    Object? matches = null,
    Object? messages = null,
    Object? discovery = null,
    Object? location = null,
    Object? lastUpdated = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? matchRate = freezed,
  }) {
    return _then(_UserAnalytics(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profileViews: null == profileViews
          ? _self.profileViews
          : profileViews // ignore: cast_nullable_to_non_nullable
              as ProfileViewsAnalytics,
      matches: null == matches
          ? _self.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as MatchesAnalytics,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as MessagesAnalytics,
      discovery: null == discovery
          ? _self.discovery
          : discovery // ignore: cast_nullable_to_non_nullable
              as DiscoveryAnalytics,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationAnalytics,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      matchRate: freezed == matchRate
          ? _self.matchRate
          : matchRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileViewsAnalyticsCopyWith<$Res> get profileViews {
    return $ProfileViewsAnalyticsCopyWith<$Res>(_self.profileViews, (value) {
      return _then(_self.copyWith(profileViews: value));
    });
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchesAnalyticsCopyWith<$Res> get matches {
    return $MatchesAnalyticsCopyWith<$Res>(_self.matches, (value) {
      return _then(_self.copyWith(matches: value));
    });
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessagesAnalyticsCopyWith<$Res> get messages {
    return $MessagesAnalyticsCopyWith<$Res>(_self.messages, (value) {
      return _then(_self.copyWith(messages: value));
    });
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscoveryAnalyticsCopyWith<$Res> get discovery {
    return $DiscoveryAnalyticsCopyWith<$Res>(_self.discovery, (value) {
      return _then(_self.copyWith(discovery: value));
    });
  }

  /// Create a copy of UserAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationAnalyticsCopyWith<$Res> get location {
    return $LocationAnalyticsCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
mixin _$ProfileViewsAnalytics {
  int get total;
  int get daily;
  int get weekly;
  int get monthly;
  Map<String, int> get byHour;
  Map<String, int> get byDay;

  /// Create a copy of ProfileViewsAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileViewsAnalyticsCopyWith<ProfileViewsAnalytics> get copyWith =>
      _$ProfileViewsAnalyticsCopyWithImpl<ProfileViewsAnalytics>(
          this as ProfileViewsAnalytics, _$identity);

  /// Serializes this ProfileViewsAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileViewsAnalytics &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly) &&
            const DeepCollectionEquality().equals(other.byHour, byHour) &&
            const DeepCollectionEquality().equals(other.byDay, byDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      total,
      daily,
      weekly,
      monthly,
      const DeepCollectionEquality().hash(byHour),
      const DeepCollectionEquality().hash(byDay));

  @override
  String toString() {
    return 'ProfileViewsAnalytics(total: $total, daily: $daily, weekly: $weekly, monthly: $monthly, byHour: $byHour, byDay: $byDay)';
  }
}

/// @nodoc
abstract mixin class $ProfileViewsAnalyticsCopyWith<$Res> {
  factory $ProfileViewsAnalyticsCopyWith(ProfileViewsAnalytics value,
          $Res Function(ProfileViewsAnalytics) _then) =
      _$ProfileViewsAnalyticsCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int daily,
      int weekly,
      int monthly,
      Map<String, int> byHour,
      Map<String, int> byDay});
}

/// @nodoc
class _$ProfileViewsAnalyticsCopyWithImpl<$Res>
    implements $ProfileViewsAnalyticsCopyWith<$Res> {
  _$ProfileViewsAnalyticsCopyWithImpl(this._self, this._then);

  final ProfileViewsAnalytics _self;
  final $Res Function(ProfileViewsAnalytics) _then;

  /// Create a copy of ProfileViewsAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
    Object? byHour = null,
    Object? byDay = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      daily: null == daily
          ? _self.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int,
      weekly: null == weekly
          ? _self.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as int,
      monthly: null == monthly
          ? _self.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int,
      byHour: null == byHour
          ? _self.byHour
          : byHour // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      byDay: null == byDay
          ? _self.byDay
          : byDay // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProfileViewsAnalytics].
extension ProfileViewsAnalyticsPatterns on ProfileViewsAnalytics {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProfileViewsAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileViewsAnalytics() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProfileViewsAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewsAnalytics():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProfileViewsAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewsAnalytics() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int total, int daily, int weekly, int monthly,
            Map<String, int> byHour, Map<String, int> byDay)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileViewsAnalytics() when $default != null:
        return $default(_that.total, _that.daily, _that.weekly, _that.monthly,
            _that.byHour, _that.byDay);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int total, int daily, int weekly, int monthly,
            Map<String, int> byHour, Map<String, int> byDay)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewsAnalytics():
        return $default(_that.total, _that.daily, _that.weekly, _that.monthly,
            _that.byHour, _that.byDay);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int total, int daily, int weekly, int monthly,
            Map<String, int> byHour, Map<String, int> byDay)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewsAnalytics() when $default != null:
        return $default(_that.total, _that.daily, _that.weekly, _that.monthly,
            _that.byHour, _that.byDay);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileViewsAnalytics implements ProfileViewsAnalytics {
  const _ProfileViewsAnalytics(
      {required this.total,
      required this.daily,
      required this.weekly,
      required this.monthly,
      required final Map<String, int> byHour,
      required final Map<String, int> byDay})
      : _byHour = byHour,
        _byDay = byDay;
  factory _ProfileViewsAnalytics.fromJson(Map<String, dynamic> json) =>
      _$ProfileViewsAnalyticsFromJson(json);

  @override
  final int total;
  @override
  final int daily;
  @override
  final int weekly;
  @override
  final int monthly;
  final Map<String, int> _byHour;
  @override
  Map<String, int> get byHour {
    if (_byHour is EqualUnmodifiableMapView) return _byHour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byHour);
  }

  final Map<String, int> _byDay;
  @override
  Map<String, int> get byDay {
    if (_byDay is EqualUnmodifiableMapView) return _byDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byDay);
  }

  /// Create a copy of ProfileViewsAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileViewsAnalyticsCopyWith<_ProfileViewsAnalytics> get copyWith =>
      __$ProfileViewsAnalyticsCopyWithImpl<_ProfileViewsAnalytics>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileViewsAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileViewsAnalytics &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly) &&
            const DeepCollectionEquality().equals(other._byHour, _byHour) &&
            const DeepCollectionEquality().equals(other._byDay, _byDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      total,
      daily,
      weekly,
      monthly,
      const DeepCollectionEquality().hash(_byHour),
      const DeepCollectionEquality().hash(_byDay));

  @override
  String toString() {
    return 'ProfileViewsAnalytics(total: $total, daily: $daily, weekly: $weekly, monthly: $monthly, byHour: $byHour, byDay: $byDay)';
  }
}

/// @nodoc
abstract mixin class _$ProfileViewsAnalyticsCopyWith<$Res>
    implements $ProfileViewsAnalyticsCopyWith<$Res> {
  factory _$ProfileViewsAnalyticsCopyWith(_ProfileViewsAnalytics value,
          $Res Function(_ProfileViewsAnalytics) _then) =
      __$ProfileViewsAnalyticsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int daily,
      int weekly,
      int monthly,
      Map<String, int> byHour,
      Map<String, int> byDay});
}

/// @nodoc
class __$ProfileViewsAnalyticsCopyWithImpl<$Res>
    implements _$ProfileViewsAnalyticsCopyWith<$Res> {
  __$ProfileViewsAnalyticsCopyWithImpl(this._self, this._then);

  final _ProfileViewsAnalytics _self;
  final $Res Function(_ProfileViewsAnalytics) _then;

  /// Create a copy of ProfileViewsAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
    Object? byHour = null,
    Object? byDay = null,
  }) {
    return _then(_ProfileViewsAnalytics(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      daily: null == daily
          ? _self.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int,
      weekly: null == weekly
          ? _self.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as int,
      monthly: null == monthly
          ? _self.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int,
      byHour: null == byHour
          ? _self._byHour
          : byHour // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      byDay: null == byDay
          ? _self._byDay
          : byDay // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
mixin _$MatchesAnalytics {
  int get total;
  double get rate;
  int get daily;
  int get weekly;
  int get monthly;

  /// Create a copy of MatchesAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchesAnalyticsCopyWith<MatchesAnalytics> get copyWith =>
      _$MatchesAnalyticsCopyWithImpl<MatchesAnalytics>(
          this as MatchesAnalytics, _$identity);

  /// Serializes this MatchesAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchesAnalytics &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, rate, daily, weekly, monthly);

  @override
  String toString() {
    return 'MatchesAnalytics(total: $total, rate: $rate, daily: $daily, weekly: $weekly, monthly: $monthly)';
  }
}

/// @nodoc
abstract mixin class $MatchesAnalyticsCopyWith<$Res> {
  factory $MatchesAnalyticsCopyWith(
          MatchesAnalytics value, $Res Function(MatchesAnalytics) _then) =
      _$MatchesAnalyticsCopyWithImpl;
  @useResult
  $Res call({int total, double rate, int daily, int weekly, int monthly});
}

/// @nodoc
class _$MatchesAnalyticsCopyWithImpl<$Res>
    implements $MatchesAnalyticsCopyWith<$Res> {
  _$MatchesAnalyticsCopyWithImpl(this._self, this._then);

  final MatchesAnalytics _self;
  final $Res Function(MatchesAnalytics) _then;

  /// Create a copy of MatchesAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? rate = null,
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      daily: null == daily
          ? _self.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int,
      weekly: null == weekly
          ? _self.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as int,
      monthly: null == monthly
          ? _self.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [MatchesAnalytics].
extension MatchesAnalyticsPatterns on MatchesAnalytics {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MatchesAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchesAnalytics() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MatchesAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchesAnalytics():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MatchesAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchesAnalytics() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int total, double rate, int daily, int weekly, int monthly)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchesAnalytics() when $default != null:
        return $default(
            _that.total, _that.rate, _that.daily, _that.weekly, _that.monthly);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int total, double rate, int daily, int weekly, int monthly)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchesAnalytics():
        return $default(
            _that.total, _that.rate, _that.daily, _that.weekly, _that.monthly);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int total, double rate, int daily, int weekly, int monthly)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchesAnalytics() when $default != null:
        return $default(
            _that.total, _that.rate, _that.daily, _that.weekly, _that.monthly);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MatchesAnalytics implements MatchesAnalytics {
  const _MatchesAnalytics(
      {required this.total,
      required this.rate,
      required this.daily,
      required this.weekly,
      required this.monthly});
  factory _MatchesAnalytics.fromJson(Map<String, dynamic> json) =>
      _$MatchesAnalyticsFromJson(json);

  @override
  final int total;
  @override
  final double rate;
  @override
  final int daily;
  @override
  final int weekly;
  @override
  final int monthly;

  /// Create a copy of MatchesAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchesAnalyticsCopyWith<_MatchesAnalytics> get copyWith =>
      __$MatchesAnalyticsCopyWithImpl<_MatchesAnalytics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchesAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchesAnalytics &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, rate, daily, weekly, monthly);

  @override
  String toString() {
    return 'MatchesAnalytics(total: $total, rate: $rate, daily: $daily, weekly: $weekly, monthly: $monthly)';
  }
}

/// @nodoc
abstract mixin class _$MatchesAnalyticsCopyWith<$Res>
    implements $MatchesAnalyticsCopyWith<$Res> {
  factory _$MatchesAnalyticsCopyWith(
          _MatchesAnalytics value, $Res Function(_MatchesAnalytics) _then) =
      __$MatchesAnalyticsCopyWithImpl;
  @override
  @useResult
  $Res call({int total, double rate, int daily, int weekly, int monthly});
}

/// @nodoc
class __$MatchesAnalyticsCopyWithImpl<$Res>
    implements _$MatchesAnalyticsCopyWith<$Res> {
  __$MatchesAnalyticsCopyWithImpl(this._self, this._then);

  final _MatchesAnalytics _self;
  final $Res Function(_MatchesAnalytics) _then;

  /// Create a copy of MatchesAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? rate = null,
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
  }) {
    return _then(_MatchesAnalytics(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      daily: null == daily
          ? _self.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int,
      weekly: null == weekly
          ? _self.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as int,
      monthly: null == monthly
          ? _self.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$MessagesAnalytics {
  int get sent;
  int get received;
  double get responseRate;
  double get averageResponseTime;

  /// Create a copy of MessagesAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessagesAnalyticsCopyWith<MessagesAnalytics> get copyWith =>
      _$MessagesAnalyticsCopyWithImpl<MessagesAnalytics>(
          this as MessagesAnalytics, _$identity);

  /// Serializes this MessagesAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessagesAnalytics &&
            (identical(other.sent, sent) || other.sent == sent) &&
            (identical(other.received, received) ||
                other.received == received) &&
            (identical(other.responseRate, responseRate) ||
                other.responseRate == responseRate) &&
            (identical(other.averageResponseTime, averageResponseTime) ||
                other.averageResponseTime == averageResponseTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sent, received, responseRate, averageResponseTime);

  @override
  String toString() {
    return 'MessagesAnalytics(sent: $sent, received: $received, responseRate: $responseRate, averageResponseTime: $averageResponseTime)';
  }
}

/// @nodoc
abstract mixin class $MessagesAnalyticsCopyWith<$Res> {
  factory $MessagesAnalyticsCopyWith(
          MessagesAnalytics value, $Res Function(MessagesAnalytics) _then) =
      _$MessagesAnalyticsCopyWithImpl;
  @useResult
  $Res call(
      {int sent,
      int received,
      double responseRate,
      double averageResponseTime});
}

/// @nodoc
class _$MessagesAnalyticsCopyWithImpl<$Res>
    implements $MessagesAnalyticsCopyWith<$Res> {
  _$MessagesAnalyticsCopyWithImpl(this._self, this._then);

  final MessagesAnalytics _self;
  final $Res Function(MessagesAnalytics) _then;

  /// Create a copy of MessagesAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sent = null,
    Object? received = null,
    Object? responseRate = null,
    Object? averageResponseTime = null,
  }) {
    return _then(_self.copyWith(
      sent: null == sent
          ? _self.sent
          : sent // ignore: cast_nullable_to_non_nullable
              as int,
      received: null == received
          ? _self.received
          : received // ignore: cast_nullable_to_non_nullable
              as int,
      responseRate: null == responseRate
          ? _self.responseRate
          : responseRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageResponseTime: null == averageResponseTime
          ? _self.averageResponseTime
          : averageResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [MessagesAnalytics].
extension MessagesAnalyticsPatterns on MessagesAnalytics {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MessagesAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessagesAnalytics() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MessagesAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessagesAnalytics():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MessagesAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessagesAnalytics() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int sent, int received, double responseRate,
            double averageResponseTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessagesAnalytics() when $default != null:
        return $default(_that.sent, _that.received, _that.responseRate,
            _that.averageResponseTime);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int sent, int received, double responseRate,
            double averageResponseTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessagesAnalytics():
        return $default(_that.sent, _that.received, _that.responseRate,
            _that.averageResponseTime);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int sent, int received, double responseRate,
            double averageResponseTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessagesAnalytics() when $default != null:
        return $default(_that.sent, _that.received, _that.responseRate,
            _that.averageResponseTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MessagesAnalytics implements MessagesAnalytics {
  const _MessagesAnalytics(
      {required this.sent,
      required this.received,
      required this.responseRate,
      required this.averageResponseTime});
  factory _MessagesAnalytics.fromJson(Map<String, dynamic> json) =>
      _$MessagesAnalyticsFromJson(json);

  @override
  final int sent;
  @override
  final int received;
  @override
  final double responseRate;
  @override
  final double averageResponseTime;

  /// Create a copy of MessagesAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessagesAnalyticsCopyWith<_MessagesAnalytics> get copyWith =>
      __$MessagesAnalyticsCopyWithImpl<_MessagesAnalytics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessagesAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessagesAnalytics &&
            (identical(other.sent, sent) || other.sent == sent) &&
            (identical(other.received, received) ||
                other.received == received) &&
            (identical(other.responseRate, responseRate) ||
                other.responseRate == responseRate) &&
            (identical(other.averageResponseTime, averageResponseTime) ||
                other.averageResponseTime == averageResponseTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sent, received, responseRate, averageResponseTime);

  @override
  String toString() {
    return 'MessagesAnalytics(sent: $sent, received: $received, responseRate: $responseRate, averageResponseTime: $averageResponseTime)';
  }
}

/// @nodoc
abstract mixin class _$MessagesAnalyticsCopyWith<$Res>
    implements $MessagesAnalyticsCopyWith<$Res> {
  factory _$MessagesAnalyticsCopyWith(
          _MessagesAnalytics value, $Res Function(_MessagesAnalytics) _then) =
      __$MessagesAnalyticsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int sent,
      int received,
      double responseRate,
      double averageResponseTime});
}

/// @nodoc
class __$MessagesAnalyticsCopyWithImpl<$Res>
    implements _$MessagesAnalyticsCopyWith<$Res> {
  __$MessagesAnalyticsCopyWithImpl(this._self, this._then);

  final _MessagesAnalytics _self;
  final $Res Function(_MessagesAnalytics) _then;

  /// Create a copy of MessagesAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sent = null,
    Object? received = null,
    Object? responseRate = null,
    Object? averageResponseTime = null,
  }) {
    return _then(_MessagesAnalytics(
      sent: null == sent
          ? _self.sent
          : sent // ignore: cast_nullable_to_non_nullable
              as int,
      received: null == received
          ? _self.received
          : received // ignore: cast_nullable_to_non_nullable
              as int,
      responseRate: null == responseRate
          ? _self.responseRate
          : responseRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageResponseTime: null == averageResponseTime
          ? _self.averageResponseTime
          : averageResponseTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$DiscoveryAnalytics {
  int get likesGiven;
  int get likesReceived;
  int get superLikesGiven;
  int get superLikesReceived;
  int get rewindCount;

  /// Create a copy of DiscoveryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiscoveryAnalyticsCopyWith<DiscoveryAnalytics> get copyWith =>
      _$DiscoveryAnalyticsCopyWithImpl<DiscoveryAnalytics>(
          this as DiscoveryAnalytics, _$identity);

  /// Serializes this DiscoveryAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DiscoveryAnalytics &&
            (identical(other.likesGiven, likesGiven) ||
                other.likesGiven == likesGiven) &&
            (identical(other.likesReceived, likesReceived) ||
                other.likesReceived == likesReceived) &&
            (identical(other.superLikesGiven, superLikesGiven) ||
                other.superLikesGiven == superLikesGiven) &&
            (identical(other.superLikesReceived, superLikesReceived) ||
                other.superLikesReceived == superLikesReceived) &&
            (identical(other.rewindCount, rewindCount) ||
                other.rewindCount == rewindCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, likesGiven, likesReceived,
      superLikesGiven, superLikesReceived, rewindCount);

  @override
  String toString() {
    return 'DiscoveryAnalytics(likesGiven: $likesGiven, likesReceived: $likesReceived, superLikesGiven: $superLikesGiven, superLikesReceived: $superLikesReceived, rewindCount: $rewindCount)';
  }
}

/// @nodoc
abstract mixin class $DiscoveryAnalyticsCopyWith<$Res> {
  factory $DiscoveryAnalyticsCopyWith(
          DiscoveryAnalytics value, $Res Function(DiscoveryAnalytics) _then) =
      _$DiscoveryAnalyticsCopyWithImpl;
  @useResult
  $Res call(
      {int likesGiven,
      int likesReceived,
      int superLikesGiven,
      int superLikesReceived,
      int rewindCount});
}

/// @nodoc
class _$DiscoveryAnalyticsCopyWithImpl<$Res>
    implements $DiscoveryAnalyticsCopyWith<$Res> {
  _$DiscoveryAnalyticsCopyWithImpl(this._self, this._then);

  final DiscoveryAnalytics _self;
  final $Res Function(DiscoveryAnalytics) _then;

  /// Create a copy of DiscoveryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likesGiven = null,
    Object? likesReceived = null,
    Object? superLikesGiven = null,
    Object? superLikesReceived = null,
    Object? rewindCount = null,
  }) {
    return _then(_self.copyWith(
      likesGiven: null == likesGiven
          ? _self.likesGiven
          : likesGiven // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _self.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      superLikesGiven: null == superLikesGiven
          ? _self.superLikesGiven
          : superLikesGiven // ignore: cast_nullable_to_non_nullable
              as int,
      superLikesReceived: null == superLikesReceived
          ? _self.superLikesReceived
          : superLikesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      rewindCount: null == rewindCount
          ? _self.rewindCount
          : rewindCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [DiscoveryAnalytics].
extension DiscoveryAnalyticsPatterns on DiscoveryAnalytics {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DiscoveryAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DiscoveryAnalytics() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DiscoveryAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DiscoveryAnalytics():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DiscoveryAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DiscoveryAnalytics() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int likesGiven, int likesReceived, int superLikesGiven,
            int superLikesReceived, int rewindCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DiscoveryAnalytics() when $default != null:
        return $default(_that.likesGiven, _that.likesReceived,
            _that.superLikesGiven, _that.superLikesReceived, _that.rewindCount);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int likesGiven, int likesReceived, int superLikesGiven,
            int superLikesReceived, int rewindCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DiscoveryAnalytics():
        return $default(_that.likesGiven, _that.likesReceived,
            _that.superLikesGiven, _that.superLikesReceived, _that.rewindCount);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int likesGiven, int likesReceived, int superLikesGiven,
            int superLikesReceived, int rewindCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DiscoveryAnalytics() when $default != null:
        return $default(_that.likesGiven, _that.likesReceived,
            _that.superLikesGiven, _that.superLikesReceived, _that.rewindCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DiscoveryAnalytics implements DiscoveryAnalytics {
  const _DiscoveryAnalytics(
      {required this.likesGiven,
      required this.likesReceived,
      required this.superLikesGiven,
      required this.superLikesReceived,
      required this.rewindCount});
  factory _DiscoveryAnalytics.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryAnalyticsFromJson(json);

  @override
  final int likesGiven;
  @override
  final int likesReceived;
  @override
  final int superLikesGiven;
  @override
  final int superLikesReceived;
  @override
  final int rewindCount;

  /// Create a copy of DiscoveryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiscoveryAnalyticsCopyWith<_DiscoveryAnalytics> get copyWith =>
      __$DiscoveryAnalyticsCopyWithImpl<_DiscoveryAnalytics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DiscoveryAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DiscoveryAnalytics &&
            (identical(other.likesGiven, likesGiven) ||
                other.likesGiven == likesGiven) &&
            (identical(other.likesReceived, likesReceived) ||
                other.likesReceived == likesReceived) &&
            (identical(other.superLikesGiven, superLikesGiven) ||
                other.superLikesGiven == superLikesGiven) &&
            (identical(other.superLikesReceived, superLikesReceived) ||
                other.superLikesReceived == superLikesReceived) &&
            (identical(other.rewindCount, rewindCount) ||
                other.rewindCount == rewindCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, likesGiven, likesReceived,
      superLikesGiven, superLikesReceived, rewindCount);

  @override
  String toString() {
    return 'DiscoveryAnalytics(likesGiven: $likesGiven, likesReceived: $likesReceived, superLikesGiven: $superLikesGiven, superLikesReceived: $superLikesReceived, rewindCount: $rewindCount)';
  }
}

/// @nodoc
abstract mixin class _$DiscoveryAnalyticsCopyWith<$Res>
    implements $DiscoveryAnalyticsCopyWith<$Res> {
  factory _$DiscoveryAnalyticsCopyWith(
          _DiscoveryAnalytics value, $Res Function(_DiscoveryAnalytics) _then) =
      __$DiscoveryAnalyticsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int likesGiven,
      int likesReceived,
      int superLikesGiven,
      int superLikesReceived,
      int rewindCount});
}

/// @nodoc
class __$DiscoveryAnalyticsCopyWithImpl<$Res>
    implements _$DiscoveryAnalyticsCopyWith<$Res> {
  __$DiscoveryAnalyticsCopyWithImpl(this._self, this._then);

  final _DiscoveryAnalytics _self;
  final $Res Function(_DiscoveryAnalytics) _then;

  /// Create a copy of DiscoveryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? likesGiven = null,
    Object? likesReceived = null,
    Object? superLikesGiven = null,
    Object? superLikesReceived = null,
    Object? rewindCount = null,
  }) {
    return _then(_DiscoveryAnalytics(
      likesGiven: null == likesGiven
          ? _self.likesGiven
          : likesGiven // ignore: cast_nullable_to_non_nullable
              as int,
      likesReceived: null == likesReceived
          ? _self.likesReceived
          : likesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      superLikesGiven: null == superLikesGiven
          ? _self.superLikesGiven
          : superLikesGiven // ignore: cast_nullable_to_non_nullable
              as int,
      superLikesReceived: null == superLikesReceived
          ? _self.superLikesReceived
          : superLikesReceived // ignore: cast_nullable_to_non_nullable
              as int,
      rewindCount: null == rewindCount
          ? _self.rewindCount
          : rewindCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$LocationAnalytics {
  Map<String, int> get activeHours;
  List<PopularLocation> get popularLocations;

  /// Create a copy of LocationAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationAnalyticsCopyWith<LocationAnalytics> get copyWith =>
      _$LocationAnalyticsCopyWithImpl<LocationAnalytics>(
          this as LocationAnalytics, _$identity);

  /// Serializes this LocationAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationAnalytics &&
            const DeepCollectionEquality()
                .equals(other.activeHours, activeHours) &&
            const DeepCollectionEquality()
                .equals(other.popularLocations, popularLocations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activeHours),
      const DeepCollectionEquality().hash(popularLocations));

  @override
  String toString() {
    return 'LocationAnalytics(activeHours: $activeHours, popularLocations: $popularLocations)';
  }
}

/// @nodoc
abstract mixin class $LocationAnalyticsCopyWith<$Res> {
  factory $LocationAnalyticsCopyWith(
          LocationAnalytics value, $Res Function(LocationAnalytics) _then) =
      _$LocationAnalyticsCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, int> activeHours, List<PopularLocation> popularLocations});
}

/// @nodoc
class _$LocationAnalyticsCopyWithImpl<$Res>
    implements $LocationAnalyticsCopyWith<$Res> {
  _$LocationAnalyticsCopyWithImpl(this._self, this._then);

  final LocationAnalytics _self;
  final $Res Function(LocationAnalytics) _then;

  /// Create a copy of LocationAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeHours = null,
    Object? popularLocations = null,
  }) {
    return _then(_self.copyWith(
      activeHours: null == activeHours
          ? _self.activeHours
          : activeHours // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      popularLocations: null == popularLocations
          ? _self.popularLocations
          : popularLocations // ignore: cast_nullable_to_non_nullable
              as List<PopularLocation>,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocationAnalytics].
extension LocationAnalyticsPatterns on LocationAnalytics {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocationAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationAnalytics() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocationAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationAnalytics():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocationAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationAnalytics() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, int> activeHours,
            List<PopularLocation> popularLocations)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationAnalytics() when $default != null:
        return $default(_that.activeHours, _that.popularLocations);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, int> activeHours,
            List<PopularLocation> popularLocations)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationAnalytics():
        return $default(_that.activeHours, _that.popularLocations);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<String, int> activeHours,
            List<PopularLocation> popularLocations)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationAnalytics() when $default != null:
        return $default(_that.activeHours, _that.popularLocations);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationAnalytics implements LocationAnalytics {
  const _LocationAnalytics(
      {required final Map<String, int> activeHours,
      required final List<PopularLocation> popularLocations})
      : _activeHours = activeHours,
        _popularLocations = popularLocations;
  factory _LocationAnalytics.fromJson(Map<String, dynamic> json) =>
      _$LocationAnalyticsFromJson(json);

  final Map<String, int> _activeHours;
  @override
  Map<String, int> get activeHours {
    if (_activeHours is EqualUnmodifiableMapView) return _activeHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activeHours);
  }

  final List<PopularLocation> _popularLocations;
  @override
  List<PopularLocation> get popularLocations {
    if (_popularLocations is EqualUnmodifiableListView)
      return _popularLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularLocations);
  }

  /// Create a copy of LocationAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationAnalyticsCopyWith<_LocationAnalytics> get copyWith =>
      __$LocationAnalyticsCopyWithImpl<_LocationAnalytics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationAnalytics &&
            const DeepCollectionEquality()
                .equals(other._activeHours, _activeHours) &&
            const DeepCollectionEquality()
                .equals(other._popularLocations, _popularLocations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeHours),
      const DeepCollectionEquality().hash(_popularLocations));

  @override
  String toString() {
    return 'LocationAnalytics(activeHours: $activeHours, popularLocations: $popularLocations)';
  }
}

/// @nodoc
abstract mixin class _$LocationAnalyticsCopyWith<$Res>
    implements $LocationAnalyticsCopyWith<$Res> {
  factory _$LocationAnalyticsCopyWith(
          _LocationAnalytics value, $Res Function(_LocationAnalytics) _then) =
      __$LocationAnalyticsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, int> activeHours, List<PopularLocation> popularLocations});
}

/// @nodoc
class __$LocationAnalyticsCopyWithImpl<$Res>
    implements _$LocationAnalyticsCopyWith<$Res> {
  __$LocationAnalyticsCopyWithImpl(this._self, this._then);

  final _LocationAnalytics _self;
  final $Res Function(_LocationAnalytics) _then;

  /// Create a copy of LocationAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeHours = null,
    Object? popularLocations = null,
  }) {
    return _then(_LocationAnalytics(
      activeHours: null == activeHours
          ? _self._activeHours
          : activeHours // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      popularLocations: null == popularLocations
          ? _self._popularLocations
          : popularLocations // ignore: cast_nullable_to_non_nullable
              as List<PopularLocation>,
    ));
  }
}

/// @nodoc
mixin _$PopularLocation {
  List<double> get coordinates;
  int get count;

  /// Create a copy of PopularLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PopularLocationCopyWith<PopularLocation> get copyWith =>
      _$PopularLocationCopyWithImpl<PopularLocation>(
          this as PopularLocation, _$identity);

  /// Serializes this PopularLocation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PopularLocation &&
            const DeepCollectionEquality()
                .equals(other.coordinates, coordinates) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(coordinates), count);

  @override
  String toString() {
    return 'PopularLocation(coordinates: $coordinates, count: $count)';
  }
}

/// @nodoc
abstract mixin class $PopularLocationCopyWith<$Res> {
  factory $PopularLocationCopyWith(
          PopularLocation value, $Res Function(PopularLocation) _then) =
      _$PopularLocationCopyWithImpl;
  @useResult
  $Res call({List<double> coordinates, int count});
}

/// @nodoc
class _$PopularLocationCopyWithImpl<$Res>
    implements $PopularLocationCopyWith<$Res> {
  _$PopularLocationCopyWithImpl(this._self, this._then);

  final PopularLocation _self;
  final $Res Function(PopularLocation) _then;

  /// Create a copy of PopularLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      coordinates: null == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PopularLocation].
extension PopularLocationPatterns on PopularLocation {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PopularLocation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PopularLocation() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PopularLocation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PopularLocation():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PopularLocation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PopularLocation() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<double> coordinates, int count)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PopularLocation() when $default != null:
        return $default(_that.coordinates, _that.count);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<double> coordinates, int count) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PopularLocation():
        return $default(_that.coordinates, _that.count);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<double> coordinates, int count)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PopularLocation() when $default != null:
        return $default(_that.coordinates, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PopularLocation implements PopularLocation {
  const _PopularLocation(
      {required final List<double> coordinates, required this.count})
      : _coordinates = coordinates;
  factory _PopularLocation.fromJson(Map<String, dynamic> json) =>
      _$PopularLocationFromJson(json);

  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  final int count;

  /// Create a copy of PopularLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PopularLocationCopyWith<_PopularLocation> get copyWith =>
      __$PopularLocationCopyWithImpl<_PopularLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PopularLocationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PopularLocation &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates), count);

  @override
  String toString() {
    return 'PopularLocation(coordinates: $coordinates, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$PopularLocationCopyWith<$Res>
    implements $PopularLocationCopyWith<$Res> {
  factory _$PopularLocationCopyWith(
          _PopularLocation value, $Res Function(_PopularLocation) _then) =
      __$PopularLocationCopyWithImpl;
  @override
  @useResult
  $Res call({List<double> coordinates, int count});
}

/// @nodoc
class __$PopularLocationCopyWithImpl<$Res>
    implements _$PopularLocationCopyWith<$Res> {
  __$PopularLocationCopyWithImpl(this._self, this._then);

  final _PopularLocation _self;
  final $Res Function(_PopularLocation) _then;

  /// Create a copy of PopularLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coordinates = null,
    Object? count = null,
  }) {
    return _then(_PopularLocation(
      coordinates: null == coordinates
          ? _self._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
