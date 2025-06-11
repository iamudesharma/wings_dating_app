import 'dart:async';

import 'package:auto_route/auto_route.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/model/geo_point_data.dart';
import 'package:wings_dating_app/src/users/widget/users_search_delegate.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:wings_dating_app/src/users/widget/tap_list_view.dart';

import '../../const/pref_util.dart';
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

final userListProvider = FutureProvider.family<List<UserModel?>?, Map<String, dynamic>?>((ref, filters) {
  return ref.read(profileRepoProvider).getUserList(limit: 10);
});

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
    final userList = ref.watch(userListProvider(filters));

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
                        child: userList.when(
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          error: (error, stackTrace) => (error is Exception)
                              ? Center(
                                  child: Text(error.toString()),
                                )
                              : Center(
                                  child: Text(error.toString()),
                                ),
                          data: (data) => RefreshIndicator.adaptive(
                            onRefresh: () async {
                              final currentLocation = await Geolocator.getCurrentPosition(
                                locationSettings: LocationSettings(
                                  accuracy: LocationAccuracy.high,

                                  // distanceFilter: 1,
                                ),
                              );

                              logger.d("currentLocation ${currentLocation.toJson()}");
                              // final currentUser = userData.position?.geopoint;

                              // if (currentLocation.latitude != currentUser?.latitude &&
                              //     currentLocation.longitude != currentUser?.longitude) {
                              //   GeoFirePoint geoFirePoint =
                              //       GeoFirePoint(GeoPoint(currentLocation.latitude, currentLocation.longitude));

                              //   await ref.read(profileRepoProvider).updateUserDoc(userData.copyWith(
                              //           position: GeoPointData(
                              //         geohash: geoFirePoint.geohash,
                              //         geopoint: geoFirePoint.geopoint,
                              //       )));

                              //   return ref.refresh(userListProvider(filters));
                              // } else {
                              return ref.refresh(userListProvider(filters));
                              // }
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
                                ),
                                itemBuilder: (context, index) {
                                  final users = data[index];

                                  return UserGridItem(
                                    onTapEditProfile: () async {
                                      AutoTabsRouter.of(context).setActiveIndex(4);
                                    },
                                    isCurrentUser: users?.id == userData.id ? true : false,
                                    users: users!,
                                  ).animate().shake();
                                },
                                itemCount: data!.length,
                              ),
                            ),
                          ),
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
