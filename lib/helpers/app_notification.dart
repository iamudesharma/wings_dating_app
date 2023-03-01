// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:wings_dating_app/helpers/helpers.dart';
// import 'package:wings_dating_app/routes/app_router.dart';
// import 'package:wings_dating_app/routes/app_router_provider.dart';

// class NotificationsController with ChangeNotifier {
//   String _firebaseToken = '';
//   String get firebaseToken => _firebaseToken;

//   String _nativeToken = '';
//   String get nativeToken => _nativeToken;
//   static ReceivedAction? initialCallAction;

//   static final NotificationsController _instance =
//       NotificationsController._internal();

//   factory NotificationsController() {
//     return _instance;
//   }

//   NotificationsController._internal();

//   // ***************************************************************
//   //    INITIALIZATIONS
//   // ***************************************************************
//   static Future<void> initializeLocalNotifications() async {
//     await AwesomeNotifications().initialize(
//         null,
//         [
//           NotificationChannel(
//               channelGroupKey: 'basic_tests',
//               channelKey: 'basic_channel',
//               channelName: 'Basic notifications',
//               channelDescription: 'Notification channel for basic tests',
//               defaultColor: const Color(0xFF9D50DD),
//               ledColor: Colors.white,
//               importance: NotificationImportance.High),
//           NotificationChannel(
//               channelGroupKey: 'category_tests',
//               channelKey: 'call_channel',
//               channelName: 'Calls Channel',
//               channelDescription: 'Channel with call ringtone',
//               defaultColor: const Color(0xFF9D50DD),
//               importance: NotificationImportance.Max,
//               ledColor: Colors.white,
//               channelShowBadge: true,
//               locked: true,
//               defaultRingtoneType: DefaultRingtoneType.Ringtone),
//           NotificationChannel(
//             channelGroupKey: 'chat_tests',
//             channelKey: 'chats',
//             channelName: 'Chat groups',
//             channelDescription:
//                 'This is a simple example channel of a chat group',
//             channelShowBadge: true,
//             importance: NotificationImportance.Max,
//             ledColor: Colors.white,
//             defaultColor: const Color(0xFF9D50DD),
//           ),
//         ],
//         debug: true);
//   }

//   static Future<void> initializeNotificationsEventListeners(
//       WidgetRef ref) async {
//     AwesomeNotifications().setListeners(
//         onActionReceivedMethod: (re) async {
//           NotificationsController.onActionReceivedMethod(re, ref);
//         },
//         onNotificationCreatedMethod:
//             NotificationsController.onNotificationCreatedMethod,
//         onNotificationDisplayedMethod:
//             NotificationsController.onNotificationDisplayedMethod,
//         onDismissActionReceivedMethod:
//             NotificationsController.onDismissActionReceivedMethod);
//   }

//   // ***************************************************************
//   //    NOTIFICATIONS EVENT LISTENERS
//   // ***************************************************************

//   static String _toSimpleEnum(NotificationLifeCycle lifeCycle) =>
//       lifeCycle.toString().split('.').last;

//   /// Use this method to detect when a new notification or a schedule is created
//   @pragma("vm:entry-point")
//   static Future<void> onNotificationCreatedMethod(
//       ReceivedNotification receivedNotification) async {
//     Fluttertoast.showToast(
//         msg:
//             'Notification created on ${_toSimpleEnum(receivedNotification.createdLifeCycle!)}',
//         toastLength: Toast.LENGTH_SHORT,
//         backgroundColor: Colors.green,
//         gravity: ToastGravity.BOTTOM);
//   }

//   /// Use this method to detect every time that a new notification is displayed
//   @pragma("vm:entry-point")
//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {
//     Fluttertoast.showToast(
//         msg:
//             'Notification displayed on ${_toSimpleEnum(receivedNotification.displayedLifeCycle!)}',
//         toastLength: Toast.LENGTH_SHORT,
//         backgroundColor: Colors.blue,
//         gravity: ToastGravity.BOTTOM);
//   }

//   /// Use this method to detect if the user dismissed a notification
//   @pragma("vm:entry-point")
//   static Future<void> onDismissActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     Fluttertoast.showToast(
//         msg:
//             'Notification dismissed on ${_toSimpleEnum(receivedAction.dismissedLifeCycle!)}',
//         toastLength: Toast.LENGTH_SHORT,
//         backgroundColor: Colors.orange,
//         gravity: ToastGravity.BOTTOM);
//   }

//   /// Use this method to detect when the user taps on a notification or action button
//   @pragma("vm:entry-point")
//   static Future<void> onActionReceivedMethod(
//       ReceivedAction receivedAction, WidgetRef ref) async {
//     // Always ensure that all plugins was initialized
//     WidgetsFlutterBinding.ensureInitialized();

//     bool isSilentAction =
//         receivedAction.actionType == ActionType.SilentAction ||
//             receivedAction.actionType == ActionType.SilentBackgroundAction;

