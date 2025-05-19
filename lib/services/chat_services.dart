import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_persistence/stream_chat_persistence.dart';
import 'package:wings_dating_app/src/model/user_models.dart' as userModel;

part 'chat_services.g.dart';

final chatPersistentClient = StreamChatPersistenceClient(
  logLevel: Level.INFO,
  connectionMode: ConnectionMode.regular,
);

@Riverpod(keepAlive: true)
StreamChatClient chatClient(Ref ref) {
  return StreamChatClient("dh5b4nztkcca")..chatPersistenceClient = chatPersistentClient;
}
