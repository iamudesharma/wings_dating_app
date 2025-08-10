// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Call {
  String get callerId;
  String get callerName;
  String get callerPic;
  String get receiverId;
  String get receiverName;
  String get receiverPic;
  String get callId;
  bool get hasDialled;

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CallCopyWith<Call> get copyWith =>
      _$CallCopyWithImpl<Call>(this as Call, _$identity);

  /// Serializes this Call to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Call &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, callerId, callerName, callerPic,
      receiverId, receiverName, receiverPic, callId, hasDialled);

  @override
  String toString() {
    return 'Call(callerId: $callerId, callerName: $callerName, callerPic: $callerPic, receiverId: $receiverId, receiverName: $receiverName, receiverPic: $receiverPic, callId: $callId, hasDialled: $hasDialled)';
  }
}

/// @nodoc
abstract mixin class $CallCopyWith<$Res> {
  factory $CallCopyWith(Call value, $Res Function(Call) _then) =
      _$CallCopyWithImpl;
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
class _$CallCopyWithImpl<$Res> implements $CallCopyWith<$Res> {
  _$CallCopyWithImpl(this._self, this._then);

  final Call _self;
  final $Res Function(Call) _then;

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      callerId: null == callerId
          ? _self.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String,
      callerName: null == callerName
          ? _self.callerName
          : callerName // ignore: cast_nullable_to_non_nullable
              as String,
      callerPic: null == callerPic
          ? _self.callerPic
          : callerPic // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _self.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPic: null == receiverPic
          ? _self.receiverPic
          : receiverPic // ignore: cast_nullable_to_non_nullable
              as String,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      hasDialled: null == hasDialled
          ? _self.hasDialled
          : hasDialled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Call].
extension CallPatterns on Call {
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
    TResult Function(_Call value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Call() when $default != null:
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
    TResult Function(_Call value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Call():
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
    TResult? Function(_Call value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Call() when $default != null:
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
            String callerId,
            String callerName,
            String callerPic,
            String receiverId,
            String receiverName,
            String receiverPic,
            String callId,
            bool hasDialled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Call() when $default != null:
        return $default(
            _that.callerId,
            _that.callerName,
            _that.callerPic,
            _that.receiverId,
            _that.receiverName,
            _that.receiverPic,
            _that.callId,
            _that.hasDialled);
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
            String callerId,
            String callerName,
            String callerPic,
            String receiverId,
            String receiverName,
            String receiverPic,
            String callId,
            bool hasDialled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Call():
        return $default(
            _that.callerId,
            _that.callerName,
            _that.callerPic,
            _that.receiverId,
            _that.receiverName,
            _that.receiverPic,
            _that.callId,
            _that.hasDialled);
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
            String callerId,
            String callerName,
            String callerPic,
            String receiverId,
            String receiverName,
            String receiverPic,
            String callId,
            bool hasDialled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Call() when $default != null:
        return $default(
            _that.callerId,
            _that.callerName,
            _that.callerPic,
            _that.receiverId,
            _that.receiverName,
            _that.receiverPic,
            _that.callId,
            _that.hasDialled);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Call implements Call {
  const _Call(
      {required this.callerId,
      required this.callerName,
      required this.callerPic,
      required this.receiverId,
      required this.receiverName,
      required this.receiverPic,
      required this.callId,
      required this.hasDialled});
  factory _Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

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

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CallCopyWith<_Call> get copyWith =>
      __$CallCopyWithImpl<_Call>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CallToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Call &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, callerId, callerName, callerPic,
      receiverId, receiverName, receiverPic, callId, hasDialled);

  @override
  String toString() {
    return 'Call(callerId: $callerId, callerName: $callerName, callerPic: $callerPic, receiverId: $receiverId, receiverName: $receiverName, receiverPic: $receiverPic, callId: $callId, hasDialled: $hasDialled)';
  }
}

/// @nodoc
abstract mixin class _$CallCopyWith<$Res> implements $CallCopyWith<$Res> {
  factory _$CallCopyWith(_Call value, $Res Function(_Call) _then) =
      __$CallCopyWithImpl;
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
class __$CallCopyWithImpl<$Res> implements _$CallCopyWith<$Res> {
  __$CallCopyWithImpl(this._self, this._then);

  final _Call _self;
  final $Res Function(_Call) _then;

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Call(
      callerId: null == callerId
          ? _self.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String,
      callerName: null == callerName
          ? _self.callerName
          : callerName // ignore: cast_nullable_to_non_nullable
              as String,
      callerPic: null == callerPic
          ? _self.callerPic
          : callerPic // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _self.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPic: null == receiverPic
          ? _self.receiverPic
          : receiverPic // ignore: cast_nullable_to_non_nullable
              as String,
      callId: null == callId
          ? _self.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      hasDialled: null == hasDialled
          ? _self.hasDialled
          : hasDialled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
