import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

import '../users/users_view.dart';

final getUserBlockListProvider = FutureProvider<List<UserModel?>>((ref) async {
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
          child: CircularProgressIndicator(),
        ),
        data: (data) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: data.isEmpty
              ? Center(
                  child:
                      const Text("No Users In Block List").animate().fadeIn(),
                )
              : GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return UserGridItem(
                      users: data[index]!,
                    ).animate().shake();
                  },
                ),
        ),
      ),
    );
  }
}
