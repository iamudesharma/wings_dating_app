// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_point_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeoPointData {
  @JsonSerializable(
      createToJson: true,
      createFieldMap: true,
      createPerFieldToJson: true,
      explicitToJson: true)
  @JsonKey(name: "coordinates")
  List<double> get geopoint;
  String get type;

  /// Create a copy of GeoPointData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeoPointDataCopyWith<GeoPointData> get copyWith =>
      _$GeoPointDataCopyWithImpl<GeoPointData>(
          this as GeoPointData, _$identity);

  /// Serializes this GeoPointData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeoPointData &&
            const DeepCollectionEquality().equals(other.geopoint, geopoint) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(geopoint), type);

  @override
  String toString() {
    return 'GeoPointData(geopoint: $geopoint, type: $type)';
  }
}

/// @nodoc
abstract mixin class $GeoPointDataCopyWith<$Res> {
  factory $GeoPointDataCopyWith(
          GeoPointData value, $Res Function(GeoPointData) _then) =
      _$GeoPointDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonSerializable(
          createToJson: true,
          createFieldMap: true,
          createPerFieldToJson: true,
          explicitToJson: true)
      @JsonKey(name: "coordinates")
      List<double> geopoint,
      String type});
}

/// @nodoc
class _$GeoPointDataCopyWithImpl<$Res> implements $GeoPointDataCopyWith<$Res> {
  _$GeoPointDataCopyWithImpl(this._self, this._then);

  final GeoPointData _self;
  final $Res Function(GeoPointData) _then;

  /// Create a copy of GeoPointData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geopoint = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      geopoint: null == geopoint
          ? _self.geopoint
          : geopoint // ignore: cast_nullable_to_non_nullable
              as List<double>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GeoPointData implements GeoPointData {
  _GeoPointData(
      {@JsonSerializable(
          createToJson: true,
          createFieldMap: true,
          createPerFieldToJson: true,
          explicitToJson: true)
      @JsonKey(name: "coordinates")
      required final List<double> geopoint,
      this.type = "Point"})
      : _geopoint = geopoint;
  factory _GeoPointData.fromJson(Map<String, dynamic> json) =>
      _$GeoPointDataFromJson(json);

  final List<double> _geopoint;
  @override
  @JsonSerializable(
      createToJson: true,
      createFieldMap: true,
      createPerFieldToJson: true,
      explicitToJson: true)
  @JsonKey(name: "coordinates")
  List<double> get geopoint {
    if (_geopoint is EqualUnmodifiableListView) return _geopoint;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_geopoint);
  }

  @override
  @JsonKey()
  final String type;

  /// Create a copy of GeoPointData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeoPointDataCopyWith<_GeoPointData> get copyWith =>
      __$GeoPointDataCopyWithImpl<_GeoPointData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GeoPointDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeoPointData &&
            const DeepCollectionEquality().equals(other._geopoint, _geopoint) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_geopoint), type);

  @override
  String toString() {
    return 'GeoPointData(geopoint: $geopoint, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$GeoPointDataCopyWith<$Res>
    implements $GeoPointDataCopyWith<$Res> {
  factory _$GeoPointDataCopyWith(
          _GeoPointData value, $Res Function(_GeoPointData) _then) =
      __$GeoPointDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonSerializable(
          createToJson: true,
          createFieldMap: true,
          createPerFieldToJson: true,
          explicitToJson: true)
      @JsonKey(name: "coordinates")
      List<double> geopoint,
      String type});
}

/// @nodoc
class __$GeoPointDataCopyWithImpl<$Res>
    implements _$GeoPointDataCopyWith<$Res> {
  __$GeoPointDataCopyWithImpl(this._self, this._then);

  final _GeoPointData _self;
  final $Res Function(_GeoPointData) _then;

  /// Create a copy of GeoPointData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? geopoint = null,
    Object? type = null,
  }) {
    return _then(_GeoPointData(
      geopoint: null == geopoint
          ? _self._geopoint
          : geopoint // ignore: cast_nullable_to_non_nullable
              as List<double>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
