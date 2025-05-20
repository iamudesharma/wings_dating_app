import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImageForm(ImageSource source) async {
  FilePicker filePicker = FilePicker.platform;

  Uint8List? path;

  if (kIsWeb) {
    final result = await filePicker.pickFiles(
      allowCompression: true,
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      path = result.files.first.bytes;
    }
  } else if (Platform.isMacOS || Platform.isWindows) {
    final result = await filePicker.pickFiles(
      allowCompression: true,
      allowMultiple: false,
      type: FileType.image,
      withData: true, // ensure bytes are loaded
    );

    if (result != null) {
      if (result.files.single.bytes != null) {
        path = result.files.single.bytes!;
      } else if (result.files.single.path != null) {
        final file = File(result.files.single.path!);
        path = await file.readAsBytes();
      }
    }
  } else {
    var image = await ImagePicker().pickImage(source: source, imageQuality: 80);
    if (image != null) {
      path = await image.readAsBytes();
    }
  }
  return path;
}
