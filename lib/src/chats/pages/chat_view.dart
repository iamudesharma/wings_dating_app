import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings_dating_app/helpers/helpers.dart';
import 'package:wings_dating_app/helpers/message_enum.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/chats/pages/video_call_view.dart';
import 'package:wings_dating_app/src/users/users_view.dart';

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

class _ChatViewState extends ConsumerState<ChatView>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      logger.i("App is resumed");
      ref.read(isUserOnlineProvider(true));
    } else {
      logger.i("App is paused");

      ref.read(isUserOnlineProvider(false));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ref.read(isUserOnlineProvider(false));
    super.dispose();
  }

  String? selectedImage;
  // final String profilePic;
  @override
  Widget build(BuildContext context) {
    final UserModel? currentUser =
        ref.watch(ProfileController.userControllerProvider).userModel;

    final messageProvider = ref.watch(getUserChatSteamProvider(widget.id));

    return SafeArea(
      maintainBottomViewPadding: true,
      child: StreamBuilder<UserModel?>(
          stream: ref.read(profileRepoProvider).getUserById(widget.id),
          builder: (context, snapshot) {
            final receiverUser = snapshot.data;
            return snapshot.connectionState == ConnectionState.waiting
                ? const Scaffold(
                    body: Center(
                    child: CircularProgressIndicator(),
                  ))
                : Scaffold(
                    body: messageProvider.when(
                      skipLoadingOnReload: true,
                      error: (error, stackTrace) => Center(
                        child: Text("Error $error"),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      data: (data) => SafeArea(
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " ${receiverUser?.username}",
                                    style: const TextStyle(
                                      // color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    " ${receiverUser!.isOnline ? "Online" : "Offline"}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
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
                                height: MediaQuery.of(context).size.height -
                                    kToolbarHeight * 1.3,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: data.length,

                                        reverse: true,
                                        // shrinkWrap: true,
                                        keyboardDismissBehavior:
                                            ScrollViewKeyboardDismissBehavior
                                                .onDrag,
                                        itemBuilder: (context, index) {
                                          final message = data[index];
                                          if (!message.isSeen &&
                                              message.recieverid ==
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid) {
                                            ref
                                                .read(chatRepositoryProvider)
                                                .setChatMessageSeen(
                                                  context,
                                                  receiverUser!.id,
                                                  message.messageId,
                                                );
                                          }
                                          return chatType(
                                              message.type,
                                              message,
                                              currentUser!
                                                  .id); // return BubbleNormal(
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    KeyboardListener(
                                      focusNode: FocusNode(),
                                      onKeyEvent: (value) => print(value),
                                      child: MessageBar(
                                        messageBarColor: Theme.of(context)
                                            .appBarTheme
                                            .backgroundColor!,
                                        onSend: (value) async {
                                          ref
                                              .read(chatRepositoryProvider)
                                              .sendTextMessage(
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
                                                    return BottomSheet(
                                                        onClosing: () {
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
                                                                    .read(ChatController
                                                                        .provider)
                                                                    .pickImage(
                                                                        imageSource:
                                                                            ImageSource.camera);

                                                                if (image !=
                                                                    null) {
                                                                  ref.read(chatRepositoryProvider).sendFileMessage(
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
                                                              gallery:
                                                                  () async {
                                                                final image = await ref
                                                                    .read(ChatController
                                                                        .provider)
                                                                    .pickImage(
                                                                        imageSource:
                                                                            ImageSource.gallery);

                                                                if (image !=
                                                                    null) {
                                                                  // setState(() {
                                                                  //   selectedImage = image;
                                                                  // });

                                                                  ref.read(chatRepositoryProvider).sendFileMessage(
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
                                                            ListTile(
                                                              leading:
                                                                  const Icon(
                                                                      Icons
                                                                          .call),
                                                              title: const Text(
                                                                  "Call"),
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => VideoCallView(
                                                                        userName:
                                                                            currentUser?.username ??
                                                                                "",
                                                                        channelId:
                                                                            ""),
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
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: InkWell(
                                              child: const Icon(
                                                Icons.camera_alt,
                                                color: Colors.green,
                                                size: 24,
                                              ),
                                              onTap: () async {
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
                    ),
                  );
          }),
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
          delivered: message.isSeen,
          sent: message.isSeen,
          image: CachedNetworkImage(
            imageUrl: message.text,
            fit: BoxFit.contain,
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
        return Column(
          children: [
            BubbleSpecialThree(
              delivered: message.isSeen,
              seen: message.isSeen,
              text: message.text,
              color: const Color(0xFFE8E8EE),
              tail: true,
              isSender: message.senderId == id ? true : false,
            ),
          ],
        );
    }
  }
}
