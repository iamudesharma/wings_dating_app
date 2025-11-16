// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/helpers/uploader.dart';
import 'package:wings_dating_app/repo/albums_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/album/controller/album_controller.dart';
import 'package:wings_dating_app/src/model/album_model.dart';
import 'package:wings_dating_app/src/users/users_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wings_dating_app/src/notifications/album_requests_view.dart';
import 'package:wings_dating_app/helpers/helpers.dart';

// part 'album_view.g.dart';

final getAllAlbumsProvider = FutureProvider.autoDispose<List<UserAlbumModel>>((ref) async {
  return ref.read(albumsRepoProvider).getAllAlbums();
});

// Albums shared with current user (read-only)
final getSharedAlbumsProvider = FutureProvider.autoDispose<List<UserAlbumModel>>((ref) async {
  return ref.read(albumsRepoProvider).getSharedAlbums();
});

@RoutePage()
class AlbumView extends ConsumerWidget {
  const AlbumView({super.key});

  void _showCreateAlbumDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final userId = FirebaseAuth.instance.currentUser?.uid;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Album'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: 'Album Name'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.trim().isEmpty || userId == null) return;
              final album = UserAlbumModel(
                ownerId: userId,
                name: nameController.text.trim(),
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              );
              final created = await ref.read(albumsRepoProvider).addAlbum(album);
              if (created != null) {
                // Refresh album lists
                ref.invalidate(getAllAlbumsProvider);
                ref.invalidate(getSharedAlbumsProvider);
                if (context.mounted) {
                  Navigator.of(context).pop();
                  // Optionally navigate to edit the new album
                  context.router.push(CreateAlbumRoute(id: created.id!));
                }
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to create album')));
                }
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final albumController = ref.watch(getAllAlbumsProvider);
    final sharedController = ref.watch(getSharedAlbumsProvider);
    final isWide = MediaQuery.of(context).size.width > 600;

