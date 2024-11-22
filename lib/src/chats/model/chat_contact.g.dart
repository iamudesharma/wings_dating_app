// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatContactImpl _$$ChatContactImplFromJson(Map<String, dynamic> json) =>
    _$ChatContactImpl(
      name: json['name'] as String,
      profilePic: json['profilePic'] as String,
      contactId: json['contactId'] as String,
      timeSent: DateTime.parse(json['timeSent'] as String),
      lastMessage: json['lastMessage'] as String,
      fcmToken: json['fcmToken'] as String,
    );

Map<String, dynamic> _$$ChatContactImplToJson(_$ChatContactImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profilePic': instance.profilePic,
      'contactId': instance.contactId,
      'timeSent': instance.timeSent.toIso8601String(),
      'lastMessage': instance.lastMessage,
      'fcmToken': instance.fcmToken,
    };
