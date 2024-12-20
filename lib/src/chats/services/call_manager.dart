// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:universal_io/io.dart';

// // import 'package:connectycube_flutter_call_kit/connectycube_flutter_call_kit.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:wings_dating_app/routes/app_router.dart';

// import '../pages/incoming_call_screen.dart';
// import 'call_kit_manager.dart';

// class CallManager {
//   static String TAG = "CallManager";

//   static CallManager get instance => _getInstance();
//   static CallManager? _instance;

//   static CallManager _getInstance() {
//     return _instance ??= CallManager._internal();
//   }

//   factory CallManager() => _getInstance();

//   CallManager._internal();

//   P2PClient? _callClient;
//   P2PSession? _currentCall;
//   BuildContext? context;
//   MediaStream? localMediaStream;
//   Map<int, MediaStream> remoteStreams = {};

//   init(BuildContext context) {
//     this.context = context;

//     _initCustomMediaConfigs();

//     if (CubeChatConnection.instance.isAuthenticated()) {
//       _initCalls();
//     } else {
//       _initChatConnectionStateListener();
//     }

//     _initCallKit();
//   }

//   destroy() {
//     P2PClient.instance.destroy();
//   }

//   void _initCustomMediaConfigs() {
//     RTCMediaConfig mediaConfig = RTCMediaConfig.instance;
//     mediaConfig.minHeight = 340;
//     mediaConfig.minWidth = 480;
//     mediaConfig.minFrameRate = 25;

//     RTCConfig.instance.statsReportsInterval = 200;
//   }

//   void _initCalls() {
//     if (_callClient == null) {
//       _callClient = P2PClient.instance;

//       _callClient!.init();
//     }

//     _callClient!.onReceiveNewSession = (callSession) async {
//       if (_currentCall != null &&
//           _currentCall!.sessionId != callSession.sessionId) {
//         callSession.reject();
//         return;
//       }
//       _currentCall = callSession;

//       var callState = await _getCallState(_currentCall!.sessionId);

//       if (callState == CallState.REJECTED) {
//         reject(_currentCall!.sessionId, false);
//       } else if (callState == CallState.ACCEPTED) {
//         acceptCall(_currentCall!.sessionId, false);
//       } else if (callState == CallState.UNKNOWN ||
//           callState == CallState.PENDING) {
//         if (callState == CallState.UNKNOWN) {
//           ConnectycubeFlutterCallKit.setCallState(
//               sessionId: _currentCall!.sessionId, callState: CallState.PENDING);
//         }

//         _showIncomingCallScreen(_currentCall!);
//       }

//       _currentCall?.onLocalStreamReceived = (localStream) {
//         localMediaStream = localStream;
//       };

//       _currentCall?.onRemoteStreamReceived = (session, userId, stream) {
//         remoteStreams[userId] = stream;
//       };

//       _currentCall?.onRemoteStreamRemoved = (session, userId, stream) {
//         remoteStreams.remove(userId);
//       };
//     };

//     _callClient!.onSessionClosed = (callSession) {
//       if (_currentCall != null &&
//           _currentCall!.sessionId == callSession.sessionId) {
//         _currentCall = null;
//         localMediaStream = null;
//         remoteStreams.clear();
//         CallKitManager.instance.processCallFinished(callSession.sessionId);
//       }
//     };
//   }

//   void startNewCall(
//       BuildContext context, int callType, Set<int> opponents) async {
//     if (opponents.isEmpty) return;

//     P2PSession callSession =
//         _callClient!.createCallSession(callType, opponents);
//     _currentCall = callSession;
//     AutoRouter.of(context).push(
//       CallRoute(callSession: callSession, isIncoming: false),
//     );

//     _sendStartCallSignalForOffliners(_currentCall!);
//   }

//   void _showIncomingCallScreen(P2PSession callSession) {
//     if (context != null) {
//       Navigator.push(
//         context!,
//         MaterialPageRoute(
//           builder: (context) => IncomingCallScreen(callSession),
//         ),
//       );
//     }
//   }

//   void acceptCall(String sessionId, bool fromCallkit) {
//     log('acceptCall, from callKit: $fromCallkit', TAG);
//     ConnectycubeFlutterCallKit.setOnLockScreenVisibility(isVisible: true);

//     if (_currentCall != null) {
//       if (context != null) {
//         if (AppLifecycleState.resumed !=
//             WidgetsBinding.instance.lifecycleState) {
//           _currentCall?.acceptCall();
//         }

//         if (!fromCallkit) {
//           ConnectycubeFlutterCallKit.reportCallAccepted(sessionId: sessionId);
//         }

//         AutoRouter.of(context!)
//             .replace(CallRoute(callSession: _currentCall!, isIncoming: true));
//       }
//     }
//   }

