// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/src/album/album_view.dart';
import 'package:wings_dating_app/src/model/album_model.dart';

import 'package:wings_dating_app/src/album/controller/album_controller.dart';

@RoutePage()
class CreateAlbumView extends ConsumerWidget {
  const CreateAlbumView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumController = ref.watch(AlbumControllerProvider(id));
    final albumNotifier = ref.read(AlbumControllerProvider(id).notifier);
    final photos = albumController.value?.photos ?? [];
    final albumNameController = TextEditingController(text: albumController.value?.name ?? "");
    final isAlbumCreated = albumController.value != null;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Album')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: photos!.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: photos.last,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                        : Center(
                            child: Icon(Icons.photo_album, size: 60, color: Colors.grey[400]),
                          ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Album Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: albumNameController,
                        decoration: InputDecoration(
                          hintText: "Enter album name",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        onSubmitted: (value) {
                          // Optionally implement album name update
                        },
                      ),
                      const SizedBox(height: 8),
                      const Text("Only you can see this", style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 16),
                      Text(
                        "Share with ${albumController.value?.sharedWith.length} people",
                      )
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: photos.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () async {
                        final file = await pickImageForm(ImageSource.gallery);
                        if (file != null && id != null) {
                          if (isAlbumCreated) {
                            // Album exists, just add image
                            await openEditor(context, ref, id: id!, path: file);
                            await albumNotifier.refreshAlbum(id);
                          } else {
                            // Album does not exist, create it first
                            final albumName = albumNameController.text.trim().isNotEmpty
                                ? albumNameController.text.trim()
                                : "My Album";
                            await ref.read(AlbumControllerProvider(id).notifier).createAlbum(
                                  UserAlbumModel(
                                    ownerId: id!,
                                    name: albumName,
                                    createdAt: DateTime.now(),
                                    updatedAt: DateTime.now(),
                                  ),
                                );
                            await openEditor(context, ref, id: id, path: file);
                            await albumNotifier.refreshAlbum(id);
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                        child: const Center(child: Icon(Icons.add, size: 36)),
                      ),
                    );
                  }
                  final photoUrl = photos[index - 1];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: photoUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
