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

// part 'album_view.g.dart';

final getAllAlbumsProvider = FutureProvider<List<UserAlbumModel>>((ref) async {
  return ref.read(albumsRepoProvider).getAllAlbums();
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
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.trim().isEmpty || userId == null) return;
              final album = UserAlbumModel(
                ownerId: userId,
                name: nameController.text.trim(),
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              );
              await ref.read(AlbumControllerProvider(userId).notifier).createAlbum(album);
              Navigator.of(context).pop();
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
    // final sharedAlbums = ref.watch(sharedAlbumProvider);
    final isWide = MediaQuery.of(context).size.width > 600;

    return RefreshIndicator(
      onRefresh: () async {
        if (userId != null) {
          return await ref.refresh(getAllAlbumsProvider);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Albums"),
          actions: [
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
                    data: (albums) {
                      final allAlbums = albums ?? <UserAlbumModel>[];
                      // final shared = sharedAlbums.value ?? [];
                      if (allAlbums.isEmpty) {
                        return const Center(child: Text('No albums found. Create your first album!'));
                      }
                      return GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isWide ? 4 : 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: allAlbums.length,
                        itemBuilder: (context, index) {
                          final album = allAlbums[index];
                          return _AlbumCard(
                            isShared: album.isShared,
                            name: album.name,
                            imageUrl: album.photos.isNotEmpty ? album.photos.first : null,
                            onTap: () {
                              context.router.push(CreateAlbumRoute(id: album.id ?? album.ownerId));
                            },
                          );
                        },
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
  const _AlbumCard({
    required this.name,
    this.imageUrl,
    required this.onTap,
    this.isShared = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  loadingBuilder: (context, child, progress) =>
                      progress == null ? child : const Center(child: CircularProgressIndicator()),
                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image)),
                ),
              ),
            if (isShared)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.8),
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
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => kIsWeb
          ? ProImageEditor.memory(
              path,
              callbacks: ProImageEditorCallbacks(
                onImageEditingComplete: (bytes) async {
                  final uploadedPath = await uploadFileToFirebaseAlbum(bytes);
                  // Add image to album after upload
                  await ref.read(AlbumControllerProvider(id).notifier).addImageToAlbum(uploadedPath);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            )
          : ProImageEditor.memory(
              path,
              callbacks: ProImageEditorCallbacks(
                onImageEditingComplete: (bytes) async {
                  final uploadedPath = await uploadFileToFirebaseAlbum(bytes);
                  // Add image to album after upload
                  await ref.read(AlbumControllerProvider(id).notifier).addImageToAlbum(
                        uploadedPath,
                      );
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
    ),
  );
}
