import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repo/profile_repo.dart';

class Dependency {
  static final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
    return FirebaseAuth.instance;
  });

  static final firebaseStoreProvider = Provider<FirebaseFirestore>((ref) {
    return FirebaseFirestore.instance;
  });

  static final firebaseStorageProvider = Provider<FirebaseStorage>((ref) {
    return FirebaseStorage.instance;
  });

  static final profileProvider = profileRepoProvider;
}
