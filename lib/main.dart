import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_flutter_call_kit/connectycube_flutter_call_kit.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_callkit_incoming/entities/android_params.dart';
// import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
// import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isolate_flutter/isolate_flutter.dart';
import 'package:wings_dating_app/const/app_const.dart';
import 'package:wings_dating_app/helpers/app_notification.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';
import 'package:wings_dating_app/routes/navigation_observers.dart';

import 'firebase_options.dart';

Future<void> _onCallAccepted(CallEvent callEvent) async {
  // the call was accepted

  await ConnectycubeFlutterCallKit.clearCallData(
      sessionId: callEvent.sessionId);
}

Future<void> _onCallRejected(CallEvent callEvent) async {
  // the call was rejected

  await ConnectycubeFlutterCallKit.clearCallData(
      sessionId: callEvent.sessionId);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseFirestore.instance.app.setAutomaticDataCollectionEnabled(true);
  await FirebaseFirestore.instance.app
      .setAutomaticResourceManagementEnabled(true);

  await FirebaseStorage.instance.app.setAutomaticDataCollectionEnabled(true);
  await FirebaseStorage.instance.app
      .setAutomaticResourceManagementEnabled(true);

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // The following lines are the same as previously explained in "Handling uncaught errors"
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    // FirebaseMessaging.onBackgroundMessage((message) async {
    //   showNotification(message);
    // });
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
  // runZonedGuarded( ProviderScope(child: MyApp()),((error, stack) => FirebaseCrashlytics.instance.recordError(error, stack)));
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
      routerDelegate:
          appRouter.delegate(navigatorObservers: () => [MyObserver()]),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Wings',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//dashboard.dart
// with this code, the app crashes
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

getTokon() async {
  IsolateFlutter? value =
      await IsolateFlutter.create(printToken(), 'Get Token');

  await value?.start();

  value?.stop();
}

printToken() async {
  await FirebaseMessaging.instance.getToken().then(
    (value) {
      logger.wtf('token: $value');
    },
  );
}

// Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   RemoteNotification notification = message.notification!;
//   AndroidNotification android = message.notification!.android!;

//   // If `onMessage` is triggered with a notification, construct our own
//   // local notification to show to users using the created channel.
//   if (notification != null && android != null) {
//     flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id, channel.name,
//             importance: Importance.high,
//             channelDescription: notification.body,
//             fullScreenIntent: true,
//             // other properties...
//           ),
//         ));
//   }
// }
