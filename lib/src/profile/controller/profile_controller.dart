// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_dating_app/services/chat_services.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/model/engagement_models.dart';

import '../../../dependency/dependencies.dart';
import '../../../helpers/extra_data.dart';
import '../../../helpers/helpers.dart';

part 'profile_controller.freezed.dart';
part 'profile_controller.g.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(null) UserModel? userModel,
    @Default(null) Uint8List? profileImage,
    @Default([]) List<String> albumImages,
    @Default(false) bool isLoading,
    @Default(null) String? error,
  }) = _ProfileState;
}

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  // Backward compatibility - apps can still use ProfileController.userControllerProvider
  static get userControllerProvider => profileControllerProvider;
  @override
  ProfileState build() {
    return const ProfileState();
  }

  Future<void> getCurrentUser() async {
    try {
      state = state.copyWith(isLoading: true);
      final user = await ref.read(Dependency.profileProvider).getCurrentUser();
      state = state.copyWith(userModel: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> updateUserData(UserModel user) async {
    try {
      state = state.copyWith(isLoading: true);
      await ref.read(Dependency.profileProvider).updateUserDoc(user);
      final updatedUser = await ref.read(Dependency.profileProvider).getCurrentUser();
      state = state.copyWith(userModel: updatedUser, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> pickImage({required ImageSource imageSource}) async {
    try {
      final image = await pickImageForm(imageSource);
      state = state.copyWith(profileImage: image);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<String?> uploadImage() async {
    if (state.profileImage != null) {
      final image = await ref
          .read(Dependency.firebaseStorageProvider)
          .ref("profileImages")
          .child("${DateTime.now().millisecondsSinceEpoch.toString()}.jpg")
          .putData(state.profileImage!, SettableMetadata(contentType: 'image/jpeg'))
          .then((p0) async {
            return await p0.ref.getDownloadURL();
          });

      return image;
    } else {
      return null;
    }
  }

  /// Upload a short video clip to storage and return its public URL
  Future<String?> uploadVideo(Uint8List bytes) async {
    try {
      final refStorage = ref
          .read(Dependency.firebaseStorageProvider)
          .ref('videos')
          .child('${DateTime.now().millisecondsSinceEpoch}.mp4');
      final task = await refStorage.putData(bytes, SettableMetadata(contentType: 'video/mp4'));
      final url = await task.ref.getDownloadURL();
      return url;
    } catch (_) {
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
      userCoordinates?.latitude ?? state.userModel!.position!.geopoint[1],
      userCoordinates?.longitude ?? state.userModel!.position!.geopoint[0],
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

  Future<void> logout() async {
    await SharedPreferences.getInstance().then((prefs) => prefs.clear());
    await ref.read(chatClientProvider).disconnectUser();
    await FirebaseAuth.instance.signOut();
  }
}

String meterToKm(double meter) {
  if (meter > 1000) {
    return '${(meter / 1000).toStringAsFixed(0)} Kms';
  } else {
    return "${meter.toStringAsFixed(0)} meters";
  }
}

@riverpod
class RoleNotifier extends _$RoleNotifier {
  @override
  Role build() {
    final userdata = ref.watch(profileControllerProvider).userModel;
    return userdata?.role ?? Role.doNotShow;
  }

  void update(Role newRole) {
    state = newRole;
  }
}

@riverpod
class BodyTypeNotifier extends _$BodyTypeNotifier {
  @override
  BodyType build() {
    final userdata = ref.watch(profileControllerProvider).userModel;
    return userdata?.bodyType ?? BodyType.doNotShow;
  }

  void update(BodyType newBodyType) {
    state = newBodyType;
  }
}

@riverpod
class RelationshipStatusNotifier extends _$RelationshipStatusNotifier {
  @override
  RelationshipStatus build() {
    final userdata = ref.watch(profileControllerProvider).userModel;
    return userdata?.relationshipStatus ?? RelationshipStatus.doNotShow;
  }

  void update(RelationshipStatus newStatus) {
    state = newStatus;
  }
}

@riverpod
class EthnicityNotifier extends _$EthnicityNotifier {
  @override
  Ethnicity build() {
    final userdata = ref.watch(profileControllerProvider).userModel;
    return userdata?.ethnicity ?? Ethnicity.doNotShow;
  }

  void update(Ethnicity newEthnicity) {
    state = newEthnicity;
  }
}

@riverpod
class LookingForNotifier extends _$LookingForNotifier {
  @override
  LookingFor build() {
    final userdata = ref.watch(profileControllerProvider).userModel;
    return userdata?.lookingFor ?? LookingFor.doNotShow;
  }

  void update(LookingFor newLookingFor) {
    state = newLookingFor;
  }
}

@riverpod
class WhereToMeetNotifier extends _$WhereToMeetNotifier {
  @override
  WhereToMeet build() {
    final userdata = ref.watch(profileControllerProvider).userModel;
    return userdata?.whereToMeet ?? WhereToMeet.doNotShow;
  }

  void update(WhereToMeet newWhereToMeet) {
    state = newWhereToMeet;
  }
}

// Compatibility providers for existing code
// final roleProvider = roleNotifierProvider;
// final bodyTypeProvider = bodyTypeNotifierProvider;
// final relationshipStatusProvider = relationshipStatusNotifierProvider;
// final ethnicityProvider = ethnicityNotifierProvider;
// final lookingForProvider = lookingForNotifierProvider;
// final whereToMeetProvider = whereToMeetNotifierProvider;
