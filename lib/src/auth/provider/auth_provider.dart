import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authstateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();

  
});
