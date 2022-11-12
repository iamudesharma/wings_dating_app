// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wings_dating_app/src/model/user_models.dart';

import '../../../dependency/dependenies.dart';

// part 'profile_controller.g.dart';

final _userControllerProvider = ChangeNotifierProvider<UserController>(
  (ref) {
    return UserController(ref: ref);
  },
);

class UserController extends ChangeNotifier {
  static ChangeNotifierProvider<UserController> userControllerProvider =
      _userControllerProvider;
  UserModel? userModel;

  final Ref ref;
  UserController({
    required this.ref,
  });

  Future<void> getCurrentUser() async {
    userModel = await ref.read(Dependency.profileProvider).getCurrentUser();
    notifyListeners();
  }
}
