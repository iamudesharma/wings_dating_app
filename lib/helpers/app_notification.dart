import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';

class NotificationsController {
  static ReceivedAction? initialCallAction;

  // ***************************************************************
  //    INITIALIZATIONS
  // ***************************************************************
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelGroupKey: 'basic_tests',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.white,
              importance: NotificationImportance.High),
          NotificationChannel(
              channelGroupKey: 'basic_tests',
              channelKey: 'badge_channel',
              channelName: 'Badge indicator notifications',
              channelDescription:
                  'Notification channel to activate badge indicator',
              channelShowBadge: true,
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.yellow),
          NotificationChannel(
              channelGroupKey: 'category_tests',
              channelKey: 'call_channel',
              channelName: 'Calls Channel',
              channelDescription: 'Channel with call ringtone',
              defaultColor: const Color(0xFF9D50DD),
              importance: NotificationImportance.Max,
              ledColor: Colors.white,
              channelShowBadge: true,
              locked: true,
              defaultRingtoneType: DefaultRingtoneType.Ringtone),
          NotificationChannel(
            channelGroupKey: 'chat_tests',
            channelKey: 'chats',
            channelName: 'Chat groups',
            channelDescription:
                'This is a simple example channel of a chat group',
            channelShowBadge: true,
            importance: NotificationImportance.Max,
            ledColor: Colors.white,
            defaultColor: const Color(0xFF9D50DD),
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'category_tests',
              channelGroupName: 'Category tests'),
        ],
        debug: true);
  }

  static Future<void> initializeNotificationsEventListeners(
      WidgetRef ref) async {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: (re) async {
          return NotificationsController.onActionReceivedMethod(re, ref);
        },
        onNotificationCreatedMethod:
            NotificationsController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationsController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationsController.onDismissActionReceivedMethod);
  }

  // ***************************************************************
  //    NOTIFICATIONS EVENT LISTENERS
  // ***************************************************************

  static String _toSimpleEnum(NotificationLifeCycle lifeCycle) =>
      lifeCycle.toString().split('.').last;

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    Fluttertoast.showToast(
        msg:
            'Notification created on ${_toSimpleEnum(receivedNotification.createdLifeCycle!)}',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.green,
        gravity: ToastGravity.BOTTOM);
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    Fluttertoast.showToast(
        msg:
            'Notification displayed on ${_toSimpleEnum(receivedNotification.displayedLifeCycle!)}',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.blue,
        gravity: ToastGravity.BOTTOM);
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    Fluttertoast.showToast(
        msg:
            'Notification dismissed on ${_toSimpleEnum(receivedAction.dismissedLifeCycle!)}',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.orange,
        gravity: ToastGravity.BOTTOM);
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction, WidgetRef ref) async {
    // Always ensure that all plugins was initialized
    WidgetsFlutterBinding.ensureInitialized();

    bool isSilentAction =
        receivedAction.actionType == ActionType.SilentAction ||
            receivedAction.actionType == ActionType.SilentBackgroundAction;

    // SilentBackgroundAction runs on background thread and cannot show
    // UI/visual elements
    if (receivedAction.actionType != ActionType.SilentBackgroundAction) {
      Fluttertoast.showToast(
          msg:
              '${isSilentAction ? 'Silent action' : 'Action'} received on ${_toSimpleEnum(receivedAction.actionLifeCycle!)}',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: isSilentAction ? Colors.blueAccent : Colors.red,
          gravity: ToastGravity.BOTTOM);
    }

    switch (receivedAction.channelKey) {
      case 'call_channel':
        if (receivedAction.actionLifeCycle != NotificationLifeCycle.AppKilled) {
          await receiveCallNotificationAction(receivedAction, ref);
        }
        break;

      // case 'alarm_channel':
      //   await receiveAlarmNotificationAction(receivedAction);
      //   break;

      // case 'media_player':
      //   await receiveMediaNotificationAction(receivedAction);
      //   break;

      // case 'chats':
      //   await receiveChatNotificationAction(receivedAction);
      //   break;

      default:
        if (isSilentAction) {
          debugPrint(receivedAction.toString());
          debugPrint("start");
          await Future.delayed(const Duration(seconds: 4));
          final url = Uri.parse("http://google.com");
          final re = await http.get(url);
          debugPrint(re.body);
          debugPrint("long task done");
          break;
        }
        if (!AwesomeStringUtils.isNullOrEmpty(receivedAction.buttonKeyInput)) {
          //   receiveButtonInputText(receivedAction);
          // } else {
          //   receiveStandardNotificationAction(receivedAction);
        }
        break;
    }
  }

  // ***************************************************************
  //    NOTIFICATIONS HANDLING METHODS
  // ***************************************************************

  // static Future<void> receiveButtonInputText(
  //     ReceivedAction receivedAction) async {
  //   debugPrint('Input Button Message: "${receivedAction.buttonKeyInput}"');
  //   Fluttertoast.showToast(
  //       msg: 'Msg: ${receivedAction.buttonKeyInput}',
  //       backgroundColor: App.mainColor,
  //       textColor: Colors.white);
  // }

  // static Future<void> receiveStandardNotificationAction(
  //     ReceivedAction receivedAction) async {
  //   loadSingletonPage(App.navigatorKey.currentState,
  //       targetPage: PAGE_NOTIFICATION_DETAILS, receivedAction: receivedAction);
  // }

  // static Future<void> receiveMediaNotificationAction(
  //     ReceivedAction receivedAction) async {
  //   switch (receivedAction.buttonKeyPressed) {
  //     case 'MEDIA_CLOSE':
  //       MediaPlayerCentral.stop();
  //       break;

  //     case 'MEDIA_PLAY':
  //     case 'MEDIA_PAUSE':
  //       MediaPlayerCentral.playPause();
  //       break;

  //     case 'MEDIA_PREV':
  //       MediaPlayerCentral.previousMedia();
  //       break;

  //     case 'MEDIA_NEXT':
  //       MediaPlayerCentral.nextMedia();
  //       break;

  //     default:
  //       loadSingletonPage(App.navigatorKey.currentState,
  //           targetPage: PAGE_MEDIA_DETAILS, receivedAction: receivedAction);
  //       break;
  //   }
  // }

  // static Future<void> receiveChatNotificationAction(
  //     ReceivedAction receivedAction) async {
  //   if (receivedAction.buttonKeyPressed == 'REPLY') {
  //     await NotificationUtils.createMessagingNotification(
  //       channelKey: 'chats',
  //       groupKey: 'jhonny_group',
  //       chatName: 'Jhonny\'s Group',
  //       username: 'you',
  //       largeIcon: 'asset://assets/images/rock-disc.jpg',
  //       message: receivedAction.buttonKeyInput,
  //     );
  //   } else {
  //     loadSingletonPage(App.navigatorKey.currentState,
  //         targetPage: PAGE_NOTIFICATION_DETAILS,
  //         receivedAction: receivedAction);
  //   }
  // }

  // static Future<void> receiveAlarmNotificationAction(
  //     ReceivedAction receivedAction) async {
  //   if (receivedAction.buttonKeyPressed == 'SNOOZE') {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString('stringValue', "abc");
  //     await NotificationUtils.showAlarmNotification(id: receivedAction.id!);
  //   }
  // }

  static Future<void> receiveCallNotificationAction(
      ReceivedAction receivedAction, WidgetRef ref) async {
    switch (receivedAction.buttonKeyPressed) {
      case 'REJECT':
        // Is not necessary to do anything, because the reject button is
        // already auto dismissible
        break;

      case 'ACCEPT':
        loadSingletonPage(ref,
            targetPage: "call", receivedAction: receivedAction);
        break;

      default:
        loadSingletonPage(ref,
            targetPage: "call", receivedAction: receivedAction);
        break;
    }
  }

  static Future<void> interceptInitialCallActionRequest() async {
    ReceivedAction? receivedAction =
        await AwesomeNotifications().getInitialNotificationAction();

    if (receivedAction?.channelKey == 'call_channel') {
      initialCallAction = receivedAction;
    }
  }
}

void loadSingletonPage(WidgetRef ref,
    {required String targetPage, required ReceivedAction receivedAction}) {
  // Avoid to open the notification details page over another details page already opened
  // Navigate into pages, avoiding to open the notification details page over another details page already opened

  ref.read(appRouteProvider).push(CallRoute(receivedAction: receivedAction));
}