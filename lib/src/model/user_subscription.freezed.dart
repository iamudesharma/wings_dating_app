// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSubscription {

 String get id; String get userId; SubscriptionPlan get plan; SubscriptionStatus get status; DateTime get startDate; DateTime get endDate; SubscriptionFeatures get features; DateTime get createdAt; DateTime get updatedAt; String? get transactionId; double? get amount; String? get currency;
/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSubscriptionCopyWith<UserSubscription> get copyWith => _$UserSubscriptionCopyWithImpl<UserSubscription>(this as UserSubscription, _$identity);

  /// Serializes this UserSubscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubscription&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.features, features) || other.features == features)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,plan,status,startDate,endDate,features,createdAt,updatedAt,transactionId,amount,currency);

@override
String toString() {
  return 'UserSubscription(id: $id, userId: $userId, plan: $plan, status: $status, startDate: $startDate, endDate: $endDate, features: $features, createdAt: $createdAt, updatedAt: $updatedAt, transactionId: $transactionId, amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $UserSubscriptionCopyWith<$Res>  {
  factory $UserSubscriptionCopyWith(UserSubscription value, $Res Function(UserSubscription) _then) = _$UserSubscriptionCopyWithImpl;
@useResult
$Res call({
 String id, String userId, SubscriptionPlan plan, SubscriptionStatus status, DateTime startDate, DateTime endDate, SubscriptionFeatures features, DateTime createdAt, DateTime updatedAt, String? transactionId, double? amount, String? currency
});


$SubscriptionFeaturesCopyWith<$Res> get features;

}
/// @nodoc
class _$UserSubscriptionCopyWithImpl<$Res>
    implements $UserSubscriptionCopyWith<$Res> {
  _$UserSubscriptionCopyWithImpl(this._self, this._then);

  final UserSubscription _self;
  final $Res Function(UserSubscription) _then;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? plan = null,Object? status = null,Object? startDate = null,Object? endDate = null,Object? features = null,Object? createdAt = null,Object? updatedAt = null,Object? transactionId = freezed,Object? amount = freezed,Object? currency = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as SubscriptionPlan,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as SubscriptionFeatures,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionFeaturesCopyWith<$Res> get features {
  
  return $SubscriptionFeaturesCopyWith<$Res>(_self.features, (value) {
    return _then(_self.copyWith(features: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSubscription].
extension UserSubscriptionPatterns on UserSubscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSubscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSubscription value)  $default,){
final _that = this;
switch (_that) {
case _UserSubscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSubscription value)?  $default,){
final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  SubscriptionPlan plan,  SubscriptionStatus status,  DateTime startDate,  DateTime endDate,  SubscriptionFeatures features,  DateTime createdAt,  DateTime updatedAt,  String? transactionId,  double? amount,  String? currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
return $default(_that.id,_that.userId,_that.plan,_that.status,_that.startDate,_that.endDate,_that.features,_that.createdAt,_that.updatedAt,_that.transactionId,_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  SubscriptionPlan plan,  SubscriptionStatus status,  DateTime startDate,  DateTime endDate,  SubscriptionFeatures features,  DateTime createdAt,  DateTime updatedAt,  String? transactionId,  double? amount,  String? currency)  $default,) {final _that = this;
switch (_that) {
case _UserSubscription():
return $default(_that.id,_that.userId,_that.plan,_that.status,_that.startDate,_that.endDate,_that.features,_that.createdAt,_that.updatedAt,_that.transactionId,_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  SubscriptionPlan plan,  SubscriptionStatus status,  DateTime startDate,  DateTime endDate,  SubscriptionFeatures features,  DateTime createdAt,  DateTime updatedAt,  String? transactionId,  double? amount,  String? currency)?  $default,) {final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
return $default(_that.id,_that.userId,_that.plan,_that.status,_that.startDate,_that.endDate,_that.features,_that.createdAt,_that.updatedAt,_that.transactionId,_that.amount,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSubscription implements UserSubscription {
  const _UserSubscription({required this.id, required this.userId, required this.plan, required this.status, required this.startDate, required this.endDate, required this.features, required this.createdAt, required this.updatedAt, this.transactionId, this.amount, this.currency});
  factory _UserSubscription.fromJson(Map<String, dynamic> json) => _$UserSubscriptionFromJson(json);

@override final  String id;
@override final  String userId;
@override final  SubscriptionPlan plan;
@override final  SubscriptionStatus status;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  SubscriptionFeatures features;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? transactionId;
@override final  double? amount;
@override final  String? currency;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSubscriptionCopyWith<_UserSubscription> get copyWith => __$UserSubscriptionCopyWithImpl<_UserSubscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSubscription&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.features, features) || other.features == features)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,plan,status,startDate,endDate,features,createdAt,updatedAt,transactionId,amount,currency);

@override
String toString() {
  return 'UserSubscription(id: $id, userId: $userId, plan: $plan, status: $status, startDate: $startDate, endDate: $endDate, features: $features, createdAt: $createdAt, updatedAt: $updatedAt, transactionId: $transactionId, amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$UserSubscriptionCopyWith<$Res> implements $UserSubscriptionCopyWith<$Res> {
  factory _$UserSubscriptionCopyWith(_UserSubscription value, $Res Function(_UserSubscription) _then) = __$UserSubscriptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, SubscriptionPlan plan, SubscriptionStatus status, DateTime startDate, DateTime endDate, SubscriptionFeatures features, DateTime createdAt, DateTime updatedAt, String? transactionId, double? amount, String? currency
});


@override $SubscriptionFeaturesCopyWith<$Res> get features;

}
/// @nodoc
class __$UserSubscriptionCopyWithImpl<$Res>
    implements _$UserSubscriptionCopyWith<$Res> {
  __$UserSubscriptionCopyWithImpl(this._self, this._then);

  final _UserSubscription _self;
  final $Res Function(_UserSubscription) _then;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? plan = null,Object? status = null,Object? startDate = null,Object? endDate = null,Object? features = null,Object? createdAt = null,Object? updatedAt = null,Object? transactionId = freezed,Object? amount = freezed,Object? currency = freezed,}) {
  return _then(_UserSubscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as SubscriptionPlan,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as SubscriptionFeatures,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionFeaturesCopyWith<$Res> get features {
  
  return $SubscriptionFeaturesCopyWith<$Res>(_self.features, (value) {
    return _then(_self.copyWith(features: value));
  });
}
}


/// @nodoc
mixin _$SubscriptionFeatures {

 bool get unlimitedLikes; bool get rewindSwipe; bool get whoLikedYou; bool get analytics; bool get prioritySupport; bool get adFree; bool get superLikes; int get dailySuperLikes; bool get boosts; int get monthlyBoosts; bool get readReceipts;
/// Create a copy of SubscriptionFeatures
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionFeaturesCopyWith<SubscriptionFeatures> get copyWith => _$SubscriptionFeaturesCopyWithImpl<SubscriptionFeatures>(this as SubscriptionFeatures, _$identity);

  /// Serializes this SubscriptionFeatures to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionFeatures&&(identical(other.unlimitedLikes, unlimitedLikes) || other.unlimitedLikes == unlimitedLikes)&&(identical(other.rewindSwipe, rewindSwipe) || other.rewindSwipe == rewindSwipe)&&(identical(other.whoLikedYou, whoLikedYou) || other.whoLikedYou == whoLikedYou)&&(identical(other.analytics, analytics) || other.analytics == analytics)&&(identical(other.prioritySupport, prioritySupport) || other.prioritySupport == prioritySupport)&&(identical(other.adFree, adFree) || other.adFree == adFree)&&(identical(other.superLikes, superLikes) || other.superLikes == superLikes)&&(identical(other.dailySuperLikes, dailySuperLikes) || other.dailySuperLikes == dailySuperLikes)&&(identical(other.boosts, boosts) || other.boosts == boosts)&&(identical(other.monthlyBoosts, monthlyBoosts) || other.monthlyBoosts == monthlyBoosts)&&(identical(other.readReceipts, readReceipts) || other.readReceipts == readReceipts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unlimitedLikes,rewindSwipe,whoLikedYou,analytics,prioritySupport,adFree,superLikes,dailySuperLikes,boosts,monthlyBoosts,readReceipts);

@override
String toString() {
  return 'SubscriptionFeatures(unlimitedLikes: $unlimitedLikes, rewindSwipe: $rewindSwipe, whoLikedYou: $whoLikedYou, analytics: $analytics, prioritySupport: $prioritySupport, adFree: $adFree, superLikes: $superLikes, dailySuperLikes: $dailySuperLikes, boosts: $boosts, monthlyBoosts: $monthlyBoosts, readReceipts: $readReceipts)';
}


}

/// @nodoc
abstract mixin class $SubscriptionFeaturesCopyWith<$Res>  {
  factory $SubscriptionFeaturesCopyWith(SubscriptionFeatures value, $Res Function(SubscriptionFeatures) _then) = _$SubscriptionFeaturesCopyWithImpl;
@useResult
$Res call({
 bool unlimitedLikes, bool rewindSwipe, bool whoLikedYou, bool analytics, bool prioritySupport, bool adFree, bool superLikes, int dailySuperLikes, bool boosts, int monthlyBoosts, bool readReceipts
});




}
/// @nodoc
class _$SubscriptionFeaturesCopyWithImpl<$Res>
    implements $SubscriptionFeaturesCopyWith<$Res> {
  _$SubscriptionFeaturesCopyWithImpl(this._self, this._then);

  final SubscriptionFeatures _self;
  final $Res Function(SubscriptionFeatures) _then;

/// Create a copy of SubscriptionFeatures
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unlimitedLikes = null,Object? rewindSwipe = null,Object? whoLikedYou = null,Object? analytics = null,Object? prioritySupport = null,Object? adFree = null,Object? superLikes = null,Object? dailySuperLikes = null,Object? boosts = null,Object? monthlyBoosts = null,Object? readReceipts = null,}) {
  return _then(_self.copyWith(
unlimitedLikes: null == unlimitedLikes ? _self.unlimitedLikes : unlimitedLikes // ignore: cast_nullable_to_non_nullable
as bool,rewindSwipe: null == rewindSwipe ? _self.rewindSwipe : rewindSwipe // ignore: cast_nullable_to_non_nullable
as bool,whoLikedYou: null == whoLikedYou ? _self.whoLikedYou : whoLikedYou // ignore: cast_nullable_to_non_nullable
as bool,analytics: null == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as bool,prioritySupport: null == prioritySupport ? _self.prioritySupport : prioritySupport // ignore: cast_nullable_to_non_nullable
as bool,adFree: null == adFree ? _self.adFree : adFree // ignore: cast_nullable_to_non_nullable
as bool,superLikes: null == superLikes ? _self.superLikes : superLikes // ignore: cast_nullable_to_non_nullable
as bool,dailySuperLikes: null == dailySuperLikes ? _self.dailySuperLikes : dailySuperLikes // ignore: cast_nullable_to_non_nullable
as int,boosts: null == boosts ? _self.boosts : boosts // ignore: cast_nullable_to_non_nullable
as bool,monthlyBoosts: null == monthlyBoosts ? _self.monthlyBoosts : monthlyBoosts // ignore: cast_nullable_to_non_nullable
as int,readReceipts: null == readReceipts ? _self.readReceipts : readReceipts // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionFeatures].
extension SubscriptionFeaturesPatterns on SubscriptionFeatures {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionFeatures value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionFeatures() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionFeatures value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionFeatures():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionFeatures value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionFeatures() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool unlimitedLikes,  bool rewindSwipe,  bool whoLikedYou,  bool analytics,  bool prioritySupport,  bool adFree,  bool superLikes,  int dailySuperLikes,  bool boosts,  int monthlyBoosts,  bool readReceipts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionFeatures() when $default != null:
return $default(_that.unlimitedLikes,_that.rewindSwipe,_that.whoLikedYou,_that.analytics,_that.prioritySupport,_that.adFree,_that.superLikes,_that.dailySuperLikes,_that.boosts,_that.monthlyBoosts,_that.readReceipts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool unlimitedLikes,  bool rewindSwipe,  bool whoLikedYou,  bool analytics,  bool prioritySupport,  bool adFree,  bool superLikes,  int dailySuperLikes,  bool boosts,  int monthlyBoosts,  bool readReceipts)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionFeatures():
return $default(_that.unlimitedLikes,_that.rewindSwipe,_that.whoLikedYou,_that.analytics,_that.prioritySupport,_that.adFree,_that.superLikes,_that.dailySuperLikes,_that.boosts,_that.monthlyBoosts,_that.readReceipts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool unlimitedLikes,  bool rewindSwipe,  bool whoLikedYou,  bool analytics,  bool prioritySupport,  bool adFree,  bool superLikes,  int dailySuperLikes,  bool boosts,  int monthlyBoosts,  bool readReceipts)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionFeatures() when $default != null:
return $default(_that.unlimitedLikes,_that.rewindSwipe,_that.whoLikedYou,_that.analytics,_that.prioritySupport,_that.adFree,_that.superLikes,_that.dailySuperLikes,_that.boosts,_that.monthlyBoosts,_that.readReceipts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionFeatures implements SubscriptionFeatures {
  const _SubscriptionFeatures({required this.unlimitedLikes, required this.rewindSwipe, required this.whoLikedYou, required this.analytics, required this.prioritySupport, required this.adFree, required this.superLikes, required this.dailySuperLikes, required this.boosts, required this.monthlyBoosts, required this.readReceipts});
  factory _SubscriptionFeatures.fromJson(Map<String, dynamic> json) => _$SubscriptionFeaturesFromJson(json);

@override final  bool unlimitedLikes;
@override final  bool rewindSwipe;
@override final  bool whoLikedYou;
@override final  bool analytics;
@override final  bool prioritySupport;
@override final  bool adFree;
@override final  bool superLikes;
@override final  int dailySuperLikes;
@override final  bool boosts;
@override final  int monthlyBoosts;
@override final  bool readReceipts;

/// Create a copy of SubscriptionFeatures
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionFeaturesCopyWith<_SubscriptionFeatures> get copyWith => __$SubscriptionFeaturesCopyWithImpl<_SubscriptionFeatures>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionFeaturesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionFeatures&&(identical(other.unlimitedLikes, unlimitedLikes) || other.unlimitedLikes == unlimitedLikes)&&(identical(other.rewindSwipe, rewindSwipe) || other.rewindSwipe == rewindSwipe)&&(identical(other.whoLikedYou, whoLikedYou) || other.whoLikedYou == whoLikedYou)&&(identical(other.analytics, analytics) || other.analytics == analytics)&&(identical(other.prioritySupport, prioritySupport) || other.prioritySupport == prioritySupport)&&(identical(other.adFree, adFree) || other.adFree == adFree)&&(identical(other.superLikes, superLikes) || other.superLikes == superLikes)&&(identical(other.dailySuperLikes, dailySuperLikes) || other.dailySuperLikes == dailySuperLikes)&&(identical(other.boosts, boosts) || other.boosts == boosts)&&(identical(other.monthlyBoosts, monthlyBoosts) || other.monthlyBoosts == monthlyBoosts)&&(identical(other.readReceipts, readReceipts) || other.readReceipts == readReceipts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unlimitedLikes,rewindSwipe,whoLikedYou,analytics,prioritySupport,adFree,superLikes,dailySuperLikes,boosts,monthlyBoosts,readReceipts);

@override
String toString() {
  return 'SubscriptionFeatures(unlimitedLikes: $unlimitedLikes, rewindSwipe: $rewindSwipe, whoLikedYou: $whoLikedYou, analytics: $analytics, prioritySupport: $prioritySupport, adFree: $adFree, superLikes: $superLikes, dailySuperLikes: $dailySuperLikes, boosts: $boosts, monthlyBoosts: $monthlyBoosts, readReceipts: $readReceipts)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionFeaturesCopyWith<$Res> implements $SubscriptionFeaturesCopyWith<$Res> {
  factory _$SubscriptionFeaturesCopyWith(_SubscriptionFeatures value, $Res Function(_SubscriptionFeatures) _then) = __$SubscriptionFeaturesCopyWithImpl;
@override @useResult
$Res call({
 bool unlimitedLikes, bool rewindSwipe, bool whoLikedYou, bool analytics, bool prioritySupport, bool adFree, bool superLikes, int dailySuperLikes, bool boosts, int monthlyBoosts, bool readReceipts
});




}
/// @nodoc
class __$SubscriptionFeaturesCopyWithImpl<$Res>
    implements _$SubscriptionFeaturesCopyWith<$Res> {
  __$SubscriptionFeaturesCopyWithImpl(this._self, this._then);

  final _SubscriptionFeatures _self;
  final $Res Function(_SubscriptionFeatures) _then;

/// Create a copy of SubscriptionFeatures
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unlimitedLikes = null,Object? rewindSwipe = null,Object? whoLikedYou = null,Object? analytics = null,Object? prioritySupport = null,Object? adFree = null,Object? superLikes = null,Object? dailySuperLikes = null,Object? boosts = null,Object? monthlyBoosts = null,Object? readReceipts = null,}) {
  return _then(_SubscriptionFeatures(
unlimitedLikes: null == unlimitedLikes ? _self.unlimitedLikes : unlimitedLikes // ignore: cast_nullable_to_non_nullable
as bool,rewindSwipe: null == rewindSwipe ? _self.rewindSwipe : rewindSwipe // ignore: cast_nullable_to_non_nullable
as bool,whoLikedYou: null == whoLikedYou ? _self.whoLikedYou : whoLikedYou // ignore: cast_nullable_to_non_nullable
as bool,analytics: null == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as bool,prioritySupport: null == prioritySupport ? _self.prioritySupport : prioritySupport // ignore: cast_nullable_to_non_nullable
as bool,adFree: null == adFree ? _self.adFree : adFree // ignore: cast_nullable_to_non_nullable
as bool,superLikes: null == superLikes ? _self.superLikes : superLikes // ignore: cast_nullable_to_non_nullable
as bool,dailySuperLikes: null == dailySuperLikes ? _self.dailySuperLikes : dailySuperLikes // ignore: cast_nullable_to_non_nullable
as int,boosts: null == boosts ? _self.boosts : boosts // ignore: cast_nullable_to_non_nullable
as bool,monthlyBoosts: null == monthlyBoosts ? _self.monthlyBoosts : monthlyBoosts // ignore: cast_nullable_to_non_nullable
as int,readReceipts: null == readReceipts ? _self.readReceipts : readReceipts // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SubscriptionStats {

 int get totalSubscriptions; int get activeSubscriptions; Map<String, int> get planDistribution; double get monthlyRevenue; double get averageLifetimeValue;
/// Create a copy of SubscriptionStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionStatsCopyWith<SubscriptionStats> get copyWith => _$SubscriptionStatsCopyWithImpl<SubscriptionStats>(this as SubscriptionStats, _$identity);

  /// Serializes this SubscriptionStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionStats&&(identical(other.totalSubscriptions, totalSubscriptions) || other.totalSubscriptions == totalSubscriptions)&&(identical(other.activeSubscriptions, activeSubscriptions) || other.activeSubscriptions == activeSubscriptions)&&const DeepCollectionEquality().equals(other.planDistribution, planDistribution)&&(identical(other.monthlyRevenue, monthlyRevenue) || other.monthlyRevenue == monthlyRevenue)&&(identical(other.averageLifetimeValue, averageLifetimeValue) || other.averageLifetimeValue == averageLifetimeValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSubscriptions,activeSubscriptions,const DeepCollectionEquality().hash(planDistribution),monthlyRevenue,averageLifetimeValue);

@override
String toString() {
  return 'SubscriptionStats(totalSubscriptions: $totalSubscriptions, activeSubscriptions: $activeSubscriptions, planDistribution: $planDistribution, monthlyRevenue: $monthlyRevenue, averageLifetimeValue: $averageLifetimeValue)';
}


}

/// @nodoc
abstract mixin class $SubscriptionStatsCopyWith<$Res>  {
  factory $SubscriptionStatsCopyWith(SubscriptionStats value, $Res Function(SubscriptionStats) _then) = _$SubscriptionStatsCopyWithImpl;
@useResult
$Res call({
 int totalSubscriptions, int activeSubscriptions, Map<String, int> planDistribution, double monthlyRevenue, double averageLifetimeValue
});




}
/// @nodoc
class _$SubscriptionStatsCopyWithImpl<$Res>
    implements $SubscriptionStatsCopyWith<$Res> {
  _$SubscriptionStatsCopyWithImpl(this._self, this._then);

  final SubscriptionStats _self;
  final $Res Function(SubscriptionStats) _then;

/// Create a copy of SubscriptionStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSubscriptions = null,Object? activeSubscriptions = null,Object? planDistribution = null,Object? monthlyRevenue = null,Object? averageLifetimeValue = null,}) {
  return _then(_self.copyWith(
totalSubscriptions: null == totalSubscriptions ? _self.totalSubscriptions : totalSubscriptions // ignore: cast_nullable_to_non_nullable
as int,activeSubscriptions: null == activeSubscriptions ? _self.activeSubscriptions : activeSubscriptions // ignore: cast_nullable_to_non_nullable
as int,planDistribution: null == planDistribution ? _self.planDistribution : planDistribution // ignore: cast_nullable_to_non_nullable
as Map<String, int>,monthlyRevenue: null == monthlyRevenue ? _self.monthlyRevenue : monthlyRevenue // ignore: cast_nullable_to_non_nullable
as double,averageLifetimeValue: null == averageLifetimeValue ? _self.averageLifetimeValue : averageLifetimeValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionStats].
extension SubscriptionStatsPatterns on SubscriptionStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionStats value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionStats value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalSubscriptions,  int activeSubscriptions,  Map<String, int> planDistribution,  double monthlyRevenue,  double averageLifetimeValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionStats() when $default != null:
return $default(_that.totalSubscriptions,_that.activeSubscriptions,_that.planDistribution,_that.monthlyRevenue,_that.averageLifetimeValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalSubscriptions,  int activeSubscriptions,  Map<String, int> planDistribution,  double monthlyRevenue,  double averageLifetimeValue)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionStats():
return $default(_that.totalSubscriptions,_that.activeSubscriptions,_that.planDistribution,_that.monthlyRevenue,_that.averageLifetimeValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalSubscriptions,  int activeSubscriptions,  Map<String, int> planDistribution,  double monthlyRevenue,  double averageLifetimeValue)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionStats() when $default != null:
return $default(_that.totalSubscriptions,_that.activeSubscriptions,_that.planDistribution,_that.monthlyRevenue,_that.averageLifetimeValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionStats implements SubscriptionStats {
  const _SubscriptionStats({required this.totalSubscriptions, required this.activeSubscriptions, required final  Map<String, int> planDistribution, required this.monthlyRevenue, required this.averageLifetimeValue}): _planDistribution = planDistribution;
  factory _SubscriptionStats.fromJson(Map<String, dynamic> json) => _$SubscriptionStatsFromJson(json);

@override final  int totalSubscriptions;
@override final  int activeSubscriptions;
 final  Map<String, int> _planDistribution;
@override Map<String, int> get planDistribution {
  if (_planDistribution is EqualUnmodifiableMapView) return _planDistribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_planDistribution);
}

@override final  double monthlyRevenue;
@override final  double averageLifetimeValue;

/// Create a copy of SubscriptionStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionStatsCopyWith<_SubscriptionStats> get copyWith => __$SubscriptionStatsCopyWithImpl<_SubscriptionStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionStats&&(identical(other.totalSubscriptions, totalSubscriptions) || other.totalSubscriptions == totalSubscriptions)&&(identical(other.activeSubscriptions, activeSubscriptions) || other.activeSubscriptions == activeSubscriptions)&&const DeepCollectionEquality().equals(other._planDistribution, _planDistribution)&&(identical(other.monthlyRevenue, monthlyRevenue) || other.monthlyRevenue == monthlyRevenue)&&(identical(other.averageLifetimeValue, averageLifetimeValue) || other.averageLifetimeValue == averageLifetimeValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSubscriptions,activeSubscriptions,const DeepCollectionEquality().hash(_planDistribution),monthlyRevenue,averageLifetimeValue);

@override
String toString() {
  return 'SubscriptionStats(totalSubscriptions: $totalSubscriptions, activeSubscriptions: $activeSubscriptions, planDistribution: $planDistribution, monthlyRevenue: $monthlyRevenue, averageLifetimeValue: $averageLifetimeValue)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionStatsCopyWith<$Res> implements $SubscriptionStatsCopyWith<$Res> {
  factory _$SubscriptionStatsCopyWith(_SubscriptionStats value, $Res Function(_SubscriptionStats) _then) = __$SubscriptionStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalSubscriptions, int activeSubscriptions, Map<String, int> planDistribution, double monthlyRevenue, double averageLifetimeValue
});




}
/// @nodoc
class __$SubscriptionStatsCopyWithImpl<$Res>
    implements _$SubscriptionStatsCopyWith<$Res> {
  __$SubscriptionStatsCopyWithImpl(this._self, this._then);

  final _SubscriptionStats _self;
  final $Res Function(_SubscriptionStats) _then;

/// Create a copy of SubscriptionStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSubscriptions = null,Object? activeSubscriptions = null,Object? planDistribution = null,Object? monthlyRevenue = null,Object? averageLifetimeValue = null,}) {
  return _then(_SubscriptionStats(
totalSubscriptions: null == totalSubscriptions ? _self.totalSubscriptions : totalSubscriptions // ignore: cast_nullable_to_non_nullable
as int,activeSubscriptions: null == activeSubscriptions ? _self.activeSubscriptions : activeSubscriptions // ignore: cast_nullable_to_non_nullable
as int,planDistribution: null == planDistribution ? _self._planDistribution : planDistribution // ignore: cast_nullable_to_non_nullable
as Map<String, int>,monthlyRevenue: null == monthlyRevenue ? _self.monthlyRevenue : monthlyRevenue // ignore: cast_nullable_to_non_nullable
as double,averageLifetimeValue: null == averageLifetimeValue ? _self.averageLifetimeValue : averageLifetimeValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
