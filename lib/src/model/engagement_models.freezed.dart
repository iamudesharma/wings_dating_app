// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'engagement_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EngagementStatus {
  bool get hasTapped;
  bool get hasLiked;
  bool get hasSuperLiked;
  bool get isMatch;

  /// Create a copy of EngagementStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EngagementStatusCopyWith<EngagementStatus> get copyWith =>
      _$EngagementStatusCopyWithImpl<EngagementStatus>(
          this as EngagementStatus, _$identity);

  /// Serializes this EngagementStatus to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EngagementStatus &&
            (identical(other.hasTapped, hasTapped) ||
                other.hasTapped == hasTapped) &&
            (identical(other.hasLiked, hasLiked) ||
                other.hasLiked == hasLiked) &&
            (identical(other.hasSuperLiked, hasSuperLiked) ||
                other.hasSuperLiked == hasSuperLiked) &&
            (identical(other.isMatch, isMatch) || other.isMatch == isMatch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hasTapped, hasLiked, hasSuperLiked, isMatch);

  @override
  String toString() {
    return 'EngagementStatus(hasTapped: $hasTapped, hasLiked: $hasLiked, hasSuperLiked: $hasSuperLiked, isMatch: $isMatch)';
  }
}

/// @nodoc
abstract mixin class $EngagementStatusCopyWith<$Res> {
  factory $EngagementStatusCopyWith(
          EngagementStatus value, $Res Function(EngagementStatus) _then) =
      _$EngagementStatusCopyWithImpl;
  @useResult
  $Res call({bool hasTapped, bool hasLiked, bool hasSuperLiked, bool isMatch});
}

/// @nodoc
class _$EngagementStatusCopyWithImpl<$Res>
    implements $EngagementStatusCopyWith<$Res> {
  _$EngagementStatusCopyWithImpl(this._self, this._then);

  final EngagementStatus _self;
  final $Res Function(EngagementStatus) _then;

  /// Create a copy of EngagementStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasTapped = null,
    Object? hasLiked = null,
    Object? hasSuperLiked = null,
    Object? isMatch = null,
  }) {
    return _then(_self.copyWith(
      hasTapped: null == hasTapped
          ? _self.hasTapped
          : hasTapped // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLiked: null == hasLiked
          ? _self.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSuperLiked: null == hasSuperLiked
          ? _self.hasSuperLiked
          : hasSuperLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isMatch: null == isMatch
          ? _self.isMatch
          : isMatch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [EngagementStatus].
extension EngagementStatusPatterns on EngagementStatus {
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
    TResult Function(_EngagementStatus value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EngagementStatus() when $default != null:
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
    TResult Function(_EngagementStatus value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EngagementStatus():
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
    TResult? Function(_EngagementStatus value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EngagementStatus() when $default != null:
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
            bool hasTapped, bool hasLiked, bool hasSuperLiked, bool isMatch)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EngagementStatus() when $default != null:
        return $default(_that.hasTapped, _that.hasLiked, _that.hasSuperLiked,
            _that.isMatch);
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
            bool hasTapped, bool hasLiked, bool hasSuperLiked, bool isMatch)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EngagementStatus():
        return $default(_that.hasTapped, _that.hasLiked, _that.hasSuperLiked,
            _that.isMatch);
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
            bool hasTapped, bool hasLiked, bool hasSuperLiked, bool isMatch)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EngagementStatus() when $default != null:
        return $default(_that.hasTapped, _that.hasLiked, _that.hasSuperLiked,
            _that.isMatch);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EngagementStatus implements EngagementStatus {
  const _EngagementStatus(
      {this.hasTapped = false,
      this.hasLiked = false,
      this.hasSuperLiked = false,
      this.isMatch = false});
  factory _EngagementStatus.fromJson(Map<String, dynamic> json) =>
      _$EngagementStatusFromJson(json);

  @override
  @JsonKey()
  final bool hasTapped;
  @override
  @JsonKey()
  final bool hasLiked;
  @override
  @JsonKey()
  final bool hasSuperLiked;
  @override
  @JsonKey()
  final bool isMatch;

  /// Create a copy of EngagementStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EngagementStatusCopyWith<_EngagementStatus> get copyWith =>
      __$EngagementStatusCopyWithImpl<_EngagementStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EngagementStatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EngagementStatus &&
            (identical(other.hasTapped, hasTapped) ||
                other.hasTapped == hasTapped) &&
            (identical(other.hasLiked, hasLiked) ||
                other.hasLiked == hasLiked) &&
            (identical(other.hasSuperLiked, hasSuperLiked) ||
                other.hasSuperLiked == hasSuperLiked) &&
            (identical(other.isMatch, isMatch) || other.isMatch == isMatch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hasTapped, hasLiked, hasSuperLiked, isMatch);

  @override
  String toString() {
    return 'EngagementStatus(hasTapped: $hasTapped, hasLiked: $hasLiked, hasSuperLiked: $hasSuperLiked, isMatch: $isMatch)';
  }
}

/// @nodoc
abstract mixin class _$EngagementStatusCopyWith<$Res>
    implements $EngagementStatusCopyWith<$Res> {
  factory _$EngagementStatusCopyWith(
          _EngagementStatus value, $Res Function(_EngagementStatus) _then) =
      __$EngagementStatusCopyWithImpl;
  @override
  @useResult
  $Res call({bool hasTapped, bool hasLiked, bool hasSuperLiked, bool isMatch});
}

/// @nodoc
class __$EngagementStatusCopyWithImpl<$Res>
    implements _$EngagementStatusCopyWith<$Res> {
  __$EngagementStatusCopyWithImpl(this._self, this._then);

  final _EngagementStatus _self;
  final $Res Function(_EngagementStatus) _then;

  /// Create a copy of EngagementStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hasTapped = null,
    Object? hasLiked = null,
    Object? hasSuperLiked = null,
    Object? isMatch = null,
  }) {
    return _then(_EngagementStatus(
      hasTapped: null == hasTapped
          ? _self.hasTapped
          : hasTapped // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLiked: null == hasLiked
          ? _self.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSuperLiked: null == hasSuperLiked
          ? _self.hasSuperLiked
          : hasSuperLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isMatch: null == isMatch
          ? _self.isMatch
          : isMatch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ProfileVisitResponse {
  String get status;
  String get message;
  int? get visitCount;
  EngagementStatus? get engagementStatus;

  /// Create a copy of ProfileVisitResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileVisitResponseCopyWith<ProfileVisitResponse> get copyWith =>
      _$ProfileVisitResponseCopyWithImpl<ProfileVisitResponse>(
          this as ProfileVisitResponse, _$identity);

  /// Serializes this ProfileVisitResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileVisitResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.engagementStatus, engagementStatus) ||
                other.engagementStatus == engagementStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, visitCount, engagementStatus);

  @override
  String toString() {
    return 'ProfileVisitResponse(status: $status, message: $message, visitCount: $visitCount, engagementStatus: $engagementStatus)';
  }
}

/// @nodoc
abstract mixin class $ProfileVisitResponseCopyWith<$Res> {
  factory $ProfileVisitResponseCopyWith(ProfileVisitResponse value,
          $Res Function(ProfileVisitResponse) _then) =
      _$ProfileVisitResponseCopyWithImpl;
  @useResult
  $Res call(
      {String status,
      String message,
      int? visitCount,
      EngagementStatus? engagementStatus});

  $EngagementStatusCopyWith<$Res>? get engagementStatus;
}

/// @nodoc
class _$ProfileVisitResponseCopyWithImpl<$Res>
    implements $ProfileVisitResponseCopyWith<$Res> {
  _$ProfileVisitResponseCopyWithImpl(this._self, this._then);

  final ProfileVisitResponse _self;
  final $Res Function(ProfileVisitResponse) _then;

  /// Create a copy of ProfileVisitResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? visitCount = freezed,
    Object? engagementStatus = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      visitCount: freezed == visitCount
          ? _self.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int?,
      engagementStatus: freezed == engagementStatus
          ? _self.engagementStatus
          : engagementStatus // ignore: cast_nullable_to_non_nullable
              as EngagementStatus?,
    ));
  }

  /// Create a copy of ProfileVisitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EngagementStatusCopyWith<$Res>? get engagementStatus {
    if (_self.engagementStatus == null) {
      return null;
    }

    return $EngagementStatusCopyWith<$Res>(_self.engagementStatus!, (value) {
      return _then(_self.copyWith(engagementStatus: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProfileVisitResponse].
extension ProfileVisitResponsePatterns on ProfileVisitResponse {
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
    TResult Function(_ProfileVisitResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileVisitResponse() when $default != null:
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
    TResult Function(_ProfileVisitResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileVisitResponse():
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
    TResult? Function(_ProfileVisitResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileVisitResponse() when $default != null:
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
    TResult Function(String status, String message, int? visitCount,
            EngagementStatus? engagementStatus)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileVisitResponse() when $default != null:
        return $default(_that.status, _that.message, _that.visitCount,
            _that.engagementStatus);
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
    TResult Function(String status, String message, int? visitCount,
            EngagementStatus? engagementStatus)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileVisitResponse():
        return $default(_that.status, _that.message, _that.visitCount,
            _that.engagementStatus);
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
    TResult? Function(String status, String message, int? visitCount,
            EngagementStatus? engagementStatus)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileVisitResponse() when $default != null:
        return $default(_that.status, _that.message, _that.visitCount,
            _that.engagementStatus);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileVisitResponse implements ProfileVisitResponse {
  const _ProfileVisitResponse(
      {this.status = '',
      this.message = '',
      this.visitCount,
      this.engagementStatus});
  factory _ProfileVisitResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileVisitResponseFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String message;
  @override
  final int? visitCount;
  @override
  final EngagementStatus? engagementStatus;

  /// Create a copy of ProfileVisitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileVisitResponseCopyWith<_ProfileVisitResponse> get copyWith =>
      __$ProfileVisitResponseCopyWithImpl<_ProfileVisitResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileVisitResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileVisitResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.engagementStatus, engagementStatus) ||
                other.engagementStatus == engagementStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, visitCount, engagementStatus);

  @override
  String toString() {
    return 'ProfileVisitResponse(status: $status, message: $message, visitCount: $visitCount, engagementStatus: $engagementStatus)';
  }
}

/// @nodoc
abstract mixin class _$ProfileVisitResponseCopyWith<$Res>
    implements $ProfileVisitResponseCopyWith<$Res> {
  factory _$ProfileVisitResponseCopyWith(_ProfileVisitResponse value,
          $Res Function(_ProfileVisitResponse) _then) =
      __$ProfileVisitResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String status,
      String message,
      int? visitCount,
      EngagementStatus? engagementStatus});

  @override
  $EngagementStatusCopyWith<$Res>? get engagementStatus;
}

/// @nodoc
class __$ProfileVisitResponseCopyWithImpl<$Res>
    implements _$ProfileVisitResponseCopyWith<$Res> {
  __$ProfileVisitResponseCopyWithImpl(this._self, this._then);

  final _ProfileVisitResponse _self;
  final $Res Function(_ProfileVisitResponse) _then;

  /// Create a copy of ProfileVisitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? visitCount = freezed,
    Object? engagementStatus = freezed,
  }) {
    return _then(_ProfileVisitResponse(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      visitCount: freezed == visitCount
          ? _self.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int?,
      engagementStatus: freezed == engagementStatus
          ? _self.engagementStatus
          : engagementStatus // ignore: cast_nullable_to_non_nullable
              as EngagementStatus?,
    ));
  }

  /// Create a copy of ProfileVisitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EngagementStatusCopyWith<$Res>? get engagementStatus {
    if (_self.engagementStatus == null) {
      return null;
    }

    return $EngagementStatusCopyWith<$Res>(_self.engagementStatus!, (value) {
      return _then(_self.copyWith(engagementStatus: value));
    });
  }
}

/// @nodoc
mixin _$TapResponse {
  bool get success;
  String get message;
  int? get remainingTaps;
  List<String> get tappedBy;

  /// Create a copy of TapResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TapResponseCopyWith<TapResponse> get copyWith =>
      _$TapResponseCopyWithImpl<TapResponse>(this as TapResponse, _$identity);

  /// Serializes this TapResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TapResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.remainingTaps, remainingTaps) ||
                other.remainingTaps == remainingTaps) &&
            const DeepCollectionEquality().equals(other.tappedBy, tappedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, remainingTaps,
      const DeepCollectionEquality().hash(tappedBy));

  @override
  String toString() {
    return 'TapResponse(success: $success, message: $message, remainingTaps: $remainingTaps, tappedBy: $tappedBy)';
  }
}

/// @nodoc
abstract mixin class $TapResponseCopyWith<$Res> {
  factory $TapResponseCopyWith(
          TapResponse value, $Res Function(TapResponse) _then) =
      _$TapResponseCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      String message,
      int? remainingTaps,
      List<String> tappedBy});
}

