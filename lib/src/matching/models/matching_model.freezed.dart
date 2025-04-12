// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matching_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchingModel _$MatchingModelFromJson(Map<String, dynamic> json) {
  return _MatchingModel.fromJson(json);
}

/// @nodoc
mixin _$MatchingModel {
  @Min(18)
  int get minAge => throw _privateConstructorUsedError;
  int get maxAge => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  List<String> get freeTimeActivities => throw _privateConstructorUsedError;

  /// Serializes this MatchingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchingModelCopyWith<MatchingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchingModelCopyWith<$Res> {
  factory $MatchingModelCopyWith(
          MatchingModel value, $Res Function(MatchingModel) then) =
      _$MatchingModelCopyWithImpl<$Res, MatchingModel>;
  @useResult
  $Res call(
      {@Min(18) int minAge,
      int maxAge,
      List<String> skills,
      List<String> freeTimeActivities});
}

/// @nodoc
class _$MatchingModelCopyWithImpl<$Res, $Val extends MatchingModel>
    implements $MatchingModelCopyWith<$Res> {
  _$MatchingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAge = null,
    Object? maxAge = null,
    Object? skills = null,
    Object? freeTimeActivities = null,
  }) {
    return _then(_value.copyWith(
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      freeTimeActivities: null == freeTimeActivities
          ? _value.freeTimeActivities
          : freeTimeActivities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchingModelImplCopyWith<$Res>
    implements $MatchingModelCopyWith<$Res> {
  factory _$$MatchingModelImplCopyWith(
          _$MatchingModelImpl value, $Res Function(_$MatchingModelImpl) then) =
      __$$MatchingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Min(18) int minAge,
      int maxAge,
      List<String> skills,
      List<String> freeTimeActivities});
}

/// @nodoc
class __$$MatchingModelImplCopyWithImpl<$Res>
    extends _$MatchingModelCopyWithImpl<$Res, _$MatchingModelImpl>
    implements _$$MatchingModelImplCopyWith<$Res> {
  __$$MatchingModelImplCopyWithImpl(
      _$MatchingModelImpl _value, $Res Function(_$MatchingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAge = null,
    Object? maxAge = null,
    Object? skills = null,
    Object? freeTimeActivities = null,
  }) {
    return _then(_$MatchingModelImpl(
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      freeTimeActivities: null == freeTimeActivities
          ? _value._freeTimeActivities
          : freeTimeActivities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true)
class _$MatchingModelImpl implements _MatchingModel {
  _$MatchingModelImpl(
      {@Min(18) required this.minAge,
      required this.maxAge,
      required final List<String> skills,
      required final List<String> freeTimeActivities})
      : _skills = skills,
        _freeTimeActivities = freeTimeActivities;

  factory _$MatchingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchingModelImplFromJson(json);

  @override
  @Min(18)
  final int minAge;
  @override
  final int maxAge;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  final List<String> _freeTimeActivities;
  @override
  List<String> get freeTimeActivities {
    if (_freeTimeActivities is EqualUnmodifiableListView)
      return _freeTimeActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_freeTimeActivities);
  }

  @override
  String toString() {
    return 'MatchingModel(minAge: $minAge, maxAge: $maxAge, skills: $skills, freeTimeActivities: $freeTimeActivities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchingModelImpl &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._freeTimeActivities, _freeTimeActivities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      minAge,
      maxAge,
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_freeTimeActivities));

  /// Create a copy of MatchingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchingModelImplCopyWith<_$MatchingModelImpl> get copyWith =>
      __$$MatchingModelImplCopyWithImpl<_$MatchingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchingModelImplToJson(
      this,
    );
  }
}

abstract class _MatchingModel implements MatchingModel {
  factory _MatchingModel(
      {@Min(18) required final int minAge,
      required final int maxAge,
      required final List<String> skills,
      required final List<String> freeTimeActivities}) = _$MatchingModelImpl;

  factory _MatchingModel.fromJson(Map<String, dynamic> json) =
      _$MatchingModelImpl.fromJson;

  @override
  @Min(18)
  int get minAge;
  @override
  int get maxAge;
  @override
  List<String> get skills;
  @override
  List<String> get freeTimeActivities;

  /// Create a copy of MatchingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchingModelImplCopyWith<_$MatchingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
