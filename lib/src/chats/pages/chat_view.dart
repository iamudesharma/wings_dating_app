import 'dart:io';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings_dating_app/config/app_config.dart';
import 'package:wings_dating_app/helpers/message_enum.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';

import '../../../repo/chat_repo.dart';
import '../../model/user_models.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/edit_profile_view.dart';
import '../controller/chat_controller.dart';
import '../model/message.dart';

final getUserChatSteamProvider =
    StreamProvider.family<List<Message>, String>((ref, id) {
  return ref.read(chatRepositoryProvider).getChatStream(id);
});

class ChatView extends ConsumerStatefulWidget {
  const ChatView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  UserModel? receiverUser;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        final users =
            await ref.read(profileRepoProvider).getUserById(widget.id);

        setState(() {
          receiverUser = users;
        });

        // ignore: use_build_context_synchronously
        ref.read(chatRepositoryProvider).setChatMessageSeen(context, users!.id,
            ref.read(ProfileController.userControllerProvider).userModel!.id);
      },
    );
  }

  String? selectedImage;
  // final String profilePic;
  @override
  Widget build(BuildContext context) {
    final UserModel? currentUser =
        ref.watch(ProfileController.userControllerProvider).userModel;

    final messageProvider = ref.watch(getUserChatSteamProvider(widget.id));

    return Scaffold(
      body: messageProvider.when(
        error: (error, stackTrace) => Center(
          child: Text("Error $error"),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) => CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text(
                receiverUser?.username ?? "Loading...",
                style: const TextStyle(
                  // color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.video_call),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height:
                    MediaQuery.of(context).size.height - kToolbarHeight - 120,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,

                        reverse: true,
                        // shrinkWrap: true,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemBuilder: (context, index) {
                          final message = data[index];
                          return chatType(message.type, message,
                              currentUser!.id); // return BubbleNormal(
                        },
                      ),
                    ),
                    KeyboardListener(
                      focusNode: FocusNode(),
                      onKeyEvent: (value) => print(value),
                      child: MessageBar(
                        messageBarColor:
                            Theme.of(context).appBarTheme.backgroundColor!,
                        onSend: (value) async {
                          ref.read(chatRepositoryProvider).sendTextMessage(
                                receiverUserData: receiverUser!,
                                context: context,
                                messageReply: null,
                                receiverUserId: widget.id,
                                senderUser: currentUser!,
                                text: value,
                              );
                        },
                        actions: [
                          InkWell(
                            child: const Icon(
                              Icons.add,
                              color: Colors.blue,
                              size: 24,
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BottomSheet(onClosing: () {
                                      Navigator.pop(context);
                                    }, builder: (context) {
                                      return SizedBox(
                                        height: 200,
                                        child: Column(
                                          children: [
                                            ImagePickerWidget(
                                              // isCallEnabled: true,
                                              camera: () async {
                                                final image = await ref
                                                    .read(
                                                        ChatController.provider)
                                                    .pickImage(
                                                        imageSource:
                                                            ImageSource.camera);

                                                if (image != null) {
                                                  ref
                                                      .read(
                                                          chatRepositoryProvider)
                                                      .sendFileMessage(
                                                          ref: ref,
                                                          file: File(image),
                                                          context: context,
                                                          messageReply: null,
                                                          isGroupChat: false,
                                                          messageEnum:
                                                              MessageEnum.image,
                                                          // ref: ref.read(),
                                                          receiverUserId:
                                                              receiverUser!.id,
                                                          senderUserData:
                                                              currentUser!);
                                                }
                                              },
                                              gallery: () async {
                                                final image = await ref
                                                    .read(
                                                        ChatController.provider)
                                                    .pickImage(
                                                        imageSource: ImageSource
                                                            .gallery);

                                                if (image != null) {
                                                  // setState(() {
                                                  //   selectedImage = image;
                                                  // });

                                                  ref
                                                      .read(
                                                          chatRepositoryProvider)
                                                      .sendFileMessage(
                                                          ref: ref,
                                                          file: File(image),
                                                          context: context,
                                                          messageReply: null,
                                                          isGroupChat: false,
                                                          messageEnum:
                                                              MessageEnum.image,
                                                          // ref: ref.read(),
                                                          receiverUserId:
                                                              receiverUser!.id,
                                                          senderUserData:
                                                              currentUser!);
                                                }
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.call),
                                              title: const Text("Call"),
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const VideoCallView(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: InkWell(
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.green,
                                size: 24,
                              ),
                              onTap: () async {
                                final image = await ref
                                    .read(ChatController.provider)
                                    .pickImage(imageSource: ImageSource.camera);

                                if (image != null) {
                                  ref
                                      .read(chatRepositoryProvider)
                                      .sendFileMessage(
                                          ref: ref,
                                          file: File(image),
                                          context: context,
                                          messageReply: null,
                                          isGroupChat: false,
                                          messageEnum: MessageEnum.image,
                                          // ref: ref.read(),
                                          receiverUserId: receiverUser!.id,
                                          senderUserData: currentUser!);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chatType(MessageEnum radians, Message message, String id) {
    switch (radians) {
      case MessageEnum.audio:
        return BubbleNormalAudio(
          onPlayPauseButtonClick: () {},
          onSeekChanged: (double value) {},
        );

      case MessageEnum.image:
        return BubbleNormalImage(
          // sent: message.isSeen,
          image: CachedNetworkImage(
            imageUrl: message.text,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          isSender: message.senderId == id ? true : false,
          id: message.messageId,
          seen: message.isSeen,
        );

      case MessageEnum.gif:
        return const Text("");

      case MessageEnum.video:
        return Container();

      case MessageEnum.text:
        return BubbleNormal(
          seen: message.isSeen,
          text: message.text,
          color: const Color(0xFFE8E8EE),
          tail: true,
          isSender: message.senderId == id ? true : false,
        );
    }
  }
}

class VideoCallView extends StatefulWidget {
  const VideoCallView({super.key});

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  // Instantiate the client
  final AgoraClient client = AgoraClient(
    agoraChannelData: AgoraChannelData(),
    agoraConnectionData: AgoraConnectionData(
      // tempToken: ,
      appId: AppConfig.appId,
      channelName: "test",
      username: "test",
      // rtmEnabled: true,

      // tempToken: ,
      tokenUrl: "http://10.0.2.2:8080",
      // "007eJxTYKg30a8zM6h4Ol3/ogfLjo9OJhe091+J/TnR2PTSvuMWs4sUGCwTLQ0NDAxSLC2STUxMTZItDY1TU42MjVKTUtIsjEyS3ppcS24IZGRYs/cwIyMDBIL4LAwlqcUlDAwAResgYQ=="
      // "007eJxTYHjZvW/SPZ7Ia5zXQw9ulHzezbqkfY0e65GO0682xtp+rN+pwGCZaGloYGCQYmmRbGJiapJsaWicmmpkbJSalJJmYWSStH3mpeSGQEYG9huPGBihEMRnYShJLS5hYAAA9QUiFQ==",
    ),
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
    // client.sessionController.value.
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
            ),
            AgoraVideoButtons(client: client),
          ],
        ),
      ),
    );
  }
}
