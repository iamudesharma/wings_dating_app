import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/routes/app_router.dart';


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
    return AutoTabsScaffold(
        routes: const [
          UsersRoute(),
          ChatListRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
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
