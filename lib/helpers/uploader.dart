import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

FirebaseStorage firebaseStorage = FirebaseStorage.instance;

Future<String> uploadFileToFirebaseAlbum(Uint8List file) async {
  final id = Uuid().v4();
  final path = 'album/$id.jpg';
  logger.i(
      '[AlbumUpload] Starting upload to Firebase Storage: path=$path bytes=${file.lengthInBytes}');
  final ref = FirebaseStorage.instance.ref(path);

  /// In some special cases detect firebase the contentType wrong,
  /// so we make sure the contentType is set to jpg.
  TaskSnapshot snap =
      await ref.putData(file, SettableMetadata(contentType: 'image/jpg'));
  // UploadTask uploadTask = firebaseStorage.ref().child("album").putData(file);
  // TaskSnapshot snap = await uploadTask;
  final downloadUrl = await snap.ref.getDownloadURL();
  logger.i('[AlbumUpload] Upload completed. path=$path url=$downloadUrl');
  return downloadUrl;
}
