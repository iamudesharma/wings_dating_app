// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeoPointData _$GeoPointDataFromJson(Map<String, dynamic> json) =>
    _GeoPointData(
      geopoint: const GeoPointConverter()
          .fromJson(json['geopoint'] as Map<String, dynamic>),
      geohash: json['geohash'] as String,
    );

Map<String, dynamic> _$GeoPointDataToJson(_GeoPointData instance) =>
    <String, dynamic>{
      'geopoint': const GeoPointConverter().toJson(instance.geopoint),
      'geohash': instance.geohash,
    };
