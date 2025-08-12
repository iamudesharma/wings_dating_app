import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/repo/chat_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/services/location_service.dart';

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

    // Check location permission periodically
    Future.microtask(() {
      ref.read(locationServiceProvider.notifier).checkLocationPermission();
    });

    // // ref.read(appRouteProvider).addListener(() {

    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // CallManager.instance.init(context);
    
    // Listen for location state changes and redirect if needed
    ref.listen(locationServiceProvider, (previous, current) {
      if (!current.hasValidLocation && mounted) {
        AutoRouter.of(context).pushAndClearStack(const LocationPermissionRoute());
      }
    });
    
    final locationState = ref.watch(locationServiceProvider);
    
    // Show loading screen while checking location
    if (locationState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    // Redirect to location permission if no valid location
    if (!locationState.hasValidLocation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          AutoRouter.of(context).pushAndClearStack(const LocationPermissionRoute());
        }
      });
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    return Scaffold(
      // bottomNavigationBar: const SizedBox(height: 50, child: BannerExample()),
      body: ResponsiveBuilder(builder: (context, size) {
        return AutoTabsScaffold(
          homeIndex: 0,
          lazyLoad: true,
          drawer: const Drawer(),
          backgroundColor: Colors.black,
          routes: [
            UsersRoute(),
            ChatListRoute(),
            AlbumRoute(),
            MatchingRoute(),
            AIChatRoute(),
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
                            label: 'Matching',
                            icon: Icon(
                              Icons.person_2_outlined,
                            ),
                          ),
                          NavigationDestination(
                            label: 'AI Wingman',
                            icon: Icon(
                              Icons.smart_toy,
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
