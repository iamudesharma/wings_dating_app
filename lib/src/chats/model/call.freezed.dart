// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Call _$CallFromJson(Map<String, dynamic> json) {
  return _Call.fromJson(json);
}

/// @nodoc
mixin _$Call {
  String get callerId => throw _privateConstructorUsedError;
  String get callerName => throw _privateConstructorUsedError;
  String get callerPic => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get receiverName => throw _privateConstructorUsedError;
  String get receiverPic => throw _privateConstructorUsedError;
  String get callId => throw _privateConstructorUsedError;
  bool get hasDialled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallCopyWith<Call> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallCopyWith<$Res> {
  factory $CallCopyWith(Call value, $Res Function(Call) then) =
      _$CallCopyWithImpl<$Res, Call>;
  @useResult
  $Res call(
      {String callerId,
      String callerName,
      String callerPic,
      String receiverId,
      String receiverName,
      String receiverPic,
      String callId,
      bool hasDialled});
}

/// @nodoc
class _$CallCopyWithImpl<$Res, $Val extends Call>
    implements $CallCopyWith<$Res> {
  _$CallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callerId = null,
    Object? callerName = null,
    Object? callerPic = null,
    Object? receiverId = null,
    Object? receiverName = null,
    Object? receiverPic = null,
    Object? callId = null,
    Object? hasDialled = null,
  }) {
    return _then(_value.copyWith(
      callerId: null == callerId
          ? _value.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String,
      callerName: null == callerName
          ? _value.callerName
          : callerName // ignore: cast_nullable_to_non_nullable
              as String,
      callerPic: null == callerPic
          ? _value.callerPic
          : callerPic // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPic: null == receiverPic
          ? _value.receiverPic
          : receiverPic // ignore: cast_nullable_to_non_nullable
              as String,
      callId: null == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      hasDialled: null == hasDialled
          ? _value.hasDialled
          : hasDialled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CallCopyWith<$Res> implements $CallCopyWith<$Res> {
  factory _$$_CallCopyWith(_$_Call value, $Res Function(_$_Call) then) =
      __$$_CallCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String callerId,
      String callerName,
      String callerPic,
      String receiverId,
      String receiverName,
      String receiverPic,
      String callId,
      bool hasDialled});
}

/// @nodoc
class __$$_CallCopyWithImpl<$Res> extends _$CallCopyWithImpl<$Res, _$_Call>
    implements _$$_CallCopyWith<$Res> {
  __$$_CallCopyWithImpl(_$_Call _value, $Res Function(_$_Call) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callerId = null,
    Object? callerName = null,
    Object? callerPic = null,
    Object? receiverId = null,
    Object? receiverName = null,
    Object? receiverPic = null,
    Object? callId = null,
    Object? hasDialled = null,
  }) {
    return _then(_$_Call(
      callerId: null == callerId
          ? _value.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String,
      callerName: null == callerName
          ? _value.callerName
          : callerName // ignore: cast_nullable_to_non_nullable
              as String,
      callerPic: null == callerPic
          ? _value.callerPic
          : callerPic // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPic: null == receiverPic
          ? _value.receiverPic
          : receiverPic // ignore: cast_nullable_to_non_nullable
              as String,
      callId: null == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      hasDialled: null == hasDialled
          ? _value.hasDialled
          : hasDialled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Call implements _Call {
  const _$_Call(
      {required this.callerId,
      required this.callerName,
      required this.callerPic,
      required this.receiverId,
      required this.receiverName,
      required this.receiverPic,
      required this.callId,
      required this.hasDialled});

  factory _$_Call.fromJson(Map<String, dynamic> json) => _$$_CallFromJson(json);

  @override
  final String callerId;
  @override
  final String callerName;
  @override
  final String callerPic;
  @override
  final String receiverId;
  @override
  final String receiverName;
  @override
  final String receiverPic;
  @override
  final String callId;
  @override
  final bool hasDialled;

  @override
  String toString() {
    return 'Call(callerId: $callerId, callerName: $callerName, callerPic: $callerPic, receiverId: $receiverId, receiverName: $receiverName, receiverPic: $receiverPic, callId: $callId, hasDialled: $hasDialled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Call &&
            (identical(other.callerId, callerId) ||
                other.callerId == callerId) &&
            (identical(other.callerName, callerName) ||
                other.callerName == callerName) &&
            (identical(other.callerPic, callerPic) ||
                other.callerPic == callerPic) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.receiverPic, receiverPic) ||
                other.receiverPic == receiverPic) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.hasDialled, hasDialled) ||
                other.hasDialled == hasDialled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, callerId, callerName, callerPic,
      receiverId, receiverName, receiverPic, callId, hasDialled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CallCopyWith<_$_Call> get copyWith =>
      __$$_CallCopyWithImpl<_$_Call>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CallToJson(
      this,
    );
  }
}

abstract class _Call implements Call {
  const factory _Call(
      {required final String callerId,
      required final String callerName,
      required final String callerPic,
      required final String receiverId,
      required final String receiverName,
      required final String receiverPic,
      required final String callId,
      required final bool hasDialled}) = _$_Call;

  factory _Call.fromJson(Map<String, dynamic> json) = _$_Call.fromJson;

  @override
  String get callerId;
  @override
  String get callerName;
  @override
  String get callerPic;
  @override
  String get receiverId;
  @override
  String get receiverName;
  @override
  String get receiverPic;
  @override
  String get callId;
  @override
  bool get hasDialled;
  @override
  @JsonKey(ignore: true)
  _$$_CallCopyWith<_$_Call> get copyWith => throw _privateConstructorUsedError;
}