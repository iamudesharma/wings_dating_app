// // // Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// // // for details. All rights reserved. Use of this source code is governed by a
// // // BSD-style license that can be found in the LICENSE file.

// // // ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

// // @JsonSerializable(explicitToJson: true)
// // class User {
// //   User({
// //     required this.name,
// //     required this.age,
// //   });

// //   final String name;
// //   final int age;
// // }

// // @Collection<User>('users')
// // final usersRef = UserCollectionReference();

// // // @JsonSerializable()
@freezed
class UserModel with _$UserModel {
  // ignore: invalid_annotation_target
  // @JsonSerializable(explicitToJson: true)
  factory UserModel({
    required String nickname,
    String? aboutMe,
    List<String>? albumUrl,
    String? avatarUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
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

// // class FirestoreDateTimeConverter extends JsonConverter<DateTime, Timestamp> {
// //   const FirestoreDateTimeConverter();
// //   @override
// //   DateTime fromJson(Timestamp json) => json.toDate();

// //   @override
// //   Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
// // }

// // // @Collection<TimestampQuery>('firestore-example-app/42/timestamp-time')
// // // final timestampQueryRef = TimestampQueryCollectionReference();

// // @JsonSerializable(converters: firestoreJsonConverters)
// // class TimestampQuery {
// //   TimestampQuery(this.time);
// //   final Timestamp time;
// // }

// // // @Collection<GeoPointQuery>('firestore-example-app/42/geopoint-time')
// // // final geoPointQueryRef = GeoPointQueryCollectionReference();

// // @JsonSerializable(converters: firestoreJsonConverters)
// // class GeoPointQuery {
// //   GeoPointQuery(this.point);
// //   final GeoPoint point;
// // }

// // // @Collection<DocumentReferenceQuery>('firestore-example-app/42/doc-ref')
// // // final documentReferenceRef = DocumentReferenceQueryCollectionReference();

// // @JsonSerializable(converters: firestoreJsonConverters)
// // class DocumentReferenceQuery {
// //   DocumentReferenceQuery(this.ref);

// //   final DocumentReference<Map<String, dynamic>> ref;
// // }
