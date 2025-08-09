import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../helpers/image_picker.dart';

final _chatController = ChangeNotifierProvider<ChatController>((ref) {
  return ChatController(ref);
});

class ChatController extends ChangeNotifier {
  static ChangeNotifierProvider<ChatController> get provider => _chatController;
  final Ref ref;

  ChatController(this.ref);

  Future<Uint8List?> pickImage({required ImageSource imageSource}) async {
    final image = await pickImageForm(imageSource);

    return image;
  }
}
