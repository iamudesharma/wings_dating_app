import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/auth/provider/auth_provider.dart';
import 'package:wings_dating_app/src/dashboard.dart';

import '../../routes/app_router_provider.dart';

class SignOptionsView extends ConsumerWidget {
  const SignOptionsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final authState = ref.watch(authstateProvider);
    return authState.when(
      skipLoadingOnReload: true,
      error: (error, stackTrace) => const Text('error'),
      loading: () => const CircularProgressIndicator(),
      data: (data) {
        if (data != null) {
          AutoRouter.of(context).popAndPush(const DashboardRoute());
          return const Scaffold();
        }
        return SignInScreen(
          auth: FirebaseAuth.instance,
          providerConfigs: const [
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(
                clientId:
                    '546119961072-ub3rclq1ocqd5v2eikflmb13j97rg27u.apps.googleusercontent.com'),
            PhoneProviderConfiguration()
          ],
          actions: [
            AuthStateChangeAction(
              (context, AuthState state) {},
            )
          ],
          showAuthActionSwitch: true,
        );
      },
    );
  }
}
