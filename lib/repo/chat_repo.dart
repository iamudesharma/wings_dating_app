import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:wings_dating_app/helpers/common_firebase_storage_repository.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

import '../helpers/message_enum.dart';
import '../helpers/message_reply_provider.dart';
import '../src/chats/model/chat_contact.dart';
import '../src/chats/model/message.dart';
import '../src/model/user_models.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(),
);

class ChatRepository {
  Future<CubeDialog?> createChat(
    Set<int> occupantsIds,
  ) async {
    CubeDialog newDialog =
        CubeDialog(CubeDialogType.PRIVATE, occupantsIds: occupantsIds.toList());
    try {
      final dialog = await createDialog(newDialog);
      return dialog;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  sendMessage(
    Set<int> occupantsIds, {
    required String body,
  }) async {
    final dialog = await createChat(occupantsIds);

    final message = createCubeMsg();
    message.body = body.trim();

    await dialog!.sendMessage(message).then((value) {
      logger.i('message sent {${value.id}}}');
    }).catchError((e) {
      logger.e(e);
    });
  }
}

CubeMessage createCubeMsg() {
  var message = CubeMessage();
  message.dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  message.markable = true;
  message.saveToHistory = true;
  return message;
}
