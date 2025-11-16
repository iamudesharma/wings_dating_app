// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_access_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlbumAccessRequestModel {

 String? get id; String get albumId; String get requesterId; String get message; AccessRequestStatus get status; DateTime get createdAt; DateTime get updatedAt; String? get albumOwnerId; String? get moderatorId; DateTime? get respondedAt; String? get rejectionReason; UserModel? get requester; UserModel? get albumOwner; UserAlbumModel? get album;
/// Create a copy of AlbumAccessRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumAccessRequestModelCopyWith<AlbumAccessRequestModel> get copyWith => _$AlbumAccessRequestModelCopyWithImpl<AlbumAccessRequestModel>(this as AlbumAccessRequestModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumAccessRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.albumOwnerId, albumOwnerId) || other.albumOwnerId == albumOwnerId)&&(identical(other.moderatorId, moderatorId) || other.moderatorId == moderatorId)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.albumOwner, albumOwner) || other.albumOwner == albumOwner)&&(identical(other.album, album) || other.album == album));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,albumId,requesterId,message,status,createdAt,updatedAt,albumOwnerId,moderatorId,respondedAt,rejectionReason,requester,albumOwner,album);

@override
String toString() {
  return 'AlbumAccessRequestModel(id: $id, albumId: $albumId, requesterId: $requesterId, message: $message, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, albumOwnerId: $albumOwnerId, moderatorId: $moderatorId, respondedAt: $respondedAt, rejectionReason: $rejectionReason, requester: $requester, albumOwner: $albumOwner, album: $album)';
}


}

/// @nodoc
abstract mixin class $AlbumAccessRequestModelCopyWith<$Res>  {
  factory $AlbumAccessRequestModelCopyWith(AlbumAccessRequestModel value, $Res Function(AlbumAccessRequestModel) _then) = _$AlbumAccessRequestModelCopyWithImpl;
@useResult
$Res call({
 String? id, String albumId, String requesterId, String message, AccessRequestStatus status, DateTime createdAt, DateTime updatedAt, String? albumOwnerId, String? moderatorId, DateTime? respondedAt, String? rejectionReason, UserModel? requester, UserModel? albumOwner, UserAlbumModel? album
});




}
/// @nodoc
class _$AlbumAccessRequestModelCopyWithImpl<$Res>
    implements $AlbumAccessRequestModelCopyWith<$Res> {
  _$AlbumAccessRequestModelCopyWithImpl(this._self, this._then);

  final AlbumAccessRequestModel _self;
  final $Res Function(AlbumAccessRequestModel) _then;

/// Create a copy of AlbumAccessRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? albumId = null,Object? requesterId = null,Object? message = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? albumOwnerId = freezed,Object? moderatorId = freezed,Object? respondedAt = freezed,Object? rejectionReason = freezed,Object? requester = freezed,Object? albumOwner = freezed,Object? album = freezed,}) {
  return _then(AlbumAccessRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AccessRequestStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,albumOwnerId: freezed == albumOwnerId ? _self.albumOwnerId : albumOwnerId // ignore: cast_nullable_to_non_nullable
as String?,moderatorId: freezed == moderatorId ? _self.moderatorId : moderatorId // ignore: cast_nullable_to_non_nullable
as String?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,requester: freezed == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as UserModel?,albumOwner: freezed == albumOwner ? _self.albumOwner : albumOwner // ignore: cast_nullable_to_non_nullable
as UserModel?,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as UserAlbumModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlbumAccessRequestModel].
extension AlbumAccessRequestModelPatterns on AlbumAccessRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}


/// @nodoc
mixin _$AlbumRequestStats {

 int get totalRequests; int get pendingRequests; int get approvedRequests; int get rejectedRequests; int get requestsToday; int get requestsThisWeek; int get requestsThisMonth; double get averageResponseTime;
/// Create a copy of AlbumRequestStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumRequestStatsCopyWith<AlbumRequestStats> get copyWith => _$AlbumRequestStatsCopyWithImpl<AlbumRequestStats>(this as AlbumRequestStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumRequestStats&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.pendingRequests, pendingRequests) || other.pendingRequests == pendingRequests)&&(identical(other.approvedRequests, approvedRequests) || other.approvedRequests == approvedRequests)&&(identical(other.rejectedRequests, rejectedRequests) || other.rejectedRequests == rejectedRequests)&&(identical(other.requestsToday, requestsToday) || other.requestsToday == requestsToday)&&(identical(other.requestsThisWeek, requestsThisWeek) || other.requestsThisWeek == requestsThisWeek)&&(identical(other.requestsThisMonth, requestsThisMonth) || other.requestsThisMonth == requestsThisMonth)&&(identical(other.averageResponseTime, averageResponseTime) || other.averageResponseTime == averageResponseTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRequests,pendingRequests,approvedRequests,rejectedRequests,requestsToday,requestsThisWeek,requestsThisMonth,averageResponseTime);

@override
String toString() {
  return 'AlbumRequestStats(totalRequests: $totalRequests, pendingRequests: $pendingRequests, approvedRequests: $approvedRequests, rejectedRequests: $rejectedRequests, requestsToday: $requestsToday, requestsThisWeek: $requestsThisWeek, requestsThisMonth: $requestsThisMonth, averageResponseTime: $averageResponseTime)';
}


}

/// @nodoc
abstract mixin class $AlbumRequestStatsCopyWith<$Res>  {
  factory $AlbumRequestStatsCopyWith(AlbumRequestStats value, $Res Function(AlbumRequestStats) _then) = _$AlbumRequestStatsCopyWithImpl;
@useResult
$Res call({
 int totalRequests, int pendingRequests, int approvedRequests, int rejectedRequests, int requestsToday, int requestsThisWeek, int requestsThisMonth, double averageResponseTime
});




}
/// @nodoc
class _$AlbumRequestStatsCopyWithImpl<$Res>
    implements $AlbumRequestStatsCopyWith<$Res> {
  _$AlbumRequestStatsCopyWithImpl(this._self, this._then);

  final AlbumRequestStats _self;
  final $Res Function(AlbumRequestStats) _then;

/// Create a copy of AlbumRequestStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRequests = null,Object? pendingRequests = null,Object? approvedRequests = null,Object? rejectedRequests = null,Object? requestsToday = null,Object? requestsThisWeek = null,Object? requestsThisMonth = null,Object? averageResponseTime = null,}) {
  return _then(AlbumRequestStats(
totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,pendingRequests: null == pendingRequests ? _self.pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as int,approvedRequests: null == approvedRequests ? _self.approvedRequests : approvedRequests // ignore: cast_nullable_to_non_nullable
as int,rejectedRequests: null == rejectedRequests ? _self.rejectedRequests : rejectedRequests // ignore: cast_nullable_to_non_nullable
as int,requestsToday: null == requestsToday ? _self.requestsToday : requestsToday // ignore: cast_nullable_to_non_nullable
as int,requestsThisWeek: null == requestsThisWeek ? _self.requestsThisWeek : requestsThisWeek // ignore: cast_nullable_to_non_nullable
as int,requestsThisMonth: null == requestsThisMonth ? _self.requestsThisMonth : requestsThisMonth // ignore: cast_nullable_to_non_nullable
as int,averageResponseTime: null == averageResponseTime ? _self.averageResponseTime : averageResponseTime // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AlbumRequestStats].
extension AlbumRequestStatsPatterns on AlbumRequestStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
