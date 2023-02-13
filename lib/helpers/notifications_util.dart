// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:flutter/material.dart';

// TO AVOID CONFLICT WITH MATERIAL DATE UTILS CLASS
import 'package:awesome_notifications/awesome_notifications.dart'
    hide AwesomeDateUtils;
import 'package:awesome_notifications/awesome_notifications.dart' as utils
    show AwesomeDateUtils;

import 'package:url_launcher/url_launcher.dart';

/* *********************************************
    LARGE TEXT FOR OUR NOTIFICATIONS TESTS
************************************************ */

String lorenIpsumText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut '
    'labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip '
    'ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat '
    'nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit'
    'anim id est laborum';

Future<void> externalUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

int createUniqueID(int maxValue) {
  Random random = new Random();
  return random.nextInt(maxValue);
}

/* *********************************************
    PERMISSIONS
************************************************ */

class NotificationUtils {
  static Future<bool> redirectToPermissionsPage() async {
    await AwesomeNotifications().showNotificationConfigPage();
    return await AwesomeNotifications().isNotificationAllowed();
  }

  static Future<void> redirectToBasicChannelPage() async {
    await AwesomeNotifications()
        .showNotificationConfigPage(channelKey: 'basic_channel');
  }

  static Future<void> redirectToAlarmPage() async {
    await AwesomeNotifications().showAlarmPage();
  }

  static Future<void> redirectToScheduledChannelsPage() async {
    await AwesomeNotifications()
        .showNotificationConfigPage(channelKey: 'scheduled');
  }

  static Future<void> redirectToOverrideDndsPage() async {
    await AwesomeNotifications().showGlobalDndOverridePage();
  }

