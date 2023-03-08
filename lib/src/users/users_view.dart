import 'dart:async';

import 'package:auto_route/auto_route.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/helpers/app_notification.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';

import '../../const/pref_util.dart';
import '../../main.dart';
import '../../routes/app_router.dart';
import '../model/user_models.dart';
import '../profile/controller/profile_controller.dart';

// final userListProvider = FutureProvider<List<UserModel>?>((ref) async {
//   return ref.read(profileRepoProvider).getUserList();
// });

final isUserOnlineProvider = FutureProvider.family<bool, bool>(
  (ref, value) async => await ref.read(profileRepoProvider).isUserOnline(value),
);

final userListProvider =
    AsyncNotifierProvider<UserListNotifier, List<UserModel?>?>(
        () => UserListNotifier());

class UserListNotifier extends AsyncNotifier<List<UserModel?>?> {
  @override
  FutureOr<List<UserModel?>?> build() {
    return ref.read(profileRepoProvider).getUserList();
  }

  addToBlockList(String id) async {
    await ref.read(profileRepoProvider).addToBlockList(id: id);
  }
}

class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView>
    with WidgetsBindingObserver {
  late StreamSubscription<ConnectivityResult> connectivityStateSubscription;
  AppLifecycleState? appState;

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');

        showNotification(message);
      }
    });

    WidgetsBinding.instance.addObserver(this);

    super.initState();

    connectivityStateSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityType) {
      if (AppLifecycleState.resumed != appState) return;

      if (connectivityType != ConnectivityResult.none) {
        log("chatConnectionState = ${CubeChatConnection.instance.chatConnectionState}");
        bool isChatDisconnected =
            CubeChatConnection.instance.chatConnectionState ==
                    CubeChatConnectionState.Closed ||
                CubeChatConnection.instance.chatConnectionState ==
                    CubeChatConnectionState.ForceClosed;

        if (isChatDisconnected &&
            CubeChatConnection.instance.currentUser != null) {
          CubeChatConnection.instance.relogin();
        }
      }
    });

    appState = WidgetsBinding.instance.lifecycleState;
    WidgetsBinding.instance.addObserver(this);
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

    // _loginToCubeChat(sharedPrefs.getUser()!);

    await ref
        .read(ProfileController.userControllerProvider)
        .updateCubeUserData(sharedPrefs.getUser()!);
  }

  _loginToCubeChat(CubeUser user) {
    print("_loginToCubeChat user $user");
    CubeChatConnectionSettings.instance.totalReconnections = 0;
    CubeChatConnection.instance.login(user).then((cubeUser) {
      CubeChatConnection.instance.subscribeToUserLastActivityStatus(user.id!);
    }).catchError((error) {});
  }

  bool? isOnline = false;

  @override
  Widget build(BuildContext context) {
    final userData =
        ref.watch(ProfileController.userControllerProvider).userModel;
    final userList = ref.watch(userListProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(userListProvider),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              pinned: true,
              // floating: false,

              titleSpacing: 50,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  // radius: 2,
                  backgroundImage: CachedNetworkImageProvider(userData!
                          .profileUrl ??
                      "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
                ),
              ),
              title: Text(userData.username),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    showSearch(
                      context: context,
                      delegate: UsersSearchDelegate(ref),
                    );
                  },
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: userList.when(
                loading: () => const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error, stackTrace) => (error is Exception)
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: Text(error.toString()),
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: Center(
                          child: Text(error.toString()),
                        ),
                      ),
                data: (data) => SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final users = data[index];

                      return UserGridItem(
                        onTapEditProfile: () {
                          AutoTabsRouter.of(context).setActiveIndex(2);
                        },
                        isCurrentUser: users!.id == userData.id ? true : false,
                        users: users,
                      ).animate().shake();
                    },
                    childCount: data!.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final searchUsersProvider =
    FutureProvider.family<List<UserModel?>?, String>((ref, query) async {
  return await ref.read(profileRepoProvider).searchUser(query);
});

class UsersSearchDelegate extends SearchDelegate {
  final WidgetRef ref;

  UsersSearchDelegate(this.ref);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final userList = ref.watch(searchUsersProvider(query));

    return userList.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => (error is Exception)
          ? Center(
              child: Text(error.toString()),
            )
          : Center(
              child: Text(error.toString()),
            ),
      data: (data) => ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          final users = data[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(users!.profileUrl!),
            ),
            title: Text(users.username),
            onTap: () {},
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final userList = ref.watch(searchUsersProvider(query));

    return userList.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => (error is Exception)
          ? Center(
              child: Text(error.toString()),
            )
          : Center(
              child: Text(error.toString()),
            ),
      data: (data) => ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          final users = data[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(users!.profileUrl!),
            ),
            title: Text(users.username),
            onTap: () {
              // // Navigator.push(
              // //   context,
              // //   MaterialPageRoute(
              // //     builder: (context) => ProfileScreen(
              // //       userId: users.id,
              // //     ),
              // //   ),
              // );
            },
          );
        },
      ),
    );
  }
}

