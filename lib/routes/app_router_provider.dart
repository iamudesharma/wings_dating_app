// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/helpers/app_notification.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

import 'package:wings_dating_app/routes/app_router.dart';

import '../const/pref_util.dart';
import '../repo/profile_repo.dart';
import '../src/profile/controller/profile_controller.dart';

part 'app_router_provider.g.dart';

@Riverpod(keepAlive: true)
AppRouter appRoute(Ref ref) {
  return AppRouter(ref
      // profileDocGuard: ProfileDocGuard(ref: ref),
      );
}

class AuthGuard extends AutoRouteGuard {
  final Ref ref;
  AuthGuard({
    required this.ref,
  });
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      if (await ref.read(profileRepoProvider).checkUserDocExist()) {
        logger.i('user doc exist');

        await ref.read(ProfileController.userControllerProvider).getCurrentUser();
        // await ref.read(profileRepoProvider).isUserOnline(true);

        // final userModel = await SharedPrefs.instance.init();
        resolver.next(true);
      } else {
        resolver.next(false);

        logger.e('user doc not exist');
        router.push(EditProfileRoute(isEditProfile: false));
      }

      //  customerController.getCustomerData();
    } else {
      resolver.next(false);

      router.push(const SignOptionsRoute());
    }
  }
}
