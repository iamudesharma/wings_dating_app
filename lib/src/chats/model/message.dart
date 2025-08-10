// import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/message_enum.dart';

part 'message.g.dart';
part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String senderId,
    required String recieverid,
    required String text,
    required MessageEnum type,
    required DateTime timeSent,
    required String messageId,
    required bool isSeen,
    String? repliedMessage,
    String? repliedTo,
    MessageEnum? repliedMessageType,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
