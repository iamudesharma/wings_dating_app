// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

import 'package:wings_dating_app/routes/app_router.dart';

import '../const/pref_util.dart';
import '../helpers/app_notification.dart';
import '../repo/profile_repo.dart';
import '../src/profile/controller/profile_controller.dart';

part 'app_router_provider.g.dart';

final chat = CubeChatConnection.instance;

@Riverpod(keepAlive: true)
AppRouter appRoute(AppRouteRef ref) {
  return AppRouter(ref);
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    SharedPrefs? prefs = await SharedPrefs.instance.init();

    // var customerController = ref.read(profileControllerProvider);
    if (auth.currentUser != null) {
      if (await ProfileRepo.checkUserDocExist()) {
        logger.i('user doc exist');

        // await ref
        //     .read(ProfileController.userControllerProvider)
        //     .getCurrentUser();
        // await ref.read(profileRepoProvider).isUserOnline(true);

        // final userModel =
        //     ref.read(ProfileController.userControllerProvider).userModel;
        final user = await SharedPrefs.instance.getUser();

        if (CubeSessionManager.instance.isActiveSessionValid()) {
          if (!chat.isAuthenticated()) {
            await chat.login(user!);

            resolver.next(true);
          } else {
            resolver.next(true);
          }
        } else {
          await _loginToCC(user!, saveUser: true);

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

Future<void> _loginToCC(CubeUser user, {bool saveUser = false}) async {
  await createSession(user).then((cubeSession) async {
    var tempUser = user;
    user = cubeSession.user!..password = tempUser.password;
    if (saveUser) {
      if (!kIsWeb) {
        final saved = await _saveUserInIsolate(user);
      } else {
        SharedPrefs.instance.saveNewUser(user);
      }
    }

    await chat.login(user);

    if (Platform.isAndroid) {
      PushNotificationsManager.instance.init();
    }
  }).catchError((error) {
    _processLoginError(error);
  });
}

Future<bool> _saveUserInIsolate(CubeUser user) async {
  final completer = Completer<bool>();
  final receivePort = ReceivePort();
  Isolate.spawn(_saveUser, [user, receivePort.sendPort]);
  receivePort.listen((message) {
    if (message is bool) {
      completer.complete(message);
    }
  });
  return completer.future;
}

void _saveUser(List<dynamic> args) async {
  final user = args[0] as CubeUser;
  final sendPort = args[1] as SendPort;
  final saved = await SharedPrefs.instance.init().then((sharedPrefs) async {
    await sharedPrefs.saveNewUser(user);
    return true;
  }).catchError((error) {
    return false;
  });
  sendPort.send(saved);
}
