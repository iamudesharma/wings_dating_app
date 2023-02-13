// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wings_dating_app/routes/app_router.dart';

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
    // var customerController = ref.read(profileControllerProvider);
    if (auth.currentUser != null) {
      print(auth.currentUser != null);
      if (await ref.read(profileRepoProvider).checkUserDocExist()) {
        print('user doc exist');

        // String initialRoute =

        //   ? PAGE_HOME
        //   : PAGE_PHONE_CALL;

        // if (NotificationsController.initialCallAction == null) {

        // } else {
        //   resolver.next(false);

        //   router.push(CallRoute(
        //     receivedAction: NotificationsController.initialCallAction,
        //   ));
        // }

        await ref
            .read(ProfileController.userControllerProvider)
            .getCurrentUser();
        resolver.next(true);

        // customerController.getCustomerData();
      } else {
        resolver.next(false);

        print('user doc not exist');
        router.push(EditProfileRoute(isEditProfile: false));
      }

      //  customerController.getCustomerData();
    } else {
      resolver.next(false);

      router.push(const SignOptionsRoute());
    }
  }
}
