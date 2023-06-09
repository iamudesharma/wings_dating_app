import 'dart:async';

// import 'package:chat_sample/src/utils/api_utils.dart';

import 'package:auto_route/auto_route.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';
import 'package:reaction_askany/reaction_askany.dart';
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
  final Emotions _emotions = Emotions.wow;
  @override
  void initState() {
    if (widget.cubeDialog == null) {
      getDialogById(widget.dialogId!);
    }

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    var user = SharedPrefs.instance.getUser()!;

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
      bottom: true,
      top: false,
      child: PlatformScaffold(
          appBar: PlatformAppBar(
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
          body: ChatScreen(widget.cubeUserId!, widget.cubeDialog, _emotions)),
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
  final Emotions _emotions;

  const ChatScreen(this._cubeUserId, this._cubeDialog, this._emotions,
      {super.key});

  @override
  // ignore: no_logic_in_create_state
  ConsumerState createState() =>
      // ignore: no_logic_in_create_state
      ChatScreenState(_cubeUserId, _cubeDialog, _emotions);
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
  StreamSubscription<MessageReaction>? reactionSubscription;
  StreamSubscription? lastActivitySubscription;
  StreamSubscription<MessageStatus>? deleteMsgSubscription;

  final List<CubeMessage> _unreadMessages = [];
  final List<CubeMessage> _unsentMessages = [];

  static const int messagesPerPage = 50;
  int lastPartSize = 0;

  List<CubeMessage> oldMessages = [];

  ChatScreenState(this._cubeUserId, this._cubeDialog, this._emotions);

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
    reactionSubscription?.cancel();
    deleteMsgSubscription?.cancel();
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

  final Emotions _emotions;

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

  void onDeleteMessage(MessageStatus status) {
    log("onDeleteMessage message= ${status.messageId}");
    deleteMessage(status.messageId);
  }

  void onReactionMessage(MessageReaction reaction) {
    log("onReactionReceived message= ${reaction.messageId}");
    _updateMessageReactions(reaction);
  }

  void _performReaction(Emoji emoji, CubeMessage message) {
    if ((message.reactions?.own.isNotEmpty ?? false) &&
        (message.reactions?.own.contains(emoji.emoji) ?? false)) {
      removeMessageReaction(message.messageId!, emoji.emoji);
      _updateMessageReactions(MessageReaction(
          _cubeUserId, _cubeDialog!.dialogId!, message.messageId!,
          removeReaction: emoji.emoji));
    } else {
      addMessageReaction(message.messageId!, emoji.emoji);
      _updateMessageReactions(MessageReaction(
          _cubeUserId, _cubeDialog!.dialogId!, message.messageId!,
          addReaction: emoji.emoji));
    }
  }

  void _updateMessageReactions(MessageReaction reaction) {
    log('[_updateMessageReactions]');
    setState(() {
      CubeMessage? msg = listMessage
          .firstWhereOrNull((msg) => msg.messageId == reaction.messageId);
      if (msg == null) return;

      if (msg.reactions == null) {
        msg.reactions = CubeMessageReactions.fromJson({
          'own': {if (reaction.userId == _cubeUserId) reaction.addReaction},
          'total': {reaction.addReaction: 1}
        });
      } else {
        if (reaction.addReaction != null) {
          if (reaction.userId != _cubeUserId ||
              !(msg.reactions?.own.contains(reaction.addReaction) ?? false)) {
            if (reaction.userId == _cubeUserId) {
              msg.reactions!.own.add(reaction.addReaction!);
            }

            msg.reactions!.total[reaction.addReaction!] =
                msg.reactions!.total[reaction.addReaction] == null
                    ? 1
                    : msg.reactions!.total[reaction.addReaction]! + 1;
          }
        }

        if (reaction.removeReaction != null) {
          if (reaction.userId != _cubeUserId ||
              (msg.reactions?.own.contains(reaction.removeReaction) ?? false)) {
            if (reaction.userId == _cubeUserId) {
              msg.reactions!.own.remove(reaction.removeReaction!);
            }

            msg.reactions!.total[reaction.removeReaction!] =
                msg.reactions!.total[reaction.removeReaction] != null &&
                        msg.reactions!.total[reaction.removeReaction]! > 0
                    ? msg.reactions!.total[reaction.removeReaction]! - 1
                    : 0;
          }

          msg.reactions!.total.removeWhere((key, value) => value == 0);
        }
      }
    });
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

    //  if(Platform.isAndroid){
    createEvent(params.getEventForRequest())
        .then((cubeEvent) {})
        .catchError((error) {});
    //  }
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

  deleteMessage(String message) {
    log('[deleteMessage] message= $message');
    setState(() {
      listMessage.removeWhere((msg) => msg.messageId == message);
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

  Emotions? emotions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: Theme.of(context).platform == TargetPlatform.iOS
            ? Colors.black
            : Theme.of(context).scaffoldBackgroundColor,
        child: WillPopScope(
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
        ),
      ),
    );
  }

  getReactionsWidget(CubeMessage message) {
    if (message.reactions == null) return Container();

    var isOwnMessage = message.senderId == _cubeUserId;

    return LayoutBuilder(builder: (context, constraints) {
      var widgetWidth =
          constraints.maxWidth == double.infinity ? 240 : constraints.maxWidth;
      var maxColumns = (widgetWidth / 60).round();
      if (message.reactions!.total.length < maxColumns) {
        maxColumns = message.reactions!.total.length;
      }

      return SizedBox(
          width: maxColumns * 56,
          child: GridView.count(
            primary: false,
            crossAxisCount: maxColumns,
            mainAxisSpacing: 4,
            childAspectRatio: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              ...message.reactions!.total.keys.map((reaction) {
                return GestureDetector(
                    onTap: () => _performReaction(Emoji(reaction, ''), message),
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: isOwnMessage ? 1 : 0,
                          right: isOwnMessage ? 0 : 1,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(reaction,
                                      style: kIsWeb
                                          ? const TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'NotoColorEmoji')
                                          : null),
                                  Text(
                                      ' ${message.reactions!.total[reaction].toString()}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                        )));
              }).toList()
            ],
          ));
    });
  }

  _reactOnMessage(CubeMessage message) {
    showDialog<Emoji>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 400,
                  height: 400,
                  child: EmojiPicker(
                    config: const Config(
                      emojiTextStyle: kIsWeb
                          ? TextStyle(
                              color: Colors.green, fontFamily: 'NotoColorEmoji')
                          : null,
                      iconColorSelected: Colors.green,
                      indicatorColor: Colors.green,
                      bgColor: Colors.white,
                    ),
                    onEmojiSelected: (category, emoji) {
                      Navigator.pop(context, emoji);
                    },
                  )));
        }).then((emoji) {
      log("onEmojiSelected emoji: ${emoji?.emoji}");
      if (emoji != null) {
        _performReaction(emoji, message);
      }
    });
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
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    double left = details.globalPosition.dx;
                                    double top = details.globalPosition.dy;
                                    showMenu(
                                      context: context,
                                      items: [
                                        PopupMenuItem<String>(
                                          value: 'Doge',
                                          onTap: () => _reactOnMessage(message),
                                          child: const Text('Add reaction'),
                                        ),
                                        if (message.senderId == _cubeUserId)
                                          PopupMenuItem<String>(
                                              onTap: () async {
                                                await _cubeDialog
                                                    ?.deleteMessage(message);
                                              },
                                              value: 'Lion',
                                              child: const Text('Delete')),
                                      ],
                                      position: RelativeRect.fromLTRB(
                                          200, 280, 0, 100),
                                    );
                                    // popUpMenu(message);
                                  },
                                  // onLongPress: () => _reactOnMessage(message),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: BubbleNormal(
                                          text: message.body ?? "",
                                          isSender: isLastMessageRight(index),
                                          seen: messageIsRead(),
                                          delivered: messageIsDelivered(),
                                          tail: true,
                                          sent: true,
                                        ),
                                      ),
                                      if (message.reactions != null &&
                                          message.reactions!.total.isNotEmpty)
                                        getReactionsWidget(message),
                                    ],
                                  ),
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
                                  GestureDetector(
                                    onLongPress: () => _reactOnMessage(message),
                                    child: Row(
                                      children: [
                                        // message.senderId == _cubeUserId
                                        //     ? const SizedBox()
                                        //     : const ReactionWrapper(
                                        //         buttonReaction: Padding(
                                        //             padding: EdgeInsets.only(
                                        //                 top: 2.0),
                                        //             child: Text("👎")),
                                        //         child: SizedBox(),
                                        //       ),

                                        if (message.reactions != null &&
                                            message.reactions!.total.isNotEmpty)
                                          getReactionsWidget(message),
                                        FittedBox(
                                          child: BubbleNormal(
                                            sent: true,
                                            isSender: isLastMessageLeft(index),
                                            text: message.body!,
                                            seen: messageIsRead(),
                                            delivered: messageIsDelivered(),
                                            tail: true,
                                          ),
                                        ),
                                      ],
                                    ),
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
      messageBarColor: Colors.white12,
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

    reactionSubscription = CubeChatConnection
        .instance.messagesReactionsManager?.reactionsStream
        .listen(onReactionMessage);

    deleteMsgSubscription = CubeChatConnection
        .instance.messagesStatusesManager?.deletedStream
        .listen(onDeleteMessage);
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

String addEmotionsCase(Emotions emotions) => switch (emotions) {
      Emotions.angry => "angry",
      Emotions.like => "like",
      Emotions.care => "care",
      Emotions.haha => "haha",
      Emotions.love => "love",
      Emotions.wow => "wow",
    };

class MessageBar extends StatelessWidget {
  final bool replying;
  final String replyingTo;
  final List<Widget> actions;
  final TextEditingController _textController = TextEditingController();
  final Color replyWidgetColor;
  final Color replyIconColor;
  final Color replyCloseColor;
  final Color messageBarColor;
  final Color sendButtonColor;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function()? onTapCloseReply;

  /// [MessageBar] constructor
  ///
  ///
  MessageBar({
    this.replying = false,
    this.replyingTo = "",
    this.actions = const [],
    this.replyWidgetColor = const Color(0xffF4F4F5),
    this.replyIconColor = Colors.blue,
    this.replyCloseColor = Colors.black12,
    this.messageBarColor = const Color(0xffF4F4F5),
    this.sendButtonColor = Colors.blue,
    this.onTextChanged,
    this.onSend,
    this.onTapCloseReply,
  });

  /// [MessageBar] builder method
  ///
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            replying
                ? Container(
                    color: replyWidgetColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: replyIconColor,
                          size: 24,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'Re : ' + replyingTo,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onTapCloseReply,
                          child: Icon(
                            Icons.close,
                            color: replyCloseColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ))
                : Container(),
            replying
                ? Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  )
                : Container(),
            Container(
              color: messageBarColor,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                children: <Widget>[
                  ...actions,
                  Expanded(
                    child: Container(
                      child: PlatformTextField(
                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: onTextChanged,
                        cupertino: (context, platform) =>
                            CupertinoTextFieldData(
                                placeholder: "Type your message here",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                        material: (context, platform) => MaterialTextFieldData(
                          decoration: InputDecoration(
                            hintText: "Type your message here",
                            hintMaxLines: 1,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                            // fillColor: Colors.white,
                            // filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 0.2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black26,
                                width: 0.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      child: Icon(
                        Icons.send,
                        color: sendButtonColor,
                        size: 24,
                      ),
                      onTap: () {
                        if (_textController.text.trim() != '') {
                          if (onSend != null) {
                            onSend!(_textController.text.trim());
                          }
                          _textController.text = '';
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
