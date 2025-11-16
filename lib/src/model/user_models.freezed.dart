// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get username; String? get bio; List<String>? get albumUrl; String? get profileUrl; String? get birthday; int? get age; GeoPointData? get position; String? get dob; String? get height; String? get weight; String? get lived; Role get role; BodyType get bodyType; RelationshipStatus get relationshipStatus; Ethnicity get ethnicity; LookingFor get lookingFor; WhereToMeet get whereToMeet; bool get isOnline; DateTime? get lastSeen; double? get distance; bool get isVerified; bool get isBlocked; List<String> get blockList; List<String> get favoriteList; List<String> get interests;// Extra onboarding fields (prompts, habits, values, social, verifications, video)
// are intentionally not part of the persisted UserModel to avoid backend schema changes.
 String get id; String? get fcmToken;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.username, username) || other.username == username)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.albumUrl, albumUrl)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.age, age) || other.age == age)&&(identical(other.position, position) || other.position == position)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.lived, lived) || other.lived == lived)&&(identical(other.role, role) || other.role == role)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.relationshipStatus, relationshipStatus) || other.relationshipStatus == relationshipStatus)&&(identical(other.ethnicity, ethnicity) || other.ethnicity == ethnicity)&&(identical(other.lookingFor, lookingFor) || other.lookingFor == lookingFor)&&(identical(other.whereToMeet, whereToMeet) || other.whereToMeet == whereToMeet)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&const DeepCollectionEquality().equals(other.blockList, blockList)&&const DeepCollectionEquality().equals(other.favoriteList, favoriteList)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.id, id) || other.id == id)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,username,bio,const DeepCollectionEquality().hash(albumUrl),profileUrl,birthday,age,position,dob,height,weight,lived,role,bodyType,relationshipStatus,ethnicity,lookingFor,whereToMeet,isOnline,lastSeen,distance,isVerified,isBlocked,const DeepCollectionEquality().hash(blockList),const DeepCollectionEquality().hash(favoriteList),const DeepCollectionEquality().hash(interests),id,fcmToken]);

@override
String toString() {
  return 'UserModel(username: $username, bio: $bio, albumUrl: $albumUrl, profileUrl: $profileUrl, birthday: $birthday, age: $age, position: $position, dob: $dob, height: $height, weight: $weight, lived: $lived, role: $role, bodyType: $bodyType, relationshipStatus: $relationshipStatus, ethnicity: $ethnicity, lookingFor: $lookingFor, whereToMeet: $whereToMeet, isOnline: $isOnline, lastSeen: $lastSeen, distance: $distance, isVerified: $isVerified, isBlocked: $isBlocked, blockList: $blockList, favoriteList: $favoriteList, interests: $interests, id: $id, fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String username, String? bio, List<String>? albumUrl, String? profileUrl, String? birthday, int? age, GeoPointData? position, String? dob, String? height, String? weight, String? lived, Role role, BodyType bodyType, RelationshipStatus relationshipStatus, Ethnicity ethnicity, LookingFor lookingFor, WhereToMeet whereToMeet, bool isOnline, DateTime? lastSeen, double? distance, bool isVerified, bool isBlocked, List<String> blockList, List<String> favoriteList, List<String> interests, String id, String? fcmToken
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? bio = freezed,Object? albumUrl = freezed,Object? profileUrl = freezed,Object? birthday = freezed,Object? age = freezed,Object? position = freezed,Object? dob = freezed,Object? height = freezed,Object? weight = freezed,Object? lived = freezed,Object? role = null,Object? bodyType = null,Object? relationshipStatus = null,Object? ethnicity = null,Object? lookingFor = null,Object? whereToMeet = null,Object? isOnline = null,Object? lastSeen = freezed,Object? distance = freezed,Object? isVerified = null,Object? isBlocked = null,Object? blockList = null,Object? favoriteList = null,Object? interests = null,Object? id = null,Object? fcmToken = freezed,}) {
  return _then(UserModel(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,albumUrl: freezed == albumUrl ? _self.albumUrl : albumUrl // ignore: cast_nullable_to_non_nullable
as List<String>?,profileUrl: freezed == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as GeoPointData?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,lived: freezed == lived ? _self.lived : lived // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,bodyType: null == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as BodyType,relationshipStatus: null == relationshipStatus ? _self.relationshipStatus : relationshipStatus // ignore: cast_nullable_to_non_nullable
as RelationshipStatus,ethnicity: null == ethnicity ? _self.ethnicity : ethnicity // ignore: cast_nullable_to_non_nullable
as Ethnicity,lookingFor: null == lookingFor ? _self.lookingFor : lookingFor // ignore: cast_nullable_to_non_nullable
as LookingFor,whereToMeet: null == whereToMeet ? _self.whereToMeet : whereToMeet // ignore: cast_nullable_to_non_nullable
as WhereToMeet,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,blockList: null == blockList ? _self.blockList : blockList // ignore: cast_nullable_to_non_nullable
as List<String>,favoriteList: null == favoriteList ? _self.favoriteList : favoriteList // ignore: cast_nullable_to_non_nullable
as List<String>,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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
