import 'dart:async';

// import 'package:chat_sample/src/utils/api_utils.dart';

import 'package:auto_route/auto_route.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
// ignore: depend_on_referenced_packages
import 'package:universal_io/io.dart';

import 'package:cached_network_image/cached_network_image.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show IterableExtension;
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/chats/chats_list_view.dart';
import 'package:wings_dating_app/src/chats/services/call_manager.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

import '../../../const/pref_util.dart';

int? time;
const int messagesPerPage = 50;
int lastPartSize = 0;
final _chatUserData = FutureProvider.family<UserModel?, int>(
    (ref, id) => ref.read(profileRepoProvider).getUserByCubeId(id));

// final getMessageListProvider =
//     StreamProvider<PagedResult<CubeMessage?>?>((ref) {
//   var params = GetMessagesParameters();
//   params.sorter = RequestSorter("desc", '', 'date_sent');
//   params.limit = messagesPerPage;
//   params.filters = [RequestFilter('', 'date_sent', 'gt', 0)];
//   return getMessages(
//     "",
//   ).asStream();
// });

@RoutePage()
class ChatView extends ConsumerStatefulWidget {
  final CubeUser? cubeUser;
  final CubeDialog? cubeDialog;
  final int? chatUserCubeId;
  final String? dialogId;
  final int? cubeUserId;

  const ChatView({
    super.key,
    this.cubeUser,
    this.cubeDialog,
    this.chatUserCubeId,
    this.dialogId,
    this.cubeUserId,
  });

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  @override
  void initState() {
    if (widget.cubeDialog == null) {
      getDialogById(widget.dialogId!);
    }

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    var user = await SharedPrefs.instance.getUser()!;

    await CubeChatConnection.instance
        .getLasUserActivity(user.id!)
        .then((value) {
      logger.d("subscribeToUserLastActivityStatus $value");
    }).onError((error, stackTrace) {
      logger.e("subscribeToUserLastActivityStatus error $error");
    });
    super.didChangeDependencies();
  }

  bool isLoading = false;
  Future<CubeDialog?> getDialogById(String id) async {
    setState(() {
      isLoading = true;
    });
    final data = await getDialogs({'id': id});

    setState(() {
      isLoading = true;
    });
    return data!.items.first;
  }

  @override
  Widget build(BuildContext context) {
    final otherUser = ref.watch(_chatUserData(widget.chatUserCubeId != null
        ? widget.chatUserCubeId!
        : widget.cubeDialog!.occupantsIds!.first == widget.cubeUser!.id
            ? widget.cubeDialog!.occupantsIds!.last
            : widget.cubeDialog!.occupantsIds!.first));
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: otherUser.when(
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const Text('Loading...'),
                data: (users) => isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                              users!.profileUrl!,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                users.username,
                              ),
                              Text(
                                ref
                                    .read(ProfileController
                                        .userControllerProvider)
                                    .getDistance(
                                      GeoPoint(
                                        users.position!.geopoint.latitude,
                                        users.position!.geopoint.longitude,
                                      ),
                                    ),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                          time == null
                              ? const SizedBox()
                              : Text(DateTime.fromMicrosecondsSinceEpoch(time!)
                                  .timeAgo())
                        ],
                      )),
          ),
          body: ChatScreen(widget.cubeUserId!, widget.cubeDialog)),
    );
  }
}

// class ChatFirstTime extends StatefulWidget {
//   const ChatFirstTime({super.key, required this.occupantsIds});

//   final Set<int> occupantsIds;

//   @override
//   State<ChatFirstTime> createState() => _ChatFirstTimeState();
// }

// class _ChatFirstTimeState extends State<ChatFirstTime> {
//   List<CubeMessage> listMessage = [];

//   CubeUser? cubeUser;
//   CubeDialog? cubeDialog;

//   late bool isLoading;
//   static const int messagesPerPage = 50;
//   int lastPartSize = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) => Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView(),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: MessageBar(
//                 messageBarColor: Colors.black,
//                 onSend: (p0) async {
//                   if (p0.isNotEmpty) {
//                     await ref.read(chatRepositoryProvider).sendMessage(
//                           widget.occupantsIds,
//                           body: p0,
//                         );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ChatScreen extends ConsumerStatefulWidget {
  // final CubeUser _cubeUser;
  final int _cubeUserId;
  final CubeDialog? _cubeDialog;

  const ChatScreen(this._cubeUserId, this._cubeDialog, {super.key});

  @override
  // ignore: no_logic_in_create_state
  ConsumerState createState() => ChatScreenState(_cubeUserId, _cubeDialog);
}

