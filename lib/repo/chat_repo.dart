import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/helpers/helpers.dart';


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
