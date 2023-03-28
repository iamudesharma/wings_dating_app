import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutterfire_ui/auth.dart';
import 'package:wings_dating_app/routes/app_router.dart';
// import 'package:firebase_auth/firebase_auth.dart' show EmailAuthProvider;

@RoutePage()
class SignOptionsView extends ConsumerWidget {
  const SignOptionsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SignInScreen(
      oauthButtonVariant: OAuthButtonVariant.icon_and_text,
      headerBuilder: (context, constraints, shrinkOffset) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: const Center(
            child: Text(
              'Wings Dating App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
      auth: FirebaseAuth.instance,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          AutoRouter.of(context).replace(const DashboardRoute());
        }),
        AuthStateChangeAction<SigningUp>((context, state) {
          AutoRouter.of(context).replace(const DashboardRoute());
        }),
      ],
      showAuthActionSwitch: true,
    );
  }
}
