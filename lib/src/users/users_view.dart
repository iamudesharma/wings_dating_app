import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

  checkIfService() async {
    Geolocator.isLocationServiceEnabled().then((value) async {
      if (value) {
        checkISLocationEnabled(await Geolocator.checkPermission());
      } else {
        nullWidget = Center(
          child: Column(
            children: [
              const Text("Please enable location service"),
              TextButton(
                child: const Text("Enable"),
                onPressed: () {
                  Geolocator.openLocationSettings();
                },
              )
            ],
          ),
        );
      }
    });
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
      if (prev == null && current.users.isEmpty && !current.isLoading) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          usersNotifier.loadUsers(refresh: true);
        });
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
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    if (usersState.error != null && usersState.users.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${usersState.error}'),
            ElevatedButton(
              onPressed: () => usersNotifier.loadUsers(refresh: true),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (usersState.users.isEmpty) {
      return const Center(
        child: Text('No users found'),
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
      child: SizedBox(
        height: sizingInformation.screenSize.height,
        width: sizingInformation.screenSize.width,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: sizingInformation.isMobile
                ? 2
                : sizingInformation.isTablet
                    ? 4
                    : 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            // Show loading indicator at the end if loading more
            if (index == usersState.users.length) {
              if (usersState.isLoadingMore) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return const SizedBox.shrink();
            }

            final user = usersState.users[index];

            return UserGridItem(
              onTapEditProfile: () async {
                AutoTabsRouter.of(context).setActiveIndex(4);
              },
              isCurrentUser: user.id == userData.id,
              users: user,
            ).animate().shake();
          },
          itemCount: usersState.users.length + (usersState.isLoadingMore ? 1 : 0),
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
    if (!sizingInformation.isMobile) {
      return Expanded(
        child: SizedBox(
          height: sizingInformation.screenSize.height,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListenableBuilder(
              listenable: AutoTabsRouter.of(context),
              builder: (context, child) {
                return NavigationRail(
                  selectedIndex: AutoTabsRouter.of(context).activeIndex,
                  extended: sizingInformation.isTablet ? false : true,
                  onDestinationSelected: (value) {
                    FirebaseAnalytics.instance.logEvent(
                      name: 'navigation_rail_tapped',
                      parameters: <String, Object>{
                        'index': value as Object,
                      },
                    );
                    AutoTabsRouter.of(context).setActiveIndex(value);
                  },
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.home), label: Text("Users")),
                    NavigationRailDestination(icon: Icon(Icons.chat_bubble), label: Text("Chat")),
                    NavigationRailDestination(icon: Icon(Icons.album_outlined), label: Text("Album")),
                    NavigationRailDestination(icon: Icon(Icons.add_card), label: Text("Matching")),
                    NavigationRailDestination(icon: Icon(Icons.person), label: Text("Profile"))
                  ],
                );
              },
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
