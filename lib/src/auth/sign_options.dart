import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/auth/provider/auth_provider.dart';

class SignOptionsView extends ConsumerWidget {
  const SignOptionsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
        AuthStateChangeAction<SignedIn>((context, state) {
          AutoRouter.of(context).replace(const DashboardRoute());
        }),
      ],
      showAuthActionSwitch: true,
    );
  }
}