//     // SilentBackgroundAction runs on background thread and cannot show
//     // UI/visual elements
//     if (receivedAction.actionType != ActionType.SilentBackgroundAction) {
//       Fluttertoast.showToast(
//           msg:
//               '${isSilentAction ? 'Silent action' : 'Action'} received on ${_toSimpleEnum(receivedAction.actionLifeCycle!)}',
//           toastLength: Toast.LENGTH_SHORT,
//           backgroundColor: isSilentAction ? Colors.blueAccent : Colors.red,
//           gravity: ToastGravity.BOTTOM);
//     }

//     logger.e(receivedAction.toString() + " ReceivedAction ");
//     switch (receivedAction.channelKey) {
//       case 'call_channel':
//         if (receivedAction.actionLifeCycle != NotificationLifeCycle.AppKilled) {
//           await receiveCallNotificationAction(receivedAction, ref);
//         }
//         break;

//       // case 'alarm_channel':
//       //   await receiveAlarmNotificationAction(receivedAction);
//       //   break;

//       // case 'media_player':
//       //   await receiveMediaNotificationAction(receivedAction);
//       //   break;

//       // case 'chats':
//       //   await receiveChatNotificationAction(receivedAction);
//       //   break;

//       default:
//         if (isSilentAction) {
//           debugPrint(receivedAction.toString());
//           debugPrint("start");
//           await Future.delayed(const Duration(seconds: 4));
//           final url = Uri.parse("http://google.com");
//           final re = await http.get(url);
//           debugPrint(re.body);
//           debugPrint("long task done");
//           break;
//         }
//         if (!AwesomeStringUtils.isNullOrEmpty(receivedAction.buttonKeyInput)) {
//           receiveButtonInputText(receivedAction);
//         } else {
//           receiveStandardNotificationAction(receivedAction);
//         }
//         break;
//     }
//   }

//   // ***************************************************************
//   //    NOTIFICATIONS HANDLING METHODS
//   // ***************************************************************

//   static Future<void> receiveButtonInputText(
//       ReceivedAction receivedAction) async {
//     debugPrint('Input Button Message: "${receivedAction.buttonKeyInput}"');
//     Fluttertoast.showToast(
//         msg: 'Msg: ${receivedAction.buttonKeyInput}',
//         backgroundColor: Colors.accents[0],
//         textColor: Colors.white);
//   }

//   static Future<void> receiveStandardNotificationAction(
//       ReceivedAction receivedAction) async {
//     // loadSingletonPage(App.navigatorKey.currentState,
//     //     targetPage: PAGE_NOTIFICATION_DETAILS, receivedAction: receivedAction);
//   }

//   // static Future<void> receiveMediaNotificationAction(
//   //     ReceivedAction receivedAction) async {
//   //   switch (receivedAction.buttonKeyPressed) {
//   //     case 'MEDIA_CLOSE':
//   //       MediaPlayerCentral.stop();
//   //       break;

//   //     case 'MEDIA_PLAY':
//   //     case 'MEDIA_PAUSE':
//   //       MediaPlayerCentral.playPause();
//   //       break;

//   //     case 'MEDIA_PREV':
//   //       MediaPlayerCentral.previousMedia();
//   //       break;

//   //     case 'MEDIA_NEXT':
//   //       MediaPlayerCentral.nextMedia();
//   //       break;

//   //     default:
//   //       loadSingletonPage(App.navigatorKey.currentState,
//   //           targetPage: PAGE_MEDIA_DETAILS, receivedAction: receivedAction);
//   //       break;
//   //   }
//   // }

//   // static Future<void> receiveChatNotificationAction(
//   //     ReceivedAction receivedAction) async {
//   //   if (receivedAction.buttonKeyPressed == 'REPLY') {
//   //     await NotificationUtils.createMessagingNotification(
//   //       channelKey: 'chats',
//   //       groupKey: 'jhonny_group',
//   //       chatName: 'Jhonny\'s Group',
//   //       username: 'you',
//   //       largeIcon: 'asset://assets/images/rock-disc.jpg',
//   //       message: receivedAction.buttonKeyInput,
//   //     );
//   //   } else {
//   //     loadSingletonPage(App.navigatorKey.currentState,
//   //         targetPage: PAGE_NOTIFICATION_DETAILS,
//   //         receivedAction: receivedAction);
//   //   }
//   // }

//   // static Future<void> receiveAlarmNotificationAction(
//   //     ReceivedAction receivedAction) async {
//   //   if (receivedAction.buttonKeyPressed == 'SNOOZE') {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     prefs.setString('stringValue', "abc");
//   //     await NotificationUtils.showAlarmNotification(id: receivedAction.id!);
//   //   }
//   // }

//   static Future<void> receiveCallNotificationAction(
//       ReceivedAction receivedAction, WidgetRef ref) async {
//     switch (receivedAction.buttonKeyPressed) {
//       case 'REJECT':
//         // Is not necessary to do anything, because the reject button is
//         // already auto dismissible
//         break;

//       case 'ACCEPT':
//         loadSingletonPage(ref,
//             targetPage: "call", receivedAction: receivedAction);
//         break;

