// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_engagement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEngagement {

 String get id; String get userId; String get targetUserId; EngagementType get type; DateTime get createdAt; DateTime get updatedAt; int? get viewDuration; String? get viewSource; int? get visitCount;
/// Create a copy of UserEngagement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEngagementCopyWith<UserEngagement> get copyWith => _$UserEngagementCopyWithImpl<UserEngagement>(this as UserEngagement, _$identity);

  /// Serializes this UserEngagement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEngagement&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.targetUserId, targetUserId) || other.targetUserId == targetUserId)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.viewDuration, viewDuration) || other.viewDuration == viewDuration)&&(identical(other.viewSource, viewSource) || other.viewSource == viewSource)&&(identical(other.visitCount, visitCount) || other.visitCount == visitCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,targetUserId,type,createdAt,updatedAt,viewDuration,viewSource,visitCount);

@override
String toString() {
  return 'UserEngagement(id: $id, userId: $userId, targetUserId: $targetUserId, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, viewDuration: $viewDuration, viewSource: $viewSource, visitCount: $visitCount)';
}


}

/// @nodoc
abstract mixin class $UserEngagementCopyWith<$Res>  {
  factory $UserEngagementCopyWith(UserEngagement value, $Res Function(UserEngagement) _then) = _$UserEngagementCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String targetUserId, EngagementType type, DateTime createdAt, DateTime updatedAt, int? viewDuration, String? viewSource, int? visitCount
});




}
/// @nodoc
class _$UserEngagementCopyWithImpl<$Res>
    implements $UserEngagementCopyWith<$Res> {
  _$UserEngagementCopyWithImpl(this._self, this._then);

  final UserEngagement _self;
  final $Res Function(UserEngagement) _then;

/// Create a copy of UserEngagement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? targetUserId = null,Object? type = null,Object? createdAt = null,Object? updatedAt = null,Object? viewDuration = freezed,Object? viewSource = freezed,Object? visitCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,targetUserId: null == targetUserId ? _self.targetUserId : targetUserId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EngagementType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,viewDuration: freezed == viewDuration ? _self.viewDuration : viewDuration // ignore: cast_nullable_to_non_nullable
as int?,viewSource: freezed == viewSource ? _self.viewSource : viewSource // ignore: cast_nullable_to_non_nullable
as String?,visitCount: freezed == visitCount ? _self.visitCount : visitCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEngagement].
extension UserEngagementPatterns on UserEngagement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEngagement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEngagement() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEngagement value)  $default,){
final _that = this;
switch (_that) {
case _UserEngagement():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEngagement value)?  $default,){
final _that = this;
switch (_that) {
case _UserEngagement() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String targetUserId,  EngagementType type,  DateTime createdAt,  DateTime updatedAt,  int? viewDuration,  String? viewSource,  int? visitCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEngagement() when $default != null:
return $default(_that.id,_that.userId,_that.targetUserId,_that.type,_that.createdAt,_that.updatedAt,_that.viewDuration,_that.viewSource,_that.visitCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String targetUserId,  EngagementType type,  DateTime createdAt,  DateTime updatedAt,  int? viewDuration,  String? viewSource,  int? visitCount)  $default,) {final _that = this;
switch (_that) {
case _UserEngagement():
return $default(_that.id,_that.userId,_that.targetUserId,_that.type,_that.createdAt,_that.updatedAt,_that.viewDuration,_that.viewSource,_that.visitCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String targetUserId,  EngagementType type,  DateTime createdAt,  DateTime updatedAt,  int? viewDuration,  String? viewSource,  int? visitCount)?  $default,) {final _that = this;
switch (_that) {
case _UserEngagement() when $default != null:
return $default(_that.id,_that.userId,_that.targetUserId,_that.type,_that.createdAt,_that.updatedAt,_that.viewDuration,_that.viewSource,_that.visitCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEngagement implements UserEngagement {
  const _UserEngagement({required this.id, required this.userId, required this.targetUserId, required this.type, required this.createdAt, required this.updatedAt, this.viewDuration, this.viewSource, this.visitCount});
  factory _UserEngagement.fromJson(Map<String, dynamic> json) => _$UserEngagementFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String targetUserId;
@override final  EngagementType type;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? viewDuration;
@override final  String? viewSource;
@override final  int? visitCount;

/// Create a copy of UserEngagement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEngagementCopyWith<_UserEngagement> get copyWith => __$UserEngagementCopyWithImpl<_UserEngagement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEngagementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEngagement&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.targetUserId, targetUserId) || other.targetUserId == targetUserId)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.viewDuration, viewDuration) || other.viewDuration == viewDuration)&&(identical(other.viewSource, viewSource) || other.viewSource == viewSource)&&(identical(other.visitCount, visitCount) || other.visitCount == visitCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,targetUserId,type,createdAt,updatedAt,viewDuration,viewSource,visitCount);

@override
String toString() {
  return 'UserEngagement(id: $id, userId: $userId, targetUserId: $targetUserId, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, viewDuration: $viewDuration, viewSource: $viewSource, visitCount: $visitCount)';
}


}

/// @nodoc
abstract mixin class _$UserEngagementCopyWith<$Res> implements $UserEngagementCopyWith<$Res> {
  factory _$UserEngagementCopyWith(_UserEngagement value, $Res Function(_UserEngagement) _then) = __$UserEngagementCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String targetUserId, EngagementType type, DateTime createdAt, DateTime updatedAt, int? viewDuration, String? viewSource, int? visitCount
});




}
/// @nodoc
class __$UserEngagementCopyWithImpl<$Res>
    implements _$UserEngagementCopyWith<$Res> {
  __$UserEngagementCopyWithImpl(this._self, this._then);

  final _UserEngagement _self;
  final $Res Function(_UserEngagement) _then;

/// Create a copy of UserEngagement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? targetUserId = null,Object? type = null,Object? createdAt = null,Object? updatedAt = null,Object? viewDuration = freezed,Object? viewSource = freezed,Object? visitCount = freezed,}) {
  return _then(_UserEngagement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,targetUserId: null == targetUserId ? _self.targetUserId : targetUserId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EngagementType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,viewDuration: freezed == viewDuration ? _self.viewDuration : viewDuration // ignore: cast_nullable_to_non_nullable
as int?,viewSource: freezed == viewSource ? _self.viewSource : viewSource // ignore: cast_nullable_to_non_nullable
as String?,visitCount: freezed == visitCount ? _self.visitCount : visitCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$NotificationModel {

 String get id; String get userId; NotificationType get type; String? get fromUserId; String get message; bool get isRead; DateTime get createdAt; DateTime get updatedAt; DateTime? get readAt; UserModel? get fromUser;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.fromUser, fromUser) || other.fromUser == fromUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,fromUserId,message,isRead,createdAt,updatedAt,readAt,fromUser);

@override
String toString() {
  return 'NotificationModel(id: $id, userId: $userId, type: $type, fromUserId: $fromUserId, message: $message, isRead: $isRead, createdAt: $createdAt, updatedAt: $updatedAt, readAt: $readAt, fromUser: $fromUser)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, NotificationType type, String? fromUserId, String message, bool isRead, DateTime createdAt, DateTime updatedAt, DateTime? readAt, UserModel? fromUser
});


$UserModelCopyWith<$Res>? get fromUser;

}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? fromUserId = freezed,Object? message = null,Object? isRead = null,Object? createdAt = null,Object? updatedAt = null,Object? readAt = freezed,Object? fromUser = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,fromUserId: freezed == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fromUser: freezed == fromUser ? _self.fromUser : fromUser // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get fromUser {
    if (_self.fromUser == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.fromUser!, (value) {
    return _then(_self.copyWith(fromUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationModel].
extension NotificationModelPatterns on NotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  NotificationType type,  String? fromUserId,  String message,  bool isRead,  DateTime createdAt,  DateTime updatedAt,  DateTime? readAt,  UserModel? fromUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.fromUserId,_that.message,_that.isRead,_that.createdAt,_that.updatedAt,_that.readAt,_that.fromUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  NotificationType type,  String? fromUserId,  String message,  bool isRead,  DateTime createdAt,  DateTime updatedAt,  DateTime? readAt,  UserModel? fromUser)  $default,) {final _that = this;
switch (_that) {
case _NotificationModel():
return $default(_that.id,_that.userId,_that.type,_that.fromUserId,_that.message,_that.isRead,_that.createdAt,_that.updatedAt,_that.readAt,_that.fromUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  NotificationType type,  String? fromUserId,  String message,  bool isRead,  DateTime createdAt,  DateTime updatedAt,  DateTime? readAt,  UserModel? fromUser)?  $default,) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.fromUserId,_that.message,_that.isRead,_that.createdAt,_that.updatedAt,_that.readAt,_that.fromUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationModel implements NotificationModel {
  const _NotificationModel({required this.id, required this.userId, required this.type, this.fromUserId, required this.message, required this.isRead, required this.createdAt, required this.updatedAt, this.readAt, this.fromUser});
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  NotificationType type;
@override final  String? fromUserId;
@override final  String message;
@override final  bool isRead;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? readAt;
@override final  UserModel? fromUser;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.fromUser, fromUser) || other.fromUser == fromUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,fromUserId,message,isRead,createdAt,updatedAt,readAt,fromUser);

@override
String toString() {
  return 'NotificationModel(id: $id, userId: $userId, type: $type, fromUserId: $fromUserId, message: $message, isRead: $isRead, createdAt: $createdAt, updatedAt: $updatedAt, readAt: $readAt, fromUser: $fromUser)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, NotificationType type, String? fromUserId, String message, bool isRead, DateTime createdAt, DateTime updatedAt, DateTime? readAt, UserModel? fromUser
});


@override $UserModelCopyWith<$Res>? get fromUser;

}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? fromUserId = freezed,Object? message = null,Object? isRead = null,Object? createdAt = null,Object? updatedAt = null,Object? readAt = freezed,Object? fromUser = freezed,}) {
  return _then(_NotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,fromUserId: freezed == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fromUser: freezed == fromUser ? _self.fromUser : fromUser // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get fromUser {
    if (_self.fromUser == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.fromUser!, (value) {
    return _then(_self.copyWith(fromUser: value));
  });
}
}


