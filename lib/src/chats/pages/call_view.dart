// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:async';

// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';

// import 'package:awesome_notifications/android_foreground_service.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vibration/vibration.dart';

// import '../../../helpers/notifications_util.dart';

// class CallView extends ConsumerStatefulWidget {
//   const CallView({
//     this.receivedAction,
//   });

//   final ReceivedAction? receivedAction;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CallViewState();
// }

// class _CallViewState extends ConsumerState<CallView> {
//   Timer? _timer;
//   Duration _secondsElapsed = Duration.zero;

//   void startCallingTimer() {
//     const oneSec = Duration(seconds: 1);
//     // NotificationUtils.cancelNotification(widget.receivedAction!.id!);
//     AndroidForegroundService.stopForeground(widget.receivedAction!.id!);

//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         setState(() {
//           _secondsElapsed += oneSec;
//         });
//       },
//     );
//   }

//   void finishCall() {
//     Vibration.vibrate(duration: 100);
//     // NotificationUtils.cancelNotification(widget.receivedAction!.id!);
//     AndroidForegroundService.stopForeground(widget.receivedAction!.id!);
//     Navigator.pop(context);
//   }

//   @override
//   void initState() {
//     lockScreenPortrait();
//     super.initState();
//     if (widget.receivedAction!.buttonKeyPressed == 'ACCEPT') {
//       startCallingTimer();
//     }
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     unlockScreenPortrait();
//     // NotificationUtils.cancelNotification(widget.receivedAction!.id!);
//     AndroidForegroundService.stopForeground(widget.receivedAction!.id!);
//     super.dispose();
//   }

//   void lockScreenPortrait() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//   }

//   void unlockScreenPortrait() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaQueryData = MediaQuery.of(context);
//     ThemeData themeData = Theme.of(context);

//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Image
//           // Image(
//           //   image: widget.receivedAction?.largeIconImage??,
//           //   fit: BoxFit.cover,
//           // ),
//           // Black Layer
//           const DecoratedBox(
//             decoration: BoxDecoration(color: Colors.black45),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: SafeArea(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     widget.receivedAction?.payload?['username']
//                             ?.replaceAll(r'\s+', r'\n') ??
//                         'Unknown',
//                     maxLines: 4,
//                   ),
//                   Text(
//                     _timer == null
//                         ? 'Incoming call'
//                         : 'Call in progress: ${(_secondsElapsed)}',
//                   ),
//                   const SizedBox(height: 50),
//                   _timer == null
//                       ? Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             TextButton(
//                                 onPressed: () {},
//                                 style: ButtonStyle(
//                                   overlayColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white12),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     const Icon(Icons.close,
//                                         color: Colors.white54),
//                                     Text(
//                                       'Reminder me',
//                                     ),
//                                   ],
//                                 )),
//                             const SizedBox(),
//                             TextButton(
//                               onPressed: () {},
//                               style: ButtonStyle(
//                                 overlayColor: MaterialStateProperty.all<Color>(
//                                     Colors.white12),
//                               ),
//                               child: Column(
//                                 children: [
//                                   const Icon(Icons.message,
//                                       color: Colors.white54),
//                                   Text(
//                                     'Message',
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       : const SizedBox(),
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.all(15),
//                     decoration: const BoxDecoration(
//                       color: Colors.black54,
//                       borderRadius: BorderRadius.all(Radius.circular(45)),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: _timer == null
//                           ? [
//                               RoundedButton(
//                                 press: finishCall,
//                                 color: Colors.red,
//                                 icon: const Icon(Icons.phone,
//                                     color: Colors.white),
//                               ),
//                               SingleSliderToConfirm(
//                                 onConfirmation: () {
//                                   Vibration.vibrate(duration: 100);
//                                   startCallingTimer();
//                                 },
//                                 width: mediaQueryData.size.width * 0.55,
//                                 backgroundColor: Colors.white60,
//                                 text: 'Slide to Talk',
//                                 stickToEnd: true,
//                                 textStyle: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     ?.copyWith(
//                                         color: Colors.white,
//                                         fontSize:
//                                             mediaQueryData.size.width * 0.05),
//                                 sliderButtonContent: RoundedButton(
//                                   press: () {},
//                                   color: Colors.white,
//                                   icon: const Icon(Icons.phone,
//                                       color: Colors.green),
//                                 ),
//                               )
//                             ]
//                           : [
//                               RoundedButton(
//                                 press: () {},
//                                 color: Colors.white,
//                                 icon: const Icon(Icons.mic_off,
//                                     color: Colors.black),
//                               ),
//                               RoundedButton(
//                                 press: finishCall,
//                                 color: Colors.red,
//                                 icon: const Icon(Icons.phone_callback,
//                                     color: Colors.white),
//                               ),
//                               RoundedButton(
//                                 press: () {},
//                                 color: Colors.white,
//                                 icon: const Icon(Icons.volume_up,
//                                     color: Colors.black),
//                               ),
//                             ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RoundedButton extends StatelessWidget {
//   const RoundedButton({
//     Key? key,
//     this.size = 64,
//     required this.icon,
//     this.color = Colors.white,
//     required this.press,
//   }) : super(key: key);

