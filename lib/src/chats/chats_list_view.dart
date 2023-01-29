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
                        childCount: data.length,
                        (context, index) {
                          final _userChatList = data[index];

                          return ListTile(
                            onTap: () async {
                              await AutoRouter.of(context)
                                  .push(ChatRoute(id: data[index].contactId));
                            },
                            leading: const CircleAvatar(
                              backgroundColor: Colors.green,
                            ),
                            title: Text(_userChatList.name),
                            subtitle: Text(_userChatList.lastMessage),
                            // trailing: const Text(_userChatList.contactId),
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
