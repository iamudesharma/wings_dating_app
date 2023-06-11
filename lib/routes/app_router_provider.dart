// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/helpers/app_notification.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

import 'package:wings_dating_app/routes/app_router.dart';

import '../const/pref_util.dart';
import '../repo/profile_repo.dart';
import '../src/profile/controller/profile_controller.dart';

part 'app_router_provider.g.dart';

final chat = CubeChatConnection.instance;

@Riverpod(keepAlive: true)
AppRouter appRoute(AppRouteRef ref) {
  return AppRouter(
    ref,
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
      print(auth.currentUser != null);
      if (await ref.read(profileRepoProvider).checkUserDocExist()) {
        logger.i('user doc exist');

        await ref
            .read(ProfileController.userControllerProvider)
            .getCurrentUser();
        await ref.read(profileRepoProvider).isUserOnline(true);

        final userModel = await SharedPrefs.instance.init();

        if (CubeSessionManager.instance.isActiveSessionValid()) {
          chat.markInactive();
          // chat.login(userModel.);
          // resolver.next(true);
        } else {
          _loginToCC(
              resolver: resolver,
              userModel.getUser() ??
                  ref
                      .read(ProfileController.userControllerProvider)
                      .userModel!
                      .cubeUser);
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

void _processLoginError(exception) {
  log(
    "Login error $exception",
  );
}

_loginToCC(CubeUser user,
    {bool saveUser = true, required NavigationResolver resolver}) {
  CubeUser cubeuser = CubeUser(login: user.login, password: user.password);

  createSession(cubeuser).then((cubeSession) async {
    print("createSession cubeSession: $cubeSession");

    resolver.next(true);

    _loginToCubeChat(user);

    if (saveUser) {
      SharedPrefs.instance.init().then((sharedPrefs) {
        sharedPrefs.saveNewUser(user);
      });
    }
  }).catchError((error) {
    _processLoginError(error);

    resolver.next(true);
  });
}

_loginToCubeChat(CubeUser user) {
  print("_loginToCubeChat user $user");
  CubeChatConnectionSettings.instance.totalReconnections = 0;
  CubeChatConnection.instance.login(user).then((cubeUser) {
    // _isLoginContinues = false;

    // if (!kIsWeb) {
    PushNotificationsManager.instance.init();
    // }
    // _goDialogScreen(context, cubeUser);
  }).catchError((error) {
    _processLoginError(error);
  });
}
