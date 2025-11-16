// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserAlbumModel {

 String get ownerId; String get name; List<String> get photos; List<String> get sharedWith; DateTime get createdAt; DateTime get updatedAt; bool get isShared; AlbumOwnerModel? get owner; String? get id;
/// Create a copy of UserAlbumModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAlbumModelCopyWith<UserAlbumModel> get copyWith => _$UserAlbumModelCopyWithImpl<UserAlbumModel>(this as UserAlbumModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAlbumModel&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.sharedWith, sharedWith)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isShared, isShared) || other.isShared == isShared)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,ownerId,name,const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(sharedWith),createdAt,updatedAt,isShared,owner,id);

@override
String toString() {
  return 'UserAlbumModel(ownerId: $ownerId, name: $name, photos: $photos, sharedWith: $sharedWith, createdAt: $createdAt, updatedAt: $updatedAt, isShared: $isShared, owner: $owner, id: $id)';
}


}

/// @nodoc
abstract mixin class $UserAlbumModelCopyWith<$Res>  {
  factory $UserAlbumModelCopyWith(UserAlbumModel value, $Res Function(UserAlbumModel) _then) = _$UserAlbumModelCopyWithImpl;
@useResult
$Res call({
 String ownerId, String name, List<String> photos, List<String> sharedWith, DateTime createdAt, DateTime updatedAt, bool isShared, AlbumOwnerModel? owner, String? id
});




}
/// @nodoc
class _$UserAlbumModelCopyWithImpl<$Res>
    implements $UserAlbumModelCopyWith<$Res> {
  _$UserAlbumModelCopyWithImpl(this._self, this._then);

  final UserAlbumModel _self;
  final $Res Function(UserAlbumModel) _then;

/// Create a copy of UserAlbumModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ownerId = null,Object? name = null,Object? photos = null,Object? sharedWith = null,Object? createdAt = null,Object? updatedAt = null,Object? isShared = null,Object? owner = freezed,Object? id = freezed,}) {
  return _then(UserAlbumModel(
ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,sharedWith: null == sharedWith ? _self.sharedWith : sharedWith // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isShared: null == isShared ? _self.isShared : isShared // ignore: cast_nullable_to_non_nullable
as bool,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as AlbumOwnerModel?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAlbumModel].
extension UserAlbumModelPatterns on UserAlbumModel {
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