/// @nodoc
mixin _$TapResult {

 bool get success; String get message; int? get remainingTaps; List<String>? get tappedBy; EngagementStatus? get engagementStatus;
/// Create a copy of TapResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TapResultCopyWith<TapResult> get copyWith => _$TapResultCopyWithImpl<TapResult>(this as TapResult, _$identity);

  /// Serializes this TapResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.remainingTaps, remainingTaps) || other.remainingTaps == remainingTaps)&&const DeepCollectionEquality().equals(other.tappedBy, tappedBy)&&(identical(other.engagementStatus, engagementStatus) || other.engagementStatus == engagementStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,remainingTaps,const DeepCollectionEquality().hash(tappedBy),engagementStatus);

@override
String toString() {
  return 'TapResult(success: $success, message: $message, remainingTaps: $remainingTaps, tappedBy: $tappedBy, engagementStatus: $engagementStatus)';
}


}

/// @nodoc
abstract mixin class $TapResultCopyWith<$Res>  {
  factory $TapResultCopyWith(TapResult value, $Res Function(TapResult) _then) = _$TapResultCopyWithImpl;
@useResult
$Res call({
 bool success, String message, int? remainingTaps, List<String>? tappedBy, EngagementStatus? engagementStatus
});


$EngagementStatusCopyWith<$Res>? get engagementStatus;

}
/// @nodoc
class _$TapResultCopyWithImpl<$Res>
    implements $TapResultCopyWith<$Res> {
  _$TapResultCopyWithImpl(this._self, this._then);

  final TapResult _self;
  final $Res Function(TapResult) _then;

/// Create a copy of TapResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? remainingTaps = freezed,Object? tappedBy = freezed,Object? engagementStatus = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,remainingTaps: freezed == remainingTaps ? _self.remainingTaps : remainingTaps // ignore: cast_nullable_to_non_nullable
as int?,tappedBy: freezed == tappedBy ? _self.tappedBy : tappedBy // ignore: cast_nullable_to_non_nullable
as List<String>?,engagementStatus: freezed == engagementStatus ? _self.engagementStatus : engagementStatus // ignore: cast_nullable_to_non_nullable
as EngagementStatus?,
  ));
}
/// Create a copy of TapResult
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


