import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/const/http_templete.dart';
import 'package:wings_dating_app/const/pref_util.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/repo/repo_exception.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

import '../helpers/extra_data.dart';

part 'profile_repo.g.dart';

@riverpod
ProfileRepo profileRepo(Ref ref) {
  return ProfileRepo(ref);
}

class ProfileRepo with RepositoryExceptionMixin {
  final Ref ref;

  ProfileRepo(this.ref);

  // CollectionReference<UserModel> userCollection() {
  //   final data = ref.read(Dependency.firebaseStoreProvider).collection("users").withConverter<UserModel>(
  //         fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
  //         toFirestore: (user, _) => user.toJson(),
  //       );

  //   return data;
  // }

  HttpTemplate httpTemplate = HttpTemplate();
  Future<void> createUserDoc(UserModel userModel) async {
    logger.i("createUserDoc userModel${userModel.toJson()}");
    try {
      final createUser = await httpTemplate.post("/users", body: userModel.toJson());
    } catch (e) {
      logger.i("createUserDoc userModel${e}");
      // Handle the error appropriately
      logger.e("Error creating user document: $e");
      rethrow; // or handle it in a way that fits your app's logic

      // TODO
    }
  }

  // Future<void> updateUserDoc(UserModel userModel) async {
  //   final usercollection = userCollection();
  //   await usercollection
  //       .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
  //       .update(userModel.toJson());
  // }

  Future<UserModel> getCurrentUser() async {
    final currentUserId = ref.read(Dependency.firebaseAuthProvider).currentUser!.uid;

    try {
      final Map<String, dynamic> response = await httpTemplate.get("/users/$currentUserId");
      print("getCurrentUser response: $response");

      // Check if response contains 'data' key and it's a Map
      if (response.containsKey('data') && response['data'] is Map<String, dynamic>) {
        final Map<String, dynamic> userMap = response['data'];

        print("getCurrentUser userMap: $userMap");
        print("userMap runtimeType: ${userMap.runtimeType}");

        return UserModel.fromJson(userMap);
      } else {
        throw Exception('Failed to fetch user: ${response['message'] ?? response}');
      }
    } catch (e) {
      print("Error in getCurrentUser: $e");
      rethrow;
    }
  }

