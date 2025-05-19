import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

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

    // ignore: invalid_annotation_target
    @GeoPointConverter()
    @JsonKey(name: "geopoint")
    required GeoPoint geopoint,
    // ignore: invalid_annotation_target
    @JsonKey(name: "geohash") required String geohash,
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

// class FirestoreDateTimeConverter extends JsonConverter<DateTime, Timestamp> {
//   const FirestoreDateTimeConverter();
//   @override
//   DateTime fromJson(Timestamp json) => json.toDate();

//   @override
//   Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
// }

// @JsonSerializable(converters: firestoreJsonConverters)
// class TimestampQuery {
//   TimestampQuery(this.time);
//   final Timestamp time;
// }

// @JsonSerializable(converters: firestoreJsonConverters)
// class GeoPointQuery {
//   GeoPointQuery(this.point);
//   final GeoPoint point;
// }

// // // // @Collection<DocumentReferenceQuery>('firestore-example-app/42/doc-ref')
// // // // final documentReferenceRef = DocumentReferenceQueryCollectionReference();

// // // @JsonSerializable(converters: firestoreJsonConverters)
// // // class DocumentReferenceQuery {
// // //   DocumentReferenceQuery(this.ref);

// // //   final DocumentReference<Map<String, dynamic>> ref;
// // // }
