// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wings_dating_app/src/model/user_models.dart';

import '../../../dependency/dependenies.dart';
import '../../../helpers/helpers.dart';

// part 'profile_controller.g.dart';

final _userControllerProvider = ChangeNotifierProvider<ProfileController>(
  (ref) {
    return ProfileController(ref: ref);
  },
);

class ProfileController extends ChangeNotifier {
  static ChangeNotifierProvider<ProfileController> userControllerProvider =
      _userControllerProvider;
  UserModel? userModel;

  String? profileImage;

  final Ref ref;
  ProfileController({
    required this.ref,
  });

  Future<void> getCurrentUser() async {
    userModel = await ref.read(Dependency.profileProvider).getCurrentUser();
    notifyListeners();
  }

  Future<void> pickImage({required ImageSource imageSource}) async {
    final image = await pickImageForm(imageSource);

    profileImage = image;
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (profileImage != null) {
      final image = await ref
          .read(Dependency.firebaseStorageProvider)
          .ref("profileImage")
          .putFile(
            File(profileImage!),
            SettableMetadata(contentType: 'image/jpeg'),
          )
          .then((p0) async {
        return await p0.ref.getDownloadURL();
      });

      return image;
    } else {
      return null;
    }
  }
}