class ChatScreenState extends ConsumerState<ChatScreen> {
  final int _cubeUserId;

  final CubeDialog? _cubeDialog;
  final Map<int?, CubeUser?> _occupants = {};

  late bool isLoading;
  late StreamSubscription<ConnectivityResult> connectivityStateSubscription;
  String? imageUrl;
  List<CubeMessage> listMessage = [];
  Timer? typingTimer;
  bool isTyping = false;
  String userStatus = '';
  static const int TYPING_TIMEOUT = 700;
  static const int STOP_TYPING_TIMEOUT = 2000;

  int _sendIsTypingTime = DateTime.now().millisecondsSinceEpoch;
  Timer? _sendStopTypingTimer;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();

  StreamSubscription<CubeMessage>? msgSubscription;
  StreamSubscription<MessageStatus>? deliveredSubscription;
  StreamSubscription<MessageStatus>? readSubscription;
  StreamSubscription<TypingStatus>? typingSubscription;

  StreamSubscription? lastActivitySubscription;

  final List<CubeMessage> _unreadMessages = [];
  final List<CubeMessage> _unsentMessages = [];

  static const int messagesPerPage = 50;
  int lastPartSize = 0;

  List<CubeMessage> oldMessages = [];

  ChatScreenState(this._cubeUserId, this._cubeDialog);

  @override
  void initState() {
    super.initState();

    if (_cubeDialog != null) {
      _initCubeChat();
    }

    // CubeChatConnection.instance.lastActivityStream!.listen((event) {
    //   log('last activity ${event.userId} ${event.seconds}');

    //   setState(() {
    //     time = event.seconds;
    //   });
    // });
    isLoading = false;
    imageUrl = '';
    listScrollController.addListener(onScrollChanged);
    connectivityStateSubscription =
        Connectivity().onConnectivityChanged.listen(onConnectivityChanged);
  }

  @override
  void dispose() {
    msgSubscription?.cancel();
    deliveredSubscription?.cancel();
    readSubscription?.cancel();
    typingSubscription?.cancel();
    textEditingController.dispose();
    connectivityStateSubscription.cancel();
    super.dispose();
  }

