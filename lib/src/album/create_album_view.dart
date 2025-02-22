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

import 'package:wings_dating_app/src/album/controller/album_controller.dart';

@RoutePage()
class CreateAlbumView extends ConsumerWidget {
  const CreateAlbumView({
    super.key,
    this.id,
  });
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumController = ref.watch(AlbumControllerProvider(id));
    return Scaffold(
      appBar: AppBar(title: const Text('Create Album')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Flex(
          direction: Axis.vertical,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Row(
                spacing: 20,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: (albumController.value?.imageUrls ?? []).isNotEmpty
                          ? Animate(
                              effects: [BlurEffect()],
                              child: CachedNetworkImage(
                                imageUrl: albumController.value!.imageUrls.last,
                                fit: BoxFit.cover,
                              ),
                            )
                          : SizedBox(),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Album Name"),
                        TextField(
                          controller: TextEditingController(
                              text: albumController.value?.name),
                          onSubmitted: (value) {
                            // albumController.createAlbum(value);
                          },
                        ),
                        Text("Only you can see this"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                GestureDetector(
                  onTap: () async {
                    if (kIsWeb) {
                      final file = await pickImageForm(ImageSource.camera);
                      if (file != null) {
                        if (context.mounted) {
                          openEditor(context, ref, id: id!, path: file);
                        }
                      }
                    } else if (Platform.isMacOS || Platform.isWindows) {
                      final file = await pickImageForm(ImageSource.camera);
                      if (file != null) {
                        if (context.mounted) {
                          openEditor(context, ref, id: id!, path: file);
                        }
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog.adaptive(
                          contentPadding: EdgeInsets.all(15),
                          content: Text("Select Pic From Options"),
                          actionsPadding: EdgeInsets.all(15),
                          actions: [
                            ElevatedButton(
                              onPressed: () async {
                                final file =
                                    await pickImageForm(ImageSource.camera);
                                if (file != null) {
                                  if (context.mounted) {
                                    openEditor(context, ref,
                                        id: id!, path: file);
                                  }
                                }
                              },
                              child: Text("Camera"),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final file =
                                    await pickImageForm(ImageSource.gallery);
                                if (file != null) {
                                  if (context.mounted) {
                                    openEditor(context, ref,
                                        id: id!, path: file);
                                  }
                                }
                              },
                              child: Text("Gallery"),
                            ),
                          ],
                        ),
                      );
                    }
                    // openEditor(
                    //   id: id,
                    //   path:
                    // );
                    // ref.read(AlbumControllerProvider(id).notifier).addImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor),
                    child: const Center(child: Icon(Icons.add)),
                  ),
                ),
                if (albumController.value != null)
                  ...albumController.value!.imageUrls.map((e) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: e,
                        ),
                      ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
