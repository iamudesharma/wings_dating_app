import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wings_dating_app/routes/app_router.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return ListTile(
                  onTap: () async {
                    await AutoRouter.of(context).push(const ChatRoute());
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
          )
        ],
      ),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Chat View"),
      ),
    );
  }
}
