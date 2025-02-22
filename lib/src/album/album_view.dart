// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/helpers/uploader.dart';
import 'package:wings_dating_app/repo/albums_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/album/controller/album_controller.dart';
import 'package:wings_dating_app/src/model/album_model.dart';
import 'package:wings_dating_app/src/users/users_view.dart';

// part 'album_view.g.dart';

final getAllAlbumsProvider = FutureProvider<List<AlbumListModel>>((ref) async {
  return ref.read(albumsRepoProvider).getAllAlbums();
});

@RoutePage()
class AlbumView extends ConsumerWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => Future.delayed(
        const Duration(seconds: 1),
      ),
      child: Scaffold(
        appBar: AppBar(
          // leading: const AutoLeadingButton(),
          title: const Text("Chats"),
          actions: [
            GestureDetector(
                onTap: () async {
                  // final image = await pickImageForm(ImageSource.gallery);
                  // if (image != null) {
                  context.router.push(CreateAlbumRoute());

                  // }
                },
                child: Text("Create Album")),
          ],
        ),
        body: ResponsiveBuilder(builder: (context, sizingInformation) {
          final albums = ref.watch(getAllAlbumsProvider);
          final sharedAlbums = ref.watch(sharedAlbumProvider);
          return Row(
            children: [
              NavigationBarWidget(
                sizingInformation: sizingInformation,
              ),
              Expanded(
                  flex: 4,
                  child: albums.when(
                    data: (data) => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemCount:
                            data.length + (sharedAlbums.value?.length ?? 0),
                        itemBuilder: (context, index) {
                          print("index ${index >= data.length}");
                          if (index >= data.length) {
                            final sharedAlbum =
                                sharedAlbums.value![index - data.length];
                            final image = List.from(sharedAlbum
                                .message
                                .attachments
                                .first
                                .extraData["imageUrls"] as dynamic);
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Animate(
                                    effects: [BlurEffect()],
                                    child: Positioned.fill(
                                        child: Image.network(
                                      image.first,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ],
                              ),
                            );
                          }
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                if (data[index].imageUrls.isNotEmpty)
                                  Animate(
                                    effects: [BlurEffect()],
                                    child: Positioned.fill(
                                        child: Image.network(
                                      data[index].imageUrls[index],
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      context.router.push(
                                          CreateAlbumRoute(id: data[index].id));

                                      // context.router.push(AlbumDetailsRoute(id: data[index].id));
                                    },
                                    child: Card(
                                      color: Colors.black12,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data[index].name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    error: (error, stackTrace) =>
                        Center(child: Text(error.toString())),
                  )),
            ],
          );
        }),
      ),
    );
  }
}

Future<void> openEditor(BuildContext context, WidgetRef ref,
    {required Uint8List path, required String id}) async {
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => kIsWeb
          ? ProImageEditor.memory(
              path,
              callbacks: ProImageEditorCallbacks(
                onImageEditingComplete: (bytes) async {
                  final _path = await uploadFileToFirebaseAlbum(bytes);

                  await ref
                      .read(AlbumControllerProvider(id).notifier)
                      .addImage(_path);

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
                  final path = await uploadFileToFirebaseAlbum(bytes);

                  await ref
                      .read(AlbumControllerProvider(id).notifier)
                      .addImage(path);

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
    ),
  );
}
