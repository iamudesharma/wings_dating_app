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
