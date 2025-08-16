// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String,
      bio: json['bio'] as String?,
      albumUrl: (json['albumUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      profileUrl: json['profileUrl'] as String? ??
          "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
      birthday: json['birthday'] as String?,
      age: (json['age'] as num?)?.toInt(),
      position: json['position'] == null
          ? null
          : GeoPointData.fromJson(json['position'] as Map<String, dynamic>),
      dob: json['dob'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      lived: json['lived'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.doNotShow,
      bodyType: $enumDecodeNullable(_$BodyTypeEnumMap, json['bodyType']) ??
          BodyType.doNotShow,
      relationshipStatus: $enumDecodeNullable(
              _$RelationshipStatusEnumMap, json['relationshipStatus']) ??
          RelationshipStatus.doNotShow,
      ethnicity: $enumDecodeNullable(_$EthnicityEnumMap, json['ethnicity']) ??
          Ethnicity.doNotShow,
      lookingFor:
          $enumDecodeNullable(_$LookingForEnumMap, json['lookingFor']) ??
              LookingFor.doNotShow,
      whereToMeet:
          $enumDecodeNullable(_$WhereToMeetEnumMap, json['whereToMeet']) ??
              WhereToMeet.doNotShow,
      isOnline: json['isOnline'] as bool? ?? false,
      lastSeen: json['lastSeen'] == null
          ? null
          : DateTime.parse(json['lastSeen'] as String),
      distance: (json['distance'] as num?)?.toDouble(),
      isVerified: json['isVerified'] as bool? ?? false,
      isBlocked: json['isBlocked'] as bool? ?? false,
      blockList: (json['blockList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoriteList: (json['favoriteList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id: json['id'] as String,
      fcmToken: json['fcmToken'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'bio': instance.bio,
      'albumUrl': instance.albumUrl,
      'profileUrl': instance.profileUrl,
      'birthday': instance.birthday,
      'age': instance.age,
      'position': instance.position?.toJson(),
      'dob': instance.dob,
      'height': instance.height,
      'weight': instance.weight,
      'lived': instance.lived,
      'role': _$RoleEnumMap[instance.role]!,
      'bodyType': _$BodyTypeEnumMap[instance.bodyType]!,
      'relationshipStatus':
          _$RelationshipStatusEnumMap[instance.relationshipStatus]!,
      'ethnicity': _$EthnicityEnumMap[instance.ethnicity]!,
      'lookingFor': _$LookingForEnumMap[instance.lookingFor]!,
      'whereToMeet': _$WhereToMeetEnumMap[instance.whereToMeet]!,
      'isOnline': instance.isOnline,
      'lastSeen': instance.lastSeen?.toIso8601String(),
      'distance': instance.distance,
      'isVerified': instance.isVerified,
      'isBlocked': instance.isBlocked,
      'blockList': instance.blockList,
      'favoriteList': instance.favoriteList,
      'interests': instance.interests,
      'id': instance.id,
      'fcmToken': instance.fcmToken,
    };

const _$RoleEnumMap = {
  Role.doNotShow: 'Do not show',
  Role.top: 'Top',
  Role.versTop: 'Vers Top',
  Role.versatile: 'Versatile',
  Role.versBottom: 'Vers Bottom',
  Role.bottom: 'Bottom',
};

const _$BodyTypeEnumMap = {
  BodyType.doNotShow: 'Do not show',
  BodyType.slim: 'Slim',
  BodyType.average: 'Average',
  BodyType.athletic: 'Athletic',
  BodyType.muscular: 'Muscular',
  BodyType.large: 'Large',
  BodyType.fit: 'Fit',
  BodyType.stocky: 'Stocky',
  BodyType.heavy: 'Heavy',
};

const _$RelationshipStatusEnumMap = {
  RelationshipStatus.doNotShow: 'Do not show',
  RelationshipStatus.single: 'Single',
  RelationshipStatus.dating: 'Dating',
  RelationshipStatus.openRelationship: 'Open Relationship',
  RelationshipStatus.married: 'Married',
  RelationshipStatus.divorced: 'Divorced',
  RelationshipStatus.widowed: 'Widowed',
  RelationshipStatus.complicated: 'Complicated',
  RelationshipStatus.inLove: 'In Love',
  RelationshipStatus.engaged: 'Engaged',
  RelationshipStatus.partnered: 'Partnered',
};

const _$EthnicityEnumMap = {
  Ethnicity.doNotShow: 'Do not show',
  Ethnicity.asian: 'Asian',
  Ethnicity.black: 'Black',
  Ethnicity.caucasian: 'Caucasian',
  Ethnicity.hispanic: 'Hispanic',
  Ethnicity.indian: 'Indian',
  Ethnicity.middleEastern: 'Middle Eastern',
  Ethnicity.nativeAmerican: 'Native American',
  Ethnicity.pacificIslander: 'Pacific Islander',
  Ethnicity.mixed: 'Mixed',
  Ethnicity.other: 'Other',
};

const _$LookingForEnumMap = {
  LookingFor.doNotShow: 'Do not show',
  LookingFor.chat: 'Chat',
  LookingFor.dates: 'Dates',
  LookingFor.friends: 'Friends',
  LookingFor.networking: 'Networking',
  LookingFor.longTerm: 'Long Term',
  LookingFor.shortTerm: 'Short Term',
  LookingFor.casual: 'Casual',
  LookingFor.rightNow: 'Right Now',
};

const _$WhereToMeetEnumMap = {
  WhereToMeet.doNotShow: 'Do not show',
  WhereToMeet.myPlace: 'My Place',
  WhereToMeet.yourPlace: 'Your Place',
  WhereToMeet.hotel: 'Hotel',
  WhereToMeet.bar: 'Bar',
  WhereToMeet.restaurant: 'Restaurant',
  WhereToMeet.coffeeShop: 'Coffee Shop',
};
