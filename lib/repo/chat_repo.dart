import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:wings_dating_app/helpers/common_firebase_storage_repository.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

import '../helpers/message_enum.dart';
import '../helpers/message_reply_provider.dart';
import '../src/chats/model/chat_contact.dart';
import '../src/chats/model/message.dart';
import '../src/model/user_models.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  ),
);

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  ChatRepository({
    required this.firestore,
    required this.auth,
  });

  Stream<List<ChatContact>> getChatContacts() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<ChatContact> contacts = [];
      for (var document in event.docs) {
        var chatContact = ChatContact.fromJson(document.data());
        var userData = await firestore
            .collection('users')
            .doc(chatContact.contactId)
            .get();
        var user = UserModel.fromJson(userData.data()!);

        contacts.add(
          ChatContact(
            name: user.username,
            profilePic: user.profileUrl ?? "",
            contactId: chatContact.contactId,
            timeSent: chatContact.timeSent,
            lastMessage: chatContact.lastMessage,
            fcmToken: '',
          ),
        );
      }
      return contacts;
    });
  }

  Stream<List<Message>> getChatStream(String recieverUserId) {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<Message> messages = [];

      logger.i('event ${event.docs.length}');
      for (var document in event.docs) {
        messages.add(Message.fromJson(document.data()));
      }
      return messages.reversed.toList();
    });
  }

  void _saveDataToContactsSubcollection(
    UserModel senderUserData,
    UserModel? recieverUserData,
    String text,
    DateTime timeSent,
    String recieverUserId,
  ) async {
    var recieverChatContact = ChatContact(
      name: senderUserData.username,
      profilePic: senderUserData.profileUrl ?? "",
      contactId: senderUserData.id,
      timeSent: timeSent,
      lastMessage: text,
      fcmToken: '',
    );
    await firestore
        .collection('users')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .set(
          recieverChatContact.toJson(),
        );

    logger.i('sender chat contact $recieverChatContact');

    // users -> current user id  => chats -> reciever user id -> set data
    var senderChatContact = ChatContact(
      fcmToken: "",
      name: recieverUserData!.username,
      profilePic: recieverUserData.profileUrl ?? "",
      contactId: recieverUserData.id,
      timeSent: timeSent,
      lastMessage: text,
    );

    logger.i('sender chat contact $senderChatContact');
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .set(
          senderChatContact.toJson(),
        );
  }

  void _saveMessageToMessageSubcollection({
    required String recieverUserId,
    required String text,
    required DateTime timeSent,
    required String messageId,
    required String username,
    required MessageEnum messageType,
    required MessageReply? messageReply,
    required String senderUsername,
    required String? recieverUserName,
  }) async {
    final message = Message(
      senderId: auth.currentUser!.uid,
      recieverid: recieverUserId,
      text: text,
      type: messageType,
      timeSent: timeSent,
      messageId: messageId,
      isSeen: false,
      repliedMessage: messageReply == null ? '' : messageReply.message,
      repliedTo: messageReply == null
          ? ''
          : messageReply.isMe
              ? senderUsername
              : recieverUserName ?? '',
      repliedMessageType:
          messageReply == null ? MessageEnum.text : messageReply.messageEnum,
    );

    // users -> sender id -> reciever id -> messages -> message id -> store message
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .collection('messages')
        .doc(messageId)
        .set(
          message.toJson(),
        );
    // users -> eciever id  -> sender id -> messages -> message id -> store message
    await firestore
        .collection('users')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .doc(messageId)
        .set(
          message.toJson(),
        );
  }

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String receiverUserId,
    required UserModel senderUser,
    UserModel? receiverUserData,
    required MessageReply? messageReply,
    // required bool isGroupChat,
  }) async {
    try {
      var timeSent = DateTime.now();

      var messageId = const Uuid().v1();

      _saveDataToContactsSubcollection(
        senderUser,
        receiverUserData,
        text,
        timeSent,
        receiverUserId,
      );

      _saveMessageToMessageSubcollection(
        recieverUserId: receiverUserId,
        text: text,
        timeSent: timeSent,
        messageType: MessageEnum.text,
        messageId: messageId,
        username: senderUser.username,
        messageReply: messageReply,
        recieverUserName: receiverUserData?.username,
        senderUsername: senderUser.username,
      );
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void sendFileMessage({
    required BuildContext context,
    required File file,
    required String receiverUserId,
    required UserModel senderUserData,
    required WidgetRef ref,
    required MessageEnum messageEnum,
    required MessageReply? messageReply,
    required bool isGroupChat,
  }) async {
    try {
      var timeSent = DateTime.now();
      var messageId = const Uuid().v1();

      String imageUrl = await ref
          .read(commonFirebaseStorageRepositoryProvider)
          .storeFileToFirebase(
            'chat/${messageEnum.type}/${senderUserData.id}/$receiverUserId/$messageId',
            file,
          );

      UserModel? recieverUserData;
      if (!isGroupChat) {
        var userDataMap =
            await firestore.collection('users').doc(receiverUserId).get();
        recieverUserData = UserModel.fromJson(userDataMap.data()!);
      }

      String contactMsg;

      switch (messageEnum) {
        case MessageEnum.image:
          contactMsg = '📷 Photo';
          break;
        case MessageEnum.video:
          contactMsg = '📸 Video';
          break;
        case MessageEnum.audio:
          contactMsg = '🎵 Audio';
          break;
        case MessageEnum.gif:
          contactMsg = 'GIF';
          break;
        default:
          contactMsg = 'GIF';
      }
      _saveDataToContactsSubcollection(
        senderUserData,
        recieverUserData,
        contactMsg,
        timeSent,
        receiverUserId,
      );

      _saveMessageToMessageSubcollection(
        recieverUserId: receiverUserId,
        text: imageUrl,
        timeSent: timeSent,
        messageId: messageId,
        username: senderUserData.username,
        messageType: messageEnum,
        messageReply: messageReply,
        recieverUserName: recieverUserData?.id,
        senderUsername: senderUserData.username,
      );
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void sendGIFMessage({
    required BuildContext context,
    required String gifUrl,
    required String recieverUserId,
    required UserModel senderUser,
    required MessageReply? messageReply,
    required bool isGroupChat,
  }) async {
    try {
      var timeSent = DateTime.now();
      UserModel? recieverUserData;

      if (!isGroupChat) {
        var userDataMap =
            await firestore.collection('users').doc(recieverUserId).get();
        recieverUserData = UserModel.fromJson(userDataMap.data()!);
      }

      var messageId = const Uuid().v1();

      _saveDataToContactsSubcollection(
        senderUser,
        recieverUserData,
        'GIF',
        timeSent,
        recieverUserId,
      );

      _saveMessageToMessageSubcollection(
        recieverUserId: recieverUserId,
        text: gifUrl,
        timeSent: timeSent,
        messageType: MessageEnum.gif,
        messageId: messageId,
        username: senderUser.username,
        messageReply: messageReply,
        recieverUserName: recieverUserData?.username,
        senderUsername: senderUser.username,
      );
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void setChatMessageSeen(
    BuildContext context,
    String recieverUserId,
    String messageId,
  ) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('chats')
          .doc(recieverUserId)
          .collection('messages')
          .doc(messageId)
          .update({'isSeen': true});

      await firestore
          .collection('users')
          .doc(recieverUserId)
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('messages')
          .doc(messageId)
          .update({'isSeen': true});
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }
}
