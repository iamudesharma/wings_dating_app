// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matching_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchingRequestModel {
  String get userId;
  RangeValue get ageRange;
  List<String> get bodyTypes;
  List<String> get positionPreferences;
  List<String> get skills;
  List<String> get activities;
  DateTime get createdAt;
  String get id;

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchingRequestModelCopyWith<MatchingRequestModel> get copyWith =>
      _$MatchingRequestModelCopyWithImpl<MatchingRequestModel>(
          this as MatchingRequestModel, _$identity);

  /// Serializes this MatchingRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchingRequestModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.ageRange, ageRange) ||
                other.ageRange == ageRange) &&
            const DeepCollectionEquality().equals(other.bodyTypes, bodyTypes) &&
            const DeepCollectionEquality()
                .equals(other.positionPreferences, positionPreferences) &&
            const DeepCollectionEquality().equals(other.skills, skills) &&
            const DeepCollectionEquality()
                .equals(other.activities, activities) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      ageRange,
      const DeepCollectionEquality().hash(bodyTypes),
      const DeepCollectionEquality().hash(positionPreferences),
      const DeepCollectionEquality().hash(skills),
      const DeepCollectionEquality().hash(activities),
      createdAt,
      id);

  @override
  String toString() {
    return 'MatchingRequestModel(userId: $userId, ageRange: $ageRange, bodyTypes: $bodyTypes, positionPreferences: $positionPreferences, skills: $skills, activities: $activities, createdAt: $createdAt, id: $id)';
  }
}

/// @nodoc
abstract mixin class $MatchingRequestModelCopyWith<$Res> {
  factory $MatchingRequestModelCopyWith(MatchingRequestModel value,
          $Res Function(MatchingRequestModel) _then) =
      _$MatchingRequestModelCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      RangeValue ageRange,
      List<String> bodyTypes,
      List<String> positionPreferences,
      List<String> skills,
      List<String> activities,
      DateTime createdAt,
      String id});

  $RangeValueCopyWith<$Res> get ageRange;
}

