import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/chats/services/call_manager.dart';

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
    return Scaffold(
      body: ResponsiveBuilder(builder: (context, size) {
        return AutoTabsScaffold(
          drawer: const Drawer(),
          backgroundColor: Colors.black,
          routes: const [
            UsersRoute(),
            ChatListRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: size.isMobile
              ? (_, tabsRouter) {
                  return NavigationBar(
                    backgroundColor: Colors.black,
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: (value) =>
                        tabsRouter.setActiveIndex(value, notify: true),
                    destinations: const [
                      NavigationDestination(
                        label: 'Home',
                        icon: Icon(
                          Icons.home_outlined,
                        ),
                      ),
                      NavigationDestination(
                        label: 'Chat',
                        icon: Icon(
                          Icons.chat_bubble_outline,
                        ),
                      ),
                      NavigationDestination(
                        label: 'Profile',
                        icon: Icon(
                          Icons.person_2_outlined,
                        ),
                      ),
                    ],
                  );
                }
              : (context, tabsRouter) => SizedBox(),
        );
      }),
    );
  }
}
