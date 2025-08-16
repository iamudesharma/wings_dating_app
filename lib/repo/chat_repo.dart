import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/services/chat_services.dart';
import 'package:wings_dating_app/src/model/user_models.dart' as userModel;

part 'chat_repo.g.dart';

@riverpod
class ChatRepo extends _$ChatRepo {
  @override
  build() {
    return null;
  }

  Future<ChannelState?> createChat(
      String currentUserId, String otherUserId) async {
    var createChannel = await ref.read(chatClientProvider).createChannel(
      "messaging",
      channelData: {
        "members": [currentUserId, otherUserId],
      },
    );

    return createChannel;
  }

  connectUser({
    required userModel.UserModel user,
  }) async {
    await ref.read(chatClientProvider).connectUser(
          User(
            id: user.id,
            extraData: {
              "name": user.username,
              "image": user.profileUrl,
            },
          ),
          ref.read(chatClientProvider).devToken(user.id).rawValue,
        );
  }
}

// final chatRepositoryProvider = Provider(
//   (ref) => ChatRepository(),
// );

// class ChatRepository {
//   // Future<CubeDialog?> createChat(
//   //   Set<int> occupantsIds,
//   // ) async {
//   //   CubeDialog newDialog =
//   //       CubeDialog(CubeDialogType.PRIVATE, occupantsIds: occupantsIds.toList());
//   //   try {
//   //     final dialog = await createDialog(newDialog);
//   //     return dialog;
//   //   } catch (e) {
//   //     logger.e(e);
//   //     return null;
//   //   }
//   // }

//   // sendMessage(
//   //   Set<int> occupantsIds, {
//   //   required String body,
//   // }) async {
//   //   final dialog = await createChat(occupantsIds);

//   //   final message = createCubeMsg();
//   //   message.body = body.trim();

//   //   await dialog!.sendMessage(message).then((value) {
//   //     logger.i('message sent {${value.id}}}');
//   //   }).catchError((e) {
//   //     logger.e(e);
//   //   });
//   // }
// }

// // CubeMessage createCubeMsg() {
// //   var message = CubeMessage();
// //   message.dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000;
// //   message.markable = true;
// //   message.saveToHistory = true;
// //   return message;
// // }
