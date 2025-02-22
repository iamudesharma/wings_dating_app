// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';

import 'package:wings_dating_app/src/model/user_models.dart';

import '../../../dependency/dependencies.dart';
import '../../../helpers/extra_data.dart';
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

  Uint8List? profileImage;

  List<String> albumImages = [];

  final Ref ref;
  ProfileController({
    required this.ref,
  });

  Future<void> getCurrentUser() async {
    userModel = await ref.read(Dependency.profileProvider).getCurrentUser();
    notifyListeners();
  }

  Future updateUserData(UserModel user) async {
    await ref.read(Dependency.profileProvider).updateUserDoc(user);
  }

  // Future updateCubeUserData(CubeUser user) async {
  //   await ref.read(Dependency.profileProvider).updateCubeUserDoc(user);
  // }

  Future<void> pickImage({required ImageSource imageSource}) async {
    final image = await pickImageForm(imageSource);

    profileImage = image;
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (profileImage != null) {
      final image = await ref
          .read(Dependency.firebaseStorageProvider)
          .ref("profileImages")
          .child("${DateTime.now().millisecondsSinceEpoch.toString()}.jpg")
          .putData(
            profileImage!,
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

  Future<Uint8List?> pickImageFromAlbum(ImageSource source) async {
    final image = await pickImageForm(source);
    ImagePicker().pickMultiImage();

    return image;
  }

  String getDistance(GeoPoint coordinates) {
    final data = Geolocator.distanceBetween(
      userModel!.position!.geopoint.latitude,
      userModel!.position!.geopoint.longitude,
      coordinates.latitude,
      coordinates.longitude,
    );
    print("data distanceBetween : ${data}");
    // final data = GeoFirePoint.distanceBetween(
    //   from: Coordinates(
    //     userModel!.position!.geopoint.latitude,
    //     userModel!.position!.geopoint.longitude,
    //   ),
    //   to: coordinates,
    // );

    return meterToKm(data);
  }

  Future<void> removeFromBlockList(
      {required String id, required int cubeId}) async {
    await ref
        .read(Dependency.profileProvider)
        .removeToBlockList(id: id, cubeId: cubeId);
  }

  Future<void> addToBlockList({required String id, required int cubeId}) async {
    await ref
        .read(Dependency.profileProvider)
        .removeToBlockList(id: id, cubeId: cubeId);
  }
}

String meterToKm(double meter) {
  // change metre to km if greater than 1000 meters
  if (meter > 1000) {
    return '${(meter / 1000).toStringAsFixed(0)} Kms';
  } else {
    return "${meter.toStringAsFixed(0)} meters";
  }
}

final roleProvider = StateProvider<Role>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.role;
});

final bodyTypeProvider = StateProvider<BodyType>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.bodyType;
});

final relationshipStatusProvider = StateProvider<RelationshipStatus>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.relationshipStatus;
});

final ethnicityProvider = StateProvider<Ethnicity>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.ethnicity;
});
final lookingForProvider = StateProvider<LookingFor>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.lookingFor;
});

final whereToMeetProvider = StateProvider<WhereToMeet>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata!.whereToMeet;
});
