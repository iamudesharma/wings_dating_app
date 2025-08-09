// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/model/engagement_models.dart';

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
  static ChangeNotifierProvider<ProfileController> userControllerProvider = _userControllerProvider;
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

  String getDistance(GeoPoint coordinates, {GeoPoint? userCoordinates}) {
    final data = Geolocator.distanceBetween(
      userCoordinates?.latitude ?? userModel!.position!.geopoint[1],
      userCoordinates?.longitude ?? userModel!.position!.geopoint[0],
      coordinates.latitude,
      coordinates.longitude,
    );

    return meterToKm(data);
  }

  Future<void> removeFromBlockList({required String id, required int cubeId}) async {
    await ref.read(Dependency.profileProvider).removeToBlockList(id: id, cubeId: cubeId);
  }

  Future<void> addToBlockList({required String id, required int cubeId}) async {
    await ref.read(Dependency.profileProvider).removeToBlockList(id: id, cubeId: cubeId);
  }

  /// Call this when a user visits another user's profile
  Future<void> visitProfile(String targetUserId) async {
    await ref.read(Dependency.profileProvider).visitProfile(targetUserId);
  }

  /// Get the list of profiles the current user has visited
  Future<List<VisitRecord>> getVisitedProfiles() async {
    final response = await ref.read(Dependency.profileProvider).getVisitedProfiles();
    return response.visits;
  }

  /// Get the list of users who have visited the current user's profile
  Future<List<VisitRecord>> getProfileVisitors() async {
    final response = await ref.read(Dependency.profileProvider).getProfileVisitors();
    return response.visits;
  }
}

String meterToKm(double meter) {
  if (meter > 1000) {
    return '${(meter / 1000).toStringAsFixed(0)} Kms';
  } else {
    return "${meter.toStringAsFixed(0)} meters";
  }
}

final roleProvider = StateProvider<Role>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata?.role ?? Role.doNotShow;
});

final bodyTypeProvider = StateProvider<BodyType>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata?.bodyType ?? BodyType.doNotShow;
});

final relationshipStatusProvider = StateProvider<RelationshipStatus>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata?.relationshipStatus ?? RelationshipStatus.doNotShow;
});

final ethnicityProvider = StateProvider<Ethnicity>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata?.ethnicity ?? Ethnicity.doNotShow;
});
final lookingForProvider = StateProvider<LookingFor>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata?.lookingFor ?? LookingFor.doNotShow;
});

final whereToMeetProvider = StateProvider<WhereToMeet>((ref) {
  final userdata = ref.read(ProfileController.userControllerProvider).userModel;
  return userdata?.whereToMeet ?? WhereToMeet.doNotShow;
});