/// @nodoc
class _$MatchingRequestModelCopyWithImpl<$Res>
    implements $MatchingRequestModelCopyWith<$Res> {
  _$MatchingRequestModelCopyWithImpl(this._self, this._then);

  final MatchingRequestModel _self;
  final $Res Function(MatchingRequestModel) _then;

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? ageRange = null,
    Object? bodyTypes = null,
    Object? positionPreferences = null,
    Object? skills = null,
    Object? activities = null,
    Object? createdAt = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ageRange: null == ageRange
          ? _self.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      bodyTypes: null == bodyTypes
          ? _self.bodyTypes
          : bodyTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      positionPreferences: null == positionPreferences
          ? _self.positionPreferences
          : positionPreferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      skills: null == skills
          ? _self.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activities: null == activities
          ? _self.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeValueCopyWith<$Res> get ageRange {
    return $RangeValueCopyWith<$Res>(_self.ageRange, (value) {
      return _then(_self.copyWith(ageRange: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MatchingRequestModel].
extension MatchingRequestModelPatterns on MatchingRequestModel {
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
    TResult Function(_MatchingRequestModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchingRequestModel() when $default != null:
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
    TResult Function(_MatchingRequestModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchingRequestModel():
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
    TResult? Function(_MatchingRequestModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchingRequestModel() when $default != null:
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
            RangeValue ageRange,
            List<String> bodyTypes,
            List<String> positionPreferences,
            List<String> skills,
            List<String> activities,
            DateTime createdAt,
            String id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchingRequestModel() when $default != null:
        return $default(
            _that.userId,
            _that.ageRange,
            _that.bodyTypes,
            _that.positionPreferences,
            _that.skills,
            _that.activities,
            _that.createdAt,
            _that.id);
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
            RangeValue ageRange,
            List<String> bodyTypes,
            List<String> positionPreferences,
            List<String> skills,
            List<String> activities,
            DateTime createdAt,
            String id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchingRequestModel():
        return $default(
            _that.userId,
            _that.ageRange,
            _that.bodyTypes,
            _that.positionPreferences,
            _that.skills,
            _that.activities,
            _that.createdAt,
            _that.id);
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
            RangeValue ageRange,
            List<String> bodyTypes,
            List<String> positionPreferences,
            List<String> skills,
            List<String> activities,
            DateTime createdAt,
            String id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchingRequestModel() when $default != null:
        return $default(
            _that.userId,
            _that.ageRange,
            _that.bodyTypes,
            _that.positionPreferences,
            _that.skills,
            _that.activities,
            _that.createdAt,
            _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true)
class _MatchingRequestModel implements MatchingRequestModel {
  _MatchingRequestModel(
      {required this.userId,
      required this.ageRange,
      required final List<String> bodyTypes,
      required final List<String> positionPreferences,
      required final List<String> skills,
      required final List<String> activities,
      required this.createdAt,
      required this.id})
      : _bodyTypes = bodyTypes,
        _positionPreferences = positionPreferences,
        _skills = skills,
        _activities = activities;
  factory _MatchingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MatchingRequestModelFromJson(json);

  @override
  final String userId;
  @override
  final RangeValue ageRange;
  final List<String> _bodyTypes;
  @override
  List<String> get bodyTypes {
    if (_bodyTypes is EqualUnmodifiableListView) return _bodyTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodyTypes);
  }

  final List<String> _positionPreferences;
  @override
  List<String> get positionPreferences {
    if (_positionPreferences is EqualUnmodifiableListView)
      return _positionPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positionPreferences);
  }

  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  final List<String> _activities;
  @override
  List<String> get activities {
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activities);
  }

  @override
  final DateTime createdAt;
  @override
  final String id;

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchingRequestModelCopyWith<_MatchingRequestModel> get copyWith =>
      __$MatchingRequestModelCopyWithImpl<_MatchingRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchingRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchingRequestModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.ageRange, ageRange) ||
                other.ageRange == ageRange) &&
            const DeepCollectionEquality()
                .equals(other._bodyTypes, _bodyTypes) &&
            const DeepCollectionEquality()
                .equals(other._positionPreferences, _positionPreferences) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      ageRange,
      const DeepCollectionEquality().hash(_bodyTypes),
      const DeepCollectionEquality().hash(_positionPreferences),
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_activities),
      createdAt,
      id);

  @override
  String toString() {
    return 'MatchingRequestModel(userId: $userId, ageRange: $ageRange, bodyTypes: $bodyTypes, positionPreferences: $positionPreferences, skills: $skills, activities: $activities, createdAt: $createdAt, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$MatchingRequestModelCopyWith<$Res>
    implements $MatchingRequestModelCopyWith<$Res> {
  factory _$MatchingRequestModelCopyWith(_MatchingRequestModel value,
          $Res Function(_MatchingRequestModel) _then) =
      __$MatchingRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      RangeValue ageRange,
      List<String> bodyTypes,
      List<String> positionPreferences,
      List<String> skills,
      List<String> activities,
      DateTime createdAt,
      String id});

  @override
  $RangeValueCopyWith<$Res> get ageRange;
}

/// @nodoc
class __$MatchingRequestModelCopyWithImpl<$Res>
    implements _$MatchingRequestModelCopyWith<$Res> {
  __$MatchingRequestModelCopyWithImpl(this._self, this._then);

  final _MatchingRequestModel _self;
  final $Res Function(_MatchingRequestModel) _then;

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? ageRange = null,
    Object? bodyTypes = null,
    Object? positionPreferences = null,
    Object? skills = null,
    Object? activities = null,
    Object? createdAt = null,
    Object? id = null,
  }) {
    return _then(_MatchingRequestModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ageRange: null == ageRange
          ? _self.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      bodyTypes: null == bodyTypes
          ? _self._bodyTypes
          : bodyTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      positionPreferences: null == positionPreferences
          ? _self._positionPreferences
          : positionPreferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      skills: null == skills
          ? _self._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activities: null == activities
          ? _self._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeValueCopyWith<$Res> get ageRange {
    return $RangeValueCopyWith<$Res>(_self.ageRange, (value) {
      return _then(_self.copyWith(ageRange: value));
    });
  }
}

/// @nodoc
mixin _$RangeValue {
  double get start;
  double get end;

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RangeValueCopyWith<RangeValue> get copyWith =>
      _$RangeValueCopyWithImpl<RangeValue>(this as RangeValue, _$identity);

  /// Serializes this RangeValue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RangeValue &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @override
  String toString() {
    return 'RangeValue(start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $RangeValueCopyWith<$Res> {
  factory $RangeValueCopyWith(
          RangeValue value, $Res Function(RangeValue) _then) =
      _$RangeValueCopyWithImpl;
  @useResult
  $Res call({double start, double end});
}

/// @nodoc
class _$RangeValueCopyWithImpl<$Res> implements $RangeValueCopyWith<$Res> {
  _$RangeValueCopyWithImpl(this._self, this._then);

  final RangeValue _self;
  final $Res Function(RangeValue) _then;

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_self.copyWith(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [RangeValue].
extension RangeValuePatterns on RangeValue {
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
    TResult Function(_RangeValue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RangeValue() when $default != null:
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
    TResult Function(_RangeValue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RangeValue():
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
    TResult? Function(_RangeValue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RangeValue() when $default != null:
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
    TResult Function(double start, double end)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RangeValue() when $default != null:
        return $default(_that.start, _that.end);
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
    TResult Function(double start, double end) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RangeValue():
        return $default(_that.start, _that.end);
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
    TResult? Function(double start, double end)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RangeValue() when $default != null:
        return $default(_that.start, _that.end);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true)
class _RangeValue implements RangeValue {
  _RangeValue({required this.start, required this.end});
  factory _RangeValue.fromJson(Map<String, dynamic> json) =>
      _$RangeValueFromJson(json);

  @override
  final double start;
  @override
  final double end;

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RangeValueCopyWith<_RangeValue> get copyWith =>
      __$RangeValueCopyWithImpl<_RangeValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RangeValueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RangeValue &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @override
  String toString() {
    return 'RangeValue(start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class _$RangeValueCopyWith<$Res>
    implements $RangeValueCopyWith<$Res> {
  factory _$RangeValueCopyWith(
          _RangeValue value, $Res Function(_RangeValue) _then) =
      __$RangeValueCopyWithImpl;
  @override
  @useResult
  $Res call({double start, double end});
}

/// @nodoc
class __$RangeValueCopyWithImpl<$Res> implements _$RangeValueCopyWith<$Res> {
  __$RangeValueCopyWithImpl(this._self, this._then);

  final _RangeValue _self;
  final $Res Function(_RangeValue) _then;

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_RangeValue(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
