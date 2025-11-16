// Copyright 2022, the Chromium project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wings_dating_app/helpers/extra_data.dart';
import 'geo_point_data.dart';
// Keep user model lean; extra onboarding data is kept locally via providers

part 'user_models.g.dart';

part 'user_models.freezed.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class UserModel with _$UserModel {
  const UserModel({
    required this.username,
    this.bio,
    this.albumUrl,
    this.profileUrl = "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
    this.birthday,
    this.age,
    this.position,
    this.dob,
    this.height,
    this.weight,
    this.lived,
    this.role = Role.doNotShow,
    this.bodyType = BodyType.doNotShow,
    this.relationshipStatus = RelationshipStatus.doNotShow,
    this.ethnicity = Ethnicity.doNotShow,
    this.lookingFor = LookingFor.doNotShow,
    this.whereToMeet = WhereToMeet.doNotShow,
    this.isOnline = false,
    this.lastSeen,
    this.distance,
    this.isVerified = false,
    this.isBlocked = false,
    this.blockList = const [],
    this.favoriteList = const [],
    this.interests = const [],
    required this.id,
    this.fcmToken,
  });

  @override
  final String username;
  @override
  final String? bio;
  @override
  final List<String>? albumUrl;
  @override
  final String? profileUrl;
  @override
  final String? birthday;
  @override
  final int? age;
  @override
  final GeoPointData? position;
  @override // { type: "Point", coordinates: [lon, lat] }
  final String? dob;
  @override
  final String? height;
  @override
  final String? weight;
  @override
  final String? lived;
  @override
  final Role role;
  @override
  final BodyType bodyType;
  @override
  final RelationshipStatus relationshipStatus;
  @override
  final Ethnicity ethnicity;
  @override
  final LookingFor lookingFor;
  @override
  final WhereToMeet whereToMeet;
  @override
  final bool isOnline;
  @override
  final DateTime? lastSeen;
  @override
  final double? distance;
  @override
  final bool isVerified;
  @override
  final bool isBlocked;
  @override
  final List<String> blockList;
  @override
  final List<String> favoriteList;
  @override
  final List<String> interests;
  // Extra onboarding fields (prompts, habits, values, social, verifications, video)
  // are intentionally not part of the persisted UserModel to avoid backend schema changes.
  @override
  final String id;
  @override
  final String? fcmToken;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);

  Map<String, Object?> toJson() => _$UserModelToJson(this);
}
