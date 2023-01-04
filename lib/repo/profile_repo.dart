import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/dependency/dependenies.dart';
import 'package:wings_dating_app/helpers/firebase_constants.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/repo/repo_exception.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

import '../src/model/geo_point_data.dart';

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
    usercollection
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
          .update(
            userModel.toJson(),
          )
          .onError((error, stackTrace) => logger.e(error)),
    );
  }

  Future<void> addLocation(GeoPointData pointData) async {
    final usercollection = userCollection();
    await exceptionHandler<void>(
      usercollection
          .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
          .update(
        {"position": pointData.toJson()},
      ),
    );
  }

  Future<List<UserModel>?>? getUserList() async {
    final geo = GeoFlutterFire();

    GeoFirePoint center = geo.point(latitude: 19.9132, longitude: 72.623603);
    // GeoFirePoint center = geo.point(latitude: 19.075983, longitude: 72.877678);

    logger.w(center.geoPoint);
    logger.w(center.data);

    // final usercollection = userCollection();
    final _firestore = FirebaseFirestore.instance;
    // usercollection.snapshots().where((event) => event.);
    final data = geo
        .collection(
          collectionRef: _firestore.collection("users"),
        )
        .within(
          center: center,
          radius: 10000,
          field: "position",
          strictMode: true,
        );

    data.listen((event) {
      logger.i(event.length);
      logger.i(event.first.exists);
      logger.i(event.first.data());
      logger.i(event.first.exists);
      logger.i(event[0].data());
      // logger.i(event[2].data());
      // logger.i(event[3].data());
    });

    await data.first.then((value) {
      value.forEach((element) {
        logger.i(element.data);
      });
    }).catchError((e) {
      logger.e(e);
    });
  }

  Future<void> saveUserLocationData(
      String UserId, String Username, String imgae) async {}
}
