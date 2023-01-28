import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

final getUserBlockListProvider = FutureProvider<List<UserModel?>>((ref) async {
  return await ref.read(profileRepoProvider).getBlockList();
});

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
        data: (data) => GridView.builder(
          itemCount: data.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