//   final double size;
//   final Icon icon;
//   final Color color;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: size,
//       width: size,
//       // ignore: deprecated_member_use
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           padding: EdgeInsets.all(15 / 64 * size),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(100)),
//           ),
//         ),
//         onPressed: press,
//         child: icon,
//       ),
//     );
//   }
// }

// class SingleSliderToConfirm extends StatefulWidget {
//   /// Height of the slider. Defaults to 70.
//   final double height;

//   /// Width of the slider. Defaults to 300.
//   final double width;

//   /// The color of the background of the slider. Defaults to Colors.white.
//   final Color backgroundColor;

//   /// The color of the background of the slider when it has been slide to the end. By giving a value here, the background color
//   /// will gradually change from backgroundColor to backgroundColorEnd when the user slides. Is not used by default.
//   final Color? backgroundColorEnd;

//   /// The color of the moving element of the slider. Defaults to Colors.blueAccent.
//   final Color foregroundColor;

//   /// The color of the icon on the moving element if icon is IconData. Defaults to Colors.white.
//   final Color iconColor;

//   /// The button widget used on the moving element of the slider. Defaults to Icon(Icons.chevron_right).
//   final Widget sliderButtonContent;

//   /// The shadow below the slider. Defaults to BoxShadow(color: Colors.black38, offset: Offset(0, 2),blurRadius: 2,spreadRadius: 0,).
//   final BoxShadow? shadow;

//   /// The text showed below the foreground. Used to specify the functionality to the user. Defaults to "Slide to confirm".
//   final String text;

//   /// The style of the text. Defaults to TextStyle(color: Colors.black26, fontWeight: FontWeight.bold,).
//   final TextStyle? textStyle;

//   /// The callback when slider is completed. This is the only required field.
//   final VoidCallback onConfirmation;

//   /// The callback when slider is pressed.
//   final VoidCallback? onTapDown;

//   /// The callback when slider is release.
//   final VoidCallback? onTapUp;

//   /// The shape of the moving element of the slider. Defaults to a circular border radius
//   final BorderRadius? foregroundShape;

//   /// The shape of the background of the slider. Defaults to a circular border radius
//   final BorderRadius? backgroundShape;

//   /// Stick the slider to the end
//   final bool stickToEnd;

//   const SingleSliderToConfirm({
//     Key? key,
//     this.height = 70,
//     this.width = 300,
//     this.backgroundColor = Colors.white,
//     this.backgroundColorEnd,
//     this.foregroundColor = Colors.blueAccent,
//     this.iconColor = Colors.white,
//     this.shadow,
//     this.sliderButtonContent = const Icon(
//       Icons.chevron_right,
//       color: Colors.white,
//       size: 35,
//     ),
//     this.text = "Slide to confirm",
//     this.textStyle,
//     required this.onConfirmation,
//     this.onTapDown,
//     this.onTapUp,
//     this.foregroundShape,
//     this.backgroundShape,
//     this.stickToEnd = false,
//   });

