import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/repo/chat_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';

import '../dependency/dependencies.dart';

@RoutePage()
class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  void initState() {
    Future.microtask(() async {
      ref.read(chatRepoProvider.notifier).connectUser(
            user: await ref.read(Dependency.profileProvider).getCurrentUser(),
          );
    });
    // NotificationsController.initializeNotificationsEventListeners(ref);

    // // ref.read(appRouteProvider).addListener(() {

    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // CallManager.instance.init(context);
    return Scaffold(
      // bottomNavigationBar: const SizedBox(height: 50, child: BannerExample()),
      body: ResponsiveBuilder(builder: (context, size) {
        return AutoTabsScaffold(
          homeIndex: 0,
          lazyLoad: true,
          drawer: const Drawer(),
          backgroundColor: Colors.black,
          routes: const [
            UsersRoute(),
            ChatListRoute(),
            AlbumRoute(),
            MatchingRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: size.isMobile
              ? (_, tabsRouter) {
                  return Consumer(
                    builder: (context, ref, child) {
                      return NavigationBar(
                        backgroundColor: Colors.black,
                        selectedIndex: tabsRouter.activeIndex,
                        onDestinationSelected: (value) => tabsRouter.setActiveIndex(value, notify: true),
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
                            label: 'Album',
                            icon: Icon(
                              Icons.album_outlined,
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
                    },
                  );
                }
              : (context, tabsRouter) => const SizedBox(),
        );
      }),
    );
  }
}
