import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

final tapListProvider = FutureProvider.family<List<UserModel?>, String>((ref, userId) async {
  final response = await ref.read(profileRepoProvider).getUserTapStats(userId);
  print('DEBUG: TapListView got response: $response');

  // Use the strongly typed response
  List<String> tappedByIds = response.tappedBy;
  print('DEBUG: Found tappedBy IDs: $tappedByIds');

  List<UserModel?> users = [];
  for (final id in tappedByIds) {
    try {
      final user = await ref.read(profileRepoProvider).getUserById(id);
      users.add(user);
    } catch (e) {
      print('DEBUG: Error getting user $id: $e');
    }
  }
  return users;
});

class TapListView extends ConsumerWidget {
  final String userId;
  const TapListView({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tapList = ref.watch(tapListProvider(userId));
    return Scaffold(
      appBar: AppBar(title: const Text('Taps Received')),
      body: tapList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (users) => users.isEmpty
            ? const Center(child: Text('No taps received yet.'))
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  if (user == null) return const SizedBox.shrink();
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profileUrl ?? ''),
                    ),
                    title: Text(user.username),
                    subtitle: Text(user.bio ?? ''),
                  );
                },
              ),
      ),
    );
  }
}
