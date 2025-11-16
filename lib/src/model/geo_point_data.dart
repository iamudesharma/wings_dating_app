import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_point_data.g.dart';

part 'geo_point_data.freezed.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class GeoPointData with _$GeoPointData {
  const GeoPointData({
    required this.geopoint,
    this.type = 'Point',
  });

  /// [geopoint] is [lon, lat]
  @override
  final List<double> geopoint;
  @override
  final String type;

  factory GeoPointData.fromJson(Map<String, Object?> json) {
    final map = Map<String, Object?>.from(json);
    // Accept external key 'coordinates' as alias for 'geopoint'
    map['geopoint'] = map['geopoint'] ?? map['coordinates'];
    return _$GeoPointDataFromJson(map);
  }

  Map<String, Object?> toJson() => _$GeoPointDataToJson(this);
}
