import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:wings_dating_app/src/users/widget/tap_list_view.dart';
import 'package:wings_dating_app/src/users/providers/paginated_users_provider.dart';

import '../model/user_models.dart';
import '../profile/controller/profile_controller.dart';
import 'widget/user_grid_item.dart';

final user = FirebaseAuth.instance.currentUser;
final DatabaseReference statusRef = FirebaseDatabase.instance.ref("status/${user!.uid}");

final onlineStatus = {
  "isOnline": true,
  "lastSeen": ServerValue.timestamp,
};

final offlineStatus = {
  "isOnline": false,
  "lastSeen": ServerValue.timestamp,
};

void setPresence() {
  statusRef.onDisconnect().set(offlineStatus).then((_) {
    statusRef.set(onlineStatus);
  });
}

// final isUserOnlineProvider = FutureProvider.family<bool, bool>(
//   (ref, value) async => await ref.read(profileRepoProvider).isUserOnline(value),
// );

@RoutePage()
class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> with WidgetsBindingObserver {
  // late StreamSubscription<List<ConnectivityResult>> connectivityStateSubscription;
  AppLifecycleState? appState;

  Widget? nullWidget;

  Future<void> checkIfService() async {
    // Check if device location services are enabled
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) return;
      setState(() {
        nullWidget = _buildGate(
          icon: Icons.location_disabled,
          title: 'Enable Location Services',
          message: 'Location services are turned off. Please enable them to continue.',
          actionText: 'Open Location Settings',
          onAction: () {
            Geolocator.openLocationSettings();
          },
        );
      });
      return;
    }

    // Check and request permission if needed
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      if (!mounted) return;
      setState(() {
        nullWidget = _buildGate(
          icon: Icons.location_off_outlined,
          title: 'Location Permission Required',
          message: 'We need your location to show nearby users. Enable it in Settings.',
          actionText: 'Open App Settings',
          onAction: () {
            Geolocator.openAppSettings();
          },
        );
      });
      return;
    }

    // All good – clear any gating widget
    if (!mounted) return;
    setState(() {
      nullWidget = null;
    });
  }

  Widget _buildGate({
    required IconData icon,
    required String title,
    required String message,
    required String actionText,
    required VoidCallback onAction,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: onAction,
              icon: const Icon(Icons.settings_outlined),
              label: Text(actionText),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Allow user to re-check after enabling without leaving the app
                checkIfService();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  checkISLocationEnabled(LocationPermission locationPermission) async {
    return switch (locationPermission) {
      LocationPermission.denied => await Geolocator.requestPermission(),
      LocationPermission.deniedForever => "deniedForever",
      LocationPermission.whileInUse => true,
      LocationPermission.always => true,
      LocationPermission.unableToDetermine => "unableToDetermine",
    };
  }

  @override
  void initState() {
    // _loginToCubeChat(); s

    checkIfService();

    if (!kIsWeb) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print('Message also contained a notification: ${message.notification}');

          // showNotification(message);
        }
      });
    }
    WidgetsBinding.instance.addObserver(this);
    setPresence();

    super.initState();

    saveCubeUserInFirebase();
  }

  saveCubeUserInFirebase() async {}

  @override
  void dispose() {
    // connectivityStateSubscription.cancel();

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final statusRef = FirebaseDatabase.instance.ref("status/${FirebaseAuth.instance.currentUser!.uid}");

    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      statusRef.set({
        "isOnline": false,
        "lastSeen": ServerValue.timestamp,
      });
    } else if (state == AppLifecycleState.resumed) {
      statusRef.set({
        "isOnline": true,
        "lastSeen": ServerValue.timestamp,
      });
      // Re-check permissions/services when returning from Settings
      checkIfService();
    }
  }

  Map<String, dynamic>? filters;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  bool? isOnline = false;

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(ProfileController.userControllerProvider).userModel;
    final usersProvider = paginatedUsersProvider(filters);
    final usersState = ref.watch(usersProvider);
    final usersNotifier = ref.watch(usersProvider.notifier);

    // Load initial users
    ref.listen(usersProvider, (prev, current) {
      print('UsersView: ref.listen triggered');
      print('UsersView: prev = $prev');
      print('UsersView: current.users.length = ${current.users.length}');
      print('UsersView: current.isLoading = ${current.isLoading}');
      print('UsersView: current.error = ${current.error}');

      // Check individual conditions
      final prevIsNull = prev == null;
      final usersIsEmpty = current.users.isEmpty;
      final notLoading = !current.isLoading;

      print('UsersView: prevIsNull = $prevIsNull');
      print('UsersView: usersIsEmpty = $usersIsEmpty');
      print('UsersView: notLoading = $notLoading');

      if (prevIsNull && usersIsEmpty && notLoading) {
        print('UsersView: All conditions met, triggering loadUsers');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          print('UsersView: Executing loadUsers(refresh: true) in post frame callback');
          usersNotifier.loadUsers(refresh: true);
        });
      } else {
        print('UsersView: Conditions not met, not triggering loadUsers');
      }
    });

    // Alternative trigger - load users on first build if no users
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('UsersView: Post frame callback - checking if we need to load users');
      print('UsersView: usersState.users.length = ${usersState.users.length}');
      print('UsersView: usersState.isLoading = ${usersState.isLoading}');
      print('UsersView: usersState.error = ${usersState.error}');

      if (usersState.users.isEmpty && !usersState.isLoading && usersState.error == null) {
        print('UsersView: Alternative trigger - loading users because list is empty and not loading');
        usersNotifier.loadUsers(refresh: true);
      } else {
        print('UsersView: Alternative trigger - not loading users');
      }
    });

    return Scaffold(
      body: ResponsiveBuilder(builder: (context, sizingInformation) {
        return nullWidget ??
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AppBar(
                    leadingWidth: 40,
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          userData!.profileUrl ?? "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
                    ),
                    title: Text(userData.username),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.whatshot),
                        tooltip: 'View Taps',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => TapListView(userId: userData.id),
                            ),
                          );
                        },
                      ),
                      InkWell(
                          onTap: () {
                            AutoRouter.of(context).push(const SearchUsersRoute());
                          },
                          child: Icon(Icons.search)),
                      SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            AutoRouter.of(context).push(const FilterRoute()).then((result) {
                              if (result != null && result is Map<String, dynamic>) {
                                setState(() {
                                  filters = result;
                                });
                                // Update filters and refresh
                                usersNotifier.updateFilters(result);
                                usersNotifier.loadUsers(refresh: true);
                              }
                            });
                          },
                          child: Icon(Icons.filter_list_alt)),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      NavigationBarWidget(
                        sizingInformation: sizingInformation,
                      ),
                      Expanded(
                        flex: 5,
                        child: RefreshIndicator.adaptive(
                          onRefresh: () async {
                            final currentLocation = await Geolocator.getCurrentPosition(
                              locationSettings: LocationSettings(
                                accuracy: LocationAccuracy.high,
                              ),
                            );

                            logger.d("currentLocation ${currentLocation.toJson()}");
                            await usersNotifier.refresh();
                          },
                          child: _buildUserGrid(sizingInformation, usersState, usersNotifier, userData),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
      }),
    );
  }

  Widget _buildUserGrid(
    SizingInformation sizingInformation,
    PaginatedUsersState usersState,
    PaginatedUsers usersNotifier,
    UserModel userData,
  ) {
    if (usersState.isLoading && usersState.users.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height: 16),
            Text(
              'Discovering amazing people...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
            ),
          ],
        ),
      );
    }

    if (usersState.error != null && usersState.users.isEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.errorContainer,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Oops! Something went wrong',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                usersState.error!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => usersNotifier.loadUsers(refresh: true),
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (usersState.users.isEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.people_outline,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'No users found',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Try adjusting your filters or check back later',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
                    ),
              ),
            ],
          ),
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            usersState.hasNext &&
            !usersState.isLoadingMore) {
          usersNotifier.loadMore();
        }
        return false;
      },
      child: Container(
        height: sizingInformation.screenSize.height,
        width: sizingInformation.screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(0.8),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(sizingInformation.isMobile ? 12 : 16),
          child: Column(
            children: [
              // Header section
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover People',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                        ),
                        Text(
                          '${usersState.users.length} people nearby',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
                              ),
                        ),
                      ],
                    ),
                    if (usersState.hasNext)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'More available',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                  ],
                ),
              ),

              // Users grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: sizingInformation.isMobile
                      ? 2
                      : sizingInformation.isTablet
                          ? 3
                          : 4,
                  mainAxisSpacing: sizingInformation.isMobile ? 16 : 20,
                  crossAxisSpacing: sizingInformation.isMobile ? 16 : 20,
                  childAspectRatio: 0.68, // Adjusted to accommodate more content
                ),
                itemBuilder: (context, index) {
                  final user = usersState.users[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: UserGridItem(
                      onTapEditProfile: () async {
                        AutoTabsRouter.of(context).setActiveIndex(4);
                      },
                      isCurrentUser: user.id == userData.id,
                      users: user,
                      userCoordinates: userData.position != null
                          ? GeoPoint(userData.position!.geopoint[1], userData.position!.geopoint[0])
                          : null,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: const Duration(milliseconds: 300))
                      .slideY(begin: 0.2, end: 0, duration: const Duration(milliseconds: 400))
                      .then(delay: const Duration(milliseconds: 100))
                      .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.0, 1.0));
                },
                itemCount: usersState.users.length,
              ),

              // Loading more indicator
              if (usersState.isLoadingMore)
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const CircularProgressIndicator.adaptive(),
                      const SizedBox(height: 12),
                      Text(
                        'Loading more amazing people...',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),

              // End of list message
              if (!usersState.hasNext && usersState.users.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "You've seen everyone nearby!",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.sizingInformation,
  });
  final SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    if (sizingInformation.isMobile) return const SizedBox.shrink();

    // Extended for desktop, compact for tablet by default
    final bool extended = !sizingInformation.isTablet;
    final theme = Theme.of(context);

    return Expanded(
      child: SizedBox(
        height: sizingInformation.screenSize.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ListenableBuilder(
                listenable: AutoTabsRouter.of(context),
                builder: (context, child) {
                  final tabsRouter = AutoTabsRouter.of(context);
                  return NavigationRail(
                    backgroundColor: theme.colorScheme.surface,
                    selectedIndex: tabsRouter.activeIndex,
                    extended: extended,
                    minWidth: 72,
                    groupAlignment: -1.0,
                    indicatorColor: theme.colorScheme.primary.withOpacity(0.10),
                    indicatorShape: const StadiumBorder(),
                    selectedIconTheme: IconThemeData(
                      color: theme.colorScheme.primary,
                    ),
                    unselectedIconTheme: IconThemeData(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    selectedLabelTextStyle: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelTextStyle: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: extended
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 12),
                                Icon(Icons.favorite, color: theme.colorScheme.primary),
                                const SizedBox(width: 8),
                                Text(
                                  'Wings',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Icon(Icons.favorite, color: theme.colorScheme.primary),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Settings',
                            icon: const Icon(Icons.settings),
                            onPressed: () => tabsRouter.setActiveIndex(5),
                          ),
                        ],
                      ),
                    ),
                    onDestinationSelected: (value) {
                      FirebaseAnalytics.instance.logEvent(
                        name: 'navigation_rail_tapped',
                        parameters: <String, Object>{
                          'index': value as Object,
                        },
                      );
                      tabsRouter.setActiveIndex(value);
                    },
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: Text('Users'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.chat_bubble_outline),
                        selectedIcon: Icon(Icons.chat_bubble),
                        label: Text('Chat'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.photo_album_outlined),
                        selectedIcon: Icon(Icons.photo_album),
                        label: Text('Album'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person_search_outlined),
                        selectedIcon: Icon(Icons.person_search),
                        label: Text('Matching'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.smart_toy_outlined),
                        selectedIcon: Icon(Icons.smart_toy),
                        label: Text('AI Wingman'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person_outline),
                        selectedIcon: Icon(Icons.person),
                        label: Text('Profile'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
