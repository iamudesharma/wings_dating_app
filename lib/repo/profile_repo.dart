import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
    return ref
        .read(Dependency.firebaseStoreProvider)
        .collection("users")
        .withConverter<UserModel>(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson());
  }

  Future<void> createUserDoc(UserModel userModel) async {
    final usercollection = userCollection();
    await usercollection
        .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
        .set(userModel);
  }

  Future<UserModel> getCurrentUser() async {
    final usercollection = userCollection();

    return await exceptionHandler<UserModel>(
      usercollection
          .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
          .get()
          .then((value) {
        return value.data()!;
      }),
    );
  }

  Future<bool> checkUserDocExist() async {
    final data = await ref
        .read(Dependency.firebaseStoreProvider)
        .collection("users")
        .doc(ref.read(Dependency.firebaseAuthProvider).currentUser?.uid)
        .get();

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
      usercollection
          .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
          .update(userModel.toJson())
          .onError((error, stackTrace) => logger.e(error)),
    );
  }

  Future<void> updateLocation(dynamic pointData) async {
    logger.e(pointData);
    final usercollection = userCollection();

    await exceptionHandler<void>(
      usercollection
          .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
          .update(
        {
          "position": pointData,
        },
      ),
    );
  }

  Future<List<UserModel>?>? getUserList() async {
    final geo = GeoFlutterFire();

    final userModel =
        ref.read(ProfileController.userControllerProvider).userModel!;

    logger.i(userModel.position);
    GeoFirePoint center = geo.point(
      latitude: userModel.position!.geopoint.latitude,
      longitude: userModel.position!.geopoint.longitude,
    );
    // GeoFi
    //rePoint center = geo.point(latitude: 19.075983, longitude: 72.877678);

    // GeoFirePoint center = geo.point(latitude: 12.960632, longitude: 77.641603);
    // logger.w(center.geoPoint);
    // logger.w(center.data);

    // final usercollection = userCollection();
    final firestore = FirebaseFirestore.instance;
    // usercollection.snapshots().where((event) => event.);
    final data =
        geo.collection(collectionRef: firestore.collection("users")).within(
              center: center,
              radius: 150,
              field: "position",
              // strictMode: true,
              strictMode: true,
            );

    final userListRaw = await data.first;
    //   return event.map((e) => UserModel.fromJson(e.data() as dynamic)).toList();
    // });
    logger.i(userListRaw.length);

    logger.i(userListRaw[0].data());

    final users = userListRaw
        .map((e) => UserModel.fromJson(e.data() as dynamic))
        .toList();

    users.removeWhere((element) {
      return userModel.blockList.contains(element.id) ||
          element.id == userModel.id;
    });

    return users;
  }

  Future<void> saveUserLocationData(
      String UserId, String Username, String imgae) async {}

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
        .get();

    logger.e(data.docs.length);
    final users = data.docs.first.data();

    logger.w(users);
    return users;
  }

  Future<void> addToBlockList({required String id}) async {
    final usercollection = userCollection();

    await usercollection
        .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
        .update({
      "blockList": FieldValue.arrayUnion([id])
    });
  }

  void removeToBlockList({required List<String> id}) async {
    final usercollection = userCollection();

    await usercollection
        .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
        .update({"blockList": FieldValue.arrayRemove(id)});
  }

  Future<List<UserModel?>> getBlockList() async {
    final usercollection = userCollection();

    final data = await usercollection
        .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
        .get();

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

    final docs = usercollection.where("username", isEqualTo: query).get();

    final data =
        await docs.then((value) => value.docs.map((e) => e.data()).toList());

    logger.i(data.length);
    return data;
  }
}
