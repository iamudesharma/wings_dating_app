import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/dependency/dependenies.dart';
import 'package:wings_dating_app/helpers/firebase_constants.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/repo/repo_exception.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

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
    final data = await exceptionHandler<bool>(
      ref
          .read(Dependency.firebaseStoreProvider)
          .collection("users")
          .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
          .get()
          .then(
        (value) {
          if (value.exists) {
            logger.i('User doc exist');
            return true;
          } else {
            logger.i('User doc does not exist');

            return false;
          }
        },
      ),
    );

    return data;
  }

  Future<void> updateUserDoc(UserModel userModel) async {
    final usercollection = userCollection();
    await exceptionHandler<void>(
      usercollection
          .doc(ref.read(Dependency.firebaseAuthProvider).currentUser!.uid)
          .update(
            userModel.toJson(),
          ),
    );
  }
}
