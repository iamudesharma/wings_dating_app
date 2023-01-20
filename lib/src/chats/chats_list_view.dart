// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/helpers/message_reply_provider.dart';
import 'package:wings_dating_app/repo/chat_repo.dart';

import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/chats/providers/get_chat_contact_provider.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final chatContacts = ref.watch(getChatContactProvider);
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: const Text("Chats"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
            chatContacts.when(
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(
                  child: Text(error.toString()),
                ),
              ),
              loading: () => const SliverToBoxAdapter(
                  child: VxShimmer(
                child: ListTile(),
              )),
              data: (data) => data.isEmpty
                  ? const SliverToBoxAdapter(
                      child: Text("No User"),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 10,
                        (context, index) {
                          return ListTile(
                            onTap: () async {
                              await AutoRouter.of(context)
                                  .push(ChatRoute(id: data[index].name));
                            },
                            leading: const CircleAvatar(
                              backgroundColor: Colors.green,
                            ),
                            title: const Text("Chat Title"),
                            subtitle: const Text("Chat Subtitle"),
                            trailing: const Text("online"),
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

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
  // final String profilePic;
  @override
  Widget build(BuildContext context) {
    final UserModel? currentUser =
        ref.watch(ProfileController.userControllerProvider).userModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(widget.id),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height - kToolbarHeight - 80,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      reverse: true,
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context, index) {
                        return BubbleNormal(
                          text: "bubble special three with tail",
                          color: const Color(0xFFE8E8EE),
                          tail: true,
                          isSender: index.isEven ? true : false,
                        );
                      },
                    ),
                  ),
                  MessageBar(
                    messageBarColor: Theme.of(context)
                        .appBarTheme
                        .backgroundColor!
                        .withOpacity(0.2),
                    onSend: (value) {
                      ref.read(chatRepositoryProvider).sendTextMessage(
                          // recieverUserData:.
                          context: context,
                          messageReply: null,
                          recieverUserId: widget.id,
                          senderUser: currentUser!,
                          text: value);
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
    );
  }
}
