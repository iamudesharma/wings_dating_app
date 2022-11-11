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
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'aboutMe': instance.aboutMe,
      'albumUrl': instance.albumUrl,
      'avatarUrl': instance.avatarUrl,
    };
