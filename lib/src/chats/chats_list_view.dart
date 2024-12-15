// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/services/chat_services.dart';
import 'package:wings_dating_app/src/chats/pages/chat_view.dart';
import 'package:wings_dating_app/src/users/users_view.dart';

// final chatListProvider = StreamProvider((ref) async* {
//   yield* getDialogs().asStream();
// });

// final unreadMessageCount = FutureProvider.family<dynamic, List<String>?>((ref, dialogId) async {
//   return getUnreadMessagesCount(dialogId);
// });

@RoutePage()
class ChatListView extends ConsumerStatefulWidget {
  const ChatListView({super.key});

  @override
  ConsumerState<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends ConsumerState<ChatListView> {
  late final _controller = StreamChannelListController(
    client: ref.read(chatClientProvider),
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    channelStateSort: const [SortOption('last_message_at')],
  );

  final _innerRouterKey = GlobalKey<AutoRouterState>();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // leading: const AutoLeadingButton(),
          title: const Text("Chats"),
          actions: [],
        ),
        body: RefreshIndicator(
          onRefresh: _controller.refresh,
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
            if (sizingInformation.isMobile) {
              return StreamChannelListView(
                controller: _controller,
                onChannelTap: (channel) {
                  context.router.push(ChatRoute(channel: channel, id: channel.id!));

                  // final router = AutoRoute.of(context);
                  // context.innerRouterOf<StackRouter>((ChatRoute(channel: channel, id: channel.id!);
                  // context.innerRouterOf<StackRouter>(
                  //   ChatRoute.name,
                  // );
                  // context.router.push(ChatRoute(channel: channel, id: channel.id!));
                },
              );
            }
            return Row(
              children: [
                NavigationBarWidget(
                  sizingInformation: sizingInformation,
                ),
                Expanded(
                  flex: 2,
                  child: StreamChannelListView(
                    controller: _controller,
                    onChannelTap: (channel) {
                      final router = _innerRouterKey.currentState?.controller;
                      router?.push(ChatRoute(channel: channel, id: channel.id!));
                      // context.router.push(ChatRoute(channel: channel, id: channel.id!));
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AutoRouter(
                    key: _innerRouterKey,
                  ),
                ),
              ],
            );
          }),
        ),
      );
}
