// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

 UserModel? get userModel; Uint8List? get profileImage; List<String> get albumImages; bool get isLoading; String? get error;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.userModel, userModel) || other.userModel == userModel)&&const DeepCollectionEquality().equals(other.profileImage, profileImage)&&const DeepCollectionEquality().equals(other.albumImages, albumImages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,userModel,const DeepCollectionEquality().hash(profileImage),const DeepCollectionEquality().hash(albumImages),isLoading,error);

@override
String toString() {
  return 'ProfileState(userModel: $userModel, profileImage: $profileImage, albumImages: $albumImages, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 UserModel? userModel, Uint8List? profileImage, List<String> albumImages, bool isLoading, String? error
});


$UserModelCopyWith<$Res>? get userModel;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userModel = freezed,Object? profileImage = freezed,Object? albumImages = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
userModel: freezed == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as UserModel?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,albumImages: null == albumImages ? _self.albumImages : albumImages // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get userModel {
    if (_self.userModel == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.userModel!, (value) {
    return _then(_self.copyWith(userModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel? userModel,  Uint8List? profileImage,  List<String> albumImages,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.userModel,_that.profileImage,_that.albumImages,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel? userModel,  Uint8List? profileImage,  List<String> albumImages,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.userModel,_that.profileImage,_that.albumImages,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel? userModel,  Uint8List? profileImage,  List<String> albumImages,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.userModel,_that.profileImage,_that.albumImages,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.userModel = null, this.profileImage = null, final  List<String> albumImages = const [], this.isLoading = false, this.error = null}): _albumImages = albumImages;
  

@override@JsonKey() final  UserModel? userModel;
@override@JsonKey() final  Uint8List? profileImage;
 final  List<String> _albumImages;
@override@JsonKey() List<String> get albumImages {
  if (_albumImages is EqualUnmodifiableListView) return _albumImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_albumImages);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String? error;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.userModel, userModel) || other.userModel == userModel)&&const DeepCollectionEquality().equals(other.profileImage, profileImage)&&const DeepCollectionEquality().equals(other._albumImages, _albumImages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,userModel,const DeepCollectionEquality().hash(profileImage),const DeepCollectionEquality().hash(_albumImages),isLoading,error);

@override
String toString() {
  return 'ProfileState(userModel: $userModel, profileImage: $profileImage, albumImages: $albumImages, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 UserModel? userModel, Uint8List? profileImage, List<String> albumImages, bool isLoading, String? error
});


@override $UserModelCopyWith<$Res>? get userModel;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userModel = freezed,Object? profileImage = freezed,Object? albumImages = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ProfileState(
userModel: freezed == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as UserModel?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,albumImages: null == albumImages ? _self._albumImages : albumImages // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get userModel {
    if (_self.userModel == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.userModel!, (value) {
    return _then(_self.copyWith(userModel: value));
  });
}
}

// dart format on
