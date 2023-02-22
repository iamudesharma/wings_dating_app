// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/chats/providers/get_chat_contact_provider.dart';

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
            SliverAppBar(
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
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: const Text("No User").animate().fadeIn(),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: data.length,
                        (context, index) {
                          final userChatList = data[index];

                          return ListTile(
                            onTap: () async {
                              await AutoRouter.of(context)
                                  .push(ChatRoute(id: data[index].contactId));
                            },
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  userChatList.profilePic ??
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                            ),
                            title: Text(userChatList.name),

                            subtitle: Text(userChatList.lastMessage),
                            trailing: Text(
                              userChatList.timeSent.timeAgo(useShortForm: true),
                            ),
                            // trailing: const Text(_userChatList.contactId),
                          ).animate().fadeIn();
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
