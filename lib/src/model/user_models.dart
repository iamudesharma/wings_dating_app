// Copyright 2022, the Chromium project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/helpers/extra_data.dart';
import 'geo_point_data.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@Collection<UserModel>('users')
@freezed
abstract class UserModel with _$UserModel {
  @JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true,
  )
  factory UserModel({
    required String username,
    String? bio,
    List<String>? albumUrl,
    @Default("https://img.icons8.com/ios/500/null/user-male-circle--v1.png") String? profileUrl,
    String? birthday,
    int? age,
    @JsonKey(name: "position") GeoPointData? position,
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
    @Default(false) bool isVerified,
    @Default(false) bool isBlocked,
    @Default([]) List<String> blockList,
    @Default([]) List<String> favoriteList,
    required String id,
    required String fcmToken,
  }) = _UserModel;

  // Converts JSON data to UserModel.
  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}

// Define the Firestore collection reference.
final _usersRef = UserModelCollectionReference();

// Define the provider that exposes the user collection reference.
final userProvider = Provider<UserModelCollectionReference>((ref) {
  return _usersRef;
});
