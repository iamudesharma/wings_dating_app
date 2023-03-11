// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimestampQuery _$TimestampQueryFromJson(Map<String, dynamic> json) =>
    TimestampQuery(
      const FirestoreTimestampConverter().fromJson(json['time'] as Timestamp),
    );

Map<String, dynamic> _$TimestampQueryToJson(TimestampQuery instance) =>
    <String, dynamic>{
      'time': const FirestoreTimestampConverter().toJson(instance.time),
    };

GeoPointQuery _$GeoPointQueryFromJson(Map<String, dynamic> json) =>
    GeoPointQuery(
      const FirestoreGeoPointConverter().fromJson(json['point'] as GeoPoint),
    );

Map<String, dynamic> _$GeoPointQueryToJson(GeoPointQuery instance) =>
    <String, dynamic>{
      'point': const FirestoreGeoPointConverter().toJson(instance.point),
    };

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      username: json['username'] as String,
      bio: json['bio'] as String?,
      albumUrl: (json['albumUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      profileUrl: json['profileUrl'] as String? ??
          "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
      birthday: json['birthday'] as String?,
      age: json['age'] as int?,
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
      isVerified: json['isVerified'] as bool? ?? false,
      isBlocked: json['isBlocked'] as bool? ?? false,
      blockList: (json['blockList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id: json['id'] as String,
      fcmToken: json['fcmToken'] as String,
      cubeUser: CubeUser.fromJson(json['cubeUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'bio': instance.bio,
      'albumUrl': instance.albumUrl,
      'profileUrl': instance.profileUrl,
      'birthday': instance.birthday,
      'age': instance.age,
      'position': instance.position,
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
      'isVerified': instance.isVerified,
      'isBlocked': instance.isBlocked,
      'blockList': instance.blockList,
      'id': instance.id,
      'fcmToken': instance.fcmToken,
      'cubeUser': instance.cubeUser,
    };

const _$RoleEnumMap = {
  Role.doNotShow: 'doNotShow',
  Role.top: 'top',
  Role.versTop: 'versTop',
  Role.versatile: 'versatile',
  Role.versBottom: 'versBottom',
  Role.bottom: 'bottom',
};

const _$BodyTypeEnumMap = {
  BodyType.doNotShow: 'doNotShow',
  BodyType.slim: 'slim',
  BodyType.average: 'average',
  BodyType.athletic: 'athletic',
  BodyType.muscular: 'muscular',
  BodyType.large: 'large',
  BodyType.fit: 'fit',
  BodyType.stocky: 'stocky',
  BodyType.heavy: 'heavy',
};

const _$RelationshipStatusEnumMap = {
  RelationshipStatus.doNotShow: 'doNotShow',
  RelationshipStatus.single: 'single',
  RelationshipStatus.dating: 'dating',
  RelationshipStatus.openRelationship: 'openRelationship',
  RelationshipStatus.married: 'married',
  RelationshipStatus.divorced: 'divorced',
  RelationshipStatus.widowed: 'widowed',
  RelationshipStatus.complicated: 'complicated',
  RelationshipStatus.inLove: 'inLove',
  RelationshipStatus.engaged: 'engaged',
  RelationshipStatus.partnered: 'partnered',
};

const _$EthnicityEnumMap = {
  Ethnicity.doNotShow: 'doNotShow',
  Ethnicity.asian: 'asian',
  Ethnicity.black: 'black',
  Ethnicity.caucasian: 'caucasian',
  Ethnicity.hispanic: 'hispanic',
  Ethnicity.indian: 'indian',
  Ethnicity.middleEastern: 'middleEastern',
  Ethnicity.nativeAmerican: 'nativeAmerican',
  Ethnicity.pacificIslander: 'pacificIslander',
  Ethnicity.mixed: 'mixed',
  Ethnicity.other: 'other',
  Ethnicity.partnered: 'partnered',
};

const _$LookingForEnumMap = {
  LookingFor.doNotShow: 'doNotShow',
  LookingFor.chat: 'chat',
  LookingFor.dates: 'dates',
  LookingFor.friends: 'friends',
  LookingFor.networking: 'networking',
  LookingFor.longTerm: 'longTerm',
  LookingFor.shortTerm: 'shortTerm',
  LookingFor.casual: 'casual',
  LookingFor.rightNow: 'rightNow',
};

const _$WhereToMeetEnumMap = {
  WhereToMeet.doNotShow: 'doNotShow',
  WhereToMeet.myPlace: 'myPlace',
  WhereToMeet.yourPlace: 'yourPlace',
  WhereToMeet.hotel: 'hotel',
  WhereToMeet.bar: 'bar',
  WhereToMeet.restaurant: 'restaurant',
  WhereToMeet.coffeeShop: 'coffeeShop',
};
