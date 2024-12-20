import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

part 'geo_point_data.freezed.dart';
part 'geo_point_data.g.dart';

@Freezed(map: FreezedMapOptions.all, toStringOverride: true, toJson: true, fromJson: true)
class GeoPointData with _$GeoPointData {
  const factory GeoPointData({
    @JsonSerializable(createToJson: true, createFieldMap: true, createPerFieldToJson: true, explicitToJson: true)

    // ignore: invalid_annotation_target
    @GeoPointConverter()
    @JsonKey(name: "geopoint")
    required GeoPoint geopoint,
    // ignore: invalid_annotation_target
    @JsonKey(name: "geohash") required String geohash,
  }) = _GeoPointData;

  factory GeoPointData.fromJson(Map<String, Object?> json) => _$GeoPointDataFromJson(json);
}

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) {
    return geoPoint;
  }

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
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
