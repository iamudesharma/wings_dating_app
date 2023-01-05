import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';

import '../model/user_models.dart';
import '../profile/controller/profile_controller.dart';

final userListProvider = FutureProvider<List<UserModel>?>((ref) async {
  return ref.read(profileRepoProvider).getUserList();
});

class UsersView extends ConsumerWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userData =
        ref.watch(ProfileController.userControllerProvider).userModel;
    final userList = ref.watch(userListProvider);
    return Scaffold(
      body: CustomScrollView(
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
                backgroundImage: NetworkImage(userData!.profileUrl!),
              ),
            ),
            title: Text(userData.name),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.blueGrey.shade300,
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Column(children: [
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
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Username",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "Age",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      );
                    },
                    childCount: data?.length,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
