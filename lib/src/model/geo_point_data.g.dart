// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeoPointData _$$_GeoPointDataFromJson(Map<String, dynamic> json) =>
    _$_GeoPointData(
      geopoint:
          const GeoPointConverter().fromJson(json['geopoint'] as GeoPoint),
      geohash: json['geohash'] as String,
    );

Map<String, dynamic> _$$_GeoPointDataToJson(_$_GeoPointData instance) =>
    <String, dynamic>{
      'geopoint': const GeoPointConverter().toJson(instance.geopoint),
      'geohash': instance.geohash,
    };
