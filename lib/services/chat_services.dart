import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/src/model/user_models.dart' as userModel;

part 'chat_services.g.dart';

@Riverpod(keepAlive: true)
StreamChatClient chatClient(Ref ref) {
  return StreamChatClient("dh5b4nztkcca");
}

// class ChatServices {
//   static StreamChatClient chatClient = StreamChatClient("dh5b4nztkcca");

//   static connectUser({
//     required userModel.UserModel user,
//   }) async {
//     await chatClient.connectUser(
//       User(
//         id: user.id,
//         extraData: {
//           "name": user.username,
//           "image": user.profileUrl,
//         },
//       ),
//       chatClient.devToken(user.id).rawValue,
//     );
//   }
// }
