// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponse<T> {

 String get status; int get code; T get data; String? get message;
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseCopyWith<T, ApiResponse<T>> get copyWith => _$ApiResponseCopyWithImpl<T, ApiResponse<T>>(this as ApiResponse<T>, _$identity);

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'ApiResponse<$T>(status: $status, code: $code, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiResponseCopyWith<T,$Res>  {
  factory $ApiResponseCopyWith(ApiResponse<T> value, $Res Function(ApiResponse<T>) _then) = _$ApiResponseCopyWithImpl;
@useResult
$Res call({
 String status, int code, T data, String? message
});




}
/// @nodoc
class _$ApiResponseCopyWithImpl<T,$Res>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._self, this._then);

  final ApiResponse<T> _self;
  final $Res Function(ApiResponse<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? code = null,Object? data = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiResponse].
extension ApiResponsePatterns<T> on ApiResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int code,  T data,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
return $default(_that.status,_that.code,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int code,  T data,  String? message)  $default,) {final _that = this;
switch (_that) {
case _ApiResponse():
return $default(_that.status,_that.code,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int code,  T data,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponse() when $default != null:
return $default(_that.status,_that.code,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ApiResponse<T> implements ApiResponse<T> {
  const _ApiResponse({required this.status, required this.code, required this.data, this.message});
  factory _ApiResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ApiResponseFromJson(json,fromJsonT);

@override final  String status;
@override final  int code;
@override final  T data;
@override final  String? message;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseCopyWith<T, _ApiResponse<T>> get copyWith => __$ApiResponseCopyWithImpl<T, _ApiResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ApiResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponse<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'ApiResponse<$T>(status: $status, code: $code, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory _$ApiResponseCopyWith(_ApiResponse<T> value, $Res Function(_ApiResponse<T>) _then) = __$ApiResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, int code, T data, String? message
});




}
/// @nodoc
class __$ApiResponseCopyWithImpl<T,$Res>
    implements _$ApiResponseCopyWith<T, $Res> {
  __$ApiResponseCopyWithImpl(this._self, this._then);

  final _ApiResponse<T> _self;
  final $Res Function(_ApiResponse<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? code = null,Object? data = freezed,Object? message = freezed,}) {
  return _then(_ApiResponse<T>(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginatedResponse {

 List<dynamic> get items; int get total; int get page; int get limit; bool get hasNext; bool get hasPrev;
/// Create a copy of PaginatedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedResponseCopyWith<PaginatedResponse> get copyWith => _$PaginatedResponseCopyWithImpl<PaginatedResponse>(this as PaginatedResponse, _$identity);

  /// Serializes this PaginatedResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,page,limit,hasNext,hasPrev);

@override
String toString() {
  return 'PaginatedResponse(items: $items, total: $total, page: $page, limit: $limit, hasNext: $hasNext, hasPrev: $hasPrev)';
}


}

/// @nodoc
abstract mixin class $PaginatedResponseCopyWith<$Res>  {
  factory $PaginatedResponseCopyWith(PaginatedResponse value, $Res Function(PaginatedResponse) _then) = _$PaginatedResponseCopyWithImpl;
@useResult
$Res call({
 List<dynamic> items, int total, int page, int limit, bool hasNext, bool hasPrev
});




}
/// @nodoc
class _$PaginatedResponseCopyWithImpl<$Res>
    implements $PaginatedResponseCopyWith<$Res> {
  _$PaginatedResponseCopyWithImpl(this._self, this._then);

  final PaginatedResponse _self;
  final $Res Function(PaginatedResponse) _then;

/// Create a copy of PaginatedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? page = null,Object? limit = null,Object? hasNext = null,Object? hasPrev = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<dynamic>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrev: null == hasPrev ? _self.hasPrev : hasPrev // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedResponse].
extension PaginatedResponsePatterns on PaginatedResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<dynamic> items,  int total,  int page,  int limit,  bool hasNext,  bool hasPrev)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedResponse() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.limit,_that.hasNext,_that.hasPrev);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<dynamic> items,  int total,  int page,  int limit,  bool hasNext,  bool hasPrev)  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponse():
return $default(_that.items,_that.total,_that.page,_that.limit,_that.hasNext,_that.hasPrev);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<dynamic> items,  int total,  int page,  int limit,  bool hasNext,  bool hasPrev)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponse() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.limit,_that.hasNext,_that.hasPrev);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedResponse implements PaginatedResponse {
  const _PaginatedResponse({required final  List<dynamic> items, required this.total, required this.page, required this.limit, required this.hasNext, required this.hasPrev}): _items = items;
  factory _PaginatedResponse.fromJson(Map<String, dynamic> json) => _$PaginatedResponseFromJson(json);

 final  List<dynamic> _items;
@override List<dynamic> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int page;
@override final  int limit;
@override final  bool hasNext;
@override final  bool hasPrev;

/// Create a copy of PaginatedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedResponseCopyWith<_PaginatedResponse> get copyWith => __$PaginatedResponseCopyWithImpl<_PaginatedResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,page,limit,hasNext,hasPrev);

@override
String toString() {
  return 'PaginatedResponse(items: $items, total: $total, page: $page, limit: $limit, hasNext: $hasNext, hasPrev: $hasPrev)';
}


}

/// @nodoc
abstract mixin class _$PaginatedResponseCopyWith<$Res> implements $PaginatedResponseCopyWith<$Res> {
  factory _$PaginatedResponseCopyWith(_PaginatedResponse value, $Res Function(_PaginatedResponse) _then) = __$PaginatedResponseCopyWithImpl;
@override @useResult
$Res call({
 List<dynamic> items, int total, int page, int limit, bool hasNext, bool hasPrev
});




}
/// @nodoc
class __$PaginatedResponseCopyWithImpl<$Res>
    implements _$PaginatedResponseCopyWith<$Res> {
  __$PaginatedResponseCopyWithImpl(this._self, this._then);

  final _PaginatedResponse _self;
  final $Res Function(_PaginatedResponse) _then;

/// Create a copy of PaginatedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? page = null,Object? limit = null,Object? hasNext = null,Object? hasPrev = null,}) {
  return _then(_PaginatedResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<dynamic>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrev: null == hasPrev ? _self.hasPrev : hasPrev // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SuccessResponse {

 String get status; int get code; String get message;
/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessResponseCopyWith<SuccessResponse> get copyWith => _$SuccessResponseCopyWithImpl<SuccessResponse>(this as SuccessResponse, _$identity);

  /// Serializes this SuccessResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,message);

@override
String toString() {
  return 'SuccessResponse(status: $status, code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $SuccessResponseCopyWith<$Res>  {
  factory $SuccessResponseCopyWith(SuccessResponse value, $Res Function(SuccessResponse) _then) = _$SuccessResponseCopyWithImpl;
@useResult
$Res call({
 String status, int code, String message
});




}
/// @nodoc
class _$SuccessResponseCopyWithImpl<$Res>
    implements $SuccessResponseCopyWith<$Res> {
  _$SuccessResponseCopyWithImpl(this._self, this._then);

  final SuccessResponse _self;
  final $Res Function(SuccessResponse) _then;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? code = null,Object? message = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SuccessResponse].
extension SuccessResponsePatterns on SuccessResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuccessResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuccessResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuccessResponse value)  $default,){
final _that = this;
switch (_that) {
case _SuccessResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuccessResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SuccessResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int code,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuccessResponse() when $default != null:
return $default(_that.status,_that.code,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int code,  String message)  $default,) {final _that = this;
switch (_that) {
case _SuccessResponse():
return $default(_that.status,_that.code,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int code,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SuccessResponse() when $default != null:
return $default(_that.status,_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuccessResponse implements SuccessResponse {
  const _SuccessResponse({required this.status, required this.code, required this.message});
  factory _SuccessResponse.fromJson(Map<String, dynamic> json) => _$SuccessResponseFromJson(json);

@override final  String status;
@override final  int code;
@override final  String message;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessResponseCopyWith<_SuccessResponse> get copyWith => __$SuccessResponseCopyWithImpl<_SuccessResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuccessResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,message);

@override
String toString() {
  return 'SuccessResponse(status: $status, code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessResponseCopyWith<$Res> implements $SuccessResponseCopyWith<$Res> {
  factory _$SuccessResponseCopyWith(_SuccessResponse value, $Res Function(_SuccessResponse) _then) = __$SuccessResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, int code, String message
});




}
/// @nodoc
class __$SuccessResponseCopyWithImpl<$Res>
    implements _$SuccessResponseCopyWith<$Res> {
  __$SuccessResponseCopyWithImpl(this._self, this._then);

  final _SuccessResponse _self;
  final $Res Function(_SuccessResponse) _then;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? code = null,Object? message = null,}) {
  return _then(_SuccessResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ErrorResponse {

 String get status; int get code; String get message; String? get error; Map<String, dynamic>? get details;
/// Create a copy of ErrorResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorResponseCopyWith<ErrorResponse> get copyWith => _$ErrorResponseCopyWithImpl<ErrorResponse>(this as ErrorResponse, _$identity);

  /// Serializes this ErrorResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,message,error,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'ErrorResponse(status: $status, code: $code, message: $message, error: $error, details: $details)';
}


}

/// @nodoc
abstract mixin class $ErrorResponseCopyWith<$Res>  {
  factory $ErrorResponseCopyWith(ErrorResponse value, $Res Function(ErrorResponse) _then) = _$ErrorResponseCopyWithImpl;
@useResult
$Res call({
 String status, int code, String message, String? error, Map<String, dynamic>? details
});




}
/// @nodoc
class _$ErrorResponseCopyWithImpl<$Res>
    implements $ErrorResponseCopyWith<$Res> {
  _$ErrorResponseCopyWithImpl(this._self, this._then);

  final ErrorResponse _self;
  final $Res Function(ErrorResponse) _then;

/// Create a copy of ErrorResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? code = null,Object? message = null,Object? error = freezed,Object? details = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ErrorResponse].
extension ErrorResponsePatterns on ErrorResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ErrorResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ErrorResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ErrorResponse value)  $default,){
final _that = this;
switch (_that) {
case _ErrorResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ErrorResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ErrorResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int code,  String message,  String? error,  Map<String, dynamic>? details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ErrorResponse() when $default != null:
return $default(_that.status,_that.code,_that.message,_that.error,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int code,  String message,  String? error,  Map<String, dynamic>? details)  $default,) {final _that = this;
switch (_that) {
case _ErrorResponse():
return $default(_that.status,_that.code,_that.message,_that.error,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int code,  String message,  String? error,  Map<String, dynamic>? details)?  $default,) {final _that = this;
switch (_that) {
case _ErrorResponse() when $default != null:
return $default(_that.status,_that.code,_that.message,_that.error,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ErrorResponse implements ErrorResponse {
  const _ErrorResponse({required this.status, required this.code, required this.message, this.error, final  Map<String, dynamic>? details}): _details = details;
  factory _ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

@override final  String status;
@override final  int code;
@override final  String message;
@override final  String? error;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorResponseCopyWith<_ErrorResponse> get copyWith => __$ErrorResponseCopyWithImpl<_ErrorResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,message,error,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'ErrorResponse(status: $status, code: $code, message: $message, error: $error, details: $details)';
}


}

/// @nodoc
abstract mixin class _$ErrorResponseCopyWith<$Res> implements $ErrorResponseCopyWith<$Res> {
  factory _$ErrorResponseCopyWith(_ErrorResponse value, $Res Function(_ErrorResponse) _then) = __$ErrorResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, int code, String message, String? error, Map<String, dynamic>? details
});




}
/// @nodoc
class __$ErrorResponseCopyWithImpl<$Res>
    implements _$ErrorResponseCopyWith<$Res> {
  __$ErrorResponseCopyWithImpl(this._self, this._then);

  final _ErrorResponse _self;
  final $Res Function(_ErrorResponse) _then;

/// Create a copy of ErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? code = null,Object? message = null,Object? error = freezed,Object? details = freezed,}) {
  return _then(_ErrorResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
