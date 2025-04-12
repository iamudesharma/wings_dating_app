// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matching_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchingRequestModel _$MatchingRequestModelFromJson(Map<String, dynamic> json) {
  return _MatchingRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MatchingRequestModel {
  String get userId => throw _privateConstructorUsedError;
  RangeValue get ageRange => throw _privateConstructorUsedError;
  List<String> get bodyTypes => throw _privateConstructorUsedError;
  List<String> get positionPreferences => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  List<String> get activities => throw _privateConstructorUsedError;
  @FirestoreDateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this MatchingRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingRequestModelCopyWith<MatchingRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingRequestModelCopyWith<$Res> {
  factory $MatchingRequestModelCopyWith(MatchingRequestModel value,
          $Res Function(MatchingRequestModel) then) =
      _$MatchingRequestModelCopyWithImpl<$Res, MatchingRequestModel>;
  @useResult
  $Res call(
      {String userId,
      RangeValue ageRange,
      List<String> bodyTypes,
      List<String> positionPreferences,
      List<String> skills,
      List<String> activities,
      @FirestoreDateTimeConverter() DateTime createdAt,
      String id});

  $RangeValueCopyWith<$Res> get ageRange;
}

/// @nodoc
class _$MatchingRequestModelCopyWithImpl<$Res,
        $Val extends MatchingRequestModel>
    implements $MatchingRequestModelCopyWith<$Res> {
  _$MatchingRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ageRange: null == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      bodyTypes: null == bodyTypes
          ? _value.bodyTypes
          : bodyTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      positionPreferences: null == positionPreferences
          ? _value.positionPreferences
          : positionPreferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeValueCopyWith<$Res> get ageRange {
    return $RangeValueCopyWith<$Res>(_value.ageRange, (value) {
      return _then(_value.copyWith(ageRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchingRequestModelImplCopyWith<$Res>
    implements $MatchingRequestModelCopyWith<$Res> {
  factory _$$MatchingRequestModelImplCopyWith(_$MatchingRequestModelImpl value,
          $Res Function(_$MatchingRequestModelImpl) then) =
      __$$MatchingRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      RangeValue ageRange,
      List<String> bodyTypes,
      List<String> positionPreferences,
      List<String> skills,
      List<String> activities,
      @FirestoreDateTimeConverter() DateTime createdAt,
      String id});

  @override
  $RangeValueCopyWith<$Res> get ageRange;
}

/// @nodoc
class __$$MatchingRequestModelImplCopyWithImpl<$Res>
    extends _$MatchingRequestModelCopyWithImpl<$Res, _$MatchingRequestModelImpl>
    implements _$$MatchingRequestModelImplCopyWith<$Res> {
  __$$MatchingRequestModelImplCopyWithImpl(_$MatchingRequestModelImpl _value,
      $Res Function(_$MatchingRequestModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$MatchingRequestModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ageRange: null == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as RangeValue,
      bodyTypes: null == bodyTypes
          ? _value._bodyTypes
          : bodyTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      positionPreferences: null == positionPreferences
          ? _value._positionPreferences
          : positionPreferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activities: null == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true)
class _$MatchingRequestModelImpl implements _MatchingRequestModel {
  _$MatchingRequestModelImpl(
      {required this.userId,
      required this.ageRange,
      required final List<String> bodyTypes,
      required final List<String> positionPreferences,
      required final List<String> skills,
      required final List<String> activities,
      @FirestoreDateTimeConverter() required this.createdAt,
      required this.id})
      : _bodyTypes = bodyTypes,
        _positionPreferences = positionPreferences,
        _skills = skills,
        _activities = activities;

  factory _$MatchingRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingRequestModelImplFromJson(json);

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
  @FirestoreDateTimeConverter()
  final DateTime createdAt;
  @override
  final String id;

  @override
  String toString() {
    return 'MatchingRequestModel(userId: $userId, ageRange: $ageRange, bodyTypes: $bodyTypes, positionPreferences: $positionPreferences, skills: $skills, activities: $activities, createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingRequestModelImpl &&
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

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingRequestModelImplCopyWith<_$MatchingRequestModelImpl>
      get copyWith =>
          __$$MatchingRequestModelImplCopyWithImpl<_$MatchingRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingRequestModelImplToJson(
      this,
    );
  }
}

abstract class _MatchingRequestModel implements MatchingRequestModel {
  factory _MatchingRequestModel(
      {required final String userId,
      required final RangeValue ageRange,
      required final List<String> bodyTypes,
      required final List<String> positionPreferences,
      required final List<String> skills,
      required final List<String> activities,
      @FirestoreDateTimeConverter() required final DateTime createdAt,
      required final String id}) = _$MatchingRequestModelImpl;

  factory _MatchingRequestModel.fromJson(Map<String, dynamic> json) =
      _$MatchingRequestModelImpl.fromJson;

  @override
  String get userId;
  @override
  RangeValue get ageRange;
  @override
  List<String> get bodyTypes;
  @override
  List<String> get positionPreferences;
  @override
  List<String> get skills;
  @override
  List<String> get activities;
  @override
  @FirestoreDateTimeConverter()
  DateTime get createdAt;
  @override
  String get id;

  /// Create a copy of MatchingRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingRequestModelImplCopyWith<_$MatchingRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RangeValue _$RangeValueFromJson(Map<String, dynamic> json) {
  return _RangeValue.fromJson(json);
}

/// @nodoc
mixin _$RangeValue {
  double get start => throw _privateConstructorUsedError;
  double get end => throw _privateConstructorUsedError;

  /// Serializes this RangeValue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RangeValueCopyWith<RangeValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeValueCopyWith<$Res> {
  factory $RangeValueCopyWith(
          RangeValue value, $Res Function(RangeValue) then) =
      _$RangeValueCopyWithImpl<$Res, RangeValue>;
  @useResult
  $Res call({double start, double end});
}

/// @nodoc
class _$RangeValueCopyWithImpl<$Res, $Val extends RangeValue>
    implements $RangeValueCopyWith<$Res> {
  _$RangeValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RangeValueImplCopyWith<$Res>
    implements $RangeValueCopyWith<$Res> {
  factory _$$RangeValueImplCopyWith(
          _$RangeValueImpl value, $Res Function(_$RangeValueImpl) then) =
      __$$RangeValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double start, double end});
}

/// @nodoc
class __$$RangeValueImplCopyWithImpl<$Res>
    extends _$RangeValueCopyWithImpl<$Res, _$RangeValueImpl>
    implements _$$RangeValueImplCopyWith<$Res> {
  __$$RangeValueImplCopyWithImpl(
      _$RangeValueImpl _value, $Res Function(_$RangeValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$RangeValueImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true)
class _$RangeValueImpl implements _RangeValue {
  _$RangeValueImpl({required this.start, required this.end});

  factory _$RangeValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$RangeValueImplFromJson(json);

  @override
  final double start;
  @override
  final double end;

  @override
  String toString() {
    return 'RangeValue(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RangeValueImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RangeValueImplCopyWith<_$RangeValueImpl> get copyWith =>
      __$$RangeValueImplCopyWithImpl<_$RangeValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RangeValueImplToJson(
      this,
    );
  }
}

abstract class _RangeValue implements RangeValue {
  factory _RangeValue(
      {required final double start,
      required final double end}) = _$RangeValueImpl;

  factory _RangeValue.fromJson(Map<String, dynamic> json) =
      _$RangeValueImpl.fromJson;

  @override
  double get start;
  @override
  double get end;

  /// Create a copy of RangeValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RangeValueImplCopyWith<_$RangeValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
