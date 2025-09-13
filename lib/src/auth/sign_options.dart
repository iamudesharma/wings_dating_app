import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wings_dating_app/assets.dart';

import 'package:wings_dating_app/routes/app_router.dart';

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
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.blue, Colors.green, Colors.yellow, Colors.orange, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Wings Dating',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                        )
                            .animate(
                              adapter: ValueNotifierAdapter(isFromCom, animated: true),
                            )
                            .shake(),
                        SvgPicture.asset(
                          Assets.rainbow3SVG,
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          sideBuilder: (context, constraints) => SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.blue, Colors.green, Colors.yellow, Colors.orange, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 150,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Wings Dating',
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                      ).animate(onInit: (controller) => controller.repeat(reverse: true), effects: [
                        const ShakeEffect(),
                      ]),
                      SvgPicture.asset(
                        Assets.rainbow3SVG,
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          auth: FirebaseAuth.instance,
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) async {
              await AutoRouter.of(context).replace(
                const DashboardRoute(),
              );
              // });
              // });
            }),
            AuthStateChangeAction<UserCreated>((context, state) async {
              await AutoRouter.of(context).replace(
                const DashboardRoute(),
              );
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
