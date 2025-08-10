// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/src/album/album_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wings_dating_app/src/profile/providers/profile_providers.dart';

import 'package:wings_dating_app/src/album/controller/album_controller.dart';

@RoutePage()
class CreateAlbumView extends ConsumerWidget {
  const CreateAlbumView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumController = ref.watch(AlbumControllerProvider(id));
    final albumNotifier = ref.read(AlbumControllerProvider(id).notifier);

    final albumNameController = TextEditingController(text: albumController.value?.name ?? "");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Album'),
        actions: [
          albumController.maybeWhen(
            data: (data) {
              final isOwner = FirebaseAuth.instance.currentUser?.uid == data.ownerId;
              if (!isOwner) return const SizedBox.shrink();
              return IconButton(
                tooltip: 'Add photos',
                icon: const Icon(Icons.add_photo_alternate_outlined),
                onPressed: data.isShared
                    ? null
                    : () async {
                        final file = await pickImageForm(ImageSource.gallery);
                        if (file != null) {
                          await openEditor(context, ref, id: id, path: file);
                          await albumNotifier.refreshAlbum(id);
                        }
                      },
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: albumController.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error', style: const TextStyle(color: Colors.red)),
          ),
          data: (data) {
            final photos = data.photos;
            final isOwner = FirebaseAuth.instance.currentUser?.uid == data.ownerId;
            final isWide = MediaQuery.of(context).size.width >= 900;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  spacing: 24,
                  runSpacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    SizedBox(
                      width: isWide ? 360 : double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: AspectRatio(
                          aspectRatio: 16 / 10,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              if (photos.isNotEmpty)
                                Hero(
                                  tag: photos.last,
                                  child: CachedNetworkImage(
                                    imageUrl: photos.last,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              else
                                Container(
                                  color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                                  child: Icon(
                                    Icons.photo_album_outlined,
                                    size: 60,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              if (photos.isNotEmpty)
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [Colors.black.withOpacity(0.35), Colors.transparent],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: isWide ? (MediaQuery.of(context).size.width - 360 - 24 - 32) : double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Album Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 8),
                          TextField(
                            controller: albumNameController,
                            readOnly: data.isShared,
                            decoration: InputDecoration(
                              hintText: "Enter album name",
                              filled: true,
                              fillColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant
                                      .withOpacity(data.isShared ? 0.1 : 0.3),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                            onSubmitted: (value) async {
                              final newName = value.trim();
                              if (newName.isEmpty || data.isShared) return;
                              await albumNotifier.rename(newName);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Album renamed')),
                                );
                              }
                            },
                          ),
                          if (isOwner) ...[
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.share),
                                label: const Text('Share with people'),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      String? selectedUserId;
                                      return StatefulBuilder(
                                        builder: (ctx, setState) {
                                          return AlertDialog(
                                            title: const Text('Share with people'),
                                            content: ConstrainedBox(
                                              constraints: const BoxConstraints(minWidth: 320, maxWidth: 560),
                                              child: data.sharedWith.isEmpty
                                                  ? const Text('Not shared with anyone yet.')
                                                  : SizedBox(
                                                      height: 360,
                                                      child: ListView.separated(
                                                        itemCount: data.sharedWith.length,
                                                        separatorBuilder: (_, __) => const Divider(height: 1),
                                                        itemBuilder: (context, i) {
                                                          final uid = data.sharedWith[i];
                                                          final profile = ref.watch(userProfileProvider(uid));
                                                          return profile.when(
                                                            data: (user) {
                                                              final display = user?.username ?? uid;
                                                              return RadioListTile<String>(
                                                                value: uid,
                                                                groupValue: selectedUserId,
                                                                onChanged: (v) => setState(() => selectedUserId = v),
                                                                title: Text(display),
                                                                subtitle: (user?.bio != null && user!.bio!.isNotEmpty)
                                                                    ? Text(user.bio!)
                                                                    : null,
                                                                secondary: CircleAvatar(
                                                                  backgroundImage: (user?.profileUrl != null &&
                                                                          (user!.profileUrl ?? '').isNotEmpty)
                                                                      ? NetworkImage(user.profileUrl!)
                                                                      : null,
                                                                  child: (user?.profileUrl == null ||
                                                                          (user!.profileUrl ?? '').isEmpty)
                                                                      ? const Icon(Icons.person)
                                                                      : null,
                                                                ),
                                                              );
                                                            },
                                                            loading: () => const ListTile(
                                                              leading: SizedBox(
                                                                  width: 24,
                                                                  height: 24,
                                                                  child: CircularProgressIndicator(strokeWidth: 2)),
                                                              title: Text('Loading...'),
                                                            ),
                                                            error: (e, st) => RadioListTile<String>(
                                                              value: uid,
                                                              groupValue: selectedUserId,
                                                              onChanged: (v) => setState(() => selectedUserId = v),
                                                              title: Text(uid),
                                                              subtitle: const Text('Failed to load username'),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.of(ctx).pop(),
                                                child: const Text('Close'),
                                              ),
                                              ElevatedButton.icon(
                                                icon: const Icon(Icons.stop_circle_outlined),
                                                label: const Text('Stop sharing'),
                                                onPressed: selectedUserId == null
                                                    ? null
                                                    : () async {
                                                        final selected = selectedUserId!;
                                                        String display = selected;
                                                        final prof = await ref
                                                            .read(userProfileProvider(selected).future)
                                                            .catchError((_) => null);
                                                        if (prof != null && prof.username.isNotEmpty) {
                                                          display = prof.username;
                                                        }
                                                        await albumNotifier.stopSharingWith(selected);
                                                        if (context.mounted) {
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(content: Text('Stopped sharing with $display')),
                                                          );
                                                        }
                                                        Navigator.of(ctx).pop();
                                                      },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                  await albumNotifier.refreshAlbum(id);
                                },
                              ),
                            ),
                            if (data.isShared == false) ...[
                              const SizedBox(height: 8),
                              Text(
                                "Only you can see this",
                                style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Share with ${albumController.value?.sharedWith.length} people",
                              )
                            ]
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text("Photos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: photos.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return data.isShared
                            ? const SizedBox.shrink()
                            : GestureDetector(
                                onTap: () async {
                                  final file = await pickImageForm(ImageSource.gallery);
                                  if (file != null) {
                                    await openEditor(context, ref, id: id, path: file);
                                    await albumNotifier.refreshAlbum(id);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                                  ),
                                  child: const Center(child: Icon(Icons.add, size: 36)),
                                ),
                              );
                      }
                      final photoUrl = photos[index - 1];
                      return GestureDetector(
                        onLongPress: () async {
                          final isOwner2 = FirebaseAuth.instance.currentUser?.uid == data.ownerId;
                          if (!isOwner2) return;
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Remove photo?'),
                              content: const Text('This will remove the photo from the album.'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                                ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Remove')),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            await albumNotifier.removePhotos({photoUrl});
                            await albumNotifier.refreshAlbum(id);
                          }
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: photoUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            if (FirebaseAuth.instance.currentUser?.uid == data.ownerId)
                              Positioned(
                                left: 4,
                                right: 4,
                                bottom: 4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _ReorderButton(
                                      icon: Icons.chevron_left,
                                      onPressed: () async {
                                        final i = index - 1;
                                        if (i <= 0) return;
                                        final newOrder = [...photos];
                                        final tmp = newOrder[i - 1];
                                        newOrder[i - 1] = newOrder[i];
                                        newOrder[i] = tmp;
                                        await albumNotifier.reorderPhotos(newOrder);
                                        await albumNotifier.refreshAlbum(id);
                                      },
                                    ),
                                    _ReorderButton(
                                      icon: Icons.chevron_right,
                                      onPressed: () async {
                                        final i = index - 1;
                                        if (i >= photos.length - 1) return;
                                        final newOrder = [...photos];
                                        final tmp = newOrder[i + 1];
                                        newOrder[i + 1] = newOrder[i];
                                        newOrder[i] = tmp;
                                        await albumNotifier.reorderPhotos(newOrder);
                                        await albumNotifier.refreshAlbum(id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      );
                    },
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

class _ReorderButton extends StatelessWidget {
  const _ReorderButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
