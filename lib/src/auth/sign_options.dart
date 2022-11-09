import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/auth/provider/auth_provider.dart';
import 'package:wings_dating_app/src/dashboard.dart';

import '../../routes/app_router_provider.dart';

// @riverpod
// Stream<User?> authStateChanges(Ref ref) {
//   return FirebaseAuth.instance.authStateChanges();
// }

class SignOptionsView extends ConsumerWidget {
  const SignOptionsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final authState = ref.watch(authstateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          ref.read(appRouteProvider).push(
                const DashboardRoute(),
              );
          return const SizedBox.shrink();
        } else {
          return SignInScreen(
            auth: FirebaseAuth.instance,
            providerConfigs: const [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                  clientId:
                      '546119961072-ub3rclq1ocqd5v2eikflmb13j97rg27u.apps.googleusercontent.com'),
              PhoneProviderConfiguration()
            ],
            actions: [],
            showAuthActionSwitch: true,
          );
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text(error.toString()),
    );
  }
}
