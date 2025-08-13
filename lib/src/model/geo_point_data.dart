import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_point_data.freezed.dart';
part 'geo_point_data.g.dart';

@freezed
@JsonSerializable(
  createToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
  explicitToJson: true,
)
abstract class GeoPointData with _$GeoPointData {
  factory GeoPointData({
    required List<double> geopoint,
    @Default("Point") String type,
  }) = _GeoPointData;

  factory GeoPointData.fromJson(Map<String, Object?> json) {
    final map = Map<String, Object?>.from(json);
    // Accept external key 'coordinates' as alias for 'geopoint'
    map['geopoint'] = map['geopoint'] ?? map['coordinates'];
    return _$GeoPointDataFromJson(map);
  }
}
 
