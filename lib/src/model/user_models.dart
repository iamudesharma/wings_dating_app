// // // Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// // // for details. All rights reserved. Use of this source code is governed by a
// // // BSD-style license that can be found in the LICENSE file.

// // // ignore_for_file: invalid_annotation_target

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_dating_app/helpers/extra_data.dart';
// import 'package:wings_dating_app/src/model/user_basic_model.dart';

import 'geo_point_data.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@Freezed(
    map: FreezedMapOptions.all,
    toStringOverride: true,
    toJson: true,
    fromJson: true)
// @JsonSerializable(anyMap: true, explicitToJson: false)
class UserModel with _$UserModel {
  factory UserModel({
    required String username,
    String? bio,
    List<String>? albumUrl,
    String? profileUrl,
    String? birthday,
    int? age,
    @JsonKey(name: "position") GeoPointData? position,
    String? dob,
    String? height,
    String? weight,
    String? lived,
    @Default(Role.doNotShow) Role role,
    @Default(BodyType.doNotShow) BodyType bodyType,
    @Default(RelationshipStatus.doNotShow)
        RelationshipStatus relationshipStatus,
    @Default(Ethnicity.doNotShow) Ethnicity ethnicity,
    @Default(LookingFor.doNotShow) LookingFor lookingFor,
    @Default(WhereToMeet.doNotShow) WhereToMeet whereToMeet,
    @Default(false) bool isOnline,
    @Default(false) bool isVerified,
    @Default(false) bool isBlocked,
    @Default([]) List<String> blockList,
    required String id,
    required String fcmToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

// GeoPoint _fromJsonGeoPoint(GeoPoint geoPoint) {
//   return geoPoint;
// }

// GeoPoint _toJsonGeoPoint(GeoPoint geoPoint) {
//   return geoPoint;
// }

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) {
    return geoPoint;
  }

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
}
// @Collection<UserModel>("users", prefix: 'User')
// final usersRef = UserModelCollectionReference();

// // final personRef = UserModel();

// // import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
// // import 'package:json_annotation/json_annotation.dart';

// // // part 'query.g.dart';

// // part 'user_models.g.dart';

// // @Collection<DateTimeQuery>('firestore-example-app/42/date-time')
// // final dateTimeQueryRef = DateTimeQueryCollectionReference();

// // @JsonSerializable(converters: firestoreJsonConverters)
// // class DateTimeQuery {
// //   DateTimeQuery(this.time);
// //   final DateTime time;
// // }

class FirestoreDateTimeConverter extends JsonConverter<DateTime, Timestamp> {
  const FirestoreDateTimeConverter();
  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

// // @Collection<TimestampQuery>('firestore-example-app/42/timestamp-time')
// // final timestampQueryRef = TimestampQueryCollectionReference();

@JsonSerializable(converters: firestoreJsonConverters)
class TimestampQuery {
  TimestampQuery(this.time);
  final Timestamp time;
}

// // // @Collection<GeoPointQuery>('firestore-example-app/42/geopoint-time')
// // // final geoPointQueryRef = GeoPointQueryCollectionReference();

@JsonSerializable(converters: firestoreJsonConverters)
class GeoPointQuery {
  GeoPointQuery(this.point);
  final GeoPoint point;
}

// // // @Collection<DocumentReferenceQuery>('firestore-example-app/42/doc-ref')
// // // final documentReferenceRef = DocumentReferenceQueryCollectionReference();

// // @JsonSerializable(converters: firestoreJsonConverters)
// // class DocumentReferenceQuery {
// //   DocumentReferenceQuery(this.ref);

// //   final DocumentReference<Map<String, dynamic>> ref;
// // }
