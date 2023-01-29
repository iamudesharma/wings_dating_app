import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

import '../../../config/app_config.dart';

class VideoCallView extends StatefulWidget {
  final String channelId;
  final String? userName;
  const VideoCallView({super.key, required this.channelId, this.userName});

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  // Instantiate the client
  late AgoraClient client;

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora(channelName: widget.channelId, name: widget.userName ?? "");
    // client.sessionController.value.
  }

  void initAgora({required String name, required String channelName}) async {
    client = AgoraClient(
      agoraChannelData: AgoraChannelData(),
      agoraConnectionData: AgoraConnectionData(
        channelName: channelName,
        appId: AppConfig.appId,
        username: name,
        tokenUrl: "http://10.0.2.2:8080",
      ),
    );
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
            ),
            AgoraVideoButtons(
                client: client,
                onDisconnect: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
