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

  Future<void> createUserDoc(UserModel userModel) async {
    await exceptionHandler(ref
        .read(Dependency.firebaseStoreProvider)
        .collection(FirebaseConstants.USERS)
        .doc(userModel.nickname)
        .set(userModel.toJson()));
  }

  Future<bool> checkUserDocExist() async {
    final data = await exceptionHandler<bool>(
      ref
          .read(Dependency.firebaseStoreProvider)
          .collection(FirebaseConstants.USERS)
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
}
