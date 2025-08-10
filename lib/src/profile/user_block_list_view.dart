import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
// Removed unused imports

final getUserBlockListProvider = FutureProvider.autoDispose<List<UserModel?>>((ref) async {
  return await ref.read(profileRepoProvider).getBlockList();
});

@RoutePage()
class UserBlockListView extends ConsumerWidget {
  const UserBlockListView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final getUserList = ref.watch(getUserBlockListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Block List"),
      ),
      body: getUserList.when(
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        data: (data) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: data.isEmpty
              ? Center(
                  child: const Text("No Users In Block List").animate().fadeIn(),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final user = data[index]!;
                    return ListTile(
                      trailing: TextButton(
                        onPressed: () async {
                          // await ref
                          //     .read(ProfileController.userControllerProvider)
                          //     .removeFromBlockList(
                          //       id: user.id,
                          //       cubeId: user.cubeUser.id!,
                          //     );

                          ref.invalidate(getUserBlockListProvider);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        child: const Text("Remove"),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          user.profileUrl!,
                        ),
                      ),
                      title: Text(user.username),
                    ).animate().shake();
                  },
                ),
        ),
      ),
    );
  }
}