/// @nodoc
class _$TapResponseCopyWithImpl<$Res> implements $TapResponseCopyWith<$Res> {
  _$TapResponseCopyWithImpl(this._self, this._then);

  final TapResponse _self;
  final $Res Function(TapResponse) _then;

  /// Create a copy of TapResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? remainingTaps = freezed,
    Object? tappedBy = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      remainingTaps: freezed == remainingTaps
          ? _self.remainingTaps
          : remainingTaps // ignore: cast_nullable_to_non_nullable
              as int?,
      tappedBy: null == tappedBy
          ? _self.tappedBy
          : tappedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TapResponse].
extension TapResponsePatterns on TapResponse {
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
    TResult Function(_TapResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TapResponse() when $default != null:
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
    TResult Function(_TapResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TapResponse():
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
    TResult? Function(_TapResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TapResponse() when $default != null:
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
    TResult Function(bool success, String message, int? remainingTaps,
            List<String> tappedBy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TapResponse() when $default != null:
        return $default(
            _that.success, _that.message, _that.remainingTaps, _that.tappedBy);
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
    TResult Function(bool success, String message, int? remainingTaps,
            List<String> tappedBy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TapResponse():
        return $default(
            _that.success, _that.message, _that.remainingTaps, _that.tappedBy);
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
    TResult? Function(bool success, String message, int? remainingTaps,
            List<String> tappedBy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TapResponse() when $default != null:
        return $default(
            _that.success, _that.message, _that.remainingTaps, _that.tappedBy);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TapResponse implements TapResponse {
  const _TapResponse(
      {this.success = false,
      this.message = '',
      this.remainingTaps,
      final List<String> tappedBy = const []})
      : _tappedBy = tappedBy;
  factory _TapResponse.fromJson(Map<String, dynamic> json) =>
      _$TapResponseFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  final int? remainingTaps;
  final List<String> _tappedBy;
  @override
  @JsonKey()
  List<String> get tappedBy {
    if (_tappedBy is EqualUnmodifiableListView) return _tappedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tappedBy);
  }

  /// Create a copy of TapResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TapResponseCopyWith<_TapResponse> get copyWith =>
      __$TapResponseCopyWithImpl<_TapResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TapResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TapResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.remainingTaps, remainingTaps) ||
                other.remainingTaps == remainingTaps) &&
            const DeepCollectionEquality().equals(other._tappedBy, _tappedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, remainingTaps,
      const DeepCollectionEquality().hash(_tappedBy));

  @override
  String toString() {
    return 'TapResponse(success: $success, message: $message, remainingTaps: $remainingTaps, tappedBy: $tappedBy)';
  }
}

/// @nodoc
abstract mixin class _$TapResponseCopyWith<$Res>
    implements $TapResponseCopyWith<$Res> {
  factory _$TapResponseCopyWith(
          _TapResponse value, $Res Function(_TapResponse) _then) =
      __$TapResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      int? remainingTaps,
      List<String> tappedBy});
}

/// @nodoc
class __$TapResponseCopyWithImpl<$Res> implements _$TapResponseCopyWith<$Res> {
  __$TapResponseCopyWithImpl(this._self, this._then);

  final _TapResponse _self;
  final $Res Function(_TapResponse) _then;

  /// Create a copy of TapResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? remainingTaps = freezed,
    Object? tappedBy = null,
  }) {
    return _then(_TapResponse(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      remainingTaps: freezed == remainingTaps
          ? _self.remainingTaps
          : remainingTaps // ignore: cast_nullable_to_non_nullable
              as int?,
      tappedBy: null == tappedBy
          ? _self._tappedBy
          : tappedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$UserTapStats {
  bool get success;
  String get message;
  int get remainingTaps;
  List<String> get tappedBy;
  EngagementStatus? get engagementStatus;

  /// Create a copy of UserTapStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserTapStatsCopyWith<UserTapStats> get copyWith =>
      _$UserTapStatsCopyWithImpl<UserTapStats>(
          this as UserTapStats, _$identity);

  /// Serializes this UserTapStats to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserTapStats &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.remainingTaps, remainingTaps) ||
                other.remainingTaps == remainingTaps) &&
            const DeepCollectionEquality().equals(other.tappedBy, tappedBy) &&
            (identical(other.engagementStatus, engagementStatus) ||
                other.engagementStatus == engagementStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, remainingTaps,
      const DeepCollectionEquality().hash(tappedBy), engagementStatus);

  @override
  String toString() {
    return 'UserTapStats(success: $success, message: $message, remainingTaps: $remainingTaps, tappedBy: $tappedBy, engagementStatus: $engagementStatus)';
  }
}

/// @nodoc
abstract mixin class $UserTapStatsCopyWith<$Res> {
  factory $UserTapStatsCopyWith(
          UserTapStats value, $Res Function(UserTapStats) _then) =
      _$UserTapStatsCopyWithImpl;
  @useResult
  $Res call(
      {bool success,
      String message,
      int remainingTaps,
      List<String> tappedBy,
      EngagementStatus? engagementStatus});

  $EngagementStatusCopyWith<$Res>? get engagementStatus;
}

/// @nodoc
class _$UserTapStatsCopyWithImpl<$Res> implements $UserTapStatsCopyWith<$Res> {
  _$UserTapStatsCopyWithImpl(this._self, this._then);

  final UserTapStats _self;
  final $Res Function(UserTapStats) _then;

  /// Create a copy of UserTapStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? remainingTaps = null,
    Object? tappedBy = null,
    Object? engagementStatus = freezed,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      remainingTaps: null == remainingTaps
          ? _self.remainingTaps
          : remainingTaps // ignore: cast_nullable_to_non_nullable
              as int,
      tappedBy: null == tappedBy
          ? _self.tappedBy
          : tappedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      engagementStatus: freezed == engagementStatus
          ? _self.engagementStatus
          : engagementStatus // ignore: cast_nullable_to_non_nullable
              as EngagementStatus?,
    ));
  }

  /// Create a copy of UserTapStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EngagementStatusCopyWith<$Res>? get engagementStatus {
    if (_self.engagementStatus == null) {
      return null;
    }

