// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wings_dating_app/routes/app_router.dart';

import '../dependency/dependenies.dart';
import '../src/profile/controller/profile_controller.dart';

part 'app_router_provider.g.dart';

@Riverpod(keepAlive: true)
AppRouter appRoute(AppRouteRef ref) {
  return AppRouter(
    authGuard: AuthGuard(ref: ref),
    profileDocGuard: ProfileDocGuard(ref: ref),
  );
}

class ProfileDocGuard extends AutoRouteGuard {
  final Ref ref;
  ProfileDocGuard({
    required this.ref,
  });
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await ref.read(Dependency.profileProvider).checkUserDocExist()) {
      resolver.next(true);
    } else {
      resolver.next(false);
      router.push(EditProfileRoute(isEditProfile: false));
    }
  }
}

class AuthGuard extends AutoRouteGuard {
  final Ref ref;
  AuthGuard({
    required this.ref,
  });
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (ref.read(Dependency.firebaseAuthProvider).currentUser != null) {
      await ref.read(UserController.userControllerProvider).getCurrentUser();
      resolver.next(true);
    } else {
      resolver.next(false);
      router.push(
        const SignOptionsRoute(),
      );
    }
  }
}
