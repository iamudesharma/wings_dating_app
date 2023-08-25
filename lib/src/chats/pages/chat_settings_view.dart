// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

final getNotificationsSettingsProvider =
    FutureProvider.family<bool, String>((ref, dialogId) async {
  return await getDialogNotificationsSettings(dialogId);
});

class ChatSettingPage extends ConsumerWidget {
  const ChatSettingPage({
    Key? key,
    required this.user,
    required this.dialogId,
  }) : super(key: key);
  final UserModel user;
  final String dialogId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final getNotificationsSettings =
    //     ref.watch(getNotificationsSettingsProvider(dialogId));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chat Settings"),
        ),
        body: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(user.profileUrl!),
            ),
            Text(user.username),
            // getNotificationsSettings.when(
            //   data: (data) => SwitchListTile.adaptive(
            //     onChanged: (value) {
            //       updateDialogNotificationsSettings(dialogId, value);
            //       ref.invalidate(getNotificationsSettingsProvider(dialogId));
            //     },
            //     value: data,
            //     title: const Text("Enable Notifications"),
            //   ),
            //   loading: () => const Center(
            //     child: CircularProgressIndicator.adaptive(),
            //   ),
            //   error: (error, stackTrace) => Center(
            //     child: Text(error.toString()),
            //   ),
            // )

            FilledButton(
              child: const Text("Block "),
              onPressed: () async {
                await ref
                    .read(ProfileController.userControllerProvider)
                    .addToBlockList(cubeId: user.cubeUser.id!, id: user.id)
                    .then(
                      (value) => context.router.replaceNamed("/"),
                    );
              },
            )
          ],
        ));
  }
}
