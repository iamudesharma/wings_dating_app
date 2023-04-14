import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

part 'geo_point_data.freezed.dart';
part 'geo_point_data.g.dart';

@Freezed(
    map: FreezedMapOptions.all,
    toStringOverride: true,
    toJson: true,
    fromJson: true)
class GeoPointData with _$GeoPointData {
  const factory GeoPointData({
    @GeoPointConverter() @JsonKey(name: "geopoint") required GeoPoint geopoint,
    @JsonKey(name: "geohash") required String geohash,
  }) = _GeoPointData;

  factory GeoPointData.fromJson(Map<String, Object?> json) =>
      _$GeoPointDataFromJson(json);
}
