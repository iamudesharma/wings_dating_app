import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/helpers/image_picker.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/album/album_view.dart';
import 'package:wings_dating_app/src/album/controller/album_controller.dart';

@RoutePage()
class AlbumDetailsView extends ConsumerWidget {
  const AlbumDetailsView(
      {super.key, required this.id, this.isPreview = false, this.channel});
  final String id;
  final bool isPreview;
  final Channel? channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(AlbumControllerProvider(id));

    final albumsWidget = albums.when(
      data: (data) => SliverGrid.builder(
        itemCount: data?.imageUrls.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          print("data image  ${data?.imageUrls}");
          return GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(ImagePreviewRoute(
                path: data?.imageUrls[index] ?? "",
              ));
            },
            child: Image.network(
              data?.imageUrls[index] ?? "",
            ),
          );
        },
      ),
      error: (error, stackTrace) => SliverToBoxAdapter(
        child: Center(child: Text(error.toString())),
      ),
      loading: () => SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator.adaptive()),
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
        // leading: const AutoLeadingButton(),
        title: const Text("Album"),
        actions: [
          GestureDetector(
              onTap: () async {
                final image = await pickImageForm(ImageSource.gallery);
                if (image != null) {
                  if (context.mounted) {
                    openEditor(context, ref, path: image, id: id);
                  }
                }
              },
              child: Text((albums.value?.imageUrls.length ?? 0) > 0
                  ? "Add More"
                  : "Create Album")),
        ],
      ),
      body: CustomScrollView(
        slivers: [albumsWidget],
      ),
    );
  }
}
