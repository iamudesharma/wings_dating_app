import 'dart:async';
import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isolate_flutter/isolate_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';
import 'package:wings_dating_app/routes/navigation_observers.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

import 'firebase_options.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.',
  enableVibration: true,
  

  // description
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  FirebaseMessaging.instance.app.setAutomaticDataCollectionEnabled(true);

  print("Handling a background message: ${message.messageId}");
  var _currentUuid = Uuid().v4();
  CallKitParams callKitParams = CallKitParams(
    id: _currentUuid,

    nameCaller: 'Hien Nguyen',
    appName: 'Callkit',
    avatar: 'https://i.pravatar.cc/100',
    handle: '0123456789',
    type: 0,
    textAccept: 'Accept',
    textDecline: 'Decline',
    textMissedCall: 'Missed call',
    textCallback: 'Call back',
    duration: 30000,
    extra: <String, dynamic>{'userId': '1a2b3c4d'},
    headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
    android: const AndroidParams(
      isCustomNotification: true,
      isShowLogo: false,
      isShowCallback: false,
      isShowMissedCallNotification: true,
      ringtonePath: 'system_ringtone_default',
      backgroundColor: '#0955fa',
      backgroundUrl: 'https://i.pravatar.cc/500',
      actionColor: '#4CAF50',
      incomingCallNotificationChannelName: "Incoming Call",
      missedCallNotificationChannelName: "Missed Call",
    ),
    // ios: IOSParams(
    //   iconName: 'CallKitLogo',
    //   handleType: 'generic',
    //   supportsVideo: true,
    //   maximumCallGroups: 2,
    //   maximumCallsPerCallGroup: 1,
    //   audioSessionMode: 'default',
    //   audioSessionActive: true,
    //   audioSessionPreferredSampleRate: 44100.0,
    //   audioSessionPreferredIOBufferDuration: 0.005,
    //   supportsDTMF: true,
    //   supportsHolding: true,
    //   supportsGrouping: false,
    //   supportsUngrouping: false,
    //   ringtonePath: 'system_ringtone_default',
    // ),
  );
  await FlutterCallkitIncoming.showCallkitIncoming(callKitParams);

  // flutterLocalNotificationsPlugin.show(
  //   message.notification.hashCode,
  //   message.notification!.title,
  //   message.notification!.body,
  //   NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       channel.id,
  //       channel.name,
  //       channelAction: AndroidNotificationChannelAction.createIfNotExists,
  //       importance: Importance.high,
  //       fullScreenIntent: true,
  //       category: AndroidNotificationCategory.call,

  //     ),
  //   ),
  // );
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
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          // selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          // if (notificationResponse.actionId == navigationActionId) {
          //   // selectNotificationStream.add(notificationResponse.payload);
          // }
          break;
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
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
      title: 'Flutter Demo',
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
  IsolateFlutter? _value =
      await IsolateFlutter.create(printToken(), 'Get Token');

  await _value?.start();

  _value?.stop();
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
