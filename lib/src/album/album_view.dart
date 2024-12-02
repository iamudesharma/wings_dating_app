import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:wings_dating_app/dependency/dependenies.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/helpers/uploader.dart';
import 'package:wings_dating_app/repo/albums_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/model/album_model.dart';
import 'package:wings_dating_app/src/users/users_view.dart';
part 'album_view.g.dart';

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
                  context.router.push(AlbumDetailsRoute());

                  // }
                },
                child: Text("Create Album")),
          ],
        ),
        body: ResponsiveBuilder(builder: (context, sizingInformation) {
          final albums = ref.watch(getAllAlbumsProvider);
          return Row(
            children: [
              NavigationBarWidget(
                sizingInformation: sizingInformation,
              ),
              Expanded(
                  flex: 4,
                  child: albums.when(
                    data: (data) => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 200),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                context.router.push(AlbumDetailsRoute());
                              },
                              child: Text(data[index].name));
                        }),
                    loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                    error: (error, stackTrace) => Center(child: Text(error.toString())),
                  )),
            ],
          );
        }),
      ),
    );
  }
}

void _openEditor(BuildContext context, WidgetRef ref, {required String path}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProImageEditor.file(
        File(path),
        callbacks: ProImageEditorCallbacks(
          onImageEditingComplete: (bytes) async {
            // print('onImageEditingComplete $bytes');
            final directory = await getTemporaryDirectory();

            // Define the file path (you can specify any name or extension for the image)
            final filePath = '${directory.path}/my_image.png';

            // Create a File object and write the bytes to it
            final file = File(filePath);
            await file.writeAsBytes(bytes);

            final path = await uploadFileToFirebaseAlbum(bytes);
            ref.read(albumsRepoProvider).addAlbum(
                  AlbumListModel(
                      imageUrls: [path],
                      name: "my album",
                      id: Uuid().v4(),
                      userId: ref.read(Dependency.firebaseAuthProvider).currentUser!.uid),
                );

            ref.read(albumProviderProvider.notifier).addImage(filePath);
            /*
              Your code to handle the edited image. Upload it to your server as an example.
              You can choose to use await, so that the loading-dialog remains visible until your code is ready, or no async, so that the loading-dialog closes immediately.
              By default, the bytes are in `jpg` format.
            */
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    ),
  );
}

@RoutePage()
class AlbumDetailsView extends ConsumerWidget {
  const AlbumDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(albumProviderProvider);
    return Scaffold(
      appBar: AppBar(
        // leading: const AutoLeadingButton(),
        title: const Text("Chats"),
        actions: [
          GestureDetector(
              onTap: () async {
                final image = await pickImageForm(ImageSource.gallery);
                if (image != null) {
                  if (context.mounted) {
                    _openEditor(context, ref, path: image);
                  }
                }
              },
              child: Text((albums.value?.length ?? 0) > 0 ? "Add More" : "Create Album")),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Card(),
                Column(),
              ],
            ),
          ),
          albums.when(
            data: (data) => SliverGrid.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Image.network(
                  data[index],
                );
              },
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(child: Text(error.toString())),
            ),
            loading: () => SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        ],
      ),
    );
  }
}

@Riverpod(keepAlive: true)
class AlbumProvider extends _$AlbumProvider {
  // List<String> albums = [];
  @override
  Future<List<String>> build() async {
    return Future.value([]);
  }

  Future<void> addImage(String todo) async {
    state = const AsyncLoading();
    // Ensure that state.value is treated as List<String>
    var newTodos = [...(state.value as List<String>), todo];
    state = AsyncData(newTodos);
  }

  Future<void> removeImage(String todo) async {
    state = const AsyncLoading();
    // Ensure that state.value is treated as List<String>
    var newTodos = state.value?..remove(todo);
    state = AsyncData(newTodos ?? []);
  }
}
