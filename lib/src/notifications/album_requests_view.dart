import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// No codegen needed here
import 'package:wings_dating_app/repo/albums_repo.dart';

final albumAccessRequestsProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
  return ref.read(albumsRepoProvider).listAlbumAccessRequestsForOwner(status: 'pending');
});

@RoutePage()
class AlbumRequestsView extends ConsumerWidget {
  const AlbumRequestsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requests = ref.watch(albumAccessRequestsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Album Requests')),
      body: requests.when(
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No pending requests'));
          }
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = items[index];
              final requester = (item['requester'] ?? {}) as Map<String, dynamic>;
              final album = (item['album'] ?? {}) as Map<String, dynamic>;
              final username = requester['username'] ?? 'Unknown';
              final avatar = requester['profileUrl'] as String?;
              final albumName = album['name'] ?? 'Album';
              final requestId = item['_id']?.toString() ?? item['id']?.toString();

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: (avatar != null && avatar.isNotEmpty) ? NetworkImage(avatar) : null,
                  child: (avatar == null || avatar.isEmpty) ? const Icon(Icons.person) : null,
                ),
                title: Text(username),
                subtitle: Text('wants access to "$albumName"'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: 'Reject',
                      icon: const Icon(Icons.close, color: Colors.redAccent),
                      onPressed: requestId == null
                          ? null
                          : () async {
                              await ref
                                  .read(albumsRepoProvider)
                                  .moderateAlbumAccessRequest(requestId: requestId, action: 'reject');
                              ref.invalidate(albumAccessRequestsProvider);
                            },
                    ),
                    IconButton(
                      tooltip: 'Approve',
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: requestId == null
                          ? null
                          : () async {
                              await ref
                                  .read(albumsRepoProvider)
                                  .moderateAlbumAccessRequest(requestId: requestId, action: 'approve');
                              ref.invalidate(albumAccessRequestsProvider);
                            },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