    return $EngagementStatusCopyWith<$Res>(_self.engagementStatus!, (value) {
      return _then(_self.copyWith(engagementStatus: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserTapStats].
extension UserTapStatsPatterns on UserTapStats {
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
    TResult Function(_UserTapStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserTapStats() when $default != null:
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
    TResult Function(_UserTapStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserTapStats():
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
    TResult? Function(_UserTapStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserTapStats() when $default != null:
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
    TResult Function(bool success, String message, int remainingTaps,
            List<String> tappedBy, EngagementStatus? engagementStatus)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserTapStats() when $default != null:
        return $default(_that.success, _that.message, _that.remainingTaps,
            _that.tappedBy, _that.engagementStatus);
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
    TResult Function(bool success, String message, int remainingTaps,
            List<String> tappedBy, EngagementStatus? engagementStatus)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserTapStats():
        return $default(_that.success, _that.message, _that.remainingTaps,
            _that.tappedBy, _that.engagementStatus);
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
    TResult? Function(bool success, String message, int remainingTaps,
            List<String> tappedBy, EngagementStatus? engagementStatus)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserTapStats() when $default != null:
        return $default(_that.success, _that.message, _that.remainingTaps,
            _that.tappedBy, _that.engagementStatus);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserTapStats implements UserTapStats {
  const _UserTapStats(
      {this.success = false,
      this.message = '',
      this.remainingTaps = 0,
      final List<String> tappedBy = const [],
      this.engagementStatus})
      : _tappedBy = tappedBy;
  factory _UserTapStats.fromJson(Map<String, dynamic> json) =>
      _$UserTapStatsFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int remainingTaps;
  final List<String> _tappedBy;
  @override
  @JsonKey()
  List<String> get tappedBy {
    if (_tappedBy is EqualUnmodifiableListView) return _tappedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tappedBy);
  }

  @override
  final EngagementStatus? engagementStatus;

  /// Create a copy of UserTapStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserTapStatsCopyWith<_UserTapStats> get copyWith =>
      __$UserTapStatsCopyWithImpl<_UserTapStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserTapStatsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserTapStats &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.remainingTaps, remainingTaps) ||
                other.remainingTaps == remainingTaps) &&
            const DeepCollectionEquality().equals(other._tappedBy, _tappedBy) &&
            (identical(other.engagementStatus, engagementStatus) ||
                other.engagementStatus == engagementStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, remainingTaps,
      const DeepCollectionEquality().hash(_tappedBy), engagementStatus);

  @override
  String toString() {
    return 'UserTapStats(success: $success, message: $message, remainingTaps: $remainingTaps, tappedBy: $tappedBy, engagementStatus: $engagementStatus)';
  }
}

/// @nodoc
abstract mixin class _$UserTapStatsCopyWith<$Res>
    implements $UserTapStatsCopyWith<$Res> {
  factory _$UserTapStatsCopyWith(
          _UserTapStats value, $Res Function(_UserTapStats) _then) =
      __$UserTapStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      int remainingTaps,
      List<String> tappedBy,
      EngagementStatus? engagementStatus});

  @override
  $EngagementStatusCopyWith<$Res>? get engagementStatus;
}

/// @nodoc
class __$UserTapStatsCopyWithImpl<$Res>
    implements _$UserTapStatsCopyWith<$Res> {
  __$UserTapStatsCopyWithImpl(this._self, this._then);

  final _UserTapStats _self;
  final $Res Function(_UserTapStats) _then;

  /// Create a copy of UserTapStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? remainingTaps = null,
    Object? tappedBy = null,
    Object? engagementStatus = freezed,
  }) {
    return _then(_UserTapStats(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      remainingTaps: null == remainingTaps
          ? _self.remainingTaps
          : remainingTaps // ignore: cast_nullable_to_non_nullable
              as int,
      tappedBy: null == tappedBy
          ? _self._tappedBy
          : tappedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      engagementStatus: freezed == engagementStatus
          ? _self.engagementStatus
          : engagementStatus // ignore: cast_nullable_to_non_nullable
              as EngagementStatus?,
    ));
  }

  /// Create a copy of UserTapStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EngagementStatusCopyWith<$Res>? get engagementStatus {
    if (_self.engagementStatus == null) {
      return null;
    }

    return $EngagementStatusCopyWith<$Res>(_self.engagementStatus!, (value) {
      return _then(_self.copyWith(engagementStatus: value));
    });
  }
}

