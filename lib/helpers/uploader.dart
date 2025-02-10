import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

FirebaseStorage firebaseStorage = FirebaseStorage.instance;

Future<String> uploadFileToFirebaseAlbum(Uint8List file) async {
  String path = 'album/${Uuid().v4()}.jpg';
  Reference ref = FirebaseStorage.instance.ref(path);

  /// In some special cases detect firebase the contentType wrong,
  /// so we make sure the contentType is set to jpg.
  TaskSnapshot snap = await ref.putData(file, SettableMetadata(contentType: 'image/jpg'));
  // UploadTask uploadTask = firebaseStorage.ref().child("album").putData(file);
  // TaskSnapshot snap = await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
}
