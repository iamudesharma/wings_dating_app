import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/profile_view.dart';

import '../../routes/app_router.dart';

class OtherUserProfileView extends ConsumerStatefulWidget {
  const OtherUserProfileView({
    super.key,
    this.id,
    this.isCurrentUser = true,
  });

  final String? id;
  final bool? isCurrentUser;

  @override
  ConsumerState<OtherUserProfileView> createState() =>
      _OtherUserProfileViewState();
}

class _OtherUserProfileViewState extends ConsumerState<OtherUserProfileView> {
  @override
  Widget build(BuildContext context) {
    // var userData;
    // if (widget.isCurrentUser!) {
    var currentUser =
        ref.watch(ProfileController.userControllerProvider).userModel;
    // } else {
    var otherUser = ref.watch(getUserByIdProvider(widget.id!));
    // }

    // logger.i(userData?.profileUrl);
    void _showPop() {
      // return VxPopupMenu();
    }
    return Scaffold(
      body: otherUser.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => (error is Exception)
            ? const Center(
                child: Text("User not found"),
              )
            : const Center(
                child: Text("Something went wrong"),
              ),
        data: (userData) => CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,

              actions: [
                PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () async {
                        ref
                            .read(profileRepoProvider)
                            .addToBlockList(id: userData!.id);
                      },
                      value: 1,
                      // row has two child icon and text.
                      child: Row(
                        children: const [
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
                    PopupMenuItem(
                      value: 2,
                      // row has two child icon and text
                      child: Row(
                        children: const [
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
                  color: Colors.grey,
                  elevation: 2,
                ),
              ],
              // centerTitle: true,
              title: Text(userData!.username),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(userData.profileUrl ?? ""),
                    ),
                    10.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userData.username),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    10.heightBox,
                    Text(
                      userData.bio ?? "",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    20.heightBox,
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileInputCard(
                                title: "Role", value: userData.role.value),
                            ProfileInputCard(
                                title: "Body Type",
                                value: userData.bodyType.value),
                            ProfileInputCard(
                                title: "Ethnicity",
                                value: userData.ethnicity.value),
                            ProfileInputCard(
                                title: "Relationship Status",
                                value: userData.relationshipStatus.value),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.chat_bubble),
          label: currentUser!.blockList.contains(otherUser.value?.id)
              ? const Text("Unblock")
              : const Text("Message"),
          onPressed: () async {
            if (currentUser.blockList.contains(otherUser.value?.id)) {
              ref
                  .read(profileRepoProvider)
                  .removeToBlockList(id: [otherUser.value!.id]);
            } else {
              await AutoRouter.of(context).push(
                ChatRoute(id: widget.id!),
              );
            }
          },
        ),
      ),
    );
  }
}
