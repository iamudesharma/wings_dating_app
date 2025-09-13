import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/src/profile/models/profile_extras.dart';

final profileExtrasRepoProvider = Provider<ProfileExtrasRepo>((ref) {
  final auth = ref.read(Dependency.firebaseAuthProvider);
  final store = ref.read(Dependency.firebaseStoreProvider);
  return ProfileExtrasRepo(ref: ref, auth: auth, store: store);
});

class ProfileExtrasRepo {
  final Ref ref;
  final FirebaseAuth auth;
  final FirebaseFirestore store;
  ProfileExtrasRepo({required this.ref, required this.auth, required this.store});

  DocumentReference<Map<String, dynamic>> _docRef(String uid) => store.collection('profile_extras').doc(uid);

  Future<Map<String, dynamic>?> fetch() async {
    try {
      final uid = auth.currentUser?.uid;
      if (uid == null) return null;
      final snap = await _docRef(uid).get();
      if (!snap.exists) return null;
      return snap.data();
    } catch (e) {
      logger.e('fetch profile extras failed: $e');
      return null;
    }
  }

  Future<void> updatePartial(Map<String, dynamic> fields) async {
    try {
      final uid = auth.currentUser?.uid;
      if (uid == null) return;
      await _docRef(uid).set(fields, SetOptions(merge: true));
    } catch (e) {
      logger.e('update profile extras failed: $e');
    }
  }

  Future<void> saveAll({
    List<PromptQA>? prompts,
    List<String>? habits,
    List<String>? values,
    SocialLinks? social,
    String? videoUrl,
    VerificationStatus? verification,
  }) async {
    final data = <String, dynamic>{};
    if (prompts != null) {
      data['prompts'] = prompts.map((e) => e.toJson()).toList();
    }
    if (habits != null) data['habits'] = habits;
    if (values != null) data['values'] = values;
    if (social != null) data['social'] = social.toJson();
    if (videoUrl != null) data['videoUrl'] = videoUrl;
    if (verification != null) data['verification'] = verification.toJson();
    await updatePartial(data);
  }
}
