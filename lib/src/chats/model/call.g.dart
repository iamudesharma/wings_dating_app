// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallImpl _$$CallImplFromJson(Map<String, dynamic> json) => _$CallImpl(
      callerId: json['callerId'] as String,
      callerName: json['callerName'] as String,
      callerPic: json['callerPic'] as String,
      receiverId: json['receiverId'] as String,
      receiverName: json['receiverName'] as String,
      receiverPic: json['receiverPic'] as String,
      callId: json['callId'] as String,
      hasDialled: json['hasDialled'] as bool,
    );

Map<String, dynamic> _$$CallImplToJson(_$CallImpl instance) =>
    <String, dynamic>{
      'callerId': instance.callerId,
      'callerName': instance.callerName,
      'callerPic': instance.callerPic,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
      'receiverPic': instance.receiverPic,
      'callId': instance.callId,
      'hasDialled': instance.hasDialled,
    };