/// @nodoc
mixin _$TapDetails {
  String get id;
  String get userId;
  String get targetUserId;
  DateTime get tappedAt;
  UserModel? get user;

  /// Create a copy of TapDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TapDetailsCopyWith<TapDetails> get copyWith =>
      _$TapDetailsCopyWithImpl<TapDetails>(this as TapDetails, _$identity);

  /// Serializes this TapDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TapDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.tappedAt, tappedAt) ||
                other.tappedAt == tappedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, targetUserId, tappedAt, user);

  @override
  String toString() {
    return 'TapDetails(id: $id, userId: $userId, targetUserId: $targetUserId, tappedAt: $tappedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $TapDetailsCopyWith<$Res> {
  factory $TapDetailsCopyWith(
          TapDetails value, $Res Function(TapDetails) _then) =
      _$TapDetailsCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String targetUserId,
      DateTime tappedAt,
      UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$TapDetailsCopyWithImpl<$Res> implements $TapDetailsCopyWith<$Res> {
  _$TapDetailsCopyWithImpl(this._self, this._then);

  final TapDetails _self;
  final $Res Function(TapDetails) _then;

  /// Create a copy of TapDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetUserId = null,
    Object? tappedAt = null,
    Object? user = freezed,
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
      targetUserId: null == targetUserId
          ? _self.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
      tappedAt: null == tappedAt
          ? _self.tappedAt
          : tappedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  /// Create a copy of TapDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TapDetails].
extension TapDetailsPatterns on TapDetails {
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
    TResult Function(_TapDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TapDetails() when $default != null:
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
    TResult Function(_TapDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TapDetails():
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
    TResult? Function(_TapDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TapDetails() when $default != null:
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
    TResult Function(String id, String userId, String targetUserId,
            DateTime tappedAt, UserModel? user)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TapDetails() when $default != null:
        return $default(_that.id, _that.userId, _that.targetUserId,
            _that.tappedAt, _that.user);
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
    TResult Function(String id, String userId, String targetUserId,
            DateTime tappedAt, UserModel? user)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TapDetails():
        return $default(_that.id, _that.userId, _that.targetUserId,
            _that.tappedAt, _that.user);
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
    TResult? Function(String id, String userId, String targetUserId,
            DateTime tappedAt, UserModel? user)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TapDetails() when $default != null:
        return $default(_that.id, _that.userId, _that.targetUserId,
            _that.tappedAt, _that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TapDetails implements TapDetails {
  const _TapDetails(
      {this.id = '',
      this.userId = '',
      this.targetUserId = '',
      required this.tappedAt,
      this.user});
  factory _TapDetails.fromJson(Map<String, dynamic> json) =>
      _$TapDetailsFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String targetUserId;
  @override
  final DateTime tappedAt;
  @override
  final UserModel? user;

  /// Create a copy of TapDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TapDetailsCopyWith<_TapDetails> get copyWith =>
      __$TapDetailsCopyWithImpl<_TapDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TapDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TapDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.tappedAt, tappedAt) ||
                other.tappedAt == tappedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, targetUserId, tappedAt, user);

  @override
  String toString() {
    return 'TapDetails(id: $id, userId: $userId, targetUserId: $targetUserId, tappedAt: $tappedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$TapDetailsCopyWith<$Res>
    implements $TapDetailsCopyWith<$Res> {
  factory _$TapDetailsCopyWith(
          _TapDetails value, $Res Function(_TapDetails) _then) =
      __$TapDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String targetUserId,
      DateTime tappedAt,
      UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$TapDetailsCopyWithImpl<$Res> implements _$TapDetailsCopyWith<$Res> {
  __$TapDetailsCopyWithImpl(this._self, this._then);

  final _TapDetails _self;
  final $Res Function(_TapDetails) _then;

  /// Create a copy of TapDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetUserId = null,
    Object? tappedAt = null,
    Object? user = freezed,
  }) {
    return _then(_TapDetails(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetUserId: null == targetUserId
          ? _self.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
      tappedAt: null == tappedAt
          ? _self.tappedAt
          : tappedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  /// Create a copy of TapDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
mixin _$PaginatedTapResponse {
  List<TapDetails> get taps;
  int get total;
  int get page;
  int get totalPages;

  /// Create a copy of PaginatedTapResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedTapResponseCopyWith<PaginatedTapResponse> get copyWith =>
      _$PaginatedTapResponseCopyWithImpl<PaginatedTapResponse>(
          this as PaginatedTapResponse, _$identity);

  /// Serializes this PaginatedTapResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedTapResponse &&
            const DeepCollectionEquality().equals(other.taps, taps) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(taps), total, page, totalPages);

  @override
  String toString() {
    return 'PaginatedTapResponse(taps: $taps, total: $total, page: $page, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $PaginatedTapResponseCopyWith<$Res> {
  factory $PaginatedTapResponseCopyWith(PaginatedTapResponse value,
          $Res Function(PaginatedTapResponse) _then) =
      _$PaginatedTapResponseCopyWithImpl;
  @useResult
  $Res call({List<TapDetails> taps, int total, int page, int totalPages});
}

/// @nodoc
class _$PaginatedTapResponseCopyWithImpl<$Res>
    implements $PaginatedTapResponseCopyWith<$Res> {
  _$PaginatedTapResponseCopyWithImpl(this._self, this._then);

  final PaginatedTapResponse _self;
  final $Res Function(PaginatedTapResponse) _then;

  /// Create a copy of PaginatedTapResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taps = null,
    Object? total = null,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_self.copyWith(
      taps: null == taps
          ? _self.taps
          : taps // ignore: cast_nullable_to_non_nullable
              as List<TapDetails>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginatedTapResponse].
extension PaginatedTapResponsePatterns on PaginatedTapResponse {
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
    TResult Function(_PaginatedTapResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedTapResponse() when $default != null:
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
    TResult Function(_PaginatedTapResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedTapResponse():
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
    TResult? Function(_PaginatedTapResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedTapResponse() when $default != null:
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
            List<TapDetails> taps, int total, int page, int totalPages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedTapResponse() when $default != null:
        return $default(_that.taps, _that.total, _that.page, _that.totalPages);
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
    TResult Function(List<TapDetails> taps, int total, int page, int totalPages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedTapResponse():
        return $default(_that.taps, _that.total, _that.page, _that.totalPages);
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
            List<TapDetails> taps, int total, int page, int totalPages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedTapResponse() when $default != null:
        return $default(_that.taps, _that.total, _that.page, _that.totalPages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaginatedTapResponse implements PaginatedTapResponse {
  const _PaginatedTapResponse(
      {final List<TapDetails> taps = const [],
      this.total = 0,
      this.page = 1,
      this.totalPages = 1})
      : _taps = taps;
  factory _PaginatedTapResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTapResponseFromJson(json);

  final List<TapDetails> _taps;
  @override
  @JsonKey()
  List<TapDetails> get taps {
    if (_taps is EqualUnmodifiableListView) return _taps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taps);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of PaginatedTapResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginatedTapResponseCopyWith<_PaginatedTapResponse> get copyWith =>
      __$PaginatedTapResponseCopyWithImpl<_PaginatedTapResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginatedTapResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginatedTapResponse &&
            const DeepCollectionEquality().equals(other._taps, _taps) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_taps), total, page, totalPages);

  @override
  String toString() {
    return 'PaginatedTapResponse(taps: $taps, total: $total, page: $page, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$PaginatedTapResponseCopyWith<$Res>
    implements $PaginatedTapResponseCopyWith<$Res> {
  factory _$PaginatedTapResponseCopyWith(_PaginatedTapResponse value,
          $Res Function(_PaginatedTapResponse) _then) =
      __$PaginatedTapResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<TapDetails> taps, int total, int page, int totalPages});
}

/// @nodoc
class __$PaginatedTapResponseCopyWithImpl<$Res>
    implements _$PaginatedTapResponseCopyWith<$Res> {
  __$PaginatedTapResponseCopyWithImpl(this._self, this._then);

  final _PaginatedTapResponse _self;
  final $Res Function(_PaginatedTapResponse) _then;

  /// Create a copy of PaginatedTapResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? taps = null,
    Object? total = null,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_PaginatedTapResponse(
      taps: null == taps
          ? _self._taps
          : taps // ignore: cast_nullable_to_non_nullable
              as List<TapDetails>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ProfileViewDetails {
  String get id;
  String get userId;
  String get targetUserId;
  DateTime get viewedAt;
  int get visitCount;
  UserModel? get viewer;
  UserModel? get user;
  int? get viewDuration;
  String? get viewSource;

  /// Create a copy of ProfileViewDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileViewDetailsCopyWith<ProfileViewDetails> get copyWith =>
      _$ProfileViewDetailsCopyWithImpl<ProfileViewDetails>(
          this as ProfileViewDetails, _$identity);

  /// Serializes this ProfileViewDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileViewDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.viewedAt, viewedAt) ||
                other.viewedAt == viewedAt) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.viewer, viewer) || other.viewer == viewer) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.viewDuration, viewDuration) ||
                other.viewDuration == viewDuration) &&
            (identical(other.viewSource, viewSource) ||
                other.viewSource == viewSource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, targetUserId,
      viewedAt, visitCount, viewer, user, viewDuration, viewSource);

  @override
  String toString() {
    return 'ProfileViewDetails(id: $id, userId: $userId, targetUserId: $targetUserId, viewedAt: $viewedAt, visitCount: $visitCount, viewer: $viewer, user: $user, viewDuration: $viewDuration, viewSource: $viewSource)';
  }
}

/// @nodoc
abstract mixin class $ProfileViewDetailsCopyWith<$Res> {
  factory $ProfileViewDetailsCopyWith(
          ProfileViewDetails value, $Res Function(ProfileViewDetails) _then) =
      _$ProfileViewDetailsCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String targetUserId,
      DateTime viewedAt,
      int visitCount,
      UserModel? viewer,
      UserModel? user,
      int? viewDuration,
      String? viewSource});

  $UserModelCopyWith<$Res>? get viewer;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProfileViewDetailsCopyWithImpl<$Res>
    implements $ProfileViewDetailsCopyWith<$Res> {
  _$ProfileViewDetailsCopyWithImpl(this._self, this._then);

  final ProfileViewDetails _self;
  final $Res Function(ProfileViewDetails) _then;

  /// Create a copy of ProfileViewDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetUserId = null,
    Object? viewedAt = null,
    Object? visitCount = null,
    Object? viewer = freezed,
    Object? user = freezed,
    Object? viewDuration = freezed,
    Object? viewSource = freezed,
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
      targetUserId: null == targetUserId
          ? _self.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
      viewedAt: null == viewedAt
          ? _self.viewedAt
          : viewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visitCount: null == visitCount
          ? _self.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewer: freezed == viewer
          ? _self.viewer
          : viewer // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      viewDuration: freezed == viewDuration
          ? _self.viewDuration
          : viewDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      viewSource: freezed == viewSource
          ? _self.viewSource
          : viewSource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProfileViewDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get viewer {
    if (_self.viewer == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.viewer!, (value) {
      return _then(_self.copyWith(viewer: value));
    });
  }

  /// Create a copy of ProfileViewDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProfileViewDetails].
extension ProfileViewDetailsPatterns on ProfileViewDetails {
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
    TResult Function(_ProfileViewDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileViewDetails() when $default != null:
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
    TResult Function(_ProfileViewDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewDetails():
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
    TResult? Function(_ProfileViewDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewDetails() when $default != null:
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
            String id,
            String userId,
            String targetUserId,
            DateTime viewedAt,
            int visitCount,
            UserModel? viewer,
            UserModel? user,
            int? viewDuration,
            String? viewSource)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileViewDetails() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.targetUserId,
            _that.viewedAt,
            _that.visitCount,
            _that.viewer,
            _that.user,
            _that.viewDuration,
            _that.viewSource);
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
            String id,
            String userId,
            String targetUserId,
            DateTime viewedAt,
            int visitCount,
            UserModel? viewer,
            UserModel? user,
            int? viewDuration,
            String? viewSource)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewDetails():
        return $default(
            _that.id,
            _that.userId,
            _that.targetUserId,
            _that.viewedAt,
            _that.visitCount,
            _that.viewer,
            _that.user,
            _that.viewDuration,
            _that.viewSource);
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
            String id,
            String userId,
            String targetUserId,
            DateTime viewedAt,
            int visitCount,
            UserModel? viewer,
            UserModel? user,
            int? viewDuration,
            String? viewSource)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewDetails() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.targetUserId,
            _that.viewedAt,
            _that.visitCount,
            _that.viewer,
            _that.user,
            _that.viewDuration,
            _that.viewSource);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileViewDetails implements ProfileViewDetails {
  const _ProfileViewDetails(
      {this.id = '',
      this.userId = '',
      this.targetUserId = '',
      required this.viewedAt,
      this.visitCount = 1,
      this.viewer,
      this.user,
      this.viewDuration,
      this.viewSource});
  factory _ProfileViewDetails.fromJson(Map<String, dynamic> json) =>
      _$ProfileViewDetailsFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String targetUserId;
  @override
  final DateTime viewedAt;
  @override
  @JsonKey()
  final int visitCount;
  @override
  final UserModel? viewer;
  @override
  final UserModel? user;
  @override
  final int? viewDuration;
  @override
  final String? viewSource;

  /// Create a copy of ProfileViewDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileViewDetailsCopyWith<_ProfileViewDetails> get copyWith =>
      __$ProfileViewDetailsCopyWithImpl<_ProfileViewDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileViewDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileViewDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.viewedAt, viewedAt) ||
                other.viewedAt == viewedAt) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.viewer, viewer) || other.viewer == viewer) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.viewDuration, viewDuration) ||
                other.viewDuration == viewDuration) &&
            (identical(other.viewSource, viewSource) ||
                other.viewSource == viewSource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, targetUserId,
      viewedAt, visitCount, viewer, user, viewDuration, viewSource);

  @override
  String toString() {
    return 'ProfileViewDetails(id: $id, userId: $userId, targetUserId: $targetUserId, viewedAt: $viewedAt, visitCount: $visitCount, viewer: $viewer, user: $user, viewDuration: $viewDuration, viewSource: $viewSource)';
  }
}

/// @nodoc
abstract mixin class _$ProfileViewDetailsCopyWith<$Res>
    implements $ProfileViewDetailsCopyWith<$Res> {
  factory _$ProfileViewDetailsCopyWith(
          _ProfileViewDetails value, $Res Function(_ProfileViewDetails) _then) =
      __$ProfileViewDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String targetUserId,
      DateTime viewedAt,
      int visitCount,
      UserModel? viewer,
      UserModel? user,
      int? viewDuration,
      String? viewSource});

  @override
  $UserModelCopyWith<$Res>? get viewer;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$ProfileViewDetailsCopyWithImpl<$Res>
    implements _$ProfileViewDetailsCopyWith<$Res> {
  __$ProfileViewDetailsCopyWithImpl(this._self, this._then);

  final _ProfileViewDetails _self;
  final $Res Function(_ProfileViewDetails) _then;

  /// Create a copy of ProfileViewDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetUserId = null,
    Object? viewedAt = null,
    Object? visitCount = null,
    Object? viewer = freezed,
    Object? user = freezed,
    Object? viewDuration = freezed,
    Object? viewSource = freezed,
  }) {
    return _then(_ProfileViewDetails(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetUserId: null == targetUserId
          ? _self.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
      viewedAt: null == viewedAt
          ? _self.viewedAt
          : viewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visitCount: null == visitCount
          ? _self.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewer: freezed == viewer
          ? _self.viewer
          : viewer // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      viewDuration: freezed == viewDuration
          ? _self.viewDuration
          : viewDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      viewSource: freezed == viewSource
          ? _self.viewSource
          : viewSource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProfileViewDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get viewer {
    if (_self.viewer == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.viewer!, (value) {
      return _then(_self.copyWith(viewer: value));
    });
  }

  /// Create a copy of ProfileViewDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
mixin _$PaginatedProfileViewsResponse {
  List<ProfileViewDetails> get views;
  int get total;
  int get page;
  int get totalPages;

  /// Create a copy of PaginatedProfileViewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedProfileViewsResponseCopyWith<PaginatedProfileViewsResponse>
      get copyWith => _$PaginatedProfileViewsResponseCopyWithImpl<
              PaginatedProfileViewsResponse>(
          this as PaginatedProfileViewsResponse, _$identity);

  /// Serializes this PaginatedProfileViewsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedProfileViewsResponse &&
            const DeepCollectionEquality().equals(other.views, views) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(views), total, page, totalPages);

  @override
  String toString() {
    return 'PaginatedProfileViewsResponse(views: $views, total: $total, page: $page, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $PaginatedProfileViewsResponseCopyWith<$Res> {
  factory $PaginatedProfileViewsResponseCopyWith(
          PaginatedProfileViewsResponse value,
          $Res Function(PaginatedProfileViewsResponse) _then) =
      _$PaginatedProfileViewsResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<ProfileViewDetails> views, int total, int page, int totalPages});
}

/// @nodoc
class _$PaginatedProfileViewsResponseCopyWithImpl<$Res>
    implements $PaginatedProfileViewsResponseCopyWith<$Res> {
  _$PaginatedProfileViewsResponseCopyWithImpl(this._self, this._then);

  final PaginatedProfileViewsResponse _self;
  final $Res Function(PaginatedProfileViewsResponse) _then;

  /// Create a copy of PaginatedProfileViewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? views = null,
    Object? total = null,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_self.copyWith(
      views: null == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as List<ProfileViewDetails>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginatedProfileViewsResponse].
extension PaginatedProfileViewsResponsePatterns
    on PaginatedProfileViewsResponse {
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
    TResult Function(_PaginatedProfileViewsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedProfileViewsResponse() when $default != null:
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
    TResult Function(_PaginatedProfileViewsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedProfileViewsResponse():
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
    TResult? Function(_PaginatedProfileViewsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedProfileViewsResponse() when $default != null:
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
    TResult Function(List<ProfileViewDetails> views, int total, int page,
            int totalPages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedProfileViewsResponse() when $default != null:
        return $default(_that.views, _that.total, _that.page, _that.totalPages);
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
            List<ProfileViewDetails> views, int total, int page, int totalPages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedProfileViewsResponse():
        return $default(_that.views, _that.total, _that.page, _that.totalPages);
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
    TResult? Function(List<ProfileViewDetails> views, int total, int page,
            int totalPages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedProfileViewsResponse() when $default != null:
        return $default(_that.views, _that.total, _that.page, _that.totalPages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaginatedProfileViewsResponse implements PaginatedProfileViewsResponse {
  const _PaginatedProfileViewsResponse(
      {final List<ProfileViewDetails> views = const [],
      this.total = 0,
      this.page = 1,
      this.totalPages = 1})
      : _views = views;
  factory _PaginatedProfileViewsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProfileViewsResponseFromJson(json);

  final List<ProfileViewDetails> _views;
  @override
  @JsonKey()
  List<ProfileViewDetails> get views {
    if (_views is EqualUnmodifiableListView) return _views;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_views);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of PaginatedProfileViewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginatedProfileViewsResponseCopyWith<_PaginatedProfileViewsResponse>
      get copyWith => __$PaginatedProfileViewsResponseCopyWithImpl<
          _PaginatedProfileViewsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginatedProfileViewsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginatedProfileViewsResponse &&
            const DeepCollectionEquality().equals(other._views, _views) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_views), total, page, totalPages);

  @override
  String toString() {
    return 'PaginatedProfileViewsResponse(views: $views, total: $total, page: $page, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$PaginatedProfileViewsResponseCopyWith<$Res>
    implements $PaginatedProfileViewsResponseCopyWith<$Res> {
  factory _$PaginatedProfileViewsResponseCopyWith(
          _PaginatedProfileViewsResponse value,
          $Res Function(_PaginatedProfileViewsResponse) _then) =
      __$PaginatedProfileViewsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ProfileViewDetails> views, int total, int page, int totalPages});
}

/// @nodoc
class __$PaginatedProfileViewsResponseCopyWithImpl<$Res>
    implements _$PaginatedProfileViewsResponseCopyWith<$Res> {
  __$PaginatedProfileViewsResponseCopyWithImpl(this._self, this._then);

  final _PaginatedProfileViewsResponse _self;
  final $Res Function(_PaginatedProfileViewsResponse) _then;

  /// Create a copy of PaginatedProfileViewsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? views = null,
    Object? total = null,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_PaginatedProfileViewsResponse(
      views: null == views
          ? _self._views
          : views // ignore: cast_nullable_to_non_nullable
              as List<ProfileViewDetails>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$VisitRecord {
  String get id;
  String get userId;
  String get targetUserId;
  DateTime get visitedAt;
  int get visitCount;
  UserModel? get user;

  /// Create a copy of VisitRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VisitRecordCopyWith<VisitRecord> get copyWith =>
      _$VisitRecordCopyWithImpl<VisitRecord>(this as VisitRecord, _$identity);

  /// Serializes this VisitRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisitRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.visitedAt, visitedAt) ||
                other.visitedAt == visitedAt) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, targetUserId, visitedAt, visitCount, user);

  @override
  String toString() {
    return 'VisitRecord(id: $id, userId: $userId, targetUserId: $targetUserId, visitedAt: $visitedAt, visitCount: $visitCount, user: $user)';
  }
}

/// @nodoc
abstract mixin class $VisitRecordCopyWith<$Res> {
  factory $VisitRecordCopyWith(
          VisitRecord value, $Res Function(VisitRecord) _then) =
      _$VisitRecordCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String targetUserId,
      DateTime visitedAt,
      int visitCount,
      UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$VisitRecordCopyWithImpl<$Res> implements $VisitRecordCopyWith<$Res> {
  _$VisitRecordCopyWithImpl(this._self, this._then);

  final VisitRecord _self;
  final $Res Function(VisitRecord) _then;

  /// Create a copy of VisitRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetUserId = null,
    Object? visitedAt = null,
    Object? visitCount = null,
    Object? user = freezed,
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
      targetUserId: null == targetUserId
          ? _self.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
      visitedAt: null == visitedAt
          ? _self.visitedAt
          : visitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visitCount: null == visitCount
          ? _self.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  /// Create a copy of VisitRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VisitRecord].
extension VisitRecordPatterns on VisitRecord {
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
    TResult Function(_VisitRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitRecord() when $default != null:
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
    TResult Function(_VisitRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitRecord():
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
    TResult? Function(_VisitRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitRecord() when $default != null:
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
    TResult Function(String id, String userId, String targetUserId,
            DateTime visitedAt, int visitCount, UserModel? user)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VisitRecord() when $default != null:
        return $default(_that.id, _that.userId, _that.targetUserId,
            _that.visitedAt, _that.visitCount, _that.user);
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
    TResult Function(String id, String userId, String targetUserId,
            DateTime visitedAt, int visitCount, UserModel? user)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitRecord():
        return $default(_that.id, _that.userId, _that.targetUserId,
            _that.visitedAt, _that.visitCount, _that.user);
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
    TResult? Function(String id, String userId, String targetUserId,
            DateTime visitedAt, int visitCount, UserModel? user)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VisitRecord() when $default != null:
        return $default(_that.id, _that.userId, _that.targetUserId,
            _that.visitedAt, _that.visitCount, _that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VisitRecord extends VisitRecord {
  const _VisitRecord(
      {this.id = '',
      this.userId = '',
      this.targetUserId = '',
      required this.visitedAt,
      this.visitCount = 1,
      this.user})
      : super._();
  factory _VisitRecord.fromJson(Map<String, dynamic> json) =>
      _$VisitRecordFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String targetUserId;
  @override
  final DateTime visitedAt;
  @override
  @JsonKey()
  final int visitCount;
  @override
  final UserModel? user;

  /// Create a copy of VisitRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VisitRecordCopyWith<_VisitRecord> get copyWith =>
      __$VisitRecordCopyWithImpl<_VisitRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VisitRecordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VisitRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.visitedAt, visitedAt) ||
                other.visitedAt == visitedAt) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, targetUserId, visitedAt, visitCount, user);

  @override
  String toString() {
    return 'VisitRecord(id: $id, userId: $userId, targetUserId: $targetUserId, visitedAt: $visitedAt, visitCount: $visitCount, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$VisitRecordCopyWith<$Res>
    implements $VisitRecordCopyWith<$Res> {
  factory _$VisitRecordCopyWith(
          _VisitRecord value, $Res Function(_VisitRecord) _then) =
      __$VisitRecordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String targetUserId,
      DateTime visitedAt,
      int visitCount,
      UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$VisitRecordCopyWithImpl<$Res> implements _$VisitRecordCopyWith<$Res> {
  __$VisitRecordCopyWithImpl(this._self, this._then);

  final _VisitRecord _self;
  final $Res Function(_VisitRecord) _then;

  /// Create a copy of VisitRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetUserId = null,
    Object? visitedAt = null,
    Object? visitCount = null,
    Object? user = freezed,
  }) {
    return _then(_VisitRecord(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetUserId: null == targetUserId
          ? _self.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as String,
      visitedAt: null == visitedAt
          ? _self.visitedAt
          : visitedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visitCount: null == visitCount
          ? _self.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  /// Create a copy of VisitRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
mixin _$PaginatedVisitsResponse {
  List<VisitRecord> get visits;
  int get total;
  int get page;
  int get totalPages;

  /// Create a copy of PaginatedVisitsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedVisitsResponseCopyWith<PaginatedVisitsResponse> get copyWith =>
      _$PaginatedVisitsResponseCopyWithImpl<PaginatedVisitsResponse>(
          this as PaginatedVisitsResponse, _$identity);

  /// Serializes this PaginatedVisitsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedVisitsResponse &&
            const DeepCollectionEquality().equals(other.visits, visits) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(visits), total, page, totalPages);

  @override
  String toString() {
    return 'PaginatedVisitsResponse(visits: $visits, total: $total, page: $page, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $PaginatedVisitsResponseCopyWith<$Res> {
  factory $PaginatedVisitsResponseCopyWith(PaginatedVisitsResponse value,
          $Res Function(PaginatedVisitsResponse) _then) =
      _$PaginatedVisitsResponseCopyWithImpl;
  @useResult
  $Res call({List<VisitRecord> visits, int total, int page, int totalPages});
}

/// @nodoc
class _$PaginatedVisitsResponseCopyWithImpl<$Res>
    implements $PaginatedVisitsResponseCopyWith<$Res> {
  _$PaginatedVisitsResponseCopyWithImpl(this._self, this._then);

  final PaginatedVisitsResponse _self;
  final $Res Function(PaginatedVisitsResponse) _then;

  /// Create a copy of PaginatedVisitsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visits = null,
    Object? total = null,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_self.copyWith(
      visits: null == visits
          ? _self.visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<VisitRecord>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginatedVisitsResponse].
extension PaginatedVisitsResponsePatterns on PaginatedVisitsResponse {
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
    TResult Function(_PaginatedVisitsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedVisitsResponse() when $default != null:
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
    TResult Function(_PaginatedVisitsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedVisitsResponse():
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
    TResult? Function(_PaginatedVisitsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedVisitsResponse() when $default != null:
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
            List<VisitRecord> visits, int total, int page, int totalPages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedVisitsResponse() when $default != null:
        return $default(
            _that.visits, _that.total, _that.page, _that.totalPages);
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
            List<VisitRecord> visits, int total, int page, int totalPages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedVisitsResponse():
        return $default(
            _that.visits, _that.total, _that.page, _that.totalPages);
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
            List<VisitRecord> visits, int total, int page, int totalPages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedVisitsResponse() when $default != null:
        return $default(
            _that.visits, _that.total, _that.page, _that.totalPages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaginatedVisitsResponse implements PaginatedVisitsResponse {
  const _PaginatedVisitsResponse(
      {final List<VisitRecord> visits = const [],
      this.total = 0,
      this.page = 1,
      this.totalPages = 1})
      : _visits = visits;
  factory _PaginatedVisitsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedVisitsResponseFromJson(json);

  final List<VisitRecord> _visits;
  @override
  @JsonKey()
  List<VisitRecord> get visits {
    if (_visits is EqualUnmodifiableListView) return _visits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visits);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of PaginatedVisitsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginatedVisitsResponseCopyWith<_PaginatedVisitsResponse> get copyWith =>
      __$PaginatedVisitsResponseCopyWithImpl<_PaginatedVisitsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginatedVisitsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginatedVisitsResponse &&
            const DeepCollectionEquality().equals(other._visits, _visits) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_visits), total, page, totalPages);

  @override
  String toString() {
    return 'PaginatedVisitsResponse(visits: $visits, total: $total, page: $page, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$PaginatedVisitsResponseCopyWith<$Res>
    implements $PaginatedVisitsResponseCopyWith<$Res> {
  factory _$PaginatedVisitsResponseCopyWith(_PaginatedVisitsResponse value,
          $Res Function(_PaginatedVisitsResponse) _then) =
      __$PaginatedVisitsResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<VisitRecord> visits, int total, int page, int totalPages});
}

/// @nodoc
class __$PaginatedVisitsResponseCopyWithImpl<$Res>
    implements _$PaginatedVisitsResponseCopyWith<$Res> {
  __$PaginatedVisitsResponseCopyWithImpl(this._self, this._then);

  final _PaginatedVisitsResponse _self;
  final $Res Function(_PaginatedVisitsResponse) _then;

  /// Create a copy of PaginatedVisitsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? visits = null,
    Object? total = null,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_PaginatedVisitsResponse(
      visits: null == visits
          ? _self._visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<VisitRecord>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$FavoriteResponse {
  String get status;
  String get message;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteResponseCopyWith<FavoriteResponse> get copyWith =>
      _$FavoriteResponseCopyWithImpl<FavoriteResponse>(
          this as FavoriteResponse, _$identity);

  /// Serializes this FavoriteResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @override
  String toString() {
    return 'FavoriteResponse(status: $status, message: $message)';
  }
}

/// @nodoc
abstract mixin class $FavoriteResponseCopyWith<$Res> {
  factory $FavoriteResponseCopyWith(
          FavoriteResponse value, $Res Function(FavoriteResponse) _then) =
      _$FavoriteResponseCopyWithImpl;
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class _$FavoriteResponseCopyWithImpl<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  _$FavoriteResponseCopyWithImpl(this._self, this._then);

  final FavoriteResponse _self;
  final $Res Function(FavoriteResponse) _then;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [FavoriteResponse].
extension FavoriteResponsePatterns on FavoriteResponse {
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
    TResult Function(_FavoriteResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoriteResponse() when $default != null:
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
    TResult Function(_FavoriteResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteResponse():
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
    TResult? Function(_FavoriteResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteResponse() when $default != null:
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
    TResult Function(String status, String message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoriteResponse() when $default != null:
        return $default(_that.status, _that.message);
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
    TResult Function(String status, String message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteResponse():
        return $default(_that.status, _that.message);
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
    TResult? Function(String status, String message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoriteResponse() when $default != null:
        return $default(_that.status, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FavoriteResponse implements FavoriteResponse {
  const _FavoriteResponse({this.status = '', this.message = ''});
  factory _FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String message;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteResponseCopyWith<_FavoriteResponse> get copyWith =>
      __$FavoriteResponseCopyWithImpl<_FavoriteResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FavoriteResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @override
  String toString() {
    return 'FavoriteResponse(status: $status, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteResponseCopyWith<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  factory _$FavoriteResponseCopyWith(
          _FavoriteResponse value, $Res Function(_FavoriteResponse) _then) =
      __$FavoriteResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class __$FavoriteResponseCopyWithImpl<$Res>
    implements _$FavoriteResponseCopyWith<$Res> {
  __$FavoriteResponseCopyWithImpl(this._self, this._then);

  final _FavoriteResponse _self;
  final $Res Function(_FavoriteResponse) _then;

  /// Create a copy of FavoriteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_FavoriteResponse(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UserAnalyticsResponse {
  String get userId;
  ProfileViewAnalytics get profileViews;
  MatchAnalytics get matches;
  MessageAnalytics get messages;
  DiscoveryAnalytics get discovery;
  LocationAnalytics get location;
  DateTime get lastUpdated;
  double? get matchRate;

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAnalyticsResponseCopyWith<UserAnalyticsResponse> get copyWith =>
      _$UserAnalyticsResponseCopyWithImpl<UserAnalyticsResponse>(
          this as UserAnalyticsResponse, _$identity);

  /// Serializes this UserAnalyticsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAnalyticsResponse &&
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
            (identical(other.matchRate, matchRate) ||
                other.matchRate == matchRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, profileViews, matches,
      messages, discovery, location, lastUpdated, matchRate);

  @override
  String toString() {
    return 'UserAnalyticsResponse(userId: $userId, profileViews: $profileViews, matches: $matches, messages: $messages, discovery: $discovery, location: $location, lastUpdated: $lastUpdated, matchRate: $matchRate)';
  }
}

/// @nodoc
abstract mixin class $UserAnalyticsResponseCopyWith<$Res> {
  factory $UserAnalyticsResponseCopyWith(UserAnalyticsResponse value,
          $Res Function(UserAnalyticsResponse) _then) =
      _$UserAnalyticsResponseCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      ProfileViewAnalytics profileViews,
      MatchAnalytics matches,
      MessageAnalytics messages,
      DiscoveryAnalytics discovery,
      LocationAnalytics location,
      DateTime lastUpdated,
      double? matchRate});

  $ProfileViewAnalyticsCopyWith<$Res> get profileViews;
  $MatchAnalyticsCopyWith<$Res> get matches;
  $MessageAnalyticsCopyWith<$Res> get messages;
  $DiscoveryAnalyticsCopyWith<$Res> get discovery;
  $LocationAnalyticsCopyWith<$Res> get location;
}

/// @nodoc
class _$UserAnalyticsResponseCopyWithImpl<$Res>
    implements $UserAnalyticsResponseCopyWith<$Res> {
  _$UserAnalyticsResponseCopyWithImpl(this._self, this._then);

  final UserAnalyticsResponse _self;
  final $Res Function(UserAnalyticsResponse) _then;

  /// Create a copy of UserAnalyticsResponse
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
              as ProfileViewAnalytics,
      matches: null == matches
          ? _self.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as MatchAnalytics,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as MessageAnalytics,
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
      matchRate: freezed == matchRate
          ? _self.matchRate
          : matchRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileViewAnalyticsCopyWith<$Res> get profileViews {
    return $ProfileViewAnalyticsCopyWith<$Res>(_self.profileViews, (value) {
      return _then(_self.copyWith(profileViews: value));
    });
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchAnalyticsCopyWith<$Res> get matches {
    return $MatchAnalyticsCopyWith<$Res>(_self.matches, (value) {
      return _then(_self.copyWith(matches: value));
    });
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageAnalyticsCopyWith<$Res> get messages {
    return $MessageAnalyticsCopyWith<$Res>(_self.messages, (value) {
      return _then(_self.copyWith(messages: value));
    });
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscoveryAnalyticsCopyWith<$Res> get discovery {
    return $DiscoveryAnalyticsCopyWith<$Res>(_self.discovery, (value) {
      return _then(_self.copyWith(discovery: value));
    });
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationAnalyticsCopyWith<$Res> get location {
    return $LocationAnalyticsCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserAnalyticsResponse].
extension UserAnalyticsResponsePatterns on UserAnalyticsResponse {
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
    TResult Function(_UserAnalyticsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserAnalyticsResponse() when $default != null:
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
    TResult Function(_UserAnalyticsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAnalyticsResponse():
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
    TResult? Function(_UserAnalyticsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAnalyticsResponse() when $default != null:
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
            ProfileViewAnalytics profileViews,
            MatchAnalytics matches,
            MessageAnalytics messages,
            DiscoveryAnalytics discovery,
            LocationAnalytics location,
            DateTime lastUpdated,
            double? matchRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserAnalyticsResponse() when $default != null:
        return $default(
            _that.userId,
            _that.profileViews,
            _that.matches,
            _that.messages,
            _that.discovery,
            _that.location,
            _that.lastUpdated,
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
            ProfileViewAnalytics profileViews,
            MatchAnalytics matches,
            MessageAnalytics messages,
            DiscoveryAnalytics discovery,
            LocationAnalytics location,
            DateTime lastUpdated,
            double? matchRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAnalyticsResponse():
        return $default(
            _that.userId,
            _that.profileViews,
            _that.matches,
            _that.messages,
            _that.discovery,
            _that.location,
            _that.lastUpdated,
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
            ProfileViewAnalytics profileViews,
            MatchAnalytics matches,
            MessageAnalytics messages,
            DiscoveryAnalytics discovery,
            LocationAnalytics location,
            DateTime lastUpdated,
            double? matchRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAnalyticsResponse() when $default != null:
        return $default(
            _that.userId,
            _that.profileViews,
            _that.matches,
            _that.messages,
            _that.discovery,
            _that.location,
            _that.lastUpdated,
            _that.matchRate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserAnalyticsResponse implements UserAnalyticsResponse {
  const _UserAnalyticsResponse(
      {this.userId = '',
      required this.profileViews,
      required this.matches,
      required this.messages,
      required this.discovery,
      required this.location,
      required this.lastUpdated,
      this.matchRate});
  factory _UserAnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAnalyticsResponseFromJson(json);

  @override
  @JsonKey()
  final String userId;
  @override
  final ProfileViewAnalytics profileViews;
  @override
  final MatchAnalytics matches;
  @override
  final MessageAnalytics messages;
  @override
  final DiscoveryAnalytics discovery;
  @override
  final LocationAnalytics location;
  @override
  final DateTime lastUpdated;
  @override
  final double? matchRate;

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAnalyticsResponseCopyWith<_UserAnalyticsResponse> get copyWith =>
      __$UserAnalyticsResponseCopyWithImpl<_UserAnalyticsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAnalyticsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAnalyticsResponse &&
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
            (identical(other.matchRate, matchRate) ||
                other.matchRate == matchRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, profileViews, matches,
      messages, discovery, location, lastUpdated, matchRate);

  @override
  String toString() {
    return 'UserAnalyticsResponse(userId: $userId, profileViews: $profileViews, matches: $matches, messages: $messages, discovery: $discovery, location: $location, lastUpdated: $lastUpdated, matchRate: $matchRate)';
  }
}

/// @nodoc
abstract mixin class _$UserAnalyticsResponseCopyWith<$Res>
    implements $UserAnalyticsResponseCopyWith<$Res> {
  factory _$UserAnalyticsResponseCopyWith(_UserAnalyticsResponse value,
          $Res Function(_UserAnalyticsResponse) _then) =
      __$UserAnalyticsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      ProfileViewAnalytics profileViews,
      MatchAnalytics matches,
      MessageAnalytics messages,
      DiscoveryAnalytics discovery,
      LocationAnalytics location,
      DateTime lastUpdated,
      double? matchRate});

  @override
  $ProfileViewAnalyticsCopyWith<$Res> get profileViews;
  @override
  $MatchAnalyticsCopyWith<$Res> get matches;
  @override
  $MessageAnalyticsCopyWith<$Res> get messages;
  @override
  $DiscoveryAnalyticsCopyWith<$Res> get discovery;
  @override
  $LocationAnalyticsCopyWith<$Res> get location;
}

/// @nodoc
class __$UserAnalyticsResponseCopyWithImpl<$Res>
    implements _$UserAnalyticsResponseCopyWith<$Res> {
  __$UserAnalyticsResponseCopyWithImpl(this._self, this._then);

  final _UserAnalyticsResponse _self;
  final $Res Function(_UserAnalyticsResponse) _then;

  /// Create a copy of UserAnalyticsResponse
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
    Object? matchRate = freezed,
  }) {
    return _then(_UserAnalyticsResponse(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profileViews: null == profileViews
          ? _self.profileViews
          : profileViews // ignore: cast_nullable_to_non_nullable
              as ProfileViewAnalytics,
      matches: null == matches
          ? _self.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as MatchAnalytics,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as MessageAnalytics,
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
      matchRate: freezed == matchRate
          ? _self.matchRate
          : matchRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileViewAnalyticsCopyWith<$Res> get profileViews {
    return $ProfileViewAnalyticsCopyWith<$Res>(_self.profileViews, (value) {
      return _then(_self.copyWith(profileViews: value));
    });
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchAnalyticsCopyWith<$Res> get matches {
    return $MatchAnalyticsCopyWith<$Res>(_self.matches, (value) {
      return _then(_self.copyWith(matches: value));
    });
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageAnalyticsCopyWith<$Res> get messages {
    return $MessageAnalyticsCopyWith<$Res>(_self.messages, (value) {
      return _then(_self.copyWith(messages: value));
    });
  }

  /// Create a copy of UserAnalyticsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscoveryAnalyticsCopyWith<$Res> get discovery {
    return $DiscoveryAnalyticsCopyWith<$Res>(_self.discovery, (value) {
      return _then(_self.copyWith(discovery: value));
    });
  }

  /// Create a copy of UserAnalyticsResponse
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
mixin _$ProfileViewAnalytics {
  int get total;
  int get daily;
  int get weekly;
  int get monthly;
  Map<String, int> get byHour;
  Map<String, int> get byDay;

  /// Create a copy of ProfileViewAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileViewAnalyticsCopyWith<ProfileViewAnalytics> get copyWith =>
      _$ProfileViewAnalyticsCopyWithImpl<ProfileViewAnalytics>(
          this as ProfileViewAnalytics, _$identity);

  /// Serializes this ProfileViewAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileViewAnalytics &&
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
    return 'ProfileViewAnalytics(total: $total, daily: $daily, weekly: $weekly, monthly: $monthly, byHour: $byHour, byDay: $byDay)';
  }
}

/// @nodoc
abstract mixin class $ProfileViewAnalyticsCopyWith<$Res> {
  factory $ProfileViewAnalyticsCopyWith(ProfileViewAnalytics value,
          $Res Function(ProfileViewAnalytics) _then) =
      _$ProfileViewAnalyticsCopyWithImpl;
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
class _$ProfileViewAnalyticsCopyWithImpl<$Res>
    implements $ProfileViewAnalyticsCopyWith<$Res> {
  _$ProfileViewAnalyticsCopyWithImpl(this._self, this._then);

  final ProfileViewAnalytics _self;
  final $Res Function(ProfileViewAnalytics) _then;

  /// Create a copy of ProfileViewAnalytics
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

/// Adds pattern-matching-related methods to [ProfileViewAnalytics].
extension ProfileViewAnalyticsPatterns on ProfileViewAnalytics {
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
    TResult Function(_ProfileViewAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileViewAnalytics() when $default != null:
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
    TResult Function(_ProfileViewAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewAnalytics():
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
    TResult? Function(_ProfileViewAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileViewAnalytics() when $default != null:
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
      case _ProfileViewAnalytics() when $default != null:
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
      case _ProfileViewAnalytics():
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
      case _ProfileViewAnalytics() when $default != null:
        return $default(_that.total, _that.daily, _that.weekly, _that.monthly,
            _that.byHour, _that.byDay);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileViewAnalytics implements ProfileViewAnalytics {
  const _ProfileViewAnalytics(
      {this.total = 0,
      this.daily = 0,
      this.weekly = 0,
      this.monthly = 0,
      final Map<String, int> byHour = const {},
      final Map<String, int> byDay = const {}})
      : _byHour = byHour,
        _byDay = byDay;
  factory _ProfileViewAnalytics.fromJson(Map<String, dynamic> json) =>
      _$ProfileViewAnalyticsFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int daily;
  @override
  @JsonKey()
  final int weekly;
  @override
  @JsonKey()
  final int monthly;
  final Map<String, int> _byHour;
  @override
  @JsonKey()
  Map<String, int> get byHour {
    if (_byHour is EqualUnmodifiableMapView) return _byHour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byHour);
  }

  final Map<String, int> _byDay;
  @override
  @JsonKey()
  Map<String, int> get byDay {
    if (_byDay is EqualUnmodifiableMapView) return _byDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byDay);
  }

  /// Create a copy of ProfileViewAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileViewAnalyticsCopyWith<_ProfileViewAnalytics> get copyWith =>
      __$ProfileViewAnalyticsCopyWithImpl<_ProfileViewAnalytics>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileViewAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileViewAnalytics &&
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
    return 'ProfileViewAnalytics(total: $total, daily: $daily, weekly: $weekly, monthly: $monthly, byHour: $byHour, byDay: $byDay)';
  }
}

/// @nodoc
abstract mixin class _$ProfileViewAnalyticsCopyWith<$Res>
    implements $ProfileViewAnalyticsCopyWith<$Res> {
  factory _$ProfileViewAnalyticsCopyWith(_ProfileViewAnalytics value,
          $Res Function(_ProfileViewAnalytics) _then) =
      __$ProfileViewAnalyticsCopyWithImpl;
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
class __$ProfileViewAnalyticsCopyWithImpl<$Res>
    implements _$ProfileViewAnalyticsCopyWith<$Res> {
  __$ProfileViewAnalyticsCopyWithImpl(this._self, this._then);

  final _ProfileViewAnalytics _self;
  final $Res Function(_ProfileViewAnalytics) _then;

  /// Create a copy of ProfileViewAnalytics
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
    return _then(_ProfileViewAnalytics(
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
mixin _$MatchAnalytics {
  int get total;
  double get rate;
  int get daily;
  int get weekly;
  int get monthly;

  /// Create a copy of MatchAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchAnalyticsCopyWith<MatchAnalytics> get copyWith =>
      _$MatchAnalyticsCopyWithImpl<MatchAnalytics>(
          this as MatchAnalytics, _$identity);

  /// Serializes this MatchAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchAnalytics &&
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
    return 'MatchAnalytics(total: $total, rate: $rate, daily: $daily, weekly: $weekly, monthly: $monthly)';
  }
}

/// @nodoc
abstract mixin class $MatchAnalyticsCopyWith<$Res> {
  factory $MatchAnalyticsCopyWith(
          MatchAnalytics value, $Res Function(MatchAnalytics) _then) =
      _$MatchAnalyticsCopyWithImpl;
  @useResult
  $Res call({int total, double rate, int daily, int weekly, int monthly});
}

/// @nodoc
class _$MatchAnalyticsCopyWithImpl<$Res>
    implements $MatchAnalyticsCopyWith<$Res> {
  _$MatchAnalyticsCopyWithImpl(this._self, this._then);

  final MatchAnalytics _self;
  final $Res Function(MatchAnalytics) _then;

  /// Create a copy of MatchAnalytics
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

/// Adds pattern-matching-related methods to [MatchAnalytics].
extension MatchAnalyticsPatterns on MatchAnalytics {
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
    TResult Function(_MatchAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchAnalytics() when $default != null:
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
    TResult Function(_MatchAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchAnalytics():
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
    TResult? Function(_MatchAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchAnalytics() when $default != null:
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
      case _MatchAnalytics() when $default != null:
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
      case _MatchAnalytics():
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
      case _MatchAnalytics() when $default != null:
        return $default(
            _that.total, _that.rate, _that.daily, _that.weekly, _that.monthly);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MatchAnalytics implements MatchAnalytics {
  const _MatchAnalytics(
      {this.total = 0,
      this.rate = 0.0,
      this.daily = 0,
      this.weekly = 0,
      this.monthly = 0});
  factory _MatchAnalytics.fromJson(Map<String, dynamic> json) =>
      _$MatchAnalyticsFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final double rate;
  @override
  @JsonKey()
  final int daily;
  @override
  @JsonKey()
  final int weekly;
  @override
  @JsonKey()
  final int monthly;

  /// Create a copy of MatchAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchAnalyticsCopyWith<_MatchAnalytics> get copyWith =>
      __$MatchAnalyticsCopyWithImpl<_MatchAnalytics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchAnalytics &&
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
    return 'MatchAnalytics(total: $total, rate: $rate, daily: $daily, weekly: $weekly, monthly: $monthly)';
  }
}

/// @nodoc
abstract mixin class _$MatchAnalyticsCopyWith<$Res>
    implements $MatchAnalyticsCopyWith<$Res> {
  factory _$MatchAnalyticsCopyWith(
          _MatchAnalytics value, $Res Function(_MatchAnalytics) _then) =
      __$MatchAnalyticsCopyWithImpl;
  @override
  @useResult
  $Res call({int total, double rate, int daily, int weekly, int monthly});
}

/// @nodoc
class __$MatchAnalyticsCopyWithImpl<$Res>
    implements _$MatchAnalyticsCopyWith<$Res> {
  __$MatchAnalyticsCopyWithImpl(this._self, this._then);

  final _MatchAnalytics _self;
  final $Res Function(_MatchAnalytics) _then;

  /// Create a copy of MatchAnalytics
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
    return _then(_MatchAnalytics(
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
mixin _$MessageAnalytics {
  int get sent;
  int get received;
  double get responseRate;
  double get averageResponseTime;

  /// Create a copy of MessageAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageAnalyticsCopyWith<MessageAnalytics> get copyWith =>
      _$MessageAnalyticsCopyWithImpl<MessageAnalytics>(
          this as MessageAnalytics, _$identity);

  /// Serializes this MessageAnalytics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageAnalytics &&
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
    return 'MessageAnalytics(sent: $sent, received: $received, responseRate: $responseRate, averageResponseTime: $averageResponseTime)';
  }
}

/// @nodoc
abstract mixin class $MessageAnalyticsCopyWith<$Res> {
  factory $MessageAnalyticsCopyWith(
          MessageAnalytics value, $Res Function(MessageAnalytics) _then) =
      _$MessageAnalyticsCopyWithImpl;
  @useResult
  $Res call(
      {int sent,
      int received,
      double responseRate,
      double averageResponseTime});
}

/// @nodoc
class _$MessageAnalyticsCopyWithImpl<$Res>
    implements $MessageAnalyticsCopyWith<$Res> {
  _$MessageAnalyticsCopyWithImpl(this._self, this._then);

  final MessageAnalytics _self;
  final $Res Function(MessageAnalytics) _then;

  /// Create a copy of MessageAnalytics
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

/// Adds pattern-matching-related methods to [MessageAnalytics].
extension MessageAnalyticsPatterns on MessageAnalytics {
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
    TResult Function(_MessageAnalytics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MessageAnalytics() when $default != null:
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
    TResult Function(_MessageAnalytics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageAnalytics():
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
    TResult? Function(_MessageAnalytics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MessageAnalytics() when $default != null:
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
      case _MessageAnalytics() when $default != null:
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
      case _MessageAnalytics():
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
      case _MessageAnalytics() when $default != null:
        return $default(_that.sent, _that.received, _that.responseRate,
            _that.averageResponseTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MessageAnalytics implements MessageAnalytics {
  const _MessageAnalytics(
      {this.sent = 0,
      this.received = 0,
      this.responseRate = 0.0,
      this.averageResponseTime = 0.0});
  factory _MessageAnalytics.fromJson(Map<String, dynamic> json) =>
      _$MessageAnalyticsFromJson(json);

  @override
  @JsonKey()
  final int sent;
  @override
  @JsonKey()
  final int received;
  @override
  @JsonKey()
  final double responseRate;
  @override
  @JsonKey()
  final double averageResponseTime;

  /// Create a copy of MessageAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageAnalyticsCopyWith<_MessageAnalytics> get copyWith =>
      __$MessageAnalyticsCopyWithImpl<_MessageAnalytics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageAnalyticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageAnalytics &&
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
    return 'MessageAnalytics(sent: $sent, received: $received, responseRate: $responseRate, averageResponseTime: $averageResponseTime)';
  }
}

/// @nodoc
abstract mixin class _$MessageAnalyticsCopyWith<$Res>
    implements $MessageAnalyticsCopyWith<$Res> {
  factory _$MessageAnalyticsCopyWith(
          _MessageAnalytics value, $Res Function(_MessageAnalytics) _then) =
      __$MessageAnalyticsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int sent,
      int received,
      double responseRate,
      double averageResponseTime});
}

/// @nodoc
class __$MessageAnalyticsCopyWithImpl<$Res>
    implements _$MessageAnalyticsCopyWith<$Res> {
  __$MessageAnalyticsCopyWithImpl(this._self, this._then);

  final _MessageAnalytics _self;
  final $Res Function(_MessageAnalytics) _then;

  /// Create a copy of MessageAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sent = null,
    Object? received = null,
    Object? responseRate = null,
    Object? averageResponseTime = null,
  }) {
    return _then(_MessageAnalytics(
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
      {this.likesGiven = 0,
      this.likesReceived = 0,
      this.superLikesGiven = 0,
      this.superLikesReceived = 0,
      this.rewindCount = 0});
  factory _DiscoveryAnalytics.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryAnalyticsFromJson(json);

  @override
  @JsonKey()
  final int likesGiven;
  @override
  @JsonKey()
  final int likesReceived;
  @override
  @JsonKey()
  final int superLikesGiven;
  @override
  @JsonKey()
  final int superLikesReceived;
  @override
  @JsonKey()
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
      {final Map<String, int> activeHours = const {},
      final List<PopularLocation> popularLocations = const []})
      : _activeHours = activeHours,
        _popularLocations = popularLocations;
  factory _LocationAnalytics.fromJson(Map<String, dynamic> json) =>
      _$LocationAnalyticsFromJson(json);

  final Map<String, int> _activeHours;
  @override
  @JsonKey()
  Map<String, int> get activeHours {
    if (_activeHours is EqualUnmodifiableMapView) return _activeHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activeHours);
  }

  final List<PopularLocation> _popularLocations;
  @override
  @JsonKey()
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
      {final List<double> coordinates = const [], this.count = 0})
      : _coordinates = coordinates;
  factory _PopularLocation.fromJson(Map<String, dynamic> json) =>
      _$PopularLocationFromJson(json);

  final List<double> _coordinates;
  @override
  @JsonKey()
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  @JsonKey()
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
