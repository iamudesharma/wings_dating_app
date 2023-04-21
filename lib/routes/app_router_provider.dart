// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/firebase_options.dart';
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

    SharedPrefs? prefs = await SharedPrefs.instance.init();

    // var customerController = ref.read(profileControllerProvider);
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
          _loginToCC(userModel.getUser()!);

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

_loginToCC(CubeUser user, {bool saveUser = false}) {
  print("_loginToCC user: $user");
  // if (_isLoginContinues) return;
  // setState(() {
  //   _isLoginContinues = true;
  // });

  createSession(user).then((cubeSession) async {
    print("createSession cubeSession: $cubeSession");
    var tempUser = user;
    user = cubeSession.user!..password = tempUser.password;
    if (saveUser) {
      SharedPrefs.instance.init().then((sharedPrefs) {
        sharedPrefs.saveNewUser(user);
      });
    }

    if (Platform.isIOS) {
      _loginToCubeChat(user);
    }
  }).catchError((error) {
    _processLoginError(error);
  });
}

_loginToCubeChat(CubeUser user) {
  print("_loginToCubeChat user $user");
  CubeChatConnectionSettings.instance.totalReconnections = 0;
  CubeChatConnection.instance.login(user).then((cubeUser) {
    // _isLoginContinues = false;
    // _goDialogScreen(context, cubeUser);
  }).catchError((error) {
    _processLoginError(error);
  });
}




// _loginToCC(CubeUser user, {bool saveUser = false}) async {
//   print("_loginToCC user: $user");

//   var token = await FirebaseAuth.instance.currentUser?.getIdToken();

//   //
//   createSessionUsingFirebase(
//           DefaultFirebaseOptions.currentPlatform.projectId, token!)
//       .then((cubeSession) async {
//     print("createSession cubeSession: $cubeSession");
//     // var tempUser = user;
//     // user = cubeSession.user!..password = tempUser.password;
//     // if (saveUser) {
//     //   final saved = _saveUserInIsolate(user);
//     //   print("User saved: $saved");
//     // }

//     // chat.login(user);

//     // if (!Platform.isIOS) {
//     //   PushNotificationsManager.instance.
//     // }
//   }).catchError((error) {
//     _processLoginError(error);
//   });
// }

// Future<bool> _saveUserInIsolate(CubeUser user) async {
//   final completer = Completer<bool>();
//   final receivePort = ReceivePort();
//   Isolate.spawn(_saveUser, [user, receivePort.sendPort]);
//   receivePort.listen((message) {
//     if (message is bool) {
//       completer.complete(message);
//     }
//   });
//   return completer.future;
// }

// void _saveUser(List<dynamic> args) async {
//   final user = args[0] as CubeUser;
//   final sendPort = args[1] as SendPort;
//   final saved = await SharedPrefs.instance.init().then((sharedPrefs) async {
//     await sharedPrefs.saveNewUser(user);
//     return true;
//   }).catchError((error) {
//     print("Error saving user in isolate: $error");
//     return false;
//   });
//   sendPort.send(saved);
// }
