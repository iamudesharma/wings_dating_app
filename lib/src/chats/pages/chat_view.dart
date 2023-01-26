import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings_dating_app/helpers/message_enum.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';

import '../../../helpers/common_firebase_storage_repository.dart';
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
                    MessageBar(
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
                                    return ImagePickerWidget(
                                      camera: () async {
                                        final image = await ref
                                            .read(ChatController.provider)
                                            .pickImage(
                                                imageSource:
                                                    ImageSource.camera);

                                        if (image != null) {
                                          ref
                                              .read(chatRepositoryProvider)
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
                                                  senderUserData: currentUser!);
                                        }
                                      },
                                      gallery: () async {
                                        final image = await ref
                                            .read(ChatController.provider)
                                            .pickImage(
                                                imageSource:
                                                    ImageSource.gallery);

                                        if (image != null) {
                                          // setState(() {
                                          //   selectedImage = image;
                                          // });

                                          ref
                                              .read(chatRepositoryProvider)
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
                                                  senderUserData: currentUser!);
                                        }
                                      },
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
                            onTap: () {},
                          ),
                        ),
                      ],
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
