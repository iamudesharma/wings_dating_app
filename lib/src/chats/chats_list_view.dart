// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:collection/collection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/chats/providers/get_chat_contact_provider.dart';

class ChatListView extends ConsumerStatefulWidget {
  const ChatListView({super.key});

  @override
  ConsumerState<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends ConsumerState<ChatListView> {
  CubeUser? currentUser;
  List<ListItem<CubeDialog>> dialogList = [];
  var _isDialogContinues = true;

  StreamSubscription<CubeMessage>? msgSubscription;
  final ChatMessagesManager? chatMessagesManager =
      CubeChatConnection.instance.chatMessagesManager;

  @override
  Widget build(BuildContext context) {
    final chatContacts = ref.watch(getChatContactProvider);
    //   return SafeArea(
    //     bottom: false,
    //     child: Scaffold(
    //       body: CustomScrollView(
    //         slivers: [
    //           SliverAppBar(
    //             title: const Text("Chats"),
    //             actions: [
    //               IconButton(
    //                 icon: const Icon(Icons.search),
    //                 onPressed: () {},
    //               ),
    //             ],
    //           ),
    //           chatContacts.when(
    //             error: (error, stackTrace) => SliverToBoxAdapter(
    //               child: Center(
    //                 child: Text(error.toString()),
    //               ),
    //             ),
    //             loading: () => const SliverToBoxAdapter(
    //                 child: VxShimmer(
    //               child: ListTile(),
    //             )),
    //             data: (data) => data.isEmpty
    //                 ? SliverToBoxAdapter(
    //                     child: Center(
    //                       child: const Text("No User").animate().fadeIn(),
    //                     ),
    //                   )
    //                 : SliverList(
    //                     delegate: SliverChildBuilderDelegate(
    //                       childCount: data.length,
    //                       (context, index) {
    //                         final userChatList = data[index];

    //                         return ListTile(
    //                           onTap: () async {
    //                             await AutoRouter.of(context)
    //                                 .push(ChatRoute(id: data[index].contactId));
    //                           },
    //                           leading: CircleAvatar(
    //                             backgroundImage: CachedNetworkImageProvider(
    //                                 userChatList.profilePic),
    //                           ),
    //                           title: Text(userChatList.name),

    //                           subtitle: Text(userChatList.lastMessage),
    //                           trailing: Text(
    //                             userChatList.timeSent.timeAgo(useShortForm: true),
    //                           ),
    //                           // trailing: const Text(_userChatList.contactId),
    //                         ).animate().fadeIn();
    //                       },
    //                     ),
    //                   ),
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        child: Column(
          children: [
            Visibility(
              visible: _isDialogContinues && dialogList.isEmpty,
              child: Container(
                margin: const EdgeInsets.all(40),
                alignment: FractionalOffset.center,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
            Expanded(
              child: _getDialogsList(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "New dialog",
        backgroundColor: Colors.blue,
        onPressed: () => _createNewDialog(context),
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }

  void _createNewDialog(BuildContext context) async {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => CreateChatScreen(currentUser),
    //   ),
    // ).then((value) => refresh());
  }

  void _processGetDialogError(exception) {
    log(
      "GetDialog error $exception",
    );
    setState(() {
      _isDialogContinues = false;
    });
    // showDialogError(exception, context);
  }

  Widget _getDialogsList(BuildContext context) {
    if (_isDialogContinues) {
      getDialogs().then((dialogs) {
        _isDialogContinues = false;
        log(
          "getDialogs: $dialogs",
        );
        setState(() {
          dialogList.clear();
          dialogList.addAll(
              dialogs!.items.map((dialog) => ListItem(dialog)).toList());
        });
      }).catchError((exception) {
        _processGetDialogError(exception);
      });
    }
    if (_isDialogContinues && dialogList.isEmpty)
      return const SizedBox.shrink();
    else if (dialogList.isEmpty)
      return const FittedBox(
        fit: BoxFit.contain,
        child: Text("No dialogs yet"),
      );
    else
      return ListView.separated(
        itemCount: dialogList.length,
        itemBuilder: _getListItemTile,
        separatorBuilder: (context, index) {
          return const Divider(thickness: 2, indent: 40, endIndent: 40);
        },
      );
  }

  Widget _getListItemTile(BuildContext context, int index) {
    getDialogIcon() {
      var dialog = dialogList[index].data;
      if (dialog.type == CubeDialogType.PRIVATE)
        return const Icon(
          Icons.person,
          size: 40.0,
          color: Colors.grey,
        );
      else {
        return const Icon(
          Icons.group,
          size: 40.0,
          color: Colors.grey,
        );
      }
    }

    getDialogAvatarWidget() {
      var dialog = dialogList[index].data;
      if (dialog.photo == null) {
        return CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade300,
            child: getDialogIcon());
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
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          imageUrl: dialogList[index].data.photo!,
          width: 45.0,
          height: 45.0,
          fit: BoxFit.cover,
        );
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: TextButton(
        child: Row(
          children: <Widget>[
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              clipBehavior: Clip.hardEdge,
              child: getDialogAvatarWidget(),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      // ignore: sort_child_properties_last
                      child: Text(
                        dialogList[index].data.name ?? 'Not available',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        dialogList[index].data.lastMessage ?? 'Not available',
                        style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: dialogList[index].isSelected,
              child: IconButton(
                iconSize: 25.0,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  _deleteDialog(context, dialogList[index].data);
                },
              ),
            ),
            Container(
              child: Text(
                dialogList[index].data.lastMessageDateSent != null ? DateFormat('MMM dd').format(DateTime.fromMillisecondsSinceEpoch(dialogList[index].data.lastMessageDateSent! * 1000)) : 'Not available',
                style: const TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ),
          ],
        ),
        onLongPress: () {
          setState(() {
            dialogList[index].isSelected = !dialogList[index].isSelected;
          });
        },
        onPressed: () {
          _openDialog(context, dialogList[index].data);
        },
      ),
    );
  }

  void _deleteDialog(BuildContext context, CubeDialog dialog) async {
    log("_deleteDialog= $dialog");
    Fluttertoast.showToast(msg: 'Coming soon');
  }

  void _openDialog(BuildContext context, CubeDialog dialog) async {
    // Navigator.pushNamed(context, 'chat_dialog',
    //     arguments: {USER_ARG_NAME: currentUser, DIALOG_ARG_NAME: dialog});
  }

  void refresh() {
    setState(() {
      _isDialogContinues = true;
    });
  }

  @override
  void initState() {
    super.initState();
    msgSubscription =
        chatMessagesManager?.chatMessagesStream.listen(onReceiveMessage);
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
    ListItem<CubeDialog>? dialogItem =
        dialogList.firstWhereOrNull((dlg) => dlg.data.dialogId == msg.dialogId);
    if (dialogItem == null) return;
    dialogItem.data.lastMessage = msg.body;
    setState(() {
      dialogItem.data.lastMessage = msg.body;
    });
  }
}

class ListItem<T> {
  bool isSelected = false; //Selection property to highlight or not
  T data; //Data of the user
  ListItem(this.data); //Constructor to assign the data
}
