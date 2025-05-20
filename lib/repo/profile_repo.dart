import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/const/pref_util.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/repo/repo_exception.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

import '../helpers/extra_data.dart';

part 'profile_repo.g.dart';

@riverpod
ProfileRepo profileRepo(ProfileRepoRef ref) {
  return ProfileRepo(ref);
}

class ProfileRepo with RepositoryExceptionMixin {
  final Ref ref;

  ProfileRepo(this.ref);

  CollectionReference<UserModel> userCollection() {
    final data = ref.read(Dependency.firebaseStoreProvider).collection("users").withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );

    return data;
  }

  Future<void> createUserDoc(UserModel userModel) async {
    final usercollection = userCollection();
    await usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).set(userModel);
  }

  // Future<void> updateUserDoc(UserModel userModel) async {
  //   final usercollection = userCollection();
  //   await usercollection
  //       .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
  //       .update(userModel.toJson());
  // }

  Future<UserModel> getCurrentUser() async {
    final usercollection = userCollection();

    var userModels = SharedPrefs.instance.getUsers();
    if (userModels != null) {
      return userModels;
    }
    return await exceptionHandler<UserModel>(
      usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).get().then((value) {
        SharedPrefs.instance.updateUser(value.data()!);
        return value.data()!;
      }),
    );
  }

  Future<bool> checkUserDocExist() async {
    final data = await userCollection().doc(FirebaseAuth.instance.currentUser!.uid).get();
    print("data${data.id}");
    if (data.exists) {
      logger.i('User doc exist');
      return true;
    } else {
      logger.i('User doc does not exist');
      return false;
    }
  }

  Future<void> updateUserDoc(UserModel userModel) async {
    final usercollection = userCollection();
    await exceptionHandler<void>(
        usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).update(userModel.toJson()));

    await SharedPrefs.instance.updateUser(userModel);
  }

  Future<void> updateLocation(dynamic pointData) async {
    logger.e(pointData);
    final usercollection = userCollection();

    await exceptionHandler<void>(
      usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).update(
        {
          "position": pointData,
        },
      ),
    );
  }

  Future<List<UserModel?>?> getUserListBySearch({int limit = 10, required GeoPoint geoPoint}) async {
    final usercollection = userCollection();

    final userModel = ref.read(ProfileController.userControllerProvider).userModel!;

    final Future<List<DocumentSnapshot<UserModel?>>> stream = GeoCollectionReference<UserModel?>(usercollection)
        .fetchWithin(
            center: GeoFirePoint(geoPoint),
            radiusInKm: 1000,
            field: "position",
            isCacheFirst: true,
            queryBuilder: (query) => query.limit(limit),
            geopointFrom: geopointFrom);

    final userDoc = await stream;

    final userListRaw = userDoc.map((event) {
      return event.data();
    }).toList()
      ..removeWhere((element) => userModel.blockList.contains(element!.id));

    return userListRaw;
  }

  Future<List<UserModel?>?> getUserList({int limit = 10}) async {
    final usercollection = userCollection();

    final userModel = ref.read(ProfileController.userControllerProvider).userModel!;

    GeoPoint center = GeoPoint(
      userModel.position!.geopoint.latitude,
      userModel.position!.geopoint.longitude,
    );

    final Future<List<DocumentSnapshot<UserModel?>>> stream =
        GeoCollectionReference<UserModel?>(usercollection).fetchWithin(
            center: GeoFirePoint(center),
            radiusInKm: 1000000,
            field: "position",
            // asBroadcastStream: true,
            // strictMode: true,
            queryBuilder: (query) => query.limit(20),
            geopointFrom: geopointFrom);

    final userDoc = await stream;

    final userListRaw = userDoc.map((event) {
      return event.data();
    }).toList()
      ..removeWhere((element) => userModel.blockList.contains(element!.id));

    return userListRaw;
  }

  Future<List<UserModel?>?> getFilterList({
    required Map<String, dynamic> filters,
    int limit = 20,
  }) async {
    final userCollectionRef = userCollection();
    final currentUser = ref.read(ProfileController.userControllerProvider).userModel!;

    final center = GeoPoint(
      currentUser.position!.geopoint.latitude,
      currentUser.position!.geopoint.longitude,
    );

    final geoCollection = GeoCollectionReference<UserModel?>(userCollectionRef);

    final double radius =
        filters['distance'] != null && filters['distance'] > 0 ? filters['distance'].toDouble() : 100000.0;

    Query<UserModel?> queryBuilder(Query<UserModel?> query) {
      if (filters['hasPhotos'] == true) {
        query = query.where('profileUrl', isNotEqualTo: null);
      }

      if (filters['hasAlbums'] == true) {
        query = query.where('albumUrl', isGreaterThan: []); // non-empty list
      }

      // Age range (client-verified after fetch)
      if (filters['ageRange'] != null) {
        final parts = filters['ageRange'].toString().split('-');
        final minAge = int.tryParse(parts[0].trim()) ?? 18;
        final maxAge = int.tryParse(parts[1].replaceAll(RegExp(r'[^\d]'), '').trim()) ?? 99;

        query = query.where('age', isGreaterThanOrEqualTo: minAge).where('age', isLessThanOrEqualTo: maxAge);
      }

      if (filters['position'] != null && filters['position'].toString().isNotEmpty) {
        query = query.where('role', isEqualTo: _mapPositionToRole(filters['position']));
      }

      if (filters['language'] != null && filters['language'].toString().isNotEmpty) {
        query = query.where('lived', isEqualTo: filters['language']);
      }

      if (filters['lastSeen'] == 'Online now') {
        query = query.where('isOnline', isEqualTo: true);
      }

      return query.limit(limit);
    }

    final snapshots = await geoCollection.fetchWithin(
      center: GeoFirePoint(center),
      radiusInKm: radius,
      field: "position",
      queryBuilder: queryBuilder,
      geopointFrom: geopointFrom,
    );

    final rawUserList = snapshots.map((doc) => doc.data()).whereType<UserModel?>().toList();

    final filteredList = rawUserList.where((user) {
      if (user == null) return false;
      if (currentUser.blockList.contains(user.id)) return false;

      // Height range
      if (filters['heightRange'] != null && filters['heightRange'].toString().isNotEmpty) {
        if (!matchesHeightRange(user.height, filters['heightRange'])) return false;
      }

      // Weight range
      if (filters['weightRange'] != null && filters['weightRange'].toString().isNotEmpty) {
        if (!matchesWeightRange(user.weight, filters['weightRange'])) return false;
      }

      // Simulated face photo check (can be replaced with a real field if added)
      if (filters['hasFacePics'] == true && user.profileUrl == null) return false;

      // Interests (not in model currently — will skip unless added)
      if (filters['interests'] != null && filters['interests'].isNotEmpty) {
        // Assuming you store interests in a list field like `interests`
        final userInterests = <String>[]; // Replace with real user field if added
        final List<String> selectedInterests = List<String>.from(filters['interests']);
        if (!selectedInterests.any((tag) => userInterests.contains(tag))) return false;
      }

      return true;
    }).toList();

    return filteredList;
  }

  Future<void> saveUserLocationData(String UserId, String Username, String imgae) async {}

  Future makeOnline(String userId, bool isOnline) async {
    final usercollection = userCollection();

    usercollection.doc(userId).update({
      "isOnline": isOnline,
    });
  }

  Future<UserModel?> getUserById(String id) async {
    final usercollection = userCollection();

    logger.w(id);

    final data = await usercollection
        .where(
          "id",
          isEqualTo: id,
        )
        .limit(1)
        .get();

    final users = data.docs.first.data();

    return users;
  }

  Future<UserModel?> getUserByCubeId(int id) async {
    final usercollection = userCollection();

    logger.w(id);

    final data = await usercollection
        .where(
          "cubeUser.id",
          isEqualTo: id,
        )
        .limit(1)
        .get();

    final users = data.docs.first.data();

    return users;
  }

  Future<void> addToBlockList({required String id, required int cubeId}) async {
    // final usercollection = userCollection();

    // var listName = 'blockList';

    // var items = [
    //   CubePrivacyListItem(cubeId, CubePrivacyAction.deny, isMutual: true),
    // ];

    // CubeChatConnection.instance.privacyListsManager?.createList(listName, items).then((users) {
    //   // privacy list created
    // }).catchError((exception) {
    //   // error occurred during creation privacy list
    // });

    // await usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).update({
    //   "blockList": FieldValue.arrayUnion([id])
    // });
    // ref.read(ProfileController.userControllerProvider.notifier).userModel!.blockList.add(id);
  }

  Future removeToBlockList({required String id, required int cubeId}) async {
    // try {
    //   final usercollection = userCollection();

    //   var listName = 'blockList';

    //   var items = [
    //     CubePrivacyListItem(cubeId, CubePrivacyAction.deny, isMutual: true),
    //   ];

    //   CubeChatConnection.instance.privacyListsManager
    //       ?.declineDefaultList()
    //       .then((voidResult) => CubeChatConnection.instance.privacyListsManager?.createList(listName, items))
    //       .then((list) => CubeChatConnection.instance.privacyListsManager?.setDefaultList(listName))
    //       .then((updatedList) {});

    //   await usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).update({
    //     "blockList": FieldValue.arrayRemove(
    //       [id],
    //     ),
    //   });
    // } catch (e) {
    //   throw e;
    // }
  }

  Future<List<UserModel?>> getBlockList() async {
    final usercollection = userCollection();

    final data = await usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).get();

    final userList = await data.get("blockList");

    logger.w(userList);

    if (userList.isEmpty) {
      return [];
    } else {
      final id = await usercollection.where("id", whereIn: userList).get();

      logger.w(id.docs.length);
      final users = id.docs.map((e) => e.data()).toList();
      logger.w(users);

      if (users.isEmpty) {
        return [];
      }
      return users;
    }
  }

  Future<bool> isUserOnline(bool isOnline) async {
    final usercollection = userCollection();

    await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).update({
      "isOnline": isOnline,
    });

    return isOnline;
  }

  Future updateImage(String path) async {
    final usercollection = userCollection();

    await ref
        .read(Dependency.firebaseStorageProvider)
        .ref("image")
        .child(DateTime.now().microsecondsSinceEpoch.toString())
        .putFile(File(path))
        .then((value) async {
      usercollection
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"profileUrl": await value.ref.getDownloadURL()});
    });
  }

  Future<List<UserModel?>?> searchUser(String query) async {
    final usercollection = userCollection();

    final docs = usercollection.where("username", isGreaterThanOrEqualTo: query).get();

    final data = await docs.then((value) => value.docs.map((e) => e.data()).toList());

    logger.i(data.length);
    return data;
  }

  Future<void> addUserToFavorite(String id) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    if (currentUserId != null) {
      await userCollection.doc(currentUserId).update({
        "favoriteList": FieldValue.arrayUnion([id]),
      });
    }
  }

  Future<void> removeUserFromFavorite(String id) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    if (currentUserId != null) {
      await userCollection.doc(currentUserId).update({
        "favoriteList": FieldValue.arrayRemove([id]),
      });
    }
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
      return Role.doNotShow.value;
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

GeoPoint geopointFrom(UserModel? data) => data!.position!.geopoint;
