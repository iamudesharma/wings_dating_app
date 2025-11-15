import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/repo/chat_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/profile/onboarding/onboarding_view.dart';
import 'package:wings_dating_app/src/profile/providers/onboarding_providers.dart';

import '../dependency/dependencies.dart';

@RoutePage()
class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  bool _onboardingPrompted = false;
  bool _chatConnected = false;

  @override
  void initState() {
    Future.microtask(() async {
      if (!_chatConnected) {
        final user = await ref.read(Dependency.profileProvider).getCurrentUser();
        await ref.read(chatRepoProvider.notifier).connectUser(user: user);
        _chatConnected = true;
      }
    });
    // NotificationsController.initializeNotificationsEventListeners(ref);

    // // ref.read(appRouteProvider).addListener(() {

    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // CallManager.instance.init(context);
    // Watch onboarding state to decide whether to prompt
    final prompts = ref.watch(promptsProvider);
    final habits = ref.watch(habitsProvider);
    final values = ref.watch(valuesProvider);
    final social = ref.watch(socialProvider);
    final videoUrl = ref.watch(videoUrlProvider);
    final skipOnboarding = ref.watch(onboardingSkipProvider);
    final skipOnboardingLoaded = ref.read(onboardingSkipProvider.notifier).isLoaded;

    final hasSocial =
        (social.instagram ?? social.twitter ?? social.linkedin ?? social.tiktok ?? social.website) != null;
    final isOnboardingDataMissing =
        prompts.isEmpty && habits.isEmpty && values.isEmpty && !hasSocial && videoUrl == null;

    if (!skipOnboardingLoaded) {
      // Still loading preference; wait before showing prompt
    } else if (isOnboardingDataMissing && !_onboardingPrompted && skipOnboarding == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted || _onboardingPrompted) return;
        _onboardingPrompted = true;
        // Ask the user to complete onboarding before using the app
        final dontAskAgainNotifier = ValueNotifier<bool>(false);
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (ctx) => AlertDialog(
            title: const Text('Complete your profile'),
            content: ValueListenableBuilder<bool>(
              valueListenable: dontAskAgainNotifier,
              builder: (context, dontAskAgain, _) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add prompts, habits, values, social links, or a short video to improve your profile. Let\'s do that now.',
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                          value: dontAskAgain,
                          onChanged: (v) => dontAskAgainNotifier.value = v ?? false,
                        ),
                        const Text("Don't ask again"),
                      ],
                    ),
                  ],
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (dontAskAgainNotifier.value) {
                    await ref.read(onboardingSkipProvider.notifier).set(true);
                  }
                  Navigator.of(ctx).pop();
                },
                child: const Text('Later'),
              ),
              FilledButton(
                onPressed: () async {
                  if (dontAskAgainNotifier.value) {
                    await ref.read(onboardingSkipProvider.notifier).set(true);
                  }
                  Navigator.of(ctx).pop();
                  if (context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ProfileOnboardingView()),
                    );
                  }
                },
                child: const Text('Start'),
              ),
            ],
          ),
        );
        dontAskAgainNotifier.dispose();
      });
    }

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.router.push(AIChatRoute()),
      //   child: const Icon(Icons.smart_toy),
        
      // ),
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
