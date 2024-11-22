// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      senderId: json['senderId'] as String,
      recieverid: json['recieverid'] as String,
      text: json['text'] as String,
      type: $enumDecode(_$MessageEnumEnumMap, json['type']),
      timeSent: DateTime.parse(json['timeSent'] as String),
      messageId: json['messageId'] as String,
      isSeen: json['isSeen'] as bool,
      repliedMessage: json['repliedMessage'] as String?,
      repliedTo: json['repliedTo'] as String?,
      repliedMessageType:
          $enumDecodeNullable(_$MessageEnumEnumMap, json['repliedMessageType']),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'recieverid': instance.recieverid,
      'text': instance.text,
      'type': _$MessageEnumEnumMap[instance.type]!,
      'timeSent': instance.timeSent.toIso8601String(),
      'messageId': instance.messageId,
      'isSeen': instance.isSeen,
      'repliedMessage': instance.repliedMessage,
      'repliedTo': instance.repliedTo,
      'repliedMessageType': _$MessageEnumEnumMap[instance.repliedMessageType],
    };

const _$MessageEnumEnumMap = {
  MessageEnum.text: 'text',
  MessageEnum.image: 'image',
  MessageEnum.audio: 'audio',
  MessageEnum.video: 'video',
  MessageEnum.gif: 'gif',
};