//   @override
//   State<StatefulWidget> createState() {
//     return SingleSliderToConfirmState();
//   }
// }

// class SingleSliderToConfirmState extends State<SingleSliderToConfirm> {
//   double _position = 0;
//   int _duration = 0;

//   double getPosition() {
//     if (_position < 0) {
//       return 0;
//     } else if (_position > widget.width - widget.height) {
//       return widget.width - widget.height;
//     } else {
//       return _position;
//     }
//   }

//   void updatePosition(details) {
//     if (details is DragEndDetails) {
//       setState(() {
//         _duration = 600;
//         if (widget.stickToEnd && _position > widget.width - widget.height) {
//           _position = widget.width - widget.height;
//         } else {
//           _position = 0;
//         }
//       });
//     } else if (details is DragUpdateDetails) {
//       setState(() {
//         _duration = 0;
//         _position = details.localPosition.dx - (widget.height / 2);
//       });
//     }
//   }

//   void sliderReleased(details) {
//     if (_position > widget.width - widget.height) {
//       widget.onConfirmation();
//     }
//     updatePosition(details);
//   }

//   Color calculateBackground() {
//     if (widget.backgroundColorEnd != null) {
//       double percent;

//       // calculates the percentage of the position of the slider
//       if (_position > widget.width - widget.height) {
//         percent = 1.0;
//       } else if (_position / (widget.width - widget.height) > 0) {
//         percent = _position / (widget.width - widget.height);
//       } else {
//         percent = 0.0;
//       }

//       int red = widget.backgroundColorEnd!.red;
//       int green = widget.backgroundColorEnd!.green;
//       int blue = widget.backgroundColorEnd!.blue;

//       return Color.alphaBlend(
//           Color.fromRGBO(red, green, blue, percent), widget.backgroundColor);
//     } else {
//       return widget.backgroundColor;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     BoxShadow shadow;
//     if (widget.shadow == null) {
//       shadow = BoxShadow(
//         color: Colors.black38,
//         offset: Offset(0, 2),
//         blurRadius: 2,
//         spreadRadius: 0,
//       );
//     } else {
//       shadow = widget.shadow!;
//     }

//     TextStyle style;
//     if (widget.textStyle == null) {
//       style = TextStyle(
//         color: Colors.black26,
//         fontWeight: FontWeight.bold,
//       );
//     } else {
//       style = widget.textStyle!;
//     }

//     return AnimatedContainer(
//       duration: Duration(milliseconds: _duration),
//       curve: Curves.ease,
//       height: widget.height,
//       width: widget.width,
//       padding: EdgeInsets.all(5),
//       decoration: BoxDecoration(
//         borderRadius: widget.backgroundShape ??
//             BorderRadius.all(Radius.circular(widget.height)),
//         color: widget.backgroundColorEnd != null
//             ? this.calculateBackground()
//             : widget.backgroundColor,
//         boxShadow: <BoxShadow>[shadow],
//       ),
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//             top: 0,
//             bottom: 0,
//             right: 10,
//             width: widget.width - getPosition() - widget.height,
//             child: Column(
//               textBaseline: TextBaseline.ideographic,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   widget.text,
//                   overflow: TextOverflow.clip,
//                   textDirection: ui.TextDirection.rtl,
//                   softWrap: false,
//                   maxLines: 1,
//                   style: style,
//                 ),
//               ],
//             ),
//           ),
//           AnimatedPositioned(
//             duration: Duration(milliseconds: _duration),
//             curve: Curves.bounceOut,
//             left: getPosition(),
//             top: 0,
//             child: GestureDetector(
//               onTapDown: (_) =>
//                   widget.onTapDown != null ? widget.onTapDown!() : null,
//               onTapUp: (_) => widget.onTapUp != null ? widget.onTapUp!() : null,
//               onPanUpdate: (details) {
//                 updatePosition(details);
//               },
//               onPanEnd: (details) {
//                 if (widget.onTapUp != null) widget.onTapUp!();
//                 sliderReleased(details);
//               },
//               child: Container(
//                 height: widget.height - 10,
//                 width: widget.height - 10,
//                 decoration: BoxDecoration(
//                   borderRadius: widget.foregroundShape ??
//                       BorderRadius.all(Radius.circular(widget.height / 2)),
//                   color: widget.foregroundColor,
//                 ),
//                 child: widget.sliderButtonContent,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:wings_dating_app/routes/app_router.dart';

