import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wings_dating_app/routes/app_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          UsersRoute(),
          ChatListRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.people)),
              BottomNavigationBarItem(
                  label: 'Posts', icon: Icon(Icons.abc_outlined)),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.search),
              ),
            ],
          );
        });
  }
}
