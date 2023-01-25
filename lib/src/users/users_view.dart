import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:location/location.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';

import '../../routes/app_router.dart';
import '../model/user_models.dart';
import '../profile/controller/profile_controller.dart';

final userListProvider = FutureProvider<List<UserModel>?>((ref) async {
  return ref.read(profileRepoProvider).getUserList();
});

class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    GeoFlutterFire geo = GeoFlutterFire();

    Location location = Location();

    // location.

    // LocationData _locationData = await location.getLocation();
    // logger.e(_locationData.latitude);
    // final geoData = geo.point(
    //   latitude: _locationData.latitude!,
    //   longitude: _locationData.longitude!,
    // );

    // await ref.read(profileRepoProvider).updateLocation(geoData);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userData =
        ref.watch(ProfileController.userControllerProvider).userModel;
    final userList = ref.watch(userListProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(userListProvider),
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              centerTitle: true,
              pinned: true,
              // floating: false,

              titleSpacing: 50,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  // radius: 2,
                  backgroundImage: NetworkImage(userData!.profileUrl ?? ""),
                ),
              ),
              title: Text(userData.username),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
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
                  skipLoadingOnRefresh: true,
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        data.removeWhere((element) =>
                            element.id ==
                            FirebaseAuth.instance.currentUser!.uid);
                        final users = data[index];

                        return InkWell(
                          onTap: () {
                            // if (userData.id != users.id) {
// AutoRouter.of(context).push(const ProfileView());
                            AutoRouter.of(context).push(OtherUserProfileRoute(
                              id: users.id,
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(users.profileUrl ?? ""),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.blueGrey.shade300,
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      ref
                                          .read(ProfileController
                                              .userControllerProvider)
                                          .getDistance(Coordinates(
                                              users.position!.geopoint.latitude,
                                              users.position!.geopoint
                                                  .longitude)),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.green,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          users.username,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "170 cm",
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          "55 kg",
                                          style: TextStyle(
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
                      },
                      childCount: data!.length - 1,
                    ),
                  ),
                )),
          ],
        ),
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
