import 'dart:io';

// import 'package:connectycube_sdk/connectycube_sdk.dart';
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
// import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:google_mobile_ads/google_mobile_ads.dart' show MobileAds;
import 'package:meta_seo/meta_seo.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'package:isolate_flutter/isolate_flutter.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';
import 'package:wings_dating_app/services/chat_services.dart';
// import 'package:wings_dating_app/routes/navigation_observers.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'firebase_options.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    setPathUrlStrategy();
  }
  if (kIsWeb) {
  } else if (Platform.isAndroid && Platform.isAndroid) {
    MobileAds.instance.initialize();
  } else {}
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
    GoogleProvider(
      clientId: "546119961072-ub3rclq1ocqd5v2eikflmb13j97rg27u.apps.googleusercontent.com",
    ),
  ]);

  if (kIsWeb) {
    MetaSEO().config();
  }

  // Initialize Gemma Model Manager in background for AI chat functionality
  print("Initializing Gemma Model Manager...");
  // GemmaModelManager.initializeAtAppStartup(); // Proper async initialization

  // SharedPrefs no longer needs explicit initialization

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

    // Ensure Gemma Model Manager is initialized (backup initialization)
    // GemmaModelManager();
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
      builder: (context, child) => StreamChat(
        client: ref.read(chatClientProvider),
        child: child,
      ),
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
        subThemesData: const FlexSubThemesData(blendOnLevel: 30, inputDecoratorRadius: 20.0, cardRadius: 20),
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