List<String> weightList = [
  "Do not show",
  "40 kg",
  "41 kg",
  "42 kg",
  "43 kg",
  "44 kg",
  "45 kg",
  "46 kg",
  "47 kg",
  "48 kg",
  "49 kg",
  "51 kg",
  "52 kg",
  "53 kg",
  "54 kg",
  "55 kg",
  "56 kg",
  "57 kg",
  "58 kg",
  "59 kg",
  "60 kg",
  "61 kg",
  "62 kg",
  "63 kg",
  "64 kg",
  "65 kg",
  "66 kg",
  "67 kg",
  "68 kg",
  "69 kg",
  "70 kg",
  "71 kg",
  "72 kg",
  "73 kg",
  "74 kg",
  "75 kg",
  "76 kg",
  "77 kg",
  "78 kg",
  "79 kg",
  "80 kg",
  "81 kg",
  "82 kg",
  "83 kg",
  "84 kg",
  "85 kg",
  "86 kg",
  "87 kg",
  "88 kg",
  "89 kg",
  "90 kg",
  "91 kg",
  "92 kg",
  "93 kg",
  "94 kg",
  "95 kg",
  "96 kg",
  "97 kg",
  "98 kg",
  "99 kg",
  "100 kg",
  "101 kg",
  "102 kg",
  "103 kg",
  "104 kg",
  "105 kg",
  "106 kg",
  "107 kg",
  "108 kg",
  "109 kg",
  "110 kg",
  "111 kg",
  "112 kg",
  "113 kg",
  "114 kg",
  "115 kg",
  "116 kg",
  "117 kg",
  "118 kg",
  "119 kg",
  "120 kg",
  "121 kg",
  "122 kg",
  "123 kg",
  "124 kg",
  "125 kg",
  "126 kg",
  "127 kg",
  "128 kg",
  "129 kg",
  "130 kg",
  "140 kg",
  "141 kg",
  "142 kg",
  "143 kg",
  "144 kg",
  "145 kg",
  "146 kg",
  "147 kg",
  "148 kg",
  "149 kg",
  "150 kg",
];

List<String> heightList = [
  "Do not show",
  "140 cm",
  "141 cm",
  "142 cm",
  "143 cm",
  "144 cm",
  "145 cm",
  "146 cm",
  "147 cm",
  "148 cm",
  "149 cm",
  "150 cm",
  "151 cm",
  "152 cm",
  "153 cm",
  "154 cm",
  "155 cm",
  "156 cm",
  "157 cm",
  "158 cm",
  "159 cm",
  "160 cm",
  "161 cm",
  "162 cm",
  "163 cm",
  "164 cm",
  "165 cm",
  "166 cm",
  "167 cm",
  "168 cm",
  "169 cm",
  "170 cm",
  "171 cm",
  "172 cm",
  "173 cm",
  "174 cm",
  "175 cm",
  "176 cm",
  "177 cm",
  "178 cm",
  "179 cm",
  "180 cm",
  "181 cm",
  "182 cm",
  "183 cm",
  "184 cm",
  "185 cm",
  "186 cm",
  "187 cm",
  "188 cm",
  "189 cm",
  "190 cm",
  "191 cm",
  "192 cm",
  "193 cm",
  "194 cm",
  "195 cm",
  "196 cm",
  "197 cm",
  "198 cm",
  "199 cm",
  "200 cm",
  "201 cm",
  "202 cm",
  "203 cm",
  "204 cm",
  "205 cm",
  "206 cm",
  "207 cm",
  "208 cm",
  "209 cm",
  "210 cm",
];

class UserGridItem extends ConsumerWidget {
  const UserGridItem(
      {super.key,
      required this.users,
      this.isCurrentUser = false,
      this.onTapEditProfile});

  final UserModel users;

  final bool? isCurrentUser;

  final VoidCallback? onTapEditProfile;

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () {
        if (isCurrentUser!) {
          AutoTabsRouter.of(context).setActiveIndex(2);
        } else {
          AutoRouter.of(context).push(
            OtherUserProfileRoute(
              id: users.id,
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(users.profileUrl ??
                "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey.shade400,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  ref
                      .read(ProfileController.userControllerProvider)
                      .getDistance(
                        Coordinates(
                          users.position!.geopoint.latitude,
                          users.position!.geopoint.longitude,
                        ),
                      ),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                isCurrentUser!
                    ? InkWell(
                        onTap: onTapEditProfile, child: const Icon(Icons.edit))
                    : Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor:
                                users.isOnline ? Colors.green : Colors.amber,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text(
                        users.username,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      users.age.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    users.height == null
                        ? const SizedBox.shrink()
                        : Text(
                            users.height!,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                    users.weight == null
                        ? const SizedBox.shrink()
                        : Text(
                            users.weight!,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