//   void reject(String sessionId, bool fromCallkit) {
//     if (_currentCall != null) {
//       if (fromCallkit) {
//         ConnectycubeFlutterCallKit.setOnLockScreenVisibility(isVisible: false);
//       } else {
//         CallKitManager.instance.processCallFinished(_currentCall!.sessionId);
//       }

//       _currentCall!.reject();
//       _sendEndCallSignalForOffliners(_currentCall);
//     }
//   }

//   void hungUp() {
//     if (_currentCall != null) {
//       CallKitManager.instance.processCallFinished(_currentCall!.sessionId);
//       _currentCall!.hungUp();
//       _sendEndCallSignalForOffliners(_currentCall);
//     }
//   }

//   CreateEventParams _getCallEventParameters(P2PSession currentCall) {
//     String? callerName = "";

//     // users
//     //     .where((cubeUser) => cubeUser.id == currentCall.callerId)
//     //     .first
//     //     .fullName;

//     CreateEventParams params = CreateEventParams();
//     params.parameters = {
//       'message':
//           "Incoming ${currentCall.callType == CallType.VIDEO_CALL ? "Video" : "Audio"} call",
//       PARAM_CALL_TYPE: currentCall.callType,
//       PARAM_SESSION_ID: currentCall.sessionId,
//       PARAM_CALLER_ID: currentCall.callerId,
//       PARAM_CALLER_NAME: callerName,
//       PARAM_CALL_OPPONENTS: currentCall.opponentsIds.join(','),
//     };

//     params.notificationType = NotificationType.PUSH;
//     params.environment =
//         kReleaseMode ? CubeEnvironment.PRODUCTION : CubeEnvironment.DEVELOPMENT;
//     params.usersIds = currentCall.opponentsIds.toList();

//     return params;
//   }

//   void _sendStartCallSignalForOffliners(P2PSession currentCall) {
//     CreateEventParams params = _getCallEventParameters(currentCall);
//     params.parameters[PARAM_SIGNAL_TYPE] = SIGNAL_TYPE_START_CALL;
//     params.parameters[PARAM_IOS_VOIP] = 1;
//     params.parameters[PARAM_EXPIRATION] =
//         DateTime.now().millisecondsSinceEpoch ~/ 1000 +
//             RTCConfig.instance.noAnswerTimeout;

//     createEvent(params.getEventForRequest()).then((cubeEvent) {
//       log("Event for offliners created: $cubeEvent");
//     }).catchError((error) {
//       log("ERROR occurs during create event");
//     });
//   }

//   void _sendEndCallSignalForOffliners(P2PSession? currentCall) {
//     if (currentCall == null) return;

//     CubeUser? currentUser = CubeChatConnection.instance.currentUser;
//     if (currentUser == null || currentUser.id != currentCall.callerId) return;

//     CreateEventParams params = _getCallEventParameters(currentCall);
//     params.parameters[PARAM_SIGNAL_TYPE] = SIGNAL_TYPE_END_CALL;

//     createEvent(params.getEventForRequest()).then((cubeEvent) {
//       log("Event for offliners created");
//     }).catchError((error) {
//       log("ERROR occurs during create event");
//     });
//   }

//   void _initCallKit() {
//     CallKitManager.instance.init(
//       onCallAccepted: (uuid) {
//         acceptCall(uuid, true);
//       },
//       onCallEnded: (uuid) {
//         reject(uuid, true);
//       },
//       onMuteCall: (mute, uuid) {
//         _currentCall?.setMicrophoneMute(mute);
//       },
//     );
//   }

//   void _initChatConnectionStateListener() {
//     CubeChatConnection.instance.connectionStateStream.listen((state) {
//       if (CubeChatConnectionState.Ready == state) {
//         _initCalls();
//       }
//     });
//   }

//   Future<String> _getCallState(String sessionId) async {
//     if (Platform.isAndroid || Platform.isIOS) {
//       var callState =
//           ConnectycubeFlutterCallKit.getCallState(sessionId: sessionId);
//       return callState;
//     }

//     return Future.value(CallState.UNKNOWN);
//   }
// }

// const String PARAM_SESSION_ID = 'session_id';
// const String PARAM_CALL_TYPE = 'call_type';
// const String PARAM_CALLER_ID = 'caller_id';
// const String PARAM_CALLER_NAME = 'caller_name';
// const String PARAM_CALL_OPPONENTS = 'call_opponents';
// const String PARAM_IOS_VOIP = 'ios_voip';
// const String PARAM_SIGNAL_TYPE = 'signal_type';
// const String PARAM_EXPIRATION = 'expiration';

// const String SIGNAL_TYPE_START_CALL = "startCall";
// const String SIGNAL_TYPE_END_CALL = "endCall";
// const String SIGNAL_TYPE_REJECT_CALL = "rejectCall";
