// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

import 'package:wings_dating_app/routes/app_router.dart';

import '../const/pref_util.dart';
import '../helpers/app_notification.dart';
import '../repo/profile_repo.dart';
import '../src/profile/controller/profile_controller.dart';

part 'app_router_provider.g.dart';

@Riverpod(keepAlive: true)
AppRouter appRoute(AppRouteRef ref) {
  return AppRouter(
    authGuard: AuthGuard(ref: ref),
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

    SharedPrefs? prefs = await SharedPrefs.instance.init();

    // var customerController = ref.read(profileControllerProvider);
    if (auth.currentUser != null) {
      print(auth.currentUser != null);
      if (await ref.read(profileRepoProvider).checkUserDocExist()) {
        logger.i('user doc exist');

        await ref
            .read(ProfileController.userControllerProvider)
            .getCurrentUser();

        final userModel =
            ref.read(ProfileController.userControllerProvider).userModel;

        if (CubeSessionManager.instance.isActiveSessionValid()) {
          if (!CubeChatConnection.instance.isAuthenticated()) {
            await SharedPrefs.instance.saveNewUser(userModel!.cubeUser);

            await CubeChatConnection.instance.login(userModel.cubeUser);

            resolver.next(true);
          } else {
            resolver.next(true);
          }
        } else {
          await _loginToCC(userModel!.cubeUser, saveUser: true);

          resolver.next(true);
        }
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

Future<void> _loginToCC(CubeUser user, {bool saveUser = false}) async {
  print("_loginToCC user: $user");

  await createSession(user).then((cubeSession) async {
    print("createSession cubeSession: $cubeSession");
    var tempUser = user;
    user = cubeSession.user!..password = tempUser.password;
    if (saveUser) {
      SharedPrefs.instance.init().then((sharedPrefs) async {
        await sharedPrefs.saveNewUser(user);
      });
    }

    await _loginToCubeChat(user);

    if (!Platform.isIOS) {
      PushNotificationsManager.instance.init();
    }
  }).catchError((error) {
    _processLoginError(error);
  });
}

Future<void> _loginToCubeChat(CubeUser user) async {
  print("_loginToCubeChat user $user");
  CubeChatConnectionSettings.instance.totalReconnections = 0;
  await CubeChatConnection.instance.login(user).then((cubeUser) async {
    await CubeChatConnection.instance
        .subscribeToUserLastActivityStatus(user.id!);
  }).catchError((error) {
    _processLoginError(error);
  });
}

void _processLoginError(exception) {
  log(
    "Login error $exception",
  );
}