  static Future<bool> requestBasicPermissionToSendNotifications(
      BuildContext context) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      // ignore: use_build_context_synchronously
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: const Color(0xfffbfbfb),
                title: const Text('Get Notified!',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/animated-bell.gif',
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fitWidth,
                    ),
                    const Text(
                      'Allow Awesome Notifications to send you beautiful notifications!',
                      maxLines: 4,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Later',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      )),
                  TextButton(
                    onPressed: () async {
                      isAllowed = await AwesomeNotifications()
                          .requestPermissionToSendNotifications();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Allow',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ));
    }
    return isAllowed;
  }

  static Future<void> requestFullScheduleChannelPermissions(
      BuildContext context,
      List<NotificationPermission> requestedPermissions) async {
    String channelKey = 'scheduled';

    await requestUserPermissions(context,
        channelKey: channelKey, permissionList: requestedPermissions);
  }

  static Future<List<NotificationPermission>> requestUserPermissions(
      BuildContext context,
      {
      // if you only intends to request the permissions until app level, set the channelKey value to null
      required String? channelKey,
      required List<NotificationPermission> permissionList}) async {
    // Check if the basic permission was conceived by the user
    // ignore: use_build_context_synchronously
    if (!await requestBasicPermissionToSendNotifications(context)) return [];

    // Check which of the permissions you need are allowed at this time
    List<NotificationPermission> permissionsAllowed =
        await AwesomeNotifications().checkPermissionList(
            channelKey: channelKey, permissions: permissionList);

    // If all permissions are allowed, there is nothing to do
    if (permissionsAllowed.length == permissionList.length)
      return permissionsAllowed;

    // Refresh the permission list with only the disallowed permissions
    List<NotificationPermission> permissionsNeeded =
        permissionList.toSet().difference(permissionsAllowed.toSet()).toList();

    // Check if some of the permissions needed request user's intervention to be enabled
    List<NotificationPermission> lockedPermissions =
        await AwesomeNotifications().shouldShowRationaleToRequest(
            channelKey: channelKey, permissions: permissionsNeeded);

    // If there is no permitions depending of user's intervention, so request it directly
    if (lockedPermissions.isEmpty) {
      // Request the permission through native resources.
      await AwesomeNotifications().requestPermissionToSendNotifications(
          channelKey: channelKey, permissions: permissionsNeeded);

      // After the user come back, check if the permissions has successfully enabled
      permissionsAllowed = await AwesomeNotifications().checkPermissionList(
          channelKey: channelKey, permissions: permissionsNeeded);
    } else {
      // If you need to show a rationale to educate the user to conceed the permission, show it
      // ignore: use_build_context_synchronously
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: const Color(0xfffbfbfb),
                title: const Text(
                  'Awesome Notificaitons needs your permission',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/animated-clock.gif',
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      'To proceed, you need to enable the permissions above' +
                          (channelKey?.isEmpty ?? true
                              ? ''
                              : ' on channel $channelKey') +
                          ':',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      lockedPermissions
                          .join(', ')
                          .replaceAll('NotificationPermission.', ''),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Deny',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      )),
                  TextButton(
                    onPressed: () async {
                      // Request the permission through native resources. Only one page redirection is done at this point.
                      await AwesomeNotifications()
                          .requestPermissionToSendNotifications(
                              channelKey: channelKey,
                              permissions: lockedPermissions);

                      // After the user come back, check if the permissions has successfully enabled
                      permissionsAllowed = await AwesomeNotifications()
                          .checkPermissionList(
                              channelKey: channelKey,
                              permissions: lockedPermissions);

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Allow',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ));
    }

    // Return the updated list of allowed permissions
    return permissionsAllowed;
  }

  static Future<bool> requestCriticalAlertsPermission(
      BuildContext context) async {
    List<NotificationPermission> requestedPermissions = [
      NotificationPermission.CriticalAlert
    ];

    List<NotificationPermission> permissionsAllowed =
        await requestUserPermissions(context,
            channelKey: null, permissionList: requestedPermissions);

    return permissionsAllowed.isNotEmpty;
  }

  static Future<bool> requestFullIntentPermission(BuildContext context) async {
    List<NotificationPermission> requestedPermissions = [
      NotificationPermission.CriticalAlert
    ];

    List<NotificationPermission> permissionsAllowed =
        await requestUserPermissions(context,
            channelKey: null, permissionList: requestedPermissions);

    return permissionsAllowed.isNotEmpty;
  }

  static Future<bool> requestPreciseAlarmPermission(
      BuildContext context) async {
    List<NotificationPermission> requestedPermissions = [
      NotificationPermission.PreciseAlarms
    ];

    List<NotificationPermission> permissionsAllowed =
        await requestUserPermissions(context,
            channelKey: null, permissionList: requestedPermissions);

    return permissionsAllowed.isNotEmpty;
  }

  static Future<bool> requestOverrideDndPermission(BuildContext context) async {
    List<NotificationPermission> requestedPermissions = [
      NotificationPermission.OverrideDnD
    ];

    List<NotificationPermission> permissionsAllowed =
        await requestUserPermissions(context,
            channelKey: null, permissionList: requestedPermissions);

    return permissionsAllowed.isNotEmpty;
  }

  /* *********************************************
      BASIC NOTIFICATIONS
  ************************************************ */

  // static Future<void> showBasicNotification(int id) async {
  //   try {
  //     bool success = await AwesomeNotifications().createNotification(
  //         content: NotificationContent(
  //             id: id,
  //             channelKey: 'basic_channel',
  //             title: 'Simple Notification',
  //             body: 'Simple body'));

  //     debugPrint(success ? 'Notification created successfully' : '');
  //   } on PlatformException catch (exception) {
  //     debugPrint('$exception');
  //   }
  // }

  static Future<void> showNotificationFromJson(
      Map<String, Object> jsonData) async {
    await AwesomeNotifications().createNotificationFromJsonData(jsonData);
  }

  static Future<void> showEmojiNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: id,
      channelKey: 'basic_channel',
      category: NotificationCategory.Social,
      title: 'Emojis are awesome too! ' +
          Emojis.smile_face_with_tongue +
          Emojis.smile_smiling_face +
          Emojis.smile_smiling_face_with_heart_eyes,
      body:
          'Simple body with a bunch of Emojis! ${Emojis.transport_police_car} ${Emojis.animals_dog} ${Emojis.flag_UnitedStates} ${Emojis.person_baby}',
      largeIcon: 'https://tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg',
      bigPicture: 'https://tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg',
      hideLargeIconOnExpand: true,
      notificationLayout: NotificationLayout.BigPicture,
    ));
  }

  static Future<void> showNotificationWithPayloadContent(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'Simple notification',
            body: 'Only a simple notification',
            payload: {'uuid': 'uuid-test'}));
  }

  static Future<void> showNotificationWithoutTitle(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            body: 'Only a simple notification',
            payload: {'uuid': 'uuid-test'}));
  }

  static Future<void> showNotificationWithoutBody(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'plain title',
            payload: {'uuid': 'uuid-test'}));
  }

  static Future<void> sendBackgroundNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            payload: {'secret-command': 'block_user'}));
  }

  /* *********************************************
      BADGE NOTIFICATIONS
  ************************************************ */

  static Future<void> showBadgeNotification(int id, {int? badgeAmount}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            badge: badgeAmount,
            channelKey: 'badge_channel',
            title: 'Badge test notification',
            body: 'This notification does activate badge indicator',
            payload: {'content 1': 'value'}),
        schedule: NotificationInterval(
            interval: 5,
            timeZone:
                await AwesomeNotifications().getLocalTimeZoneIdentifier()));
  }

  static Future<void> showWithoutBadgeNotification(int id,
      {int? badgeAmount}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            badge: badgeAmount,
            channelKey: 'basic_channel',
            title: 'Badge test notification',
            body: 'This notification does not activate badge indicator'),
        schedule: NotificationInterval(
            interval: 5,
            timeZone:
                await AwesomeNotifications().getLocalTimeZoneIdentifier()));
  }

  // ON BADGE METHODS, NULL CHANNEL SETS THE GLOBAL COUNTER

  static Future<int> getBadgeIndicator() async {
    int amount = await AwesomeNotifications().getGlobalBadgeCounter();
    return amount;
  }

  static Future<void> setBadgeIndicator(int amount) async {
    await AwesomeNotifications().setGlobalBadgeCounter(amount);
  }

  static Future<int> incrementBadgeIndicator() async {
    return await AwesomeNotifications().incrementGlobalBadgeCounter();
  }

  static Future<int> decrementBadgeIndicator() async {
    return await AwesomeNotifications().decrementGlobalBadgeCounter();
  }

  static Future<void> resetBadgeIndicator() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  /* *********************************************
      ACTION BUTTONS NOTIFICATIONS
  ************************************************ */

  static Future<void> showNotificationWithActionButtons(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'Anonymous says:',
            body: 'Hi there!',
            payload: {'uuid': 'user-profile-uuid'}),
        actionButtons: [
          NotificationActionButton(
              key: 'READ', label: 'Mark as read', autoDismissible: true),
          NotificationActionButton(
              key: 'PROFILE',
              label: 'Profile',
              autoDismissible: true,
              enabled: false)
        ]);
  }

  static Future<void> showNotificationWithSilentActionButtons(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'Action Type tests',
            body: 'Click on the buttons above to test each action type:'
                '<br>* The notification body has the default action type.'
                '<br>* The silent action runs on background but uses UI Thread.'
                '<br>* The silent bg action runs on Backgrond Thread and does not allows UI.'
                '<br>* The disabled action runs on background and never fires any event method.',
            notificationLayout: NotificationLayout.BigText,
            autoDismissible: false,
            payload: {'uuid': 'user-profile-uuid'}),
        actionButtons: [
          NotificationActionButton(
              key: 'SILENT',
              label: 'Silent',
              actionType: ActionType.SilentAction,
              autoDismissible: false),
          NotificationActionButton(
              key: 'SILENT_BG',
              label: 'Silent BG',
              actionType: ActionType.SilentBackgroundAction,
              autoDismissible: false),
          NotificationActionButton(
              key: 'DISMISS',
              label: 'Dismiss',
              actionType: ActionType.DismissAction,
              autoDismissible: true,
              isDangerousOption: true),
        ]);
  }

  static Future<void> showNotificationWithIconsAndActionButtons(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'Anonymous says:',
            body: 'Hi there!',
            payload: {'uuid': 'user-profile-uuid'}),
        actionButtons: [
          NotificationActionButton(
              key: 'READ', label: 'Mark as read', autoDismissible: true),
          NotificationActionButton(
              key: 'PROFILE',
              label: 'Profile',
              autoDismissible: true,
              color: Colors.green),
          NotificationActionButton(
              key: 'DISMISS',
              label: 'Dismiss',
              isDangerousOption: true,
              actionType: ActionType.DismissAction)
        ]);
  }

  /* *********************************************
      NOTIFICATION'S SPECIAL CATEGORIES
  ************************************************ */

  static Future<void> showCallNotification(int id, int timeToWait) async {
    // String platformVersion = await getPlatformVersion();
    // Schedule only for test purposes. For real applications, you MUST
    // create call or alarm notifications using AndroidForegroundService.
    await AwesomeNotifications().createNotification(
        // await AndroidForegroundService.startAndroidForegroundService(
        //     foregroundStartMode: ForegroundStartMode.stick,
        //     foregroundServiceType: ForegroundServiceType.phoneCall,
        content: NotificationContent(
            id: id,
            channelKey: 'call_channel',
            title: 'Incoming Call',
            body: 'from Little Mary',
            category: NotificationCategory.Call,
            largeIcon: 'asset://assets/images/girl-phonecall.jpg',
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            backgroundColor: Colors.green,

            // backgroundColor: (platformVersion == 'Android-31')
            //     ? const Color(0xFF00796a)
            //     : Colors.white,
            payload: {'username': 'Little Mary'}),
        actionButtons: [
          NotificationActionButton(
              key: 'ACCEPT',
              label: 'Accept Call',
              actionType: ActionType.Default,
              color: Colors.green,
              autoDismissible: true),
          NotificationActionButton(
              key: 'REJECT',
              label: 'Reject',
              actionType: ActionType.SilentAction,
              isDangerousOption: true,
              autoDismissible: true),
        ],
        schedule: NotificationInterval(interval: timeToWait));
  }

  static Future<void> startForegroundServiceNotification(int id) async {
    await AndroidForegroundService.startForeground(
        content: NotificationContent(
            id: id,
            body: 'Service is running!',
            title: 'Android Foreground Service',
            channelKey: 'basic_channel',
            bigPicture: 'asset://assets/images/android-bg-worker.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            category: NotificationCategory.Service),
        actionButtons: [
          NotificationActionButton(
              key: 'SHOW_SERVICE_DETAILS', label: 'Show details')
        ]);
  }

  static Future<void> stopForegroundServiceNotification(int id) async {
    await AndroidForegroundService.stopForeground(id);
  }

  /* *********************************************
      CUSTOM SOUND NOTIFICATIONS
  ************************************************ */

  /* *********************************************
      WAKE UP LOCK SCREEN NOTIFICATIONS
  ************************************************ */
  /* *********************************************
      FULL SCREEN INTENT NOTIFICATIONS
  ************************************************ */

  /* *********************************************
      SILENCED NOTIFICATIONS
  ************************************************ */

  /* *********************************************
      BIG PICTURE NOTIFICATIONS
  ************************************************ */

  /* *********************************************
      MEDIA CONTROLLER NOTIFICATIONS
  ************************************************ */

  // static void updateNotificationMediaPlayer(int id, MediaModel? mediaNow) {
  //   if (mediaNow == null) {
  //     cancelNotification(id);
  //     return;
  //   }

  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: id,
  //           channelKey: 'media_player',
  //           category: NotificationCategory.Transport,
  //           title: mediaNow.bandName,
  //           body: mediaNow.trackName,
  //           summary: MediaPlayerCentral.isPlaying ? 'Now playing' : '',
  //           notificationLayout: NotificationLayout.MediaPlayer,
  //           largeIcon: mediaNow.diskImagePath,
  //           color: Colors.purple.shade700,
  //           autoDismissible: false,
  //           showWhen: false),
  //       actionButtons: [
  //         NotificationActionButton(
  //             key: 'MEDIA_PREV',
  //             icon: 'resource://drawable/res_ic_prev' +
  //                 (MediaPlayerCentral.hasPreviousMedia ? '' : '_disabled'),
  //             label: 'Previous',
  //             autoDismissible: false,
  //             showInCompactView: false,
  //             enabled: MediaPlayerCentral.hasPreviousMedia,
  //             actionType: ActionType.KeepOnTop),
  //         MediaPlayerCentral.isPlaying
  //             ? NotificationActionButton(
  //                 key: 'MEDIA_PAUSE',
  //                 icon: 'resource://drawable/res_ic_pause',
  //                 label: 'Pause',
  //                 autoDismissible: false,
  //                 showInCompactView: true,
  //                 actionType: ActionType.KeepOnTop)
  //             : NotificationActionButton(
  //                 key: 'MEDIA_PLAY',
  //                 icon: 'resource://drawable/res_ic_play' +
  //                     (MediaPlayerCentral.hasAnyMedia ? '' : '_disabled'),
  //                 label: 'Play',
  //                 autoDismissible: false,
  //                 showInCompactView: true,
  //                 enabled: MediaPlayerCentral.hasAnyMedia,
  //                 actionType: ActionType.KeepOnTop),
  //         NotificationActionButton(
  //             key: 'MEDIA_NEXT',
  //             icon: 'resource://drawable/res_ic_next' +
  //                 (MediaPlayerCentral.hasNextMedia ? '' : '_disabled'),
  //             label: 'Previous',
  //             showInCompactView: true,
  //             enabled: MediaPlayerCentral.hasNextMedia,
  //             actionType: ActionType.KeepOnTop),
  //         NotificationActionButton(
  //             key: 'MEDIA_CLOSE',
  //             icon: 'resource://drawable/res_ic_close',
  //             label: 'Close',
  //             autoDismissible: true,
  //             showInCompactView: true,
  //             actionType: ActionType.KeepOnTop)
  //       ]);
  // }

  static Future<void> createMessagingNotification(
      {required String channelKey,
      required String groupKey,
      required String chatName,
      required String username,
      required String message,
      String? largeIcon,
      bool checkPermission = true}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: createUniqueID(AwesomeNotifications.maxID),
            groupKey: groupKey,
            channelKey: channelKey,
            summary: chatName,
            title: username,
            body: message,
            largeIcon: largeIcon,
            notificationLayout: NotificationLayout.Messaging,
            category: NotificationCategory.Message),
        actionButtons: [
          NotificationActionButton(
            key: 'REPLY',
            label: 'Reply',
            requireInputText: true,
            autoDismissible: false,
          ),
          NotificationActionButton(
            key: 'READ',
            label: 'Mark as Read',
            autoDismissible: true,
            requireInputText: true,
          )
        ]);
  }
}