/// Adds pattern-matching-related methods to [TapResult].
extension TapResultPatterns on TapResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TapResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TapResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TapResult value)  $default,){
final _that = this;
switch (_that) {
case _TapResult():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TapResult value)?  $default,){
final _that = this;
switch (_that) {
case _TapResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  int? remainingTaps,  List<String>? tappedBy,  EngagementStatus? engagementStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TapResult() when $default != null:
return $default(_that.success,_that.message,_that.remainingTaps,_that.tappedBy,_that.engagementStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  int? remainingTaps,  List<String>? tappedBy,  EngagementStatus? engagementStatus)  $default,) {final _that = this;
switch (_that) {
case _TapResult():
return $default(_that.success,_that.message,_that.remainingTaps,_that.tappedBy,_that.engagementStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  int? remainingTaps,  List<String>? tappedBy,  EngagementStatus? engagementStatus)?  $default,) {final _that = this;
switch (_that) {
case _TapResult() when $default != null:
return $default(_that.success,_that.message,_that.remainingTaps,_that.tappedBy,_that.engagementStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TapResult implements TapResult {
  const _TapResult({required this.success, required this.message, this.remainingTaps, final  List<String>? tappedBy, this.engagementStatus}): _tappedBy = tappedBy;
  factory _TapResult.fromJson(Map<String, dynamic> json) => _$TapResultFromJson(json);

@override final  bool success;
@override final  String message;
@override final  int? remainingTaps;
 final  List<String>? _tappedBy;
@override List<String>? get tappedBy {
  final value = _tappedBy;
  if (value == null) return null;
  if (_tappedBy is EqualUnmodifiableListView) return _tappedBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  EngagementStatus? engagementStatus;

/// Create a copy of TapResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TapResultCopyWith<_TapResult> get copyWith => __$TapResultCopyWithImpl<_TapResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TapResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TapResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.remainingTaps, remainingTaps) || other.remainingTaps == remainingTaps)&&const DeepCollectionEquality().equals(other._tappedBy, _tappedBy)&&(identical(other.engagementStatus, engagementStatus) || other.engagementStatus == engagementStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,remainingTaps,const DeepCollectionEquality().hash(_tappedBy),engagementStatus);

@override
String toString() {
  return 'TapResult(success: $success, message: $message, remainingTaps: $remainingTaps, tappedBy: $tappedBy, engagementStatus: $engagementStatus)';
}


}

/// @nodoc
abstract mixin class _$TapResultCopyWith<$Res> implements $TapResultCopyWith<$Res> {
  factory _$TapResultCopyWith(_TapResult value, $Res Function(_TapResult) _then) = __$TapResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, int? remainingTaps, List<String>? tappedBy, EngagementStatus? engagementStatus
});


@override $EngagementStatusCopyWith<$Res>? get engagementStatus;

}
/// @nodoc
class __$TapResultCopyWithImpl<$Res>
    implements _$TapResultCopyWith<$Res> {
  __$TapResultCopyWithImpl(this._self, this._then);

  final _TapResult _self;
  final $Res Function(_TapResult) _then;

/// Create a copy of TapResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? remainingTaps = freezed,Object? tappedBy = freezed,Object? engagementStatus = freezed,}) {
  return _then(_TapResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,remainingTaps: freezed == remainingTaps ? _self.remainingTaps : remainingTaps // ignore: cast_nullable_to_non_nullable
as int?,tappedBy: freezed == tappedBy ? _self._tappedBy : tappedBy // ignore: cast_nullable_to_non_nullable
as List<String>?,engagementStatus: freezed == engagementStatus ? _self.engagementStatus : engagementStatus // ignore: cast_nullable_to_non_nullable
as EngagementStatus?,
  ));
}

/// Create a copy of TapResult
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
mixin _$TapStats {

 int get totalTaps; int get dailyTaps; int get remainingTaps; List<String> get tappedBy; DateTime get lastTapTime; EngagementStatus? get engagementStatus;
/// Create a copy of TapStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TapStatsCopyWith<TapStats> get copyWith => _$TapStatsCopyWithImpl<TapStats>(this as TapStats, _$identity);

  /// Serializes this TapStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapStats&&(identical(other.totalTaps, totalTaps) || other.totalTaps == totalTaps)&&(identical(other.dailyTaps, dailyTaps) || other.dailyTaps == dailyTaps)&&(identical(other.remainingTaps, remainingTaps) || other.remainingTaps == remainingTaps)&&const DeepCollectionEquality().equals(other.tappedBy, tappedBy)&&(identical(other.lastTapTime, lastTapTime) || other.lastTapTime == lastTapTime)&&(identical(other.engagementStatus, engagementStatus) || other.engagementStatus == engagementStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTaps,dailyTaps,remainingTaps,const DeepCollectionEquality().hash(tappedBy),lastTapTime,engagementStatus);

@override
String toString() {
  return 'TapStats(totalTaps: $totalTaps, dailyTaps: $dailyTaps, remainingTaps: $remainingTaps, tappedBy: $tappedBy, lastTapTime: $lastTapTime, engagementStatus: $engagementStatus)';
}


}

/// @nodoc
abstract mixin class $TapStatsCopyWith<$Res>  {
  factory $TapStatsCopyWith(TapStats value, $Res Function(TapStats) _then) = _$TapStatsCopyWithImpl;
@useResult
$Res call({
 int totalTaps, int dailyTaps, int remainingTaps, List<String> tappedBy, DateTime lastTapTime, EngagementStatus? engagementStatus
});


$EngagementStatusCopyWith<$Res>? get engagementStatus;

}
/// @nodoc
class _$TapStatsCopyWithImpl<$Res>
    implements $TapStatsCopyWith<$Res> {
  _$TapStatsCopyWithImpl(this._self, this._then);

  final TapStats _self;
  final $Res Function(TapStats) _then;

/// Create a copy of TapStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalTaps = null,Object? dailyTaps = null,Object? remainingTaps = null,Object? tappedBy = null,Object? lastTapTime = null,Object? engagementStatus = freezed,}) {
  return _then(_self.copyWith(
totalTaps: null == totalTaps ? _self.totalTaps : totalTaps // ignore: cast_nullable_to_non_nullable
as int,dailyTaps: null == dailyTaps ? _self.dailyTaps : dailyTaps // ignore: cast_nullable_to_non_nullable
as int,remainingTaps: null == remainingTaps ? _self.remainingTaps : remainingTaps // ignore: cast_nullable_to_non_nullable
as int,tappedBy: null == tappedBy ? _self.tappedBy : tappedBy // ignore: cast_nullable_to_non_nullable
as List<String>,lastTapTime: null == lastTapTime ? _self.lastTapTime : lastTapTime // ignore: cast_nullable_to_non_nullable
as DateTime,engagementStatus: freezed == engagementStatus ? _self.engagementStatus : engagementStatus // ignore: cast_nullable_to_non_nullable
as EngagementStatus?,
  ));
}
/// Create a copy of TapStats
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


/// Adds pattern-matching-related methods to [TapStats].
extension TapStatsPatterns on TapStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TapStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TapStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TapStats value)  $default,){
final _that = this;
switch (_that) {
case _TapStats():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TapStats value)?  $default,){
final _that = this;
switch (_that) {
case _TapStats() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalTaps,  int dailyTaps,  int remainingTaps,  List<String> tappedBy,  DateTime lastTapTime,  EngagementStatus? engagementStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TapStats() when $default != null:
return $default(_that.totalTaps,_that.dailyTaps,_that.remainingTaps,_that.tappedBy,_that.lastTapTime,_that.engagementStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalTaps,  int dailyTaps,  int remainingTaps,  List<String> tappedBy,  DateTime lastTapTime,  EngagementStatus? engagementStatus)  $default,) {final _that = this;
switch (_that) {
case _TapStats():
return $default(_that.totalTaps,_that.dailyTaps,_that.remainingTaps,_that.tappedBy,_that.lastTapTime,_that.engagementStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalTaps,  int dailyTaps,  int remainingTaps,  List<String> tappedBy,  DateTime lastTapTime,  EngagementStatus? engagementStatus)?  $default,) {final _that = this;
switch (_that) {
case _TapStats() when $default != null:
return $default(_that.totalTaps,_that.dailyTaps,_that.remainingTaps,_that.tappedBy,_that.lastTapTime,_that.engagementStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TapStats implements TapStats {
  const _TapStats({required this.totalTaps, required this.dailyTaps, required this.remainingTaps, required final  List<String> tappedBy, required this.lastTapTime, this.engagementStatus}): _tappedBy = tappedBy;
  factory _TapStats.fromJson(Map<String, dynamic> json) => _$TapStatsFromJson(json);

@override final  int totalTaps;
@override final  int dailyTaps;
@override final  int remainingTaps;
 final  List<String> _tappedBy;
@override List<String> get tappedBy {
  if (_tappedBy is EqualUnmodifiableListView) return _tappedBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tappedBy);
}

@override final  DateTime lastTapTime;
@override final  EngagementStatus? engagementStatus;

/// Create a copy of TapStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TapStatsCopyWith<_TapStats> get copyWith => __$TapStatsCopyWithImpl<_TapStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TapStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TapStats&&(identical(other.totalTaps, totalTaps) || other.totalTaps == totalTaps)&&(identical(other.dailyTaps, dailyTaps) || other.dailyTaps == dailyTaps)&&(identical(other.remainingTaps, remainingTaps) || other.remainingTaps == remainingTaps)&&const DeepCollectionEquality().equals(other._tappedBy, _tappedBy)&&(identical(other.lastTapTime, lastTapTime) || other.lastTapTime == lastTapTime)&&(identical(other.engagementStatus, engagementStatus) || other.engagementStatus == engagementStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTaps,dailyTaps,remainingTaps,const DeepCollectionEquality().hash(_tappedBy),lastTapTime,engagementStatus);

@override
String toString() {
  return 'TapStats(totalTaps: $totalTaps, dailyTaps: $dailyTaps, remainingTaps: $remainingTaps, tappedBy: $tappedBy, lastTapTime: $lastTapTime, engagementStatus: $engagementStatus)';
}


}

/// @nodoc
abstract mixin class _$TapStatsCopyWith<$Res> implements $TapStatsCopyWith<$Res> {
  factory _$TapStatsCopyWith(_TapStats value, $Res Function(_TapStats) _then) = __$TapStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalTaps, int dailyTaps, int remainingTaps, List<String> tappedBy, DateTime lastTapTime, EngagementStatus? engagementStatus
});


@override $EngagementStatusCopyWith<$Res>? get engagementStatus;

}
/// @nodoc
class __$TapStatsCopyWithImpl<$Res>
    implements _$TapStatsCopyWith<$Res> {
  __$TapStatsCopyWithImpl(this._self, this._then);

  final _TapStats _self;
  final $Res Function(_TapStats) _then;

/// Create a copy of TapStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalTaps = null,Object? dailyTaps = null,Object? remainingTaps = null,Object? tappedBy = null,Object? lastTapTime = null,Object? engagementStatus = freezed,}) {
  return _then(_TapStats(
totalTaps: null == totalTaps ? _self.totalTaps : totalTaps // ignore: cast_nullable_to_non_nullable
as int,dailyTaps: null == dailyTaps ? _self.dailyTaps : dailyTaps // ignore: cast_nullable_to_non_nullable
as int,remainingTaps: null == remainingTaps ? _self.remainingTaps : remainingTaps // ignore: cast_nullable_to_non_nullable
as int,tappedBy: null == tappedBy ? _self._tappedBy : tappedBy // ignore: cast_nullable_to_non_nullable
as List<String>,lastTapTime: null == lastTapTime ? _self.lastTapTime : lastTapTime // ignore: cast_nullable_to_non_nullable
as DateTime,engagementStatus: freezed == engagementStatus ? _self.engagementStatus : engagementStatus // ignore: cast_nullable_to_non_nullable
as EngagementStatus?,
  ));
}

/// Create a copy of TapStats
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
mixin _$EngagementStatus {

 bool get hasTapped; bool get hasLiked; bool get isMatched; DateTime? get lastEngagement;
/// Create a copy of EngagementStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EngagementStatusCopyWith<EngagementStatus> get copyWith => _$EngagementStatusCopyWithImpl<EngagementStatus>(this as EngagementStatus, _$identity);

  /// Serializes this EngagementStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EngagementStatus&&(identical(other.hasTapped, hasTapped) || other.hasTapped == hasTapped)&&(identical(other.hasLiked, hasLiked) || other.hasLiked == hasLiked)&&(identical(other.isMatched, isMatched) || other.isMatched == isMatched)&&(identical(other.lastEngagement, lastEngagement) || other.lastEngagement == lastEngagement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasTapped,hasLiked,isMatched,lastEngagement);

@override
String toString() {
  return 'EngagementStatus(hasTapped: $hasTapped, hasLiked: $hasLiked, isMatched: $isMatched, lastEngagement: $lastEngagement)';
}


}

/// @nodoc
abstract mixin class $EngagementStatusCopyWith<$Res>  {
  factory $EngagementStatusCopyWith(EngagementStatus value, $Res Function(EngagementStatus) _then) = _$EngagementStatusCopyWithImpl;
@useResult
$Res call({
 bool hasTapped, bool hasLiked, bool isMatched, DateTime? lastEngagement
});




}
/// @nodoc
class _$EngagementStatusCopyWithImpl<$Res>
    implements $EngagementStatusCopyWith<$Res> {
  _$EngagementStatusCopyWithImpl(this._self, this._then);

  final EngagementStatus _self;
  final $Res Function(EngagementStatus) _then;

/// Create a copy of EngagementStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasTapped = null,Object? hasLiked = null,Object? isMatched = null,Object? lastEngagement = freezed,}) {
  return _then(_self.copyWith(
hasTapped: null == hasTapped ? _self.hasTapped : hasTapped // ignore: cast_nullable_to_non_nullable
as bool,hasLiked: null == hasLiked ? _self.hasLiked : hasLiked // ignore: cast_nullable_to_non_nullable
as bool,isMatched: null == isMatched ? _self.isMatched : isMatched // ignore: cast_nullable_to_non_nullable
as bool,lastEngagement: freezed == lastEngagement ? _self.lastEngagement : lastEngagement // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EngagementStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EngagementStatus() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EngagementStatus value)  $default,){
final _that = this;
switch (_that) {
case _EngagementStatus():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EngagementStatus value)?  $default,){
final _that = this;
switch (_that) {
case _EngagementStatus() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasTapped,  bool hasLiked,  bool isMatched,  DateTime? lastEngagement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EngagementStatus() when $default != null:
return $default(_that.hasTapped,_that.hasLiked,_that.isMatched,_that.lastEngagement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasTapped,  bool hasLiked,  bool isMatched,  DateTime? lastEngagement)  $default,) {final _that = this;
switch (_that) {
case _EngagementStatus():
return $default(_that.hasTapped,_that.hasLiked,_that.isMatched,_that.lastEngagement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasTapped,  bool hasLiked,  bool isMatched,  DateTime? lastEngagement)?  $default,) {final _that = this;
switch (_that) {
case _EngagementStatus() when $default != null:
return $default(_that.hasTapped,_that.hasLiked,_that.isMatched,_that.lastEngagement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EngagementStatus implements EngagementStatus {
  const _EngagementStatus({required this.hasTapped, required this.hasLiked, required this.isMatched, this.lastEngagement});
  factory _EngagementStatus.fromJson(Map<String, dynamic> json) => _$EngagementStatusFromJson(json);

@override final  bool hasTapped;
@override final  bool hasLiked;
@override final  bool isMatched;
@override final  DateTime? lastEngagement;

/// Create a copy of EngagementStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EngagementStatusCopyWith<_EngagementStatus> get copyWith => __$EngagementStatusCopyWithImpl<_EngagementStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EngagementStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EngagementStatus&&(identical(other.hasTapped, hasTapped) || other.hasTapped == hasTapped)&&(identical(other.hasLiked, hasLiked) || other.hasLiked == hasLiked)&&(identical(other.isMatched, isMatched) || other.isMatched == isMatched)&&(identical(other.lastEngagement, lastEngagement) || other.lastEngagement == lastEngagement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasTapped,hasLiked,isMatched,lastEngagement);

@override
String toString() {
  return 'EngagementStatus(hasTapped: $hasTapped, hasLiked: $hasLiked, isMatched: $isMatched, lastEngagement: $lastEngagement)';
}


}

/// @nodoc
abstract mixin class _$EngagementStatusCopyWith<$Res> implements $EngagementStatusCopyWith<$Res> {
  factory _$EngagementStatusCopyWith(_EngagementStatus value, $Res Function(_EngagementStatus) _then) = __$EngagementStatusCopyWithImpl;
@override @useResult
$Res call({
 bool hasTapped, bool hasLiked, bool isMatched, DateTime? lastEngagement
});




}
/// @nodoc
class __$EngagementStatusCopyWithImpl<$Res>
    implements _$EngagementStatusCopyWith<$Res> {
  __$EngagementStatusCopyWithImpl(this._self, this._then);

  final _EngagementStatus _self;
  final $Res Function(_EngagementStatus) _then;

/// Create a copy of EngagementStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasTapped = null,Object? hasLiked = null,Object? isMatched = null,Object? lastEngagement = freezed,}) {
  return _then(_EngagementStatus(
hasTapped: null == hasTapped ? _self.hasTapped : hasTapped // ignore: cast_nullable_to_non_nullable
as bool,hasLiked: null == hasLiked ? _self.hasLiked : hasLiked // ignore: cast_nullable_to_non_nullable
as bool,isMatched: null == isMatched ? _self.isMatched : isMatched // ignore: cast_nullable_to_non_nullable
as bool,lastEngagement: freezed == lastEngagement ? _self.lastEngagement : lastEngagement // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ViewResult {

 int get totalViews; int get uniqueViewers; List<ViewerInfo> get viewers;
/// Create a copy of ViewResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewResultCopyWith<ViewResult> get copyWith => _$ViewResultCopyWithImpl<ViewResult>(this as ViewResult, _$identity);

  /// Serializes this ViewResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewResult&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.uniqueViewers, uniqueViewers) || other.uniqueViewers == uniqueViewers)&&const DeepCollectionEquality().equals(other.viewers, viewers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalViews,uniqueViewers,const DeepCollectionEquality().hash(viewers));

@override
String toString() {
  return 'ViewResult(totalViews: $totalViews, uniqueViewers: $uniqueViewers, viewers: $viewers)';
}


}

/// @nodoc
abstract mixin class $ViewResultCopyWith<$Res>  {
  factory $ViewResultCopyWith(ViewResult value, $Res Function(ViewResult) _then) = _$ViewResultCopyWithImpl;
@useResult
$Res call({
 int totalViews, int uniqueViewers, List<ViewerInfo> viewers
});




}
/// @nodoc
class _$ViewResultCopyWithImpl<$Res>
    implements $ViewResultCopyWith<$Res> {
  _$ViewResultCopyWithImpl(this._self, this._then);

  final ViewResult _self;
  final $Res Function(ViewResult) _then;

/// Create a copy of ViewResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalViews = null,Object? uniqueViewers = null,Object? viewers = null,}) {
  return _then(_self.copyWith(
totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,uniqueViewers: null == uniqueViewers ? _self.uniqueViewers : uniqueViewers // ignore: cast_nullable_to_non_nullable
as int,viewers: null == viewers ? _self.viewers : viewers // ignore: cast_nullable_to_non_nullable
as List<ViewerInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [ViewResult].
extension ViewResultPatterns on ViewResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewResult value)  $default,){
final _that = this;
switch (_that) {
case _ViewResult():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewResult value)?  $default,){
final _that = this;
switch (_that) {
case _ViewResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalViews,  int uniqueViewers,  List<ViewerInfo> viewers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewResult() when $default != null:
return $default(_that.totalViews,_that.uniqueViewers,_that.viewers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalViews,  int uniqueViewers,  List<ViewerInfo> viewers)  $default,) {final _that = this;
switch (_that) {
case _ViewResult():
return $default(_that.totalViews,_that.uniqueViewers,_that.viewers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalViews,  int uniqueViewers,  List<ViewerInfo> viewers)?  $default,) {final _that = this;
switch (_that) {
case _ViewResult() when $default != null:
return $default(_that.totalViews,_that.uniqueViewers,_that.viewers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewResult implements ViewResult {
  const _ViewResult({required this.totalViews, required this.uniqueViewers, required final  List<ViewerInfo> viewers}): _viewers = viewers;
  factory _ViewResult.fromJson(Map<String, dynamic> json) => _$ViewResultFromJson(json);

@override final  int totalViews;
@override final  int uniqueViewers;
 final  List<ViewerInfo> _viewers;
@override List<ViewerInfo> get viewers {
  if (_viewers is EqualUnmodifiableListView) return _viewers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_viewers);
}


/// Create a copy of ViewResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewResultCopyWith<_ViewResult> get copyWith => __$ViewResultCopyWithImpl<_ViewResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewResult&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.uniqueViewers, uniqueViewers) || other.uniqueViewers == uniqueViewers)&&const DeepCollectionEquality().equals(other._viewers, _viewers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalViews,uniqueViewers,const DeepCollectionEquality().hash(_viewers));

@override
String toString() {
  return 'ViewResult(totalViews: $totalViews, uniqueViewers: $uniqueViewers, viewers: $viewers)';
}


}

/// @nodoc
abstract mixin class _$ViewResultCopyWith<$Res> implements $ViewResultCopyWith<$Res> {
  factory _$ViewResultCopyWith(_ViewResult value, $Res Function(_ViewResult) _then) = __$ViewResultCopyWithImpl;
@override @useResult
$Res call({
 int totalViews, int uniqueViewers, List<ViewerInfo> viewers
});




}
/// @nodoc
class __$ViewResultCopyWithImpl<$Res>
    implements _$ViewResultCopyWith<$Res> {
  __$ViewResultCopyWithImpl(this._self, this._then);

  final _ViewResult _self;
  final $Res Function(_ViewResult) _then;

/// Create a copy of ViewResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalViews = null,Object? uniqueViewers = null,Object? viewers = null,}) {
  return _then(_ViewResult(
totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,uniqueViewers: null == uniqueViewers ? _self.uniqueViewers : uniqueViewers // ignore: cast_nullable_to_non_nullable
as int,viewers: null == viewers ? _self._viewers : viewers // ignore: cast_nullable_to_non_nullable
as List<ViewerInfo>,
  ));
}


}


/// @nodoc
mixin _$ViewerInfo {

 String get userId; int get viewCount; DateTime get lastViewed; UserModel? get user;
/// Create a copy of ViewerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewerInfoCopyWith<ViewerInfo> get copyWith => _$ViewerInfoCopyWithImpl<ViewerInfo>(this as ViewerInfo, _$identity);

  /// Serializes this ViewerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewerInfo&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.lastViewed, lastViewed) || other.lastViewed == lastViewed)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,viewCount,lastViewed,user);

@override
String toString() {
  return 'ViewerInfo(userId: $userId, viewCount: $viewCount, lastViewed: $lastViewed, user: $user)';
}


}

/// @nodoc
abstract mixin class $ViewerInfoCopyWith<$Res>  {
  factory $ViewerInfoCopyWith(ViewerInfo value, $Res Function(ViewerInfo) _then) = _$ViewerInfoCopyWithImpl;
@useResult
$Res call({
 String userId, int viewCount, DateTime lastViewed, UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ViewerInfoCopyWithImpl<$Res>
    implements $ViewerInfoCopyWith<$Res> {
  _$ViewerInfoCopyWithImpl(this._self, this._then);

  final ViewerInfo _self;
  final $Res Function(ViewerInfo) _then;

/// Create a copy of ViewerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? viewCount = null,Object? lastViewed = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,lastViewed: null == lastViewed ? _self.lastViewed : lastViewed // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of ViewerInfo
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


/// Adds pattern-matching-related methods to [ViewerInfo].
extension ViewerInfoPatterns on ViewerInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewerInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewerInfo() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewerInfo value)  $default,){
final _that = this;
switch (_that) {
case _ViewerInfo():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewerInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ViewerInfo() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  int viewCount,  DateTime lastViewed,  UserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewerInfo() when $default != null:
return $default(_that.userId,_that.viewCount,_that.lastViewed,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  int viewCount,  DateTime lastViewed,  UserModel? user)  $default,) {final _that = this;
switch (_that) {
case _ViewerInfo():
return $default(_that.userId,_that.viewCount,_that.lastViewed,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  int viewCount,  DateTime lastViewed,  UserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _ViewerInfo() when $default != null:
return $default(_that.userId,_that.viewCount,_that.lastViewed,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewerInfo implements ViewerInfo {
  const _ViewerInfo({required this.userId, required this.viewCount, required this.lastViewed, this.user});
  factory _ViewerInfo.fromJson(Map<String, dynamic> json) => _$ViewerInfoFromJson(json);

@override final  String userId;
@override final  int viewCount;
@override final  DateTime lastViewed;
@override final  UserModel? user;

/// Create a copy of ViewerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewerInfoCopyWith<_ViewerInfo> get copyWith => __$ViewerInfoCopyWithImpl<_ViewerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewerInfo&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.lastViewed, lastViewed) || other.lastViewed == lastViewed)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,viewCount,lastViewed,user);

@override
String toString() {
  return 'ViewerInfo(userId: $userId, viewCount: $viewCount, lastViewed: $lastViewed, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ViewerInfoCopyWith<$Res> implements $ViewerInfoCopyWith<$Res> {
  factory _$ViewerInfoCopyWith(_ViewerInfo value, $Res Function(_ViewerInfo) _then) = __$ViewerInfoCopyWithImpl;
@override @useResult
$Res call({
 String userId, int viewCount, DateTime lastViewed, UserModel? user
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ViewerInfoCopyWithImpl<$Res>
    implements _$ViewerInfoCopyWith<$Res> {
  __$ViewerInfoCopyWithImpl(this._self, this._then);

  final _ViewerInfo _self;
  final $Res Function(_ViewerInfo) _then;

/// Create a copy of ViewerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? viewCount = null,Object? lastViewed = null,Object? user = freezed,}) {
  return _then(_ViewerInfo(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,lastViewed: null == lastViewed ? _self.lastViewed : lastViewed // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of ViewerInfo
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
mixin _$MatchResult {

 String get id; String get userId1; String get userId2; DateTime get createdAt; bool get isActive; UserModel? get user1; UserModel? get user2;
/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchResultCopyWith<MatchResult> get copyWith => _$MatchResultCopyWithImpl<MatchResult>(this as MatchResult, _$identity);

  /// Serializes this MatchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchResult&&(identical(other.id, id) || other.id == id)&&(identical(other.userId1, userId1) || other.userId1 == userId1)&&(identical(other.userId2, userId2) || other.userId2 == userId2)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.user1, user1) || other.user1 == user1)&&(identical(other.user2, user2) || other.user2 == user2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId1,userId2,createdAt,isActive,user1,user2);

@override
String toString() {
  return 'MatchResult(id: $id, userId1: $userId1, userId2: $userId2, createdAt: $createdAt, isActive: $isActive, user1: $user1, user2: $user2)';
}


}

/// @nodoc
abstract mixin class $MatchResultCopyWith<$Res>  {
  factory $MatchResultCopyWith(MatchResult value, $Res Function(MatchResult) _then) = _$MatchResultCopyWithImpl;
@useResult
$Res call({
 String id, String userId1, String userId2, DateTime createdAt, bool isActive, UserModel? user1, UserModel? user2
});


$UserModelCopyWith<$Res>? get user1;$UserModelCopyWith<$Res>? get user2;

}
/// @nodoc
class _$MatchResultCopyWithImpl<$Res>
    implements $MatchResultCopyWith<$Res> {
  _$MatchResultCopyWithImpl(this._self, this._then);

  final MatchResult _self;
  final $Res Function(MatchResult) _then;

/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId1 = null,Object? userId2 = null,Object? createdAt = null,Object? isActive = null,Object? user1 = freezed,Object? user2 = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId1: null == userId1 ? _self.userId1 : userId1 // ignore: cast_nullable_to_non_nullable
as String,userId2: null == userId2 ? _self.userId2 : userId2 // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,user1: freezed == user1 ? _self.user1 : user1 // ignore: cast_nullable_to_non_nullable
as UserModel?,user2: freezed == user2 ? _self.user2 : user2 // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user1 {
    if (_self.user1 == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user1!, (value) {
    return _then(_self.copyWith(user1: value));
  });
}/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user2 {
    if (_self.user2 == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user2!, (value) {
    return _then(_self.copyWith(user2: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchResult].
extension MatchResultPatterns on MatchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchResult value)  $default,){
final _that = this;
switch (_that) {
case _MatchResult():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchResult value)?  $default,){
final _that = this;
switch (_that) {
case _MatchResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId1,  String userId2,  DateTime createdAt,  bool isActive,  UserModel? user1,  UserModel? user2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchResult() when $default != null:
return $default(_that.id,_that.userId1,_that.userId2,_that.createdAt,_that.isActive,_that.user1,_that.user2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId1,  String userId2,  DateTime createdAt,  bool isActive,  UserModel? user1,  UserModel? user2)  $default,) {final _that = this;
switch (_that) {
case _MatchResult():
return $default(_that.id,_that.userId1,_that.userId2,_that.createdAt,_that.isActive,_that.user1,_that.user2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId1,  String userId2,  DateTime createdAt,  bool isActive,  UserModel? user1,  UserModel? user2)?  $default,) {final _that = this;
switch (_that) {
case _MatchResult() when $default != null:
return $default(_that.id,_that.userId1,_that.userId2,_that.createdAt,_that.isActive,_that.user1,_that.user2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchResult implements MatchResult {
  const _MatchResult({required this.id, required this.userId1, required this.userId2, required this.createdAt, required this.isActive, this.user1, this.user2});
  factory _MatchResult.fromJson(Map<String, dynamic> json) => _$MatchResultFromJson(json);

@override final  String id;
@override final  String userId1;
@override final  String userId2;
@override final  DateTime createdAt;
@override final  bool isActive;
@override final  UserModel? user1;
@override final  UserModel? user2;

/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchResultCopyWith<_MatchResult> get copyWith => __$MatchResultCopyWithImpl<_MatchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchResult&&(identical(other.id, id) || other.id == id)&&(identical(other.userId1, userId1) || other.userId1 == userId1)&&(identical(other.userId2, userId2) || other.userId2 == userId2)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.user1, user1) || other.user1 == user1)&&(identical(other.user2, user2) || other.user2 == user2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId1,userId2,createdAt,isActive,user1,user2);

@override
String toString() {
  return 'MatchResult(id: $id, userId1: $userId1, userId2: $userId2, createdAt: $createdAt, isActive: $isActive, user1: $user1, user2: $user2)';
}


}

/// @nodoc
abstract mixin class _$MatchResultCopyWith<$Res> implements $MatchResultCopyWith<$Res> {
  factory _$MatchResultCopyWith(_MatchResult value, $Res Function(_MatchResult) _then) = __$MatchResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId1, String userId2, DateTime createdAt, bool isActive, UserModel? user1, UserModel? user2
});


@override $UserModelCopyWith<$Res>? get user1;@override $UserModelCopyWith<$Res>? get user2;

}
/// @nodoc
class __$MatchResultCopyWithImpl<$Res>
    implements _$MatchResultCopyWith<$Res> {
  __$MatchResultCopyWithImpl(this._self, this._then);

  final _MatchResult _self;
  final $Res Function(_MatchResult) _then;

/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId1 = null,Object? userId2 = null,Object? createdAt = null,Object? isActive = null,Object? user1 = freezed,Object? user2 = freezed,}) {
  return _then(_MatchResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId1: null == userId1 ? _self.userId1 : userId1 // ignore: cast_nullable_to_non_nullable
as String,userId2: null == userId2 ? _self.userId2 : userId2 // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,user1: freezed == user1 ? _self.user1 : user1 // ignore: cast_nullable_to_non_nullable
as UserModel?,user2: freezed == user2 ? _self.user2 : user2 // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user1 {
    if (_self.user1 == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user1!, (value) {
    return _then(_self.copyWith(user1: value));
  });
}/// Create a copy of MatchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user2 {
    if (_self.user2 == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user2!, (value) {
    return _then(_self.copyWith(user2: value));
  });
}
}

// dart format on
