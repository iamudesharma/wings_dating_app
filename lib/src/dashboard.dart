import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/chats/services/call_manager.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

import '../const/pref_util.dart';
import '../helpers/app_notification.dart';
import 'chats/chats_list_view.dart';

@RoutePage()
class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  void initState() {
    // NotificationsController.initializeNotificationsEventListeners(ref);

    // // ref.read(appRouteProvider).addListener(() {

    // });
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    final userModel =
        ref.read(ProfileController.userControllerProvider).userModel;
    await _loginToCC(userModel!.cubeUser);

    await CubeChatConnection.instance.login(userModel.cubeUser);

    super.didChangeDependencies();
  }

  Future<void> _loginToCC(CubeUser user, {bool saveUser = false}) async {
    print("_loginToCC user: $user");

    await createSession(user).then((cubeSession) async {
      print("createSession cubeSession: $cubeSession");
      var tempUser = user;
      user = cubeSession.user!..password = tempUser.password;
      // if (saveUser) {
      //   final saved = await _saveUserInIsolate(user);
      //   print("User saved: $saved");
      // }

      await CubeChatConnection.instance.login(user);

      // await chat.login(user);

      if (!Platform.isIOS) {
        PushNotificationsManager.instance.init();
      }
    }).catchError((error) {
      // _processLoginError(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    CallManager.instance.init(context);
    return AutoTabsScaffold(
        routes: const [
          UsersRoute(),
          ChatListRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (value) async {
              if (value == 1) {
                ref.invalidate(chatListProvider);
              }
              tabsRouter.setActiveIndex(value);
            },
            destinations: const [
              NavigationDestination(
                label: 'Users',
                icon: Icon(
                  Icons.people,
                ),
              ),
              NavigationDestination(
                label: 'Chat',
                icon: Icon(
                  Icons.chat_bubble,
                ),
              ),
              NavigationDestination(
                label: 'Profile',
                icon: Icon(
                  Icons.person,
                ),
              ),
            ],
          );
        });
  }
}
