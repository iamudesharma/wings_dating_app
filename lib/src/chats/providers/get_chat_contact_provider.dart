import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/chat_repo.dart';

import '../model/chat_contact.dart';

final getChatContactProvider = StreamProvider<List<ChatContact>>((ref) {
  return ref.read(chatRepositoryProvider).getChatContacts();
});