    return RefreshIndicator(
      onRefresh: () async {
        if (userId != null) {
          // ref.refresh returns the provider; re-read to ensure new future
          ref.invalidate(getAllAlbumsProvider);
          ref.invalidate(getSharedAlbumsProvider);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Albums"),
          actions: [
            // Pending album requests shortcut
            Consumer(
              builder: (context, ref, _) {
                final pending = ref.watch(albumAccessRequestsProvider);
                final count = pending.maybeWhen(data: (items) => items.length, orElse: () => 0);
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      tooltip: 'Album Requests',
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AlbumRequestsView()));
                      },
                    ),
                    if (count > 0)
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            count > 9 ? '9+' : '$count',
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_photo_alternate_rounded),
              tooltip: 'Create Album',
              onPressed: () => _showCreateAlbumDialog(context, ref),
            ),
          ],
        ),
        body: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return Row(
              children: [
                if (isWide) NavigationBarWidget(sizingInformation: sizingInformation),
                Expanded(
                  flex: 4,
                  child: albumController.when(
                    data: (owned) {
                      final sharedRaw = sharedController.maybeWhen(
                        data: (s) => s,
                        orElse: () => const <UserAlbumModel>[],
                      );

                      // Split the combined API response into owned vs shared by owner
                      final currentUserId = userId;
                      final allFromUserEndpoint = owned;

                      // Owned = albums where ownerId == current user
                      final ownedList = allFromUserEndpoint
                          .where((a) => currentUserId != null && a.ownerId == currentUserId)
                          // Do not show the "Shared" ribbon on your own albums section
                          .map((a) => a.copyWith(isShared: false))
                          .toList(growable: false);

                      // Shared candidates from the user endpoint = albums owned by others
                      final sharedFromUserEndpoint = allFromUserEndpoint
                          .where((a) => currentUserId != null && a.ownerId != currentUserId)
                          .map((a) => a.copyWith(isShared: true))
                          .toList(growable: false);

                      // Merge with dedicated shared endpoint results
                      final Map<String, UserAlbumModel> sharedMap = {
                        for (final a in sharedFromUserEndpoint)
                          if (a.id != null) a.id!: a,
                      };
                      for (final a in sharedRaw) {
                        if (a.id != null && !sharedMap.containsKey(a.id)) {
                          sharedMap[a.id!] = a.copyWith(isShared: true);
                        }
                      }
                      // Remove any duplicates that overlap with owned ids
                      final ownedIds = ownedList.map((e) => e.id).whereType<String>().toSet();
                      final shared = sharedMap.values
                          .where((a) => a.id != null && !ownedIds.contains(a.id))
                          .toList(growable: false);

                      if (ownedList.isEmpty && shared.isEmpty) {
                        return const Center(child: Text('No albums found. Create your first album!'));
                      }

                      Widget gridFor(List<UserAlbumModel> list) => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isWide ? 4 : 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          final album = list[index];
                          final ownerId = album.owner?.id ?? album.ownerId;
                          final ownerName = album.owner != null
                              ? album.owner!.username
                              : (ownerId == userId ? 'You' : 'Owner');
                          final ownerAvatar = album.owner?.profilePicture;
                          return _AlbumCard(
                            isShared: album.isShared,
                            name: album.name,
                            imageUrl: album.photos.isNotEmpty ? album.photos.first : null,
                            ownerId: ownerId,
                            ownerName: ownerName,
                            ownerAvatar: ownerAvatar,
                            onTap: () {
                              if (album.id == null) return;
                              final currentUserId = FirebaseAuth.instance.currentUser?.uid;
                              final isOwner = currentUserId != null && album.ownerId == currentUserId;
                              if (isOwner) {
                                context.router.push(CreateAlbumRoute(id: album.id!));
                              } else {
                                context.router.push(AlbumDetailsRoute(id: album.id!));
                              }
                            },
                          );
                        },
                      );

                      return ListView(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        children: [
                          if (ownedList.isNotEmpty) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                              child: Text('Your albums', style: Theme.of(context).textTheme.titleMedium),
                            ),
                            gridFor(ownedList),
                            const SizedBox(height: 20),
                          ],
                          if (shared.isNotEmpty) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                              child: Text('Shared with you', style: Theme.of(context).textTheme.titleMedium),
                            ),
                            gridFor(shared),
                          ],
                        ],
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                    error: (error, stackTrace) => Center(child: Text(error.toString())),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AlbumCard extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final VoidCallback onTap;
  final bool isShared;
  final String? ownerId;
  final String? ownerName;
  final String? ownerAvatar;
  const _AlbumCard({
    required this.name,
    this.imageUrl,
    required this.onTap,
    this.isShared = false,
    this.ownerId,
    this.ownerName,
    this.ownerAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(20);
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.surfaceContainerHighest.withOpacity(0.6),
              theme.colorScheme.surfaceContainerHighest.withOpacity(0.2),
            ],
          ),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 6))],
          border: Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.4)),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: radius,
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      loadingBuilder: (context, child, progress) =>
                          progress == null ? child : const Center(child: CircularProgressIndicator()),
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: theme.colorScheme.surface,
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary.withOpacity(0.12),
                            theme.colorScheme.secondary.withOpacity(0.12),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Icon(Icons.photo_album, size: 48, color: theme.colorScheme.onSurface.withOpacity(0.5)),
                    ),
            ),
            // subtle dark overlay for text legibility
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: radius,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.65)],
                  ),
                ),
              ),
            ),
            if (isShared)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Shared',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.vertical(bottom: radius.bottomLeft),
                ),
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (ownerId != null && ownerName != null) ...[
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () => context.router.push(OtherUserProfileRoute(id: ownerId!)),
                        borderRadius: BorderRadius.circular(12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 9,
                              backgroundImage: (ownerAvatar != null && ownerAvatar!.isNotEmpty)
                                  ? NetworkImage(ownerAvatar!)
                                  : null,
                              child: (ownerAvatar == null || ownerAvatar!.isEmpty)
                                  ? const Icon(Icons.person, size: 12, color: Colors.white)
                                  : null,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              ownerName!,
                              style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> openEditor(BuildContext context, WidgetRef ref, {required Uint8List path, required String id}) async {
  logger.i('[AlbumEditor] Opening editor for albumId=$id bytes=${path.lengthInBytes}');
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => kIsWeb
          ? ProImageEditor.memory(
              path,
              callbacks: ProImageEditorCallbacks(
                onImageEditingComplete: (bytes) async {
                  logger.i('[AlbumEditor] Edit complete. Uploading bytes=${bytes.lengthInBytes}');
                  final uploadedPath = await uploadFileToFirebaseAlbum(bytes);
                  logger.i('[AlbumEditor] Upload success. url=$uploadedPath');
                  // Add image to album after upload
                  final controller = ref.read(albumControllerProvider(id).notifier);
                  await controller.addImageToAlbum(uploadedPath);
                  if (context.mounted) {
                    logger.i('[AlbumEditor] Closing editor after successful save.');
                    Navigator.pop(context);
                  }
                },
              ),
            )
          : ProImageEditor.memory(
              path,
              callbacks: ProImageEditorCallbacks(
                onImageEditingComplete: (bytes) async {
                  logger.i('[AlbumEditor] Edit complete. Uploading bytes=${bytes.lengthInBytes}');
                  final uploadedPath = await uploadFileToFirebaseAlbum(bytes);
                  logger.i('[AlbumEditor] Upload success. url=$uploadedPath');
                  // Add image to album after upload
                  final controller = ref.read(albumControllerProvider(id).notifier);
                  await controller.addImageToAlbum(uploadedPath);
                  if (context.mounted) {
                    logger.i('[AlbumEditor] Closing editor after successful save.');
                    Navigator.pop(context);
                  }
                },
              ),
            ),
    ),
  );
}
