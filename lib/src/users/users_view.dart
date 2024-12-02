import 'dart:async';

import 'package:auto_route/auto_route.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/helpers/app_notification.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/geo_point_data.dart';
import 'package:wings_dating_app/src/users/widget/users_search_elegate.dart';

import '../../const/app_const.dart';
import '../../const/pref_util.dart';
import '../../routes/app_router.dart';
import '../model/user_models.dart';
import '../profile/controller/profile_controller.dart';
import 'widget/user_grid_item.dart';

// final userListProvider = FutureProvider<List<UserModel>?>((ref) async {
//   return ref.read(profileRepoProvider).getUserList();
// });

final isUserOnlineProvider = FutureProvider.family<bool, bool>(
  (ref, value) async => await ref.read(profileRepoProvider).isUserOnline(value),
);

final userListProvider = StreamProvider<List<UserModel?>?>((ref) => ref.read(profileRepoProvider).getUserList());

@RoutePage()
class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> with WidgetsBindingObserver {
  late StreamSubscription<List<ConnectivityResult>> connectivityStateSubscription;
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
              const Text("Plase enable location service"),
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

    init(AppConst.cubeappId, AppConst.authKey, AppConst.authSecret, onSessionRestore: () async {
      SharedPrefs sharedPrefs = await SharedPrefs.instance.init();
      CubeUser? user = sharedPrefs.getUser();

      return createSession(user);
    });
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

    super.initState();

    connectivityStateSubscription = Connectivity().onConnectivityChanged.listen((connectivityType) {
      if (AppLifecycleState.resumed != appState) return;

      if (connectivityType != ConnectivityResult.none) {
        log("chatConnectionState = ${CubeChatConnection.instance.chatConnectionState}");
        bool isChatDisconnected = CubeChatConnection.instance.chatConnectionState == CubeChatConnectionState.Closed ||
            CubeChatConnection.instance.chatConnectionState == CubeChatConnectionState.ForceClosed;

        if (isChatDisconnected && CubeChatConnection.instance.currentUser != null) {
          CubeChatConnection.instance.relogin();
        }
      }
    });

    appState = WidgetsBinding.instance.lifecycleState;
    WidgetsBinding.instance.addObserver(this);

    saveCubeUserInFirebase();
  }

  saveCubeUserInFirebase() async {
    final userModel = ref.read(ProfileController.userControllerProvider).userModel?.cubeUser;

    SharedPrefs sharedPrefs = await SharedPrefs.instance.init();
    CubeUser? user = sharedPrefs.getUser();

    if (userModel!.id == null) {
      await ref.read(profileRepoProvider).updateCubeUserDoc(user!);
    }
  }

  @override
  void dispose() {
    connectivityStateSubscription.cancel();

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    log("Current app state: $state");
    appState = state;

    if (AppLifecycleState.paused == state) {
      if (CubeChatConnection.instance.isAuthenticated()) {
        CubeChatConnection.instance.markInactive();

        await compute(ref.read(profileRepoProvider).isUserOnline, false);
      }
    } else if (AppLifecycleState.resumed == state) {
      // // just for an example user was saved in the local storage
      SharedPrefs.instance.init().then((sharedPrefs) async {
        CubeUser? user = sharedPrefs.getUser();

        if (user != null) {
          if (!CubeChatConnection.instance.isAuthenticated()) {
            CubeChatConnection.instance.login(user);
          } else {
            CubeChatConnection.instance.markActive();

            await compute(ref.read(profileRepoProvider).isUserOnline, true);
          }
        }
      });
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    SharedPrefs sharedPrefs = await SharedPrefs.instance.init();

    final _currentUser = ref.read(ProfileController.userControllerProvider).userModel;
    // _loginToCubeChat(sharedPrefs.getUser()!);
    if (_currentUser?.cubeUser.id == null) {
      await ref.read(profileRepoProvider).updateUserDoc(_currentUser!.copyWith(
            cubeUser: sharedPrefs.getUser()!,
          ));
    }
  }

  bool? isOnline = false;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.author(author: 'Eng Mouaz M AlShahmeh');
      meta.description(description: 'Meta SEO Web Example');
      meta.keywords(keywords: 'Flutter, Dart, SEO, Meta, Web');
    }

    final userData = ref.watch(ProfileController.userControllerProvider).userModel;
    final userList = ref.watch(userListProvider);

    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          final currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

          logger.d("currentLocation ${currentLocation.toJson()}");
          final currentUser = userData?.position?.geopoint;

          if (currentLocation.latitude != currentUser?.latitude &&
              currentLocation.longitude != currentUser?.longitude) {
            GeoFirePoint geoFirePoint = GeoFirePoint(GeoPoint(currentLocation.latitude, currentLocation.longitude));

            await ref.read(profileRepoProvider).updateUserDoc(userData!.copyWith(
                    position: GeoPointData(
                  geohash: geoFirePoint.geohash,
                  geopoint: geoFirePoint.geopoint,
                )));

            return ref.refresh(userListProvider);
          } else {
            return ref.refresh(userListProvider);
          }
        },
        child: ResponsiveBuilder(builder: (context, sizingInformation) {
          return nullWidget ??
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: AppBar(
                      leadingWidth: 40,
                      leading: CircleAvatar(
                        // radius: 25,
                        // radius: 2,
                        backgroundImage: CachedNetworkImageProvider(
                            userData!.profileUrl ?? "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
                      ),
                      title: Text(userData.username),
                      actions: [
                        SearchAnchor(
                          viewBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          viewSurfaceTintColor: Colors.black,
                          builder: (context, controller) => InkWell(
                              onTap: () {
                                controller.openView();
                              },
                              child: const Icon(Icons.search)),
                          suggestionsBuilder: (context, controller) {
                            final userList = ref.watch(searchUsersProvider(controller.text));

                            return [
                              Container(
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
                                  data: (data) => SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      itemCount: data!.length,
                                      itemBuilder: (context, index) {
                                        final users = data[index];
                                        return ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: CachedNetworkImageProvider(users!.profileUrl!),
                                          ),
                                          title: Text(users.username, style: const TextStyle(color: Colors.white)),
                                          onTap: () {},
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ];
                          },
                          isFullScreen: sizingInformation.isMobile ? true : false,
                        ),
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
                            data: (data) => SizedBox(
                              height: sizingInformation.screenSize.height,
                              width: sizingInformation.screenSize.width,
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: sizingInformation.isMobile
                                      ? 3
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
                                      AutoTabsRouter.of(context).setActiveIndex(3);
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
                      ],
                    ),
                  ),
                ],
              );
        }),
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
                            AutoTabsRouter.of(context).setActiveIndex(value);
                          },
                          destinations: const [
                            NavigationRailDestination(icon: Icon(Icons.home), label: Text("Users")),
                            NavigationRailDestination(icon: Icon(Icons.chat_bubble), label: Text("Chat")),
                            NavigationRailDestination(icon: Icon(Icons.album_outlined), label: Text("Album")),
                            NavigationRailDestination(
                              icon: Icon(Icons.person),
                              label: Text("Profile"),
                            ),
                          ],
                        );
                      }))));
    } else {
      return Container();
    }
  }
}
