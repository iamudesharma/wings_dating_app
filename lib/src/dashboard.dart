import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/routes/app_router.dart';

import '../dependency/dependenies.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
