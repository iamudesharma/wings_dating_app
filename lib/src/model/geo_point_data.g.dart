// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoPointData _$GeoPointDataFromJson(Map<String, dynamic> json) => GeoPointData(
      geopoint: (json['geopoint'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      type: json['type'] as String? ?? 'Point',
    );

Map<String, dynamic> _$GeoPointDataToJson(GeoPointData instance) =>
    <String, dynamic>{
      'geopoint': instance.geopoint,
      'type': instance.type,
    };
