import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/chats/model/message.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

import '../utils.dart';
// import 'package:no_signal/models/chat.dart';
// import 'package:no_signal/models/user.dart';
// import 'package:no_signal/utils/api.dart';

// import '../../themes.dart';

/// [ChatServicesNotifier]
/// The services neccessary to work with the [Chat] model.
/// These are all the services for client Side.
/// Since its a State Notifier it will notify if something changes
/// In Riverpod, no need to call `notifyListeners()`
/// Just use [state] to update the state and it will be updated automatically
class ChatServicesNotifier extends StateNotifier<List<ChatBubble>> {
  final Client client;
  final String collectionId;
  late final Databases database;
  late final Account account;
  late final Realtime realtime;
  late RealtimeSubscription subscription;

  /// The List of [Chat]s fetched for the particular collection
  final List<Message> _chats = [];

  /// Current LoggedIn [User] to be obtained from Constructor
  final UserModel? user;

  /// getter for _chats
  List<Message> get chats => _chats;

  // / Private Function for parsing [Chat] data to [ChatBubble]
  ChatBubble _parseChat(Message chat) {
    return ChatBubble(
      margin: const EdgeInsets.only(top: 10),
      alignment:
          user!.id == chat.senderId ? Alignment.topRight : Alignment.topLeft,
      shadowColor: Colors.transparent,
      backGroundColor: user!.id != chat.senderId ? Colors.grey : Colors.black,
      clipper: ChatBubbleClipper1(
        type: user!.id == chat.senderId
            ? BubbleType.sendBubble
            : BubbleType.receiverBubble,
      ),
      child: Text(chat.text),
    );
  }

  /// Constructor
  ChatServicesNotifier(
      {required this.client, this.user, required this.collectionId})
      : super([]) {
    database = Databases(client);
    account = Account(client);
    realtime = Realtime(client);
    subscription = realtime.subscribe(
      ['databases.${ApiInfo.databaseId}.collections.$collectionId.documents'],
    );
    _getOldMessages(user);
    _getRealtimeMessages();
  }

  /// Send a new message to the user.
  /// Will update the function to add support for other multimedia
  ///
  Future<void> sendMessage(Message chat) async {
    try {
      await database.createDocument(
        databaseId: ApiInfo.databaseId,
        collectionId: collectionId,
        documentId: 'unique()',
        data: chat.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Function to receive the old messages from the database.
  /// This will be a one time call for this function.
  ///
  /// It will update the of [state] - List<ChatBubbles>
  /// Since its not required outside of this class,
  /// it is private
  void _getOldMessages(UserModel? user) async {
    try {
      final models.DocumentList temp = await database.listDocuments(
          databaseId: ApiInfo.databaseId, collectionId: collectionId);
      final response = temp.documents;

      /// Adding the List of [Chat]s to the [_chats]
      for (var element in response) {
        _chats.add(Message.fromJson(element.data));
      }

      /// Updating the [state]
      /// NOTE: Don't update state by calling List methods like `add()`
      /// This does not actually modify the state.
      /// Update the state as below when you want to completely modify the list
      /// or use [...state, newState] to add a new element to the existing list
      /// Using any of the List methods will not trigger rebuilds
      // state = _chats.map((e) => _parseChat(e)).toList();
    } on AppwriteException catch (_) {
      rethrow;
    }
  }

  /// [_getRealtimeMessages]
  ///
  /// A realtime function to receive new messages from the database.
  /// Appwrite Realtime API only notifies new document changes in the collection.
  /// So we would need to listen to the collection and get the new messages.
  /// That's why we made a function to [getOldMessages].
  void _getRealtimeMessages() {
    subscription.stream.listen((chat) {
      Message data = Message.fromJson(chat.payload);
      _chats.add(data);

      /// Note: We used spread operator to keep the existing state as well as
      /// add the new element to the list.
      /// This will trigger a rebuild of the widget.
      state = [...state, _parseChat(data)];
    });
  }

  /// [closeStream]
  ///
  /// Close the realtime stream
  /// Will be called when the user backs from chat Screen
  /// Closing the stream to avoid memory leaks and unnecessary calls
  @override
  void dispose() {
    subscription.close();
    log('Stream Closed');
    super.dispose();
  }
}
