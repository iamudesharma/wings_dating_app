import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
  Widget build(BuildContext context) {
    CallManager.instance.init(context);
    return PlatformScaffold(
      body: AutoTabsScaffold(
          backgroundColor: Colors.black,
          routes: const [
            UsersRoute(),
            ChatListRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return PlatformNavBar(
                backgroundColor: Colors.black,
                cupertino: (context, platform) => CupertinoTabBarData(
                      inactiveColor: Colors.grey,
                      activeColor: Theme.of(context).primaryColor,
                      currentIndex: tabsRouter.activeIndex,
                      itemChanged: (value) async {
                        if (value == 1) {
                          ref.invalidate(chatListProvider);
                        }
                        tabsRouter.setActiveIndex(value);
                      },
                      items: [
                        BottomNavigationBarItem(
                          label: 'Users',
                          icon: Icon(
                            PlatformIcons(context).home,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: 'Chat',
                          icon: Icon(
                            CupertinoIcons.chat_bubble,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: 'Profile',
                          icon: Icon(
                            PlatformIcons(context).person,
                          ),
                        ),
                      ],
                    ),
                material: (context, platform) => MaterialNavBarData(
                      elevation: 0,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      selectedLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    )
                // selectedIndex: tabsRouter.activeIndex,
                // onDestinationSelected: (value) async {
                //   if (value == 1) {
                //     ref.invalidate(chatListProvider);
                //   }
                //   tabsRouter.setActiveIndex(value);
                // },
                // destinations: const [
                //   NavigationDestination(
                //     label: 'Users',
                //     icon: Icon(
                //       Icons.people,
                //     ),
                //   ),
                //   NavigationDestination(
                //     label: 'Chat',
                //     icon: Icon(
                //       Icons.chat_bubble,
                //     ),
                //   ),
                //   NavigationDestination(
                //     label: 'Profile',
                //     icon: Icon(
                //       Icons.person,
                //     ),
                //   ),
                // ],
                );
          }),
    );
  }
}
