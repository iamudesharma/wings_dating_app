// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      nickname: json['nickname'] as String,
      aboutMe: json['aboutMe'] as String?,
      albumUrl: (json['albumUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      avatarUrl: json['avatarUrl'] as String?,
      userBasicModel: json['userBasicModel'] == null
          ? null
          : UserBasicModel.fromJson(
              json['userBasicModel'] as Map<String, dynamic>),
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.doNotShow,
      bodyType: $enumDecodeNullable(_$BodyTypeEnumMap, json['bodyType']) ??
          BodyType.doNotShow,
      relationshipStatus: $enumDecodeNullable(
              _$RelationshipStatusEnumMap, json['relationshipStatus']) ??
          RelationshipStatus.doNotShow,
      ethnicity: $enumDecodeNullable(_$EthnicityEnumMap, json['ethnicity']) ??
          Ethnicity.doNotShow,
      lookingFor: $enumDecodeNullable(_$LookingForEnumMap, json['lookingFor']),
      whereToMeet:
          $enumDecodeNullable(_$WhereToMeetEnumMap, json['whereToMeet']),
      isOnline: json['isOnline'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
      isBlocked: json['isBlocked'] as bool? ?? false,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'aboutMe': instance.aboutMe,
      'albumUrl': instance.albumUrl,
      'avatarUrl': instance.avatarUrl,
      'userBasicModel': instance.userBasicModel,
      'role': _$RoleEnumMap[instance.role]!,
      'bodyType': _$BodyTypeEnumMap[instance.bodyType]!,
      'relationshipStatus':
          _$RelationshipStatusEnumMap[instance.relationshipStatus]!,
      'ethnicity': _$EthnicityEnumMap[instance.ethnicity]!,
      'lookingFor': _$LookingForEnumMap[instance.lookingFor],
      'whereToMeet': _$WhereToMeetEnumMap[instance.whereToMeet],
      'isOnline': instance.isOnline,
      'isVerified': instance.isVerified,
      'isBlocked': instance.isBlocked,
      'age': instance.age,
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
  LookingFor.chat: 'chat',
  LookingFor.dates: 'dates',
  LookingFor.friends: 'friends',
  LookingFor.networking: 'networking',
  LookingFor.longTerm: 'longTerm',
  LookingFor.shortTerm: 'shortTerm',
  LookingFor.casual: 'casual',
  LookingFor.ightNow: 'ightNow',
};

const _$WhereToMeetEnumMap = {
  WhereToMeet.myPlace: 'myPlace',
  WhereToMeet.yourPlace: 'yourPlace',
  WhereToMeet.hotel: 'hotel',
  WhereToMeet.bar: 'bar',
  WhereToMeet.restaurant: 'restaurant',
  WhereToMeet.coffeeShop: 'coffeeShop',
};
