import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/repo/chat_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/services/chat_services.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/profile_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'widgets/profile_input_card.dart';

@RoutePage()
class OtherUserProfileView extends ConsumerStatefulWidget {
  const OtherUserProfileView({
    super.key,
    @pathParam this.id,
    this.isCurrentUser = true,
  });

  final String? id;
  final bool? isCurrentUser;

  @override
  ConsumerState<OtherUserProfileView> createState() => _OtherUserProfileViewState();
}

class _OtherUserProfileViewState extends ConsumerState<OtherUserProfileView> {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logEvent(
      name: 'user_profile_view',
      parameters: <String, Object>{
        'user_id': widget.id as Object,
      },
    );
    // var userData;
    // if (widget.isCurrentUser!) {
    var currentUser = ref.watch(ProfileController.userControllerProvider).userModel;
    // } else {
    var otherUser = ref.watch(getUserByIdProvider(widget.id!));
    // }

    return Scaffold(
      // backgroundColor: ,
      body: otherUser.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) => (error is Exception)
            ? const Center(
                child: Text("User not found"),
              )
            : const Center(
                child: Text("Something went wrong"),
              ),
        data: (userData) {
          if (kIsWeb) {
            MetaSEO meta = MetaSEO();

            meta.author(author: userData!.username);
            meta.description(description: userData.bio ?? "No Bio");
            meta.keywords(
              keywords: userData.bodyType.value,
            );
            meta.ogImage(ogImage: userData.profileUrl ?? "https://img.icons8.com/ios/500/null.png");
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: AutoLeadingButton(),
                pinned: true,

                actions: [
                  PopupMenuButton<int>(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () async {
                          // await ref
                          //     .read(userListProvider.notifier)
                          //     .addToBlockList(userData!.id);

                          // ignore: use_build_context_synchronously
                          context.router.back();
                          // AutoRouter.of(context).replace(const DashboardRoute());
                        },
                        value: 1,
                        // row has two child icon and text.
                        child: const Row(
                          children: [
                            Icon(Icons.block),
                            SizedBox(
                              // sized box with width 10
                              width: 10,
                            ),
                            Text("Block")
                          ],
                        ),
                      ),
                      // popupmenu item 2
                      const PopupMenuItem(
                        value: 2,
                        // row has two child icon and text
                        child: Row(
                          children: [
                            Icon(Icons.chrome_reader_mode),
                            SizedBox(
                              // sized box with width 10
                              width: 10,
                            ),
                            Text("About")
                          ],
                        ),
                      ),
                    ],
                    offset: const Offset(0, 100),
                    color: Colors.black,
                    elevation: 2,
                  ),
                ],
                // centerTitle: true,
                title: Text(userData!.username),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      // color: Colors.white,
                      imageUrl: (userData.profileUrl ?? "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "About",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      // 10.heightBox,
                      SizedBox(height: 20),

                      Text(
                        userData.bio ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      // 20.heightBox,
                      SizedBox(height: 20),

                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.sizeOf(context).width * 0.3,
                            maxWidth: MediaQuery.sizeOf(context).width,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileInputCard(title: "Role", value: userData.role.value),
                              ProfileInputCard(title: "Body Type", value: userData.bodyType.value),
                              ProfileInputCard(title: "Ethnicity", value: userData.ethnicity.value),
                              ProfileInputCard(title: "Relationship Status", value: userData.relationshipStatus.value),
                              ProfileInputCard(title: "Looking for", value: userData.lookingFor.value),
                              ProfileInputCard(title: "Where to meet", value: userData.whereToMeet.value),
                              ProfileInputCard(title: "Height", value: userData.height ?? "Do not Show"),
                              ProfileInputCard(title: "Weight", value: userData.weight ?? "Do not Show"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
            icon: const Icon(Icons.chat_bubble),
            label: currentUser!.blockList.contains(otherUser.value?.id) ? const Text("Unblock") : const Text("Message"),
            onPressed: () async {
              // Future.microtask(() async {
              //   ref.read(chatRepoProvider.notifier).connectUser(
              //         user: await ref.read(Dependency.profileProvider).getCurrentUser(),
              //       );
              // });

              final channelState =
                  await ref.read(chatRepoProvider.notifier).createChat(currentUser.id, otherUser.value!.id);
              // AutoRouter.of(context).push( ChatRoute(channel: ));
              // print(channel?.toJson());
              final channel = await ref.read(chatClientProvider).queryChannelsOnline(
                      filter: Filter.and([
                    Filter.equal('type', 'messaging'), // Use your actual channel type here (e.g., 'messaging')
                    Filter.in_(
                        'members', [currentUser.id]), // Include the current user's ID in an $in filter for access
                    Filter.in_('members', [otherUser.value!.id]), // Also include the other user's ID
                  ]));

              print("channel ${channel.length}");
              context.router.push(ChatRoute(channel: channel[0], id: channel[0].id!));
              // Todo create chat one to one chat
            }),
      ),
    );
  }
}
