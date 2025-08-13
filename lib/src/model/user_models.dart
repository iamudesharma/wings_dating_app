// Copyright 2022, the Chromium project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_dating_app/helpers/extra_data.dart';
import 'geo_point_data.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
@JsonSerializable(
  createToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
  explicitToJson: true,
)
abstract class UserModel with _$UserModel {
  factory UserModel({
    required String username,
    String? bio,
    List<String>? albumUrl,
    @Default("https://img.icons8.com/ios/500/null/user-male-circle--v1.png") String? profileUrl,
    String? birthday,
    int? age,
    GeoPointData? position, // Custom model matching { type: "Point", coordinates: [lon, lat] }
    String? dob,
    String? height,
    String? weight,
    String? lived,
    @Default(Role.doNotShow) Role role,
    @Default(BodyType.doNotShow) BodyType bodyType,
    @Default(RelationshipStatus.doNotShow) RelationshipStatus relationshipStatus,
    @Default(Ethnicity.doNotShow) Ethnicity ethnicity,
    @Default(LookingFor.doNotShow) LookingFor lookingFor,
    @Default(WhereToMeet.doNotShow) WhereToMeet whereToMeet,
    @Default(false) bool isOnline,
    DateTime? lastSeen, // Added
    double? distance, // Added
    @Default(false) bool isVerified,
    @Default(false) bool isBlocked,
    @Default([]) List<String> blockList,
    @Default([]) List<String> favoriteList,
    @Default([]) List<String> interests, // Added
    required String id,
    required String fcmToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}

// Define the Firestore collection reference.