import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _chatController = ChangeNotifierProvider<ChatController>((ref) {
  return ChatController(ref);
});

class ChatController extends ChangeNotifier {
  ChangeNotifierProvider<ChatController> get provider => _chatController;
  final Ref ref;

  ChatController(this.ref);
}
