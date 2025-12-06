import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:wings_dating_app/routes/app_router.dart';

import 'package:wings_dating_app/src/widgets/wings_animated_logo.dart';

@RoutePage()
class SignOptionsView extends ConsumerWidget {
  const SignOptionsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isFromCom = ValueNotifier<double>(0.0);
    return Scaffold(
      body: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (value) {
          if (value.character == "udesh@gmail.com") {
            isFromCom.value = 20;
          }
        },
        child: SignInScreen(
          oauthButtonVariant: OAuthButtonVariant.icon_and_text,
          // breakpoint: 500,
          headerBuilder: (context, constraints, shrinkOffset) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: const Center(child: WingsAnimatedLogo(size: 150)),
            );
          },
          sideBuilder: (context, constraints) => SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: const Center(child: WingsAnimatedLogo(size: 300)),
          ),
          auth: FirebaseAuth.instance,
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) async {
              await AutoRouter.of(context).replace(const DashboardRoute());
              // });
              // });
            }),
            AuthStateChangeAction<UserCreated>((context, state) async {
              await AutoRouter.of(context).replace(const DashboardRoute());
              //       });
              // });
            }),
          ],
          showAuthActionSwitch: true,
          loginViewKey: key,
        ),
      ),
    );
  }
}
