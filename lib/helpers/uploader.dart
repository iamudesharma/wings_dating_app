import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage firebaseStorage = FirebaseStorage.instance;

Future<String> uploadFileToFirebaseAlbum(Uint8List file) async {
  UploadTask uploadTask = firebaseStorage.ref().child("album").putData(file);
  TaskSnapshot snap = await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
}
