// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_basic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserBasicModel _$UserBasicModelFromJson(Map<String, dynamic> json) {
  return _UserBasicModel.fromJson(json);
}

/// @nodoc
mixin _$UserBasicModel {
  String? get dob => throw _privateConstructorUsedError;
  String? get height => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  String? get lived => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBasicModelCopyWith<UserBasicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBasicModelCopyWith<$Res> {
  factory $UserBasicModelCopyWith(
          UserBasicModel value, $Res Function(UserBasicModel) then) =
      _$UserBasicModelCopyWithImpl<$Res, UserBasicModel>;
  @useResult
  $Res call({String? dob, String? height, String? weight, String? lived});
}

/// @nodoc
class _$UserBasicModelCopyWithImpl<$Res, $Val extends UserBasicModel>
    implements $UserBasicModelCopyWith<$Res> {
  _$UserBasicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dob = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? lived = freezed,
  }) {
    return _then(_value.copyWith(
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      lived: freezed == lived
          ? _value.lived
          : lived // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserBasicModelCopyWith<$Res>
    implements $UserBasicModelCopyWith<$Res> {
  factory _$$_UserBasicModelCopyWith(
          _$_UserBasicModel value, $Res Function(_$_UserBasicModel) then) =
      __$$_UserBasicModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? dob, String? height, String? weight, String? lived});
}

/// @nodoc
class __$$_UserBasicModelCopyWithImpl<$Res>
    extends _$UserBasicModelCopyWithImpl<$Res, _$_UserBasicModel>
    implements _$$_UserBasicModelCopyWith<$Res> {
  __$$_UserBasicModelCopyWithImpl(
      _$_UserBasicModel _value, $Res Function(_$_UserBasicModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dob = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? lived = freezed,
  }) {
    return _then(_$_UserBasicModel(
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      lived: freezed == lived
          ? _value.lived
          : lived // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserBasicModel implements _UserBasicModel {
  _$_UserBasicModel({this.dob, this.height, this.weight, this.lived});

  factory _$_UserBasicModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserBasicModelFromJson(json);

  @override
  final String? dob;
  @override
  final String? height;
  @override
  final String? weight;
  @override
  final String? lived;

  @override
  String toString() {
    return 'UserBasicModel(dob: $dob, height: $height, weight: $weight, lived: $lived)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserBasicModel &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.lived, lived) || other.lived == lived));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dob, height, weight, lived);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserBasicModelCopyWith<_$_UserBasicModel> get copyWith =>
      __$$_UserBasicModelCopyWithImpl<_$_UserBasicModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserBasicModelToJson(
      this,
    );
  }
}

abstract class _UserBasicModel implements UserBasicModel {
  factory _UserBasicModel(
      {final String? dob,
      final String? height,
      final String? weight,
      final String? lived}) = _$_UserBasicModel;

  factory _UserBasicModel.fromJson(Map<String, dynamic> json) =
      _$_UserBasicModel.fromJson;

  @override
  String? get dob;
  @override
  String? get height;
  @override
  String? get weight;
  @override
  String? get lived;
  @override
  @JsonKey(ignore: true)
  _$$_UserBasicModelCopyWith<_$_UserBasicModel> get copyWith =>
      throw _privateConstructorUsedError;
}
