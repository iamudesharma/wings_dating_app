import 'dart:async';

import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
//
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:isolate_flutter/isolate_flutter.dart';
import 'package:wings_dating_app/const/app_const.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';
import 'package:wings_dating_app/routes/navigation_observers.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
    GoogleProvider(
      clientId:
          "546119961072-ub3rclq1ocqd5v2eikflmb13j97rg27u.apps.googleusercontent.com",
    ),
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    init(
      AppConst.cubeappId,
      AppConst.authKey,
      AppConst.authSecret,
    );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final materialDarkTheme = ThemeData.dark();

    // final cupertinoLightTheme =
    //     MaterialBasedCupertinoThemeData(materialTheme: materialLightTheme);

    final materialDarkTheme = ThemeData.dark();

    final cupertinoLightTheme = MaterialBasedCupertinoThemeData(
      materialTheme: materialDarkTheme.copyWith(
        // useMaterial3: true,
        // brightness: Brightness.dark,
        primaryColor: Colors.teal,
        primaryColorDark: Colors.teal,
        primaryColorLight: Colors.teal,
      ),
    );

    final appRouter = ref.watch(appRouteProvider);
    return Builder(
      builder: (context) => MaterialApp.router(
        // theme: cupertinoLightTheme
        // theme: cupertinoDarkTheme,

        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],

        theme: FlexThemeData.light(
          scheme: FlexScheme.aquaBlue,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 20,
          appBarOpacity: 0.95,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            blendOnColors: false,
            inputDecoratorRadius: 12.0,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          // To use the playground font, add GoogleFonts package and uncomment
          fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.aquaBlue,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarOpacity: 0.90,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
            inputDecoratorRadius: 12.0,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          // To use the playground font, add GoogleFonts package and uncomment
          fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        themeMode: ThemeMode.dark,
        routerDelegate: appRouter.delegate(
          navigatorObservers: () => [
            MyObserver(),
          ],
          placeholder: (context) => Scaffold(
              body: Center(
            child: Image.asset("assets/logo.png"),
          )),
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
        title: 'Wings',
      ),
    );
  }
}
