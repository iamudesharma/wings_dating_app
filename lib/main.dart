import 'dart:async';

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:context_menus/context_menus.dart';
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
import 'package:meta_seo/meta_seo.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'package:isolate_flutter/isolate_flutter.dart';
import 'package:wings_dating_app/const/app_const.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';
// import 'package:wings_dating_app/routes/navigation_observers.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();
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

  if (kIsWeb) {
    MetaSEO().config();
  }
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
    final appRouter = ref.watch(appRouteProvider);
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      theme: FlexThemeData.light(
        lightIsWhite: true,
        scheme: FlexScheme.deepPurple,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          inputDecoratorRadius: 12.0,
          blendTextTheme: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        // To use the playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        darkIsTrueBlack: true,
        scheme: FlexScheme.deepPurple,
        surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
        tones: FlexTones.jolly(Brightness.dark),
        blendLevel: 15,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
            blendOnLevel: 30, inputDecoratorRadius: 20.0, cardRadius: 20),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        appBarStyle: FlexAppBarStyle.material,
        useMaterial3ErrorColors: true,
      ),
      themeMode: ThemeMode.dark,
      title: 'Wings Dating App',
    );
  }
}