import '../../../helpers/logger.dart';
import '../services/call_manager.dart';

@RoutePage()

class CallView extends StatefulWidget {
  final P2PSession _callSession;
  final bool _isIncoming;

  @override
  State<CallView> createState() {
    return _CallViewState(_callSession, _isIncoming);
  }

  const CallView(this._callSession, this._isIncoming, {super.key});
}

class _CallViewState extends State<CallView>
    implements RTCSessionStateCallback<P2PSession> {
  final P2PSession _callSession;
  final bool _isIncoming;
  bool _isCameraEnabled = true;
  bool _isSpeakerEnabled = true;
  bool _isMicMute = false;

  RTCVideoRenderer? localRenderer;
  Map<int, RTCVideoRenderer> remoteRenderers = {};
  final CubeStatsReportsManager _statsReportsManager =
      CubeStatsReportsManager();
  MediaStream? _localMediaStream;

  Widget? _localVideoView;

  bool _needRebuildLocalVideoView = true;

  final bool _customMediaStream = false;

  _CallViewState(this._callSession, this._isIncoming);

  @override
  void initState() {
    super.initState();

    _localMediaStream = CallManager.instance.localMediaStream;

    _callSession.onLocalStreamReceived = _addLocalMediaStream;
    _callSession.onRemoteStreamReceived = _addRemoteMediaStream;
    _callSession.onSessionClosed = _onSessionClosed;
    _statsReportsManager.init(_callSession);
    _callSession.setSessionCallbacksListener(this);

    if (_isIncoming ?? false) {
      if (_callSession.state == RTCSessionState.RTC_SESSION_NEW) {
        _callSession.acceptCall();
      }
    } else {
      _callSession.startCall();
    }
  }

  @override
  void deactivate() {
    super.deactivate();

    stopBackgroundExecution();

    localRenderer?.srcObject = null;
    localRenderer?.dispose();

    remoteRenderers.forEach((opponentId, renderer) {
      logger.i("[dispose] dispose renderer for $opponentId");
      try {
        renderer.srcObject = null;
        renderer.dispose();
      } catch (e) {
        log('Error $e');
      }
    });
  }

  void _addRemoteMediaStream(session, int userId, MediaStream stream) {
    log(
      "_addRemoteMediaStream for user $userId",
    );
    _onRemoteStreamAdd(userId, stream);
  }

  void _onSessionClosed(session) {
    logger.i(
      "_onSessionClosed",
    );
    _callSession.removeSessionCallbacksListener();

    // _statsReportsManager.dispose();

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginScreen(),
    //   ),
    // );
  }

  void _onRemoteStreamAdd(int opponentId, MediaStream stream) async {
    logger.i(
      "_onStreamAdd for user $opponentId",
    );

    RTCVideoRenderer streamRender = RTCVideoRenderer();
    await streamRender.initialize();
    streamRender.srcObject = stream;
    setState(() {
      remoteRenderers[opponentId] = streamRender;
    });
  }

  Future<void> _addLocalMediaStream(MediaStream stream) async {
    _localMediaStream = stream;

    if (!mounted) return;

    setState(() {
      _needRebuildLocalVideoView = localRenderer == null;
    });

    localRenderer?.srcObject = _localMediaStream;
  }

  Future<void> _removeMediaStream(callSession, int userId) async {
    logger.i(
      "_removeMediaStream for user $userId",
    );
    RTCVideoRenderer? videoRenderer = remoteRenderers[userId];
    if (videoRenderer == null) return;

    videoRenderer.srcObject = null;
    videoRenderer.dispose();

    setState(() {
      remoteRenderers.remove(userId);
    });
  }

//Remove this method if you don't want to use background execution
  Widget buildRemoteVideoItem(int opponentId, RTCVideoRenderer renderer) {
    return Expanded(
      child: Stack(
        children: [
          RTCVideoView(
            renderer,
            objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
            mirror: false,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: StreamBuilder<CubeMicLevelEvent>(
                      stream: _statsReportsManager.micLevelStream
                          .where((event) => event.userId == opponentId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const LinearProgressIndicator(value: 0);
                        } else {
                          var micLevelForUser = snapshot.data!;
                          return LinearProgressIndicator(
                              value: micLevelForUser.micLevel);
                        }
                      },
                    ),
                  ),
                ),
              )),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black26,
                    child: StreamBuilder<CubeVideoBitrateEvent>(
                      stream: _statsReportsManager.videoBitrateStream
                          .where((event) => event.userId == opponentId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text(
                            '0 kbits/sec',
                            style: TextStyle(color: Colors.white),
                          );
                        } else {
                          var videoBitrateForUser = snapshot.data!;
                          return Text(
                            '${videoBitrateForUser.bitRate} kbits/sec',
                            style: const TextStyle(color: Colors.white),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Future<Widget> _buildLocalVideoItem() async {
    logger.i(
      "buildLocalVideoStreamItem",
    );
    if (localRenderer == null) {
      localRenderer = RTCVideoRenderer();
      await localRenderer!.initialize();
    }

    localRenderer?.srcObject = _localMediaStream;

    _localVideoView = Expanded(
        child: RTCVideoView(
      localRenderer!,
      objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
      mirror: true,
    ));
    _needRebuildLocalVideoView = false;

    return _localVideoView!;
  }

  List<Widget> renderStreamsGrid(Orientation orientation) {
    List<Widget> streamsExpanded = [];

    if (_localMediaStream != null) {
      streamsExpanded.add(_localVideoView == null
          ? FutureBuilder<Widget>(
              future: _needRebuildLocalVideoView
                  ? _buildLocalVideoItem()
                  : Future.value(_localVideoView),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                } else {
                  return Expanded(child: Container());
                }
              })
          : _localVideoView != null
              ? _localVideoView!
              : Expanded(child: Container()));
    }

    if (remoteRenderers.isEmpty) {
      streamsExpanded
          .addAll(CallManager.instance.remoteStreams.entries.map((entry) {
        var videoRenderer = RTCVideoRenderer();
        var initialisationFuture = videoRenderer.initialize().then((_) {
          videoRenderer.srcObject = entry.value;
          return videoRenderer;
        });

        return FutureBuilder<RTCVideoRenderer>(
          future: initialisationFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildRemoteVideoItem(entry.key, snapshot.data!);
            } else {
              return Expanded(
                  child: Container(
                child: const Text('Waiting...'),
              ));
            }
          },
        );
      }));
    } else {
      streamsExpanded.addAll(remoteRenderers.entries
          .map(
            (entry) => buildRemoteVideoItem(entry.key, entry.value),
          )
          .toList());
    }

    if (streamsExpanded.length > 2) {
      List<Widget> rows = [];

      for (var i = 0; i < streamsExpanded.length; i += 2) {
        var chunkEndIndex = i + 2;

        if (streamsExpanded.length < chunkEndIndex) {
          chunkEndIndex = streamsExpanded.length;
        }

        var chunk = streamsExpanded.sublist(i, chunkEndIndex);

        rows.add(
          Expanded(
            child: orientation == Orientation.portrait
                ? Row(children: chunk)
                : Column(children: chunk),
          ),
        );
      }

      return rows;
    }

    return streamsExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
          _isVideoCall()
              ? OrientationBuilder(
                  builder: (context, orientation) {
                    return Center(
                      child: Container(
                        child: orientation == Orientation.portrait
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: renderStreamsGrid(orientation))
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: renderStreamsGrid(orientation)),
                      ),
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text(
                          "Audio call",
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text(
                          "Members:",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ),
                      Text(
                        _callSession.opponentsIds.join(", "),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _getActionsPanel(),
          ),
        ]),
      ),
    );
  }

  Widget _getActionsPanel() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32)),
        child: Container(
          padding: const EdgeInsets.all(4),
          color: Colors.black26,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "Mute",
                  onPressed: () => _muteMic(),
                  backgroundColor: Colors.black38,
                  child: Icon(
                    Icons.mic,
                    color: _isMicMute ? Colors.grey : Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "Speacker",
                  onPressed: () => _switchSpeaker(),
                  backgroundColor: Colors.black38,
                  child: Icon(
                    Icons.volume_up,
                    color: _isSpeakerEnabled ? Colors.white : Colors.grey,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () => _endCall(),
                  child: const Icon(
                    Icons.call_end,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _switchSpeaker() {
    setState(() {
      _isSpeakerEnabled = !_isSpeakerEnabled;
      _callSession.enableSpeakerphone(_isSpeakerEnabled);
    });
  }

  _endCall() {
    CallManager.instance.hungUp();
    if (_isIncoming) {
      AutoRouter.of(context).replace(const DashboardRoute());
    } else {
      AutoRouter.of(context).back();
    }
  }

  _muteMic() {
    setState(() {
      _isMicMute = !_isMicMute;
      _callSession.setMicrophoneMute(_isMicMute);
    });
  }

  _switchCamera() {
    if (!_isVideoEnabled()) return;

    _callSession.switchCamera();
  }

  _toggleCamera() {
    if (!_isVideoCall()) return;

    setState(() {
      _isCameraEnabled = !_isCameraEnabled;
      _callSession.setVideoEnabled(_isCameraEnabled);
    });
  }

  bool _isVideoEnabled() {
    return _isVideoCall() && _isCameraEnabled;
  }

  bool _isVideoCall() {
    return CallType.VIDEO_CALL == _callSession.callType;
  }

  @override
  void onConnectedToUser(P2PSession session, int userId) {
    logger.i(
      "onConnectedToUser for user $userId",
    );
  }

  @override
  void onConnectionClosedForUser(P2PSession session, int userId) {
    logger.i("onConnectionClosedForUser userId= $userId");
    _removeMediaStream(session, userId);
  }

  @override
  void onDisconnectedFromUser(P2PSession session, int userId) {
    logger.i("onDisconnectedFromUser userId= $userId");
    _removeMediaStream(session, userId);
  }
  
  @override
  void onConnectingToUser(P2PSession session, int userId) {
    // TODO: implement onConnectingToUser
  }
  
  @override
  void onConnectionFailedWithUser(P2PSession session, int userId) {
    // TODO: implement onConnectionFailedWithUser
  }
}

Future<bool> initForegroundService() async {
  if (Platform.isAndroid) {
  const   androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: 'Conference Calls sample',
      notificationText: 'Screen sharing in in progress',
      notificationImportance:  AndroidNotificationImportance.high,
      notificationIcon:
          AndroidResource(name: 'ic_launcher_foreground', defType: 'drawable'),
    );
    return FlutterBackground.initialize(androidConfig: androidConfig);
  } else {
    return Future.value(true);
  }
}

Future<bool> startBackgroundExecution() async {
  if (Platform.isAndroid) {
    return initForegroundService().then((_) {
      return FlutterBackground.enableBackgroundExecution();
    });
  } else {
    return Future.value(true);
  }
}

Future<bool> stopBackgroundExecution() async {
  if (Platform.isAndroid && FlutterBackground.isBackgroundExecutionEnabled) {
    return FlutterBackground.disableBackgroundExecution();
  } else {
    return Future.value(true);
  }
}

Future<bool> hasBackgroundExecutionPermissions() async {
  if (Platform.isAndroid) {
    return FlutterBackground.hasPermissions;
  } else {
    return Future.value(true);
  }
}

Future<bool> _onBackPressed(BuildContext context) {
  return Future.value(false);
}
