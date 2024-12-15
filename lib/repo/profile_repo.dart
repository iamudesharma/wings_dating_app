import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/const/pref_util.dart';
import 'package:wings_dating_app/dependency/dependenies.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/repo/repo_exception.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

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

    return await exceptionHandler<UserModel>(
      usercollection.doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid).get().then((value) {
        return value.data()!;
      }),
    );
  }

  Future<bool> checkUserDocExist() async {
    final data = await userCollection().doc(FirebaseAuth.instance.currentUser!.uid).get();

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

  Stream<List<UserModel?>?> getUserList({int limit = 10}) {
    final usercollection = userCollection();

    final userModel = ref.read(ProfileController.userControllerProvider).userModel!;

    logger.i(userModel.position);
    GeoPoint center = GeoPoint(
      userModel.position!.geopoint.latitude,
      userModel.position!.geopoint.longitude,
    );

    final Stream<List<DocumentSnapshot<UserModel?>>> stream =
        GeoCollectionReference<UserModel?>(usercollection).subscribeWithin(
            center: GeoFirePoint(center),
            radiusInKm: 1000000,
            field: "position",
            asBroadcastStream: true,
            // strictMode: true,
            queryBuilder: (query) => query.limit(20),
            geopointFrom: geopointFrom);

    final userListRaw = stream.map((event) {
      logger.i(event.length);

      return event.map((e) {
        return e.data();
      }).toList()
        ..removeWhere((element) => userModel.blockList.contains(element!.id));
    });

    return userListRaw;

    // logger.i(userListRaw.length);

    // logger.i(userListRaw[0].data());

    // final users = userListRaw
    //     .map(
    //       (e) => e.data(),
    //     )
    //     .toList();

    // logger.v(users);
    // print(users.length);
    // print(users.first);

    // return users;
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
}

GeoPoint geopointFrom(UserModel? data) => data!.position!.geopoint;
