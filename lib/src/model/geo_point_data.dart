import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_point_data.freezed.dart';
part 'geo_point_data.g.dart';

@freezed
abstract class GeoPointData with _$GeoPointData {
  factory GeoPointData({
    @JsonSerializable(
      createToJson: true,
      createFieldMap: true,
      createPerFieldToJson: true,
      explicitToJson: true,
    )
    @JsonKey(name: "coordinates")
    required List<double> geopoint,
    @Default("Point") String type,
  }) = _GeoPointData;

  factory GeoPointData.fromJson(Map<String, Object?> json) => _$GeoPointDataFromJson(json);
}

class GeoPointConverter implements JsonConverter<GeoPoint, Map<String, dynamic>> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(Map<String, dynamic> json) {
    return GeoPoint(json['latitude'] as double, json['longitude'] as double);
  }

  @override
  Map<String, dynamic> toJson(GeoPoint geoPoint) => {
        'latitude': geoPoint.latitude,
        'longitude': geoPoint.longitude,
      };
}
