// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoPointDataImpl _$$GeoPointDataImplFromJson(Map<String, dynamic> json) =>
    _$GeoPointDataImpl(
      geopoint:
          const GeoPointConverter().fromJson(json['geopoint'] as GeoPoint),
      geohash: json['geohash'] as String,
    );

Map<String, dynamic> _$$GeoPointDataImplToJson(_$GeoPointDataImpl instance) =>
    <String, dynamic>{
      'geopoint': const GeoPointConverter().toJson(instance.geopoint),
      'geohash': instance.geohash,
    };
