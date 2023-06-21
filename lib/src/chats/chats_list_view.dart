// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

import '../../routes/app_router.dart';

final chatListProvider = StreamProvider((ref) async* {
  yield* getDialogs().asStream();
});

final unreadMessageCount =
    FutureProvider.family<dynamic, List<String>?>((ref, dialogId) async {
  return getUnreadMessagesCount(dialogId);
});

@RoutePage()
class ChatListView extends ConsumerStatefulWidget {
  const ChatListView({super.key});

  @override
  ConsumerState<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends ConsumerState<ChatListView> {
  CubeUser? currentUser;

  StreamSubscription<CubeMessage>? msgSubscription;
  final ChatMessagesManager? chatMessagesManager =
      CubeChatConnection.instance.chatMessagesManager;

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(chatListProvider);
    return RefreshIndicator(
      onRefresh: () => Future.delayed(
        const Duration(seconds: 1),
        () => ref.refresh(chatListProvider),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chats"),
        ),
        body: ResponsiveBuilder(builder: (context, sizingInformation) {
          return Row(
            children: [
              if (!sizingInformation.isMobile)
                Expanded(
                  child: SizedBox(
                      height: sizingInformation.screenSize.height,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: NavigationRail(
                            selectedIndex:
                                AutoTabsRouter.of(context).activeIndex,
                            extended: sizingInformation.isTablet ? false : true,
                            onDestinationSelected: (value) {
                              AutoTabsRouter.of(context).setActiveIndex(value);
                            },
                            destinations: const [
                              NavigationRailDestination(
                                  icon: Icon(Icons.home), label: Text("Users")),
                              NavigationRailDestination(
                                  icon: Icon(Icons.chat_bubble),
                                  label: Text("Chat")),
                              NavigationRailDestination(
                                icon: Icon(Icons.person),
                                label: Text("Profile"),
                              ),
                            ],
                          ))),
                ),
              Expanded(
                flex: 4,
                child: value.when(
                    error: (error, stackTrace) =>
                        Center(child: Text(error.toString())),
                    loading: () =>
                        const Center(child: CircularProgressIndicator.adaptive()),
                    data: (data) {
                      final dialogList = data!.items;

                      if (dialogList.isEmpty) {
                        return const Center(
                          child: Text(
                            "No user for chat",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                                // color: Colors.white,
                                ),
                          ),
                        );
                      } else {
                        return Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: SizedBox(
                                height: sizingInformation.screenSize.height,
                                width: sizingInformation.screenSize.width,
                                child: ListView.separated(
                                  itemCount: dialogList.length,
                                  itemBuilder: (context, index) {
                                    return _getListItemTile(
                                        context, index, dialogList);
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox();
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _getListItemTile(
      BuildContext context, int index, List<CubeDialog> dialogList) {
    getDialogAvatarWidget() {
      var dialog = dialogList[index];
      if (dialog.photo == null) {
        return const CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(
              "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
        );
      } else {
        return CachedNetworkImage(
          placeholder: (context, url) => Container(
            width: 40.0,
            height: 40.0,
            padding: const EdgeInsets.all(70.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          imageUrl: dialogList[index].photo ??
              "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
          width: 45.0,
          height: 45.0,
          fit: BoxFit.cover,
        );
      }
    }

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              _deleteDialog(context, dialogList[index]);
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      key: ValueKey(dialogList[index].id.toString()),
      child: ListTile(
        onTap: () async {
          final id = dialogList[index].occupantsIds;
          AutoRouter.of(context).push(
            ChatRoute(
              cubeDialog: dialogList[index],
              cubeUserId:
                  id!.where((element) => element == currentUser!.id).first,
              chatUserCubeId:
                  id.where((element) => element != currentUser!.id).first,
            ),
          );

          // id?.first == currentUser!.id ? id![0] : id![1],
          // log(
          //   "${id?.first != currentUser!.id ? id![0] : id![1]}",
          // );
        },
        leading: getDialogAvatarWidget(),
        title: Text(
          dialogList[index].name ?? 'Not available',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        subtitle: Text(
          dialogList[index].lastMessage ?? 'Not available',
          style: const TextStyle(color: Colors.grey, fontSize: 15.0),
        ),
        trailing: Row(
          // crossAxisAlignment: ,
          mainAxisSize: MainAxisSize.min,
          children: [
            dialogList[index].unreadMessageCount == 0
                ? const SizedBox.shrink()
                : Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child:
                        Text(dialogList[index].unreadMessageCount.toString())),
            const SizedBox(width: 10.0),
            Text(
              dialogList[index].lastMessageDateSent != null
                  ? DateTime.fromMillisecondsSinceEpoch(
                          dialogList[index].lastMessageDateSent! * 1000)
                      .timeAgo(useShortForm: true)
                  : 'Not available',
              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteDialog(BuildContext context, CubeDialog dialog) async {
    log("_deleteDialog= $dialog");

    await deleteDialog(dialog.dialogId!, true);

    ref.invalidate(chatListProvider);
    Fluttertoast.showToast(msg: 'Coming soon');
  }

  @override
  void initState() {
    super.initState();
    msgSubscription =
        chatMessagesManager?.chatMessagesStream.listen(onReceiveMessage);

    final users = ref.read(ProfileController.userControllerProvider).userModel!;

    setState(() {
      currentUser = users.cubeUser;
    });
  }

  @override
  void dispose() {
    super.dispose();
    log(
      "dispose",
    );
    msgSubscription?.cancel();
  }

  void onReceiveMessage(CubeMessage message) {
    log("onReceiveMessage global message= $message");
    updateDialog(message);
  }

  updateDialog(CubeMessage msg) {
    var dialogItem = ref
        .read(chatListProvider)
        .value!
        .items
        .where((dlg) => dlg.dialogId == msg.dialogId)
        .first;
    // ignore: unnecessary_null_comparison
    if (dialogItem == null) return;
    dialogItem.lastMessage = msg.body;
    setState(() {
      dialogItem.lastMessage = msg.body;
    });
  }
}

class ListItem<T> {
  bool isSelected = false; //Selection property to highlight or not
  T data; //Data of the user
  ListItem(this.data); //Constructor to assign the data
}
