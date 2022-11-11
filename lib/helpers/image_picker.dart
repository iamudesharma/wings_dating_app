import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<String?> pickImageForm(ImageSource source) async {
  var image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image.path;
  } else {
    return null;
  }
}



