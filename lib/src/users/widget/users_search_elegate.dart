import 'package:cached_network_image/cached_network_image.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/users/users_view.dart';

final searchUsersProvider = FutureProvider.family<List<UserModel?>?, String>((ref, query) async {
  return await ref.read(profileRepoProvider).searchUser(query);
});

// final userLastActiveProvider = FutureProvider.family<int, int>((ref, cubeId) async {
//   await CubeChatConnection.instance.subscribeToUserLastActivityStatus(cubeId);
//   return CubeChatConnection.instance.getLasUserActivity(cubeId);
// });

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
        child: CircularProgressIndicator.adaptive(),
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
        child: CircularProgressIndicator.adaptive(),
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