  void openGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null) return;

    setState(() {
      isLoading = true;
    });

    var uploadImageFuture = getUploadingImageFuture(result);
    Uint8List imageData;

    if (kIsWeb) {
      imageData = result.files.single.bytes!;
    } else {
      imageData = File(result.files.single.path!).readAsBytesSync();
    }

    var decodedImage = await decodeImageFromList(imageData);

    uploadImageFile(uploadImageFuture, decodedImage);
  }

  Future uploadImageFile(Future<CubeFile> uploadAction, imageData) async {
    uploadAction.then((cubeFile) {
      onSendChatAttachment(cubeFile, imageData);
    }).catchError((ex) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: 'This file is not an image');
    });
  }

  void onReceiveMessage(CubeMessage message) {
    log("onReceiveMessage message= $message");
    if (message.dialogId != _cubeDialog?.dialogId ||
        message.senderId == _cubeUserId) return;

    addMessageToListView(message);
  }

  void onDeliveredMessage(MessageStatus status) {
    log("onDeliveredMessage message= $status");
    updateReadDeliveredStatusMessage(status, false);
  }

  void onReadMessage(MessageStatus status) {
    log("onReadMessage message= ${status.messageId}");
    updateReadDeliveredStatusMessage(status, true);
  }

  void onTypingMessage(TypingStatus status) {
    log("TypingStatus message= ${status.userId}");
    if (status.userId == _cubeUserId ||
        (status.dialogId != null && status.dialogId != _cubeDialog?.dialogId)) {
      return;
    }
    userStatus = _occupants[status.userId]?.fullName ??
        _occupants[status.userId]?.login ??
        '';
    if (userStatus.isEmpty) return;
    userStatus = "$userStatus is typing ...";

    if (isTyping != true) {
      setState(() {
        isTyping = true;
      });
    }
    startTypingTimer();
  }

  startTypingTimer() {
    typingTimer?.cancel();
    typingTimer = Timer(const Duration(milliseconds: 900), () {
      setState(() {
        isTyping = false;
      });
    });
  }

  void onSendChatMessage(String content) {
    if (content.trim() != '') {
      final message = createCubeMsg();
      message.body = content.trim();
      onSendMessage(message);
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

  void onSendChatAttachment(CubeFile cubeFile, imageData) async {
    final attachment = CubeAttachment();
    attachment.id = cubeFile.uid;
    attachment.type = CubeAttachmentType.IMAGE_TYPE;
    attachment.url = cubeFile.getPublicUrl();
    attachment.height = imageData.height;
    attachment.width = imageData.width;
    final message = createCubeMsg();
    message.body = "Attachment";
    message.attachments = [attachment];
    onSendMessage(message);
  }

  CubeMessage createCubeMsg() {
    var message = CubeMessage();
    message.dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    message.markable = true;
    message.saveToHistory = true;
    return message;
  }

  void onSendMessage(CubeMessage message) async {
    log("onSendMessage message= $message");

    await _cubeDialog?.sendMessage(message);

    message.senderId = _cubeUserId;
    addMessageToListView(message);
    listScrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);

    bool isProduction = const bool.fromEnvironment('dart.vm.product');

    CreateEventParams params = CreateEventParams();

    params.parameters = {
      'message':
          "you have new message from ${_occupants[_cubeUserId]?.fullName ?? _occupants[_cubeUserId]?.login ?? ''}",
      "cube_dialog_id": "${_cubeDialog?.dialogId}",
      "cube_user_id": "${_cubeDialog?.userId}",

      // 'message' field is required
      // 'custom_parameter1': "custom parameter value 1",
      // 'custom_parameter2': "custom parameter value 2",
      // 'ios_voip': 1 // to send VoIP push notification to iOS
      //more standard parameters you can found by link https://developers.connectycube.com/server/push_notifications?id=universal-push-notifications
    };

    params.notificationType = NotificationType.PUSH;

    params.environment =
        isProduction ? CubeEnvironment.PRODUCTION : CubeEnvironment.DEVELOPMENT;
    params.usersIds = [
      _cubeDialog!.occupantsIds!
          .where((element) => element != _cubeUserId)
          .first
    ];

    createEvent(params.getEventForRequest())
        .then((cubeEvent) {})
        .catchError((error) {});
  }

  updateReadDeliveredStatusMessage(MessageStatus status, bool isRead) {
    log('[updateReadDeliveredStatusMessage]');
    setState(() {
      CubeMessage? msg = listMessage
          .firstWhereOrNull((msg) => msg.messageId == status.messageId);
      if (msg == null) return;
      if (isRead) {
        msg.readIds == null
            ? msg.readIds = [status.userId]
            : msg.readIds?.add(status.userId);
      } else {
        msg.deliveredIds == null
            ? msg.deliveredIds = [status.userId]
            : msg.deliveredIds?.add(status.userId);
      }

      log('[updateReadDeliveredStatusMessage] status updated for $msg');
    });
  }

  addMessageToListView(CubeMessage message) {
    setState(() {
      isLoading = false;
      int existMessageIndex = listMessage.indexWhere((cubeMessage) {
        return cubeMessage.messageId == message.messageId;
      });

      if (existMessageIndex != -1) {
        listMessage[existMessageIndex] = message;
      } else {
        listMessage.insert(0, message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // List of messages
              buildListMessage(),
              //Typing content
              buildTyping(),
              // Input content
              buildInput(),
            ],
          ),

          // Loading
          buildLoading()
        ],
      ),
    );
  }

  Widget buildItem(int index, CubeMessage message) {
    markAsReadIfNeed() {
      var isOpponentMsgRead =
          message.readIds != null && message.readIds!.contains(_cubeUserId);
      print(
          "markAsReadIfNeed message= $message, isOpponentMsgRead= $isOpponentMsgRead");
      if (message.senderId != _cubeUserId && !isOpponentMsgRead) {
        if (message.readIds == null) {
          message.readIds = [_cubeUserId];
        } else {
          message.readIds!.add(_cubeUserId);
        }

        if (CubeChatConnection.instance.chatConnectionState ==
            CubeChatConnectionState.Ready) {
          _cubeDialog?.readMessage(message);
        } else {
          _unreadMessages.add(message);
        }
      }
    }

    bool messageIsRead() {
      log("[getReadDeliveredWidget] messageIsRead");
      if (_cubeDialog?.type == CubeDialogType.PRIVATE) {
        return message.readIds != null &&
            (message.recipientId == null ||
                message.readIds!.contains(message.recipientId));
      }
      return message.readIds != null &&
          message.readIds!.any(
              (int id) => id != _cubeUserId && _occupants.keys.contains(id));
    }

    bool messageIsDelivered() {
      log("[getReadDeliveredWidget] messageIsDelivered");
      if (_cubeDialog?.type == CubeDialogType.PRIVATE) {
        return message.deliveredIds != null &&
            (message.recipientId == null ||
                message.deliveredIds!.contains(message.recipientId));
      }
      return message.deliveredIds != null &&
          message.deliveredIds!.any(
              (int id) => id != _cubeUserId && _occupants.keys.contains(id));
    }

    Widget getDateWidget() {
      return Text(
        DateFormat('HH:mm').format(
            DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)),
        style: const TextStyle(
            color: Colors.grey, fontSize: 12.0, fontStyle: FontStyle.italic),
      );
    }

    Widget getHeaderDateWidget() {
      return Container(
        alignment: Alignment.center,
        // ignore: sort_child_properties_last
        child: Text(
          DateFormat('dd MMMM').format(
              DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)),
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.0,
              fontStyle: FontStyle.italic),
        ),
        margin: const EdgeInsets.all(10.0),
      );
    }

    bool isHeaderView() {
      int headerId = int.parse(DateFormat('ddMMyyyy').format(
          DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)));
      if (index >= listMessage.length - 1) {
        return false;
      }
      var msgPrev = listMessage[index + 1];
      int nextItemHeaderId = int.parse(DateFormat('ddMMyyyy').format(
          DateTime.fromMillisecondsSinceEpoch(msgPrev.dateSent! * 1000)));
      var result = headerId != nextItemHeaderId;
      return result;
    }

    if (message.senderId == _cubeUserId) {
      // Right (own message)
      return Column(
        children: <Widget>[
          isHeaderView() ? getHeaderDateWidget() : const SizedBox.shrink(),
          Row(
            // ignore: sort_child_properties_last
            children: <Widget>[
              message.attachments?.isNotEmpty ?? false
                  // Image
                  ? Container(
                      margin: EdgeInsets.only(
                          bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                          right: 10.0),
                      child: TextButton(
                        child: Material(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CachedNetworkImage(
                                  placeholder: (context, url) => Container(
                                    width: 200.0,
                                    height: 200.0,
                                    padding: const EdgeInsets.all(70.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                    child: const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.blue),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Material(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      'images/img_not_available.jpeg',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  imageUrl: message.attachments!.first.url!,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                                getDateWidget(),
                              ]),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => FullPhoto(
                          //             url: message.attachments!.first.url!)));
                        },
                      ),
                    )
                  : message.body != null && message.body!.isNotEmpty
                      // Text
                      ? Flexible(
                          child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                getDateWidget(),
                                const SizedBox(
                                  height: 5,
                                ),
                                BubbleNormal(
                                  text: message.body ?? "",
                                  isSender: isLastMessageRight(index),
                                  seen: messageIsRead(),
                                  delivered: messageIsDelivered(),
                                  tail: true,
                                  sent: true,
                                ),
                              ]),
                        )
                      : Container(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          width: 200.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.0)),
                          margin: EdgeInsets.only(
                            bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                            right: 10.0,
                          ),
                          child: Text(
                            "Empty",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      );
    } else {
      // Left (opponent message)
      markAsReadIfNeed();
      return Container(
        // ignore: sort_child_properties_last
        child: Column(
          // ignore: sort_child_properties_last
          children: <Widget>[
            isHeaderView() ? getHeaderDateWidget() : const SizedBox.shrink(),
            Row(
              children: <Widget>[
                message.attachments?.isNotEmpty ?? false
                    ? Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: TextButton(
                          child: Material(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    placeholder: (context, url) => Container(
                                      width: 200.0,
                                      height: 200.0,
                                      padding: const EdgeInsets.all(70.0),
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child: const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.blue),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Material(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.asset(
                                        'images/img_not_available.jpeg',
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    imageUrl: message.attachments!.first.url!,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                  getDateWidget(),
                                ]),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => FullPhoto(
                            //             url: message.attachments!.first.url!)));
                          },
                        ),
                      )
                    : message.body != null && message.body!.isNotEmpty
                        ? Flexible(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BubbleNormal(
                                    sent: true,
                                    isSender: isLastMessageLeft(index),
                                    text: message.body!,
                                    seen: messageIsRead(),
                                    delivered: messageIsDelivered(),
                                    tail: true,
                                  ),
                                  // getDateWidget(),
                                ]),
                          )
                        : Container(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 10.0, 15.0, 10.0),
                            width: 200.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8.0)),
                            margin: EdgeInsets.only(
                                bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                                right: 10.0),
                            child: Text(
                              "Empty",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: const EdgeInsets.only(bottom: 10.0),
      );
    }
  }

  bool isLastMessageLeft(int index) {
    if ((listMessage[index].id == _cubeUserId)) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((listMessage[index].id != _cubeUserId)) {
      return true;
    } else {
      return false;
    }
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading ? const CircularProgressIndicator() : Container(),
    );
  }

  Widget buildTyping() {
    return Visibility(
      visible: isTyping,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(16.0),
        child: Text(
          userStatus,
          style:
              const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget buildInput() {
    return MessageBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.video_call),
          onPressed: () {
            CallManager.instance.startNewCall(context, CallType.VIDEO_CALL, {
              _cubeDialog!.occupantsIds!.where((e) => e != _cubeUserId).first
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.image),
          onPressed: () {
            openGallery();
          },
        ),
        IconButton(
          icon: const Icon(Icons.camera_alt),
          onPressed: () {},
        ),
      ],
      messageBarColor: Colors.black,
      onSend: (p0) async {
        if (p0.isNotEmpty) {
          onSendChatMessage(p0);
        }
      },
      onTextChanged: (p0) {
        sendIsTypingStatus();
      },
    );
  }

  Widget buildListMessage() {
    getWidgetMessages(listMessage) {
      return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) => buildItem(index, listMessage[index]),
        itemCount: listMessage.length,
        reverse: true,
        controller: listScrollController,
      );
    }

    return Flexible(
      child: StreamBuilder<List<CubeMessage>>(
        stream: getMessagesList().asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor)));
          } else {
            listMessage = snapshot.data ?? [];
            return getWidgetMessages(listMessage);
          }
        },
      ),
    );
  }

  Future<List<CubeMessage>> getMessagesList() async {
    if (listMessage.isNotEmpty) return Future.value(listMessage);

    Completer<List<CubeMessage>> completer = Completer();
    List<CubeMessage>? messages;
    try {
      await Future.wait<void>([
        getMessagesByDate(0, false).then((loadedMessages) {
          isLoading = false;
          messages = loadedMessages;
        }),
        getAllUsersByIds(_cubeDialog!.occupantsIds!.toSet()).then((result) =>
            _occupants.addAll({for (var item in result!.items) item.id: item}))
      ]);
      completer.complete(messages);
    } catch (error) {
      completer.completeError(error);
    }
    return completer.future;
  }

  void onScrollChanged() {
    if ((listScrollController.position.pixels ==
            listScrollController.position.maxScrollExtent) &&
        messagesPerPage >= lastPartSize) {
      setState(() {
        isLoading = true;

        if (oldMessages.isNotEmpty) {
          getMessagesBetweenDates(
                  oldMessages.first.dateSent ?? 0,
                  listMessage.last.dateSent ??
                      DateTime.now().millisecondsSinceEpoch ~/ 1000)
              .then((newMessages) {
            setState(() {
              isLoading = false;

              listMessage.addAll(newMessages);

              if (newMessages.length < messagesPerPage) {
                oldMessages.insertAll(0, listMessage);
                listMessage = List.from(oldMessages);
                oldMessages.clear();
              }
            });
          });
        } else {
          getMessagesByDate(listMessage.last.dateSent ?? 0, false)
              .then((messages) {
            setState(() {
              isLoading = false;
              listMessage.addAll(messages);
            });
          });
        }
      });
    }
  }

  Future<bool> onBackPress() {
    ref.invalidate(chatListProvider);

    Navigator.pop(context);
    return Future.value(true);
  }

  _initChatListeners() {
    log("[_initChatListeners]");
    msgSubscription = CubeChatConnection
        .instance.chatMessagesManager!.chatMessagesStream
        .listen(onReceiveMessage);
    deliveredSubscription = CubeChatConnection
        .instance.messagesStatusesManager!.deliveredStream
        .listen(onDeliveredMessage);
    readSubscription = CubeChatConnection
        .instance.messagesStatusesManager!.readStream
        .listen(onReadMessage);
    typingSubscription = CubeChatConnection
        .instance.typingStatusesManager!.isTypingStream
        .listen(onTypingMessage);
  }

  void _initCubeChat() {
    log("_initCubeChat");
    if (CubeChatConnection.instance.isAuthenticated()) {
      log("[_initCubeChat] isAuthenticated");
      _initChatListeners();
    } else {
      log("[_initCubeChat] not authenticated");
      CubeChatConnection.instance.connectionStateStream.listen((state) {
        log("[_initCubeChat] state $state");
        if (CubeChatConnectionState.Ready == state) {
          _initChatListeners();

          if (_unreadMessages.isNotEmpty) {
            for (var cubeMessage in _unreadMessages) {
              _cubeDialog?.readMessage(cubeMessage);
            }
            _unreadMessages.clear();
          }

          if (_unsentMessages.isNotEmpty) {
            for (var cubeMessage in _unsentMessages) {
              _cubeDialog?.sendMessage(cubeMessage);
            }

            _unsentMessages.clear();
          }
        }
      });
    }
  }

  void sendIsTypingStatus() {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var isTypingTimeout = currentTime - _sendIsTypingTime;
    if (isTypingTimeout >= TYPING_TIMEOUT) {
      _sendIsTypingTime = currentTime;
      _cubeDialog?.sendIsTypingStatus();
      _startStopTypingStatus();
    }
  }

  void _startStopTypingStatus() {
    _sendStopTypingTimer?.cancel();
    _sendStopTypingTimer =
        Timer(const Duration(milliseconds: STOP_TYPING_TIMEOUT), () {
      _cubeDialog?.sendStopTypingStatus();
    });
  }

  Future<List<CubeMessage>> getMessagesByDate(int date, bool isLoadNew) async {
    var params = GetMessagesParameters();
    params.sorter = RequestSorter("desc", '', 'date_sent');
    params.limit = messagesPerPage;
    params.filters = [
      RequestFilter('', 'date_sent', isLoadNew || date == 0 ? 'gt' : 'lt', date)
    ];

    return getMessages(_cubeDialog!.dialogId!, params.getRequestParameters())
        .then((result) {
          lastPartSize = result!.items.length;

          return result.items;
        })
        .whenComplete(() {})
        .catchError((onError) {});
  }

  Future<List<CubeMessage>> getMessagesBetweenDates(
      int startDate, int endDate) async {
    var params = GetMessagesParameters();
    params.sorter = RequestSorter("desc", '', 'date_sent');
    params.limit = messagesPerPage;
    params.filters = [
      RequestFilter('', 'date_sent', 'gt', startDate),
      RequestFilter('', 'date_sent', 'lt', endDate)
    ];

    return getMessages(_cubeDialog!.dialogId!, params.getRequestParameters())
        .then((result) {
      return result!.items;
    });
  }

  void onConnectivityChanged(ConnectivityResult connectivityType) {
    log("[ChatScreenState] connectivityType changed to '$connectivityType'");

    if (connectivityType == ConnectivityResult.wifi ||
        connectivityType == ConnectivityResult.mobile) {
      setState(() {
        isLoading = true;
      });

      getMessagesBetweenDates(listMessage.first.dateSent ?? 0,
              DateTime.now().millisecondsSinceEpoch ~/ 1000)
          .then((newMessages) {
        setState(() {
          if (newMessages.length == messagesPerPage) {
            oldMessages = List.from(listMessage);
            listMessage = newMessages;
          } else {
            listMessage.insertAll(0, newMessages);
          }
        });
      }).whenComplete(() {
        setState(() {
          isLoading = false;
        });
      });
    }
  }
}

Future<CubeFile> getUploadingImageFuture(FilePickerResult result) async {
  // there possible to upload the file as an array of bytes, but here showed two ways just as an example
  if (kIsWeb) {
    return uploadRawFile(result.files.single.bytes!, result.files.single.name,
        isPublic: true, onProgress: (progress) {
      log("uploadImageFile progress= $progress");
    });
  } else {
    return uploadFile(File(result.files.single.path!), isPublic: true,
        onProgress: (progress) {
      log("uploadImageFile progress= $progress");
    });
  }
}
