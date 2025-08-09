// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeoPointData _$GeoPointDataFromJson(Map<String, dynamic> json) =>
    _GeoPointData(
      geopoint: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      type: json['type'] as String? ?? "Point",
    );

Map<String, dynamic> _$GeoPointDataToJson(_GeoPointData instance) =>
    <String, dynamic>{
      'coordinates': instance.geopoint,
      'type': instance.type,
    };