  Future<bool> checkUserDocExist() async {
    try {
      await getCurrentUser();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateUserDoc(UserModel userModel) async {
    logger.i("updateUserDoc userModel");
    await httpTemplate.put("/users/${userModel.id}", body: userModel.toJson());
    // await SharedPrefs.instance.updateUser(userModel);
  }

  // Future<void> updateLocation(dynamic pointData) async {
  //   logger.e(pointData);
  //   final usercollection = userCollection();

  //   await exceptionHandler<void>(
  //     usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).update(
  //       {
  //         "position": pointData,
  //       },
  //     ),
  //   );
  // }

  Future<List<UserModel?>?> getUserListBySearch({int limit = 10, required GeoPoint geoPoint}) async {
    try {
      final userModel = ref.read(ProfileController.userControllerProvider).userModel!;

      String query =
          "lng=${userModel.position!.geopoint[0]}&lat=${userModel.position!.geopoint[1]}&distance=5000000&userId=${userModel.id}";
      final response = await httpTemplate.get(
        "users/near/?$query",
      );

      // Check if response contains 'data' key and it's a Map
      print("users runtimeType: ${response["data"].runtimeType}");

      if (response.containsKey('data') && response['data'] is List<dynamic>) {
        final List<dynamic> users = response['data'];
        // final Map<String, dynamic> userMap = response['data'];

        print("users userMap: $users");
        print("users runtimeType: ${users.runtimeType}");

        return (users).map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch user: ${response['message'] ?? response}');
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<UserModel?>?> getUserList({int limit = 10}) async {
    try {
      final userModel = await getCurrentUser();
      // Defensive null check for position and geopoint list
      final geopoint = userModel.position?.geopoint;
      if (geopoint == null || geopoint.length < 2) {
        logger.e("User position or geopoint is null or incomplete");
        return [];
      }
      String query = "lng=${geopoint[0]}&lat=${geopoint[1]}&distance=50000000&userId=${userModel.id}";
      final response = await httpTemplate.get("/users/near/?$query");
      print("users runtimeType: ${response["data"].runtimeType}");
      print("users runtimeType: ${response["data"]}");

      if (response.containsKey('data') && response['data'] is List<dynamic>) {
        final List<dynamic> users = response['data'];
        print("users userMap: $users");
        print("users runtimeType: ${users.runtimeType}");
        return users
            .map((e) {
              print("users runtimeType: ${e.runtimeType}");
              // Defensive: Only parse if e is Map<String, dynamic> and has required fields
              if (e is Map<String, dynamic> && e['id'] != null && e['id'] is String) {
                return UserModel.fromJson(e);
              } else {
                logger.e("Skipping invalid user entry: $e");
                return null;
              }
            })
            .where((e) => e != null)
            .toList();
      } else {
        throw Exception('Failed to fetch user: ${response['message'] ?? response}');
      }
    } catch (e, st) {
      logger.e("Error fetching user list: $e $st");
      return [];
    }
  }

  Future<List<UserModel?>?> getFilterList({
    required Map<String, dynamic> filters,
    int limit = 20,
  }) async {
    print("getFilterList filters: $filters");
    // final userCollectionRef = userCollection();
    // final currentUser = ref.read(ProfileController.userControllerProvider).userModel!;

    // final center = GeoPoint(
    //   currentUser.position!.geopoint.latitude,
    //   currentUser.position!.geopoint.longitude,
    // );

    // final geoCollection = GeoCollectionReference<UserModel?>(userCollectionRef);

    // final double radius =
    //     filters['distance'] != null && filters['distance'] > 0 ? filters['distance'].toDouble() : 100000.0;

    // Query<UserModel?> queryBuilder(Query<UserModel?> query) {
    //   if (filters['hasPhotos'] == true) {
    //     query = query.where('profileUrl', isNotEqualTo: null);
    //   }

    //   if (filters['hasAlbums'] == true) {
    //     query = query.where('albumUrl', isGreaterThan: []); // non-empty list
    //   }

    //   // Age range (client-verified after fetch)
    //   if (filters['ageRange'] != null) {
    //     final parts = filters['ageRange'].toString().split('-');
    //     final minAge = int.tryParse(parts[0].trim()) ?? 18;
    //     final maxAge = int.tryParse(parts[1].replaceAll(RegExp(r'[^\d]'), '').trim()) ?? 99;

    //     query = query.where('age', isGreaterThanOrEqualTo: minAge).where('age', isLessThanOrEqualTo: maxAge);
    //   }

    //   if (filters['position'] != null && filters['position'].toString().isNotEmpty) {
    //     query = query.where('role', isEqualTo: _mapPositionToRole(filters['position']));
    //   }

    //   if (filters['language'] != null && filters['language'].toString().isNotEmpty) {
    //     query = query.where('lived', isEqualTo: filters['language']);
    //   }

    //   if (filters['lastSeen'] == 'Online now') {
    //     query = query.where('isOnline', isEqualTo: true);
    //   }

    //   return query.limit(limit);
    // }

    // final snapshots = await geoCollection.fetchWithin(
    //   center: GeoFirePoint(center),
    //   radiusInKm: radius,
    //   field: "position",
    //   queryBuilder: queryBuilder,
    //   geopointFrom: geopointFrom,
    // );

    // final rawUserList = snapshots.map((doc) => doc.data()).whereType<UserModel?>().toList();

    // final filteredList = rawUserList.where((user) {
    //   if (user == null) return false;
    //   if (currentUser.blockList.contains(user.id)) return false;

    //   // Height range
    //   if (filters['heightRange'] != null && filters['heightRange'].toString().isNotEmpty) {
    //     if (!matchesHeightRange(user.height, filters['heightRange'])) return false;
    //   }

    //   // Weight range
    //   if (filters['weightRange'] != null && filters['weightRange'].toString().isNotEmpty) {
    //     if (!matchesWeightRange(user.weight, filters['weightRange'])) return false;
    //   }

    //   // Simulated face photo check (can be replaced with a real field if added)
    //   if (filters['hasFacePics'] == true && user.profileUrl == null) return false;

    //   // Interests (not in model currently — will skip unless added)
    //   if (filters['interests'] != null && filters['interests'].isNotEmpty) {
    //     // Assuming you store interests in a list field like `interests`
    //     final userInterests = <String>[]; // Replace with real user field if added
    //     final List<String> selectedInterests = List<String>.from(filters['interests']);
    //     if (!selectedInterests.any((tag) => userInterests.contains(tag))) return false;
    //   }

    //   return true;
    // }).toList();

    // return filteredList;
    return [];
  }

  Future<UserModel?> getUserById(String id) async {
    final user = await httpTemplate.get("/users/$id");
    return UserModel.fromJson(user['data']);
    // return users;
  }

  Future<void> addToBlockList({required String id, required int cubeId}) async {}

  Future removeToBlockList({required String id, required int cubeId}) async {}

  Future<List<UserModel?>> getBlockList() async {
    return [];
  }

  Future<String> updateImage(String path) async {
    final value = await ref
        .read(Dependency.firebaseStorageProvider)
        .ref("image")
        .child(DateTime.now().microsecondsSinceEpoch.toString())
        .putFile(File(path));

    final image = await value.ref.getDownloadURL();
    return image;
  }

  Future<List<UserModel?>?> searchUser(String query) async {
    // final usercollection = userCollection();

    // final docs = usercollection.where("username", isGreaterThanOrEqualTo: query).get();

    // final data = await docs.then((value) => value.docs.map((e) => e.data()).toList());

    // logger.i(data.length);
    // return data;
    return [];
  }

  Future<void> addUserToFavorite(String id) async {
    // final userCollection = FirebaseFirestore.instance.collection('users');
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    final response = await httpTemplate.post("/users/$currentUserId/favorite/$id");

    // if (currentUserId != null) {
    //   await userCollection.doc(currentUserId).update({
    //     "favoriteList": FieldValue.arrayUnion([id]),
    //   });
    // }
  }

  Future<void> removeUserFromFavorite(String id) async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    final response = await httpTemplate.delete("/users/$currentUserId/favorite/$id");
  }
}

String _mapPositionToRole(String position) {
  switch (position.toLowerCase()) {
    case 'top':
      return Role.top.value;
    case 'vers top':
      return Role.versTop.value;
    case 'versatile':
      return Role.versatile.value;
    case 'vers bottom':
      return Role.versBottom.value;
    case 'bottom':
      return Role.bottom.value;

    default:
      return Role.doNotShow.name;
  }
}

bool matchesHeightRange(String? heightStr, String range) {
  if (heightStr == null) return false;
  final heightCm = double.tryParse(heightStr.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;

  switch (range) {
    case '< 5\'5"':
      return heightCm < 165;
    case '5\'5" - 5\'10"':
      return heightCm >= 165 && heightCm <= 178;
    case '5\'11" - 6\'2"':
      return heightCm >= 180 && heightCm <= 188;
    case '6\'3" and above':
      return heightCm > 190;
    default:
      return true;
  }
}

bool matchesWeightRange(String? weightStr, String range) {
  if (weightStr == null) return false;
  final weightKg = double.tryParse(weightStr.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;

  switch (range) {
    case '< 60kg':
      return weightKg < 60;
    case '60 - 75kg':
      return weightKg >= 60 && weightKg <= 75;
    case '76 - 90kg':
      return weightKg > 75 && weightKg <= 90;
    case '90kg+':
      return weightKg > 90;
    default:
      return true;
  }
}

// GeoPoint geopointFrom(UserModel? data) => data!.position!.geopoint;

Map<String, dynamic> _normalizeUserMap(Map<String, dynamic> userMap) {
  // Map backend camelCase values to display values expected by the enums
  const mapping = {
    "doNotShow": "Do not show",
    "top": "Top",
    "versTop": "Vers Top",
    "versatile": "Versatile",
    "versBottom": "Vers Bottom",
    "bottom": "Bottom",
    // Add more mappings for other enums if needed
  };

  for (final key in ['role', 'bodyType', 'relationshipStatus', 'ethnicity', 'lookingFor', 'whereToMeet']) {
    if (userMap[key] != null && mapping.containsKey(userMap[key])) {
      userMap[key] = mapping[userMap[key]];
    }
  }
  return userMap;
}
