import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';

import '../../../repo/chat_repo.dart';
import '../../model/user_models.dart';
import '../../profile/controller/profile_controller.dart';
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
  UserModel? reciverUser;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        final users =
            await ref.read(profileRepoProvider).getUserById(widget.id);

        setState(() {
          reciverUser = users;
        });
      },
    );
  }

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
                reciverUser?.username ?? "Loading...",
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
                          return BubbleNormal(
                            text: message.text,
                            color: const Color(0xFFE8E8EE),
                            tail: true,
                            isSender: message.senderId == currentUser!.id
                                ? true
                                : false,
                          );
                        },
                      ),
                    ),
                    MessageBar(
                      messageBarColor: Theme.of(context)
                          .appBarTheme
                          .backgroundColor!
                          .withOpacity(0.2),
                      onSend: (value) async {
                        ref.read(chatRepositoryProvider).sendTextMessage(
                              recieverUserData: reciverUser!,
                              context: context,
                              messageReply: null,
                              recieverUserId: widget.id,
                              senderUser: currentUser!,
                              text: value,
                            );
                      },
                      actions: [
                        InkWell(
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 24,
                          ),
                          onTap: () {},
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
}
