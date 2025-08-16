import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wings_dating_app/helpers/image_picker.dart';
import 'package:wings_dating_app/repo/albums_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/album/album_view.dart';
import 'package:wings_dating_app/src/album/controller/album_controller.dart';
import 'package:wings_dating_app/src/model/album_model.dart';

part 'album_details_view.g.dart';

@riverpod
class AlbumDetails extends _$AlbumDetails {
  @override
  FutureOr<UserAlbumModel> build(String id) async {
    return ref.read(albumsRepoProvider).getAlbumsById(id);
  }
}

// Named provider for checking if current user has a pending access request
final pendingAlbumRequestProvider = FutureProvider.autoDispose.family<bool, String>((ref, albumId) async {
  try {
    final pending = await ref.read(albumsRepoProvider).getPendingRequestForAlbum(albumId: albumId);
    return pending != null;
  } catch (_) {
    return false;
  }
});

@RoutePage()
class AlbumDetailsView extends ConsumerWidget {
  const AlbumDetailsView({super.key, required this.id, this.isPreview = false, this.channel});
  final String id;
  final bool isPreview;
  final Channel? channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(AlbumDetailsProvider(id));
    final pendingAsync = ref.watch(pendingAlbumRequestProvider(id));

    final albumsWidget = albums.when(
      data: (data) {
        if (data.photos.isEmpty) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: _EmptyAlbumCard(isOwner: FirebaseAuth.instance.currentUser?.uid == data.ownerId),
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final photo = data.photos[index];
                final isOwner = FirebaseAuth.instance.currentUser?.uid == data.ownerId;
                return GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(ImagePreviewRoute(path: photo));
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Hero(
                          tag: photo,
                          child: Image.network(
                            photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (isOwner)
                        Positioned(
                          top: 6,
                          right: 6,
                          child: Material(
                            color: Theme.of(context).colorScheme.surface.withOpacity(0.75),
                            shape: const CircleBorder(),
                            child: IconButton(
                              visualDensity: VisualDensity.compact,
                              iconSize: 20,
                              tooltip: 'Remove photo',
                              icon: Icon(
                                Icons.delete_outline,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Remove photo?'),
                                    content: const Text('This will remove the photo from the album.'),
                                    actions: [
                                      TextButton(
                                          onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                                      ElevatedButton(
                                          onPressed: () => Navigator.pop(ctx, true), child: const Text('Remove')),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  await ref.read(AlbumControllerProvider(id).notifier).removePhotos({photo});
                                  await ref.read(AlbumControllerProvider(id).notifier).refreshAlbum(id);
                                }
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
              childCount: data.photos.length,
            ),
          ),
        );
      },
      error: (error, stackTrace) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(child: Text(error.toString())),
        ),
      ),
      loading: () => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );

    if (isPreview) {
      return StreamChannel(
        channel: channel ?? StreamChannel.of(context).channel,
        child: Scaffold(
          appBar: StreamChannelHeader(),
          body: CustomScrollView(
            slivers: [albumsWidget],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Album"),
        actions: [
          albums.maybeWhen(
            data: (data) {
              final isOwner = FirebaseAuth.instance.currentUser?.uid == data.ownerId;
              if (!isOwner) return const SizedBox.shrink();
              return IconButton(
                tooltip: (albums.value?.photos.isNotEmpty ?? false) ? 'Add photos' : 'Create album',
                icon: const Icon(Icons.add_photo_alternate_outlined),
                onPressed: () async {
                  final image = await pickImageForm(ImageSource.gallery);
                  if (image != null && context.mounted) {
                    openEditor(context, ref, path: image, id: id);
                  }
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: albums.when(
        data: (data) {
          final isOwner = FirebaseAuth.instance.currentUser?.uid == data.ownerId;
          final header = (!isOwner && data.isShared && data.owner != null)
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: (data.owner!.profilePicture.isNotEmpty)
                                ? NetworkImage(data.owner!.profilePicture)
                                : null,
                            child: data.owner!.profilePicture.isEmpty ? const Icon(Icons.person) : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.owner!.username, style: Theme.of(context).textTheme.titleMedium),
                                const SizedBox(height: 2),
                                Row(children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text('Shared album',
                                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                              color: Theme.of(context).colorScheme.primary,
                                            )),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink());

          final content = CustomScrollView(
            slivers: [
              // Optional cover preview
              if (data.photos.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Hero(
                              tag: data.photos.first,
                              child: Image.network(data.photos.first, fit: BoxFit.cover),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.4),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              bottom: 12,
                              right: 12,
                              child: Row(
                                children: [
                                  Icon(Icons.photo_library_outlined,
                                      color: Theme.of(context).colorScheme.onSurface, size: 18),
                                  const SizedBox(width: 8),
                                  Text(
                                    data.name.isNotEmpty ? data.name : 'Album',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              header,
              albumsWidget,
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          );
          // If user neither owner nor shared, show request access
          if (!isOwner && data.isShared == false) {
            return Column(
              children: [
                Expanded(child: content),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: pendingAsync.maybeWhen(
                    data: (isPending) {
                      if (isPending) {
                        return OutlinedButton.icon(
                          icon: const Icon(Icons.hourglass_top),
                          label: const Text('Requested'),
                          onPressed: null,
                        );
                      }
                      return ElevatedButton.icon(
                        icon: const Icon(Icons.lock_open),
                        label: const Text('Request Access'),
                        onPressed: () async {
                          final controller = TextEditingController();
                          final message = await showDialog<String>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Request access'),
                              content: TextField(
                                controller: controller,
                                decoration: const InputDecoration(hintText: 'Add a message'),
                              ),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(ctx, controller.text.trim()),
                                  child: const Text('Send'),
                                ),
                              ],
                            ),
                          );
                          if (message != null) {
                            final res = await ref
                                .read(AlbumControllerProvider(id).notifier)
                                .requestAccess(message, albumId: id);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(res != null ? 'Request sent' : 'Failed to send request')),
                              );
                            }
                            // refresh pending state
                            ref.invalidate(pendingAlbumRequestProvider(id));
                          }
                        },
                      );
                    },
                    orElse: () => ElevatedButton.icon(
                      icon: const Icon(Icons.lock_open),
                      label: const Text('Request Access'),
                      onPressed: () async {
                        final controller = TextEditingController();
                        final message = await showDialog<String>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Request access'),
                            content: TextField(
                              controller: controller,
                              decoration: const InputDecoration(hintText: 'Add a message'),
                            ),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(ctx, controller.text.trim()),
                                child: const Text('Send'),
                              ),
                            ],
                          ),
                        );
                        if (message != null) {
                          final res =
                              await ref.read(AlbumControllerProvider(id).notifier).requestAccess(message, albumId: id);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(res != null ? 'Request sent' : 'Failed to send request')),
                            );
                          }
                          ref.invalidate(pendingAlbumRequestProvider(id));
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return content;
        },
        error: (e, st) => CustomScrollView(slivers: [albumsWidget]),
        loading: () => CustomScrollView(slivers: [albumsWidget]),
      ),
    );
  }
}

class _EmptyAlbumCard extends StatelessWidget {
  const _EmptyAlbumCard({required this.isOwner});
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.photo_album_outlined, size: 48, color: Theme.of(context).colorScheme.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(
            isOwner ? 'No photos yet' : 'Nothing to see yet',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            isOwner ? 'Add photos to get started.' : 'Ask the owner for access or wait until shared.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