//       default:
//         loadSingletonPage(ref,
//             targetPage: "call", receivedAction: receivedAction);
//         break;
//     }
//   }

//   // static Future<void> interceptInitialCallActionRequest() async {
//   //   ReceivedAction? receivedAction =
//   //       await AwesomeNotifications().getInitialNotificationAction();

//   //   if (receivedAction?.channelKey == 'call_channel') {
//   //     initialCallAction = receivedAction;
//   //   }
//   // }

//   static Future<void> getInitialNotificationAction() async {
//     ReceivedAction? receivedAction = await AwesomeNotifications()
//         .getInitialNotificationAction(removeFromActionEvents: true);
//     if (receivedAction == null) return;
//     Fluttertoast.showToast(
//         msg: 'Notification action launched app: $receivedAction',
//         backgroundColor: Colors.deepPurple);
//     print('Notification action launched app: $receivedAction');
//   }

//   /// Use this method to execute on background when a silent data arrives
//   /// (even while terminated)
//   @pragma("vm:entry-point")
//   static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
//     Fluttertoast.showToast(
//         msg: 'Silent data received',
//         backgroundColor: Colors.blueAccent,
//         textColor: Colors.white,
//         fontSize: 16);

//     print('"SilentData": ${silentData.toString()}');

//     if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
//       print("bg");
//     } else {
//       print("FOREGROUND");
//     }

//     print('mySilentDataHandle received a FcmSilentData execution');
//     await executeLongTaskTest();
//   }

//   static Future<void> executeLongTaskTest() async {
//     print("starting long task");
//     await Future.delayed(Duration(seconds: 4));
//     final url = Uri.parse("http://google.com");
//     final re = await http.get(url);
//     print(re.body);
//     print("long task done");
//   }

//   /// Use this method to detect when a new fcm token is received
//   @pragma("vm:entry-point")
//   static Future<void> myFcmTokenHandle(String token) async {
//     Fluttertoast.showToast(
//         msg: 'Fcm token received',
//         backgroundColor: Colors.blueAccent,
//         textColor: Colors.white,
//         fontSize: 16);
//     debugPrint('Firebase Token:"$token"');

//     _instance._firebaseToken = token;
//     _instance.notifyListeners();
//   }

//   /// Use this method to detect when a new native token is received
//   @pragma("vm:entry-point")
//   static Future<void> myNativeTokenHandle(String token) async {
//     Fluttertoast.showToast(
//         msg: 'Native token received',
//         backgroundColor: Colors.blueAccent,
//         textColor: Colors.white,
//         fontSize: 16);
//     debugPrint('Native Token:"$token"');
//   }

//   static Future<void> initializeRemoteNotifications(
//       {required bool debug}) async {
//     await Firebase.initializeApp();
//     await AwesomeNotificationsFcm().initialize(
//         onFcmSilentDataHandle: NotificationsController.mySilentDataHandle,
//         onFcmTokenHandle: NotificationsController.myFcmTokenHandle,
//         onNativeTokenHandle: NotificationsController.myNativeTokenHandle,
//         licenseKeys:
//             // On this example app, the app ID / Bundle Id are different
//             // for each platform, so was used the main Bundle ID + 1 variation
//             [
//           // me.carda.awesome-notifications-fcm.example
//           'B3J3yxQbzzyz0KmkQR6rDlWB5N68sTWTEMV7k9HcPBroUh4RZ/Og2Fv6Wc/lE'
//               '2YaKuVY4FUERlDaSN4WJ0lMiiVoYIRtrwJBX6/fpPCbGNkSGuhrx0Rekk'
//               '+yUTQU3C3WCVf2D534rNF3OnYKUjshNgQN8do0KAihTK7n83eUD60=',

//           // me.carda.awesome_notifications_fcm.example
//           'UzRlt+SJ7XyVgmD1WV+7dDMaRitmKCKOivKaVsNkfAQfQfechRveuKblFnCp4'
//               'zifTPgRUGdFmJDiw1R/rfEtTIlZCBgK3Wa8MzUV4dypZZc5wQIIVsiqi0Zhaq'
//               'YtTevjLl3/wKvK8fWaEmUxdOJfFihY8FnlrSA48FW94XWIcFY=',
//         ],
//         debug: debug);
//   }
// }

// void loadSingletonPage(WidgetRef ref,
//     {required String targetPage, required ReceivedAction receivedAction}) {
//   // Avoid to open the notification details page over another details page already opened
//   // Navigate into pages, avoiding to open the notification details page over another details page already opened

//   ref.read(appRouteProvider).push(CallRoute(receivedAction: receivedAction));
// }

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

sendChat({
  Map<String, dynamic>? additionalData,
  required String fcm,
  required String? content,
}) async {
  var notification = OSCreateNotification(
    playerIds: [fcm],
    content: content,
    heading: "Chat",
    additionalData: additionalData,
  );

  await OneSignal.shared.postNotification(notification).then((value) {
    logger.i(value);
  });
}
