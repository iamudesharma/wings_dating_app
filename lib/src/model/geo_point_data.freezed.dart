// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_point_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoPointData _$GeoPointDataFromJson(Map<String, dynamic> json) {
  return _GeoPointData.fromJson(json);
}

/// @nodoc
mixin _$GeoPointData {
  @JsonSerializable(explicitToJson: true, createFieldMap: true)
  @GeoPointConverter()
  @JsonKey(name: "geopoint")
  GeoPoint get geopoint =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "geohash")
  String get geohash => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GeoPointData value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GeoPointData value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GeoPointData value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoPointDataCopyWith<GeoPointData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPointDataCopyWith<$Res> {
  factory $GeoPointDataCopyWith(
          GeoPointData value, $Res Function(GeoPointData) then) =
      _$GeoPointDataCopyWithImpl<$Res, GeoPointData>;
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true, createFieldMap: true)
      @GeoPointConverter()
      @JsonKey(name: "geopoint")
      GeoPoint geopoint,
      @JsonKey(name: "geohash") String geohash});
}

/// @nodoc
class _$GeoPointDataCopyWithImpl<$Res, $Val extends GeoPointData>
    implements $GeoPointDataCopyWith<$Res> {
  _$GeoPointDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geopoint = null,
    Object? geohash = null,
  }) {
    return _then(_value.copyWith(
      geopoint: null == geopoint
          ? _value.geopoint
          : geopoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoPointDataCopyWith<$Res>
    implements $GeoPointDataCopyWith<$Res> {
  factory _$$_GeoPointDataCopyWith(
          _$_GeoPointData value, $Res Function(_$_GeoPointData) then) =
      __$$_GeoPointDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true, createFieldMap: true)
      @GeoPointConverter()
      @JsonKey(name: "geopoint")
      GeoPoint geopoint,
      @JsonKey(name: "geohash") String geohash});
}

/// @nodoc
class __$$_GeoPointDataCopyWithImpl<$Res>
    extends _$GeoPointDataCopyWithImpl<$Res, _$_GeoPointData>
    implements _$$_GeoPointDataCopyWith<$Res> {
  __$$_GeoPointDataCopyWithImpl(
      _$_GeoPointData _value, $Res Function(_$_GeoPointData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geopoint = null,
    Object? geohash = null,
  }) {
    return _then(_$_GeoPointData(
      geopoint: null == geopoint
          ? _value.geopoint
          : geopoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      geohash: null == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoPointData implements _GeoPointData {
  const _$_GeoPointData(
      {@JsonSerializable(explicitToJson: true, createFieldMap: true)
      @GeoPointConverter()
      @JsonKey(name: "geopoint")
      required this.geopoint,
      @JsonKey(name: "geohash") required this.geohash});

  factory _$_GeoPointData.fromJson(Map<String, dynamic> json) =>
      _$$_GeoPointDataFromJson(json);

  @override
  @JsonSerializable(explicitToJson: true, createFieldMap: true)
  @GeoPointConverter()
  @JsonKey(name: "geopoint")
  final GeoPoint geopoint;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "geohash")
  final String geohash;

  @override
  String toString() {
    return 'GeoPointData(geopoint: $geopoint, geohash: $geohash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoPointData &&
            (identical(other.geopoint, geopoint) ||
                other.geopoint == geopoint) &&
            (identical(other.geohash, geohash) || other.geohash == geohash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, geopoint, geohash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoPointDataCopyWith<_$_GeoPointData> get copyWith =>
      __$$_GeoPointDataCopyWithImpl<_$_GeoPointData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GeoPointData value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GeoPointData value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GeoPointData value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoPointDataToJson(
      this,
    );
  }
}

abstract class _GeoPointData implements GeoPointData {
  const factory _GeoPointData(
          {@JsonSerializable(explicitToJson: true, createFieldMap: true)
          @GeoPointConverter()
          @JsonKey(name: "geopoint")
          required final GeoPoint geopoint,
          @JsonKey(name: "geohash") required final String geohash}) =
      _$_GeoPointData;

  factory _GeoPointData.fromJson(Map<String, dynamic> json) =
      _$_GeoPointData.fromJson;

  @override
  @JsonSerializable(explicitToJson: true, createFieldMap: true)
  @GeoPointConverter()
  @JsonKey(name: "geopoint")
  GeoPoint get geopoint;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "geohash")
  String get geohash;
  @override
  @JsonKey(ignore: true)
  _$$_GeoPointDataCopyWith<_$_GeoPointData> get copyWith =>
      throw _privateConstructorUsedError;
}
