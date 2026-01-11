// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:chat_sample/src/utils/api_utils.dart';

import 'package:auto_route/auto_route.dart';
import 'package:emojis/emoji.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
// import 'package:get_it/get_it.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// import 'package:geoflutterfire2/geoflutterfire2.dart';
// ignore: depend_on_referenced_packages
// import 'package:universal_io/io.dart';

// ignore: depend_on_referenced_packages
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';
// import 'package:substring_highlight/substring_highlight.dart';

// import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/routes/app_router.dart';
// import 'package:wings_dating_app/src/ai_wingman/models/model.dart' show Model;
import 'package:wings_dating_app/src/album/album_view.dart';
import 'package:wings_dating_app/src/chats/pages/gemma_auto_compelete.dart';

int? time;
const int messagesPerPage = 50;
int lastPartSize = 0;
// final _chatUserData =
//     FutureProvider.autoDispose.family<UserModel?, int>((ref, id) {
//   ref.keepAlive();
//   return ref.read(profileRepoProvider).getUserByCubeId(id);
// });

// final getMessageListProvider =
//     StreamProvider<PagedResult<CubeMessage?>?>((ref) {
//   var params = GetMessagesParameters();
//   params.sorter = RequestSorter("desc", '', 'date_sent');
//   params.limit = messagesPerPage;
//   params.filters = [RequestFilter('', 'date_sent', 'gt', 0)];
//   return getMessages(
//     "",
//   ).asStream();
// });

@RoutePage()
class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.channel,
    @PathParam("id") required this.id,
  });

  final Channel channel;
  final String id;

  @override
  Widget build(BuildContext context) {
    return StreamChannel(
      channel: channel,
      child: Scaffold(
        appBar: const StreamChannelHeader(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamMessageListView(
                
                messageBuilder: (p0, messageDetails, p2, defaultMessageWidget) {
                  return defaultMessageWidget.copyWith(
                    showSendingIndicator: true,
                    
                    attachmentBuilders: [
                      ...StreamAttachmentWidgetBuilder.defaultBuilders(
                        message: messageDetails.message,
                        customAttachmentBuilders: [AlbumBuilder()],
                      ),
                    ],
                  );
                },
              ),
            ),
            StreamMessageInput(
              
              enableVoiceRecording: true,
              customAutocompleteTriggers: [
                StreamAutocompleteTrigger(
                  trigger: ':',
                  minimumRequiredCharacters: 2,
                  optionsViewBuilder: (
                    context,
                    autocompleteQuery,
                    messageEditingController,
                  ) {
                    final query = autocompleteQuery.query;
                    return StreamGemmaAutocompleteOptions(
                      query: query,
                      onOptionSelected: (emoji) {
                        // accepting the autocomplete option.
                        StreamAutocomplete.of(context).acceptAutocompleteOption(
                          emoji,
                          keepTrigger: false,
                        );
                      },
                    );
                  },
                ),
              ],
              actionsBuilder: (context, defaultActions) {
                return defaultActions
                  ..add(
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(
                            context: context,
                            builder: (context) {
                              return PickUpAlbum();
                            });
                      },
                      child: Icon(
                        Icons.album_rounded,
                      ),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PickUpAlbum extends ConsumerWidget {
  const PickUpAlbum({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getAlbum = ref.watch(getAllAlbumsProvider);
    return getAlbum.when(
        data: (data) {
          return GridView.builder(
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) => GridTile(
              child: GestureDetector(
                onTap: () {
                  final channel = StreamChannel.of(context).channel;

                  // channel.sendMessage(
                  //   Message(
                  //     text: 'My Album',
                  //     attachments: [
                  //       Attachment(
                  //         uploadState: const UploadState.success(),
                  //         type: 'album',
                  //         extraData: {
                  //           'image_id': data[index].id,
                  //           'name': data[index].name,
                  //           'imageUrls': data[index].imageUrls
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
                child: Image.network(
                  data[index].photos[0],
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
  }
}

class AlbumBuilder extends StreamAttachmentWidgetBuilder {
  @override
  Widget build(BuildContext context, Message message,
      Map<String, List<Attachment>> attachments) {
    final attachment =
        message.attachments.first.extraData["imageUrls"] as dynamic;
    final imageId = message.attachments.first.extraData["image_id"] as dynamic;

    return GestureDetector(
      onTap: () async {
        context.router.push(AlbumDetailsRoute(
          id: imageId,
        ));
      },
      child: SizedBox(
        height: 200,
        child: Animate(
          effects: [BlurEffect()],
          child: Image.network(
            attachment[0],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  bool canHandle(Message message, Map<String, List<Attachment>> attachments) {
    final types = attachments.keys;
    return types.contains("album");
  }
}

// import 'package:emojis/emoji.dart';
// import 'package:flutter/material.dart';

// import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// import 'package:substring_highlight/substring_highlight.dart';

// /// Overlay for displaying emoji that can be used
class StreamEmojiAutocompleteOptions extends StatelessWidget {
  /// Constructor for creating a [StreamEmojiAutocompleteOptions]
  const StreamEmojiAutocompleteOptions({
    super.key,
    required this.query,
    this.onEmojiSelected,
  });

  /// Query for searching emoji.
  final String query;

  /// Callback called when an emoji is selected.
  final ValueSetter<Emoji>? onEmojiSelected;

  @override
  Widget build(BuildContext context) {
    final emojis = Emoji.all().where((it) {
      final normalizedQuery = query.toUpperCase();
      final normalizedShortName = it.shortName.toUpperCase();

      return normalizedShortName.contains(normalizedQuery);
    });

    if (emojis.isEmpty) return const SizedBox.shrink();

    return StreamAutocompleteOptions<Emoji>(
      options: emojis,
      optionBuilder: (context, emoji) {
        final themeData = Theme.of(context);
        return ListTile(
          dense: true,
          horizontalTitleGap: 0,
          leading: Text(
            emoji.char,
            style: themeData.textTheme.titleLarge!.copyWith(
              fontSize: 24,
            ),
          ),
          title: SubstringHighlight(
            text: emoji.shortName,
            term: query,
            textStyleHighlight: themeData.textTheme.titleLarge!.copyWith(
              color: Colors.yellow,
              fontSize: 14.5,
              fontWeight: FontWeight.bold,
            ),
            textStyle: themeData.textTheme.titleLarge!.copyWith(
              fontSize: 14.5,
            ),
          ),
          onTap: onEmojiSelected == null ? null : () => onEmojiSelected!(emoji),
        );
      },
    );
  }
}
