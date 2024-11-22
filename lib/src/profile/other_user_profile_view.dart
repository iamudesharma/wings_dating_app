import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/profile_view.dart';

import '../../routes/app_router.dart';

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

    return WillPopScope(
      onWillPop: () {
        AutoRouter.of(context).back();
        return Future.value(true);
      },
      child: Scaffold(
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
              meta.ogImage(
                  ogImage: userData.profileUrl ??
                      "https://img.icons8.com/ios/500/null.png");
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
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
                            context.router.maybePop();
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
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        // color: Colors.white,
                        imageUrl: (userData.profileUrl ??
                            "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
                        fit: BoxFit.contain,
                      ),
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
                            ProfileInputCard(
                                title: "Looking for",
                                value: userData.lookingFor.value),
                            ProfileInputCard(
                                title: "Where to meet",
                                value: userData.whereToMeet.value),
                            ProfileInputCard(
                                title: "Height",
                                value: userData.height ?? "Do not Show"),
                            ProfileInputCard(
                                title: "Weight",
                                value: userData.weight ?? "Do not Show"),
                          ],
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
              label: currentUser!.blockList.contains(otherUser.value?.id)
                  ? const Text("Unblock")
                  : const Text("Message"),
              onPressed: () async {
                _createDialog(
                    context,
                    {
                      currentUser.cubeUser.id ?? 0,
                      otherUser.value!.cubeUser.id ?? 0
                    },
                    currentUser.cubeUser.id ?? 0);
              }),
        ),
      ),
    );
  }

  void _createDialog(BuildContext context, Set<int> users, int current) async {
    log("_createDialog with users= $users");

    CubeDialog newDialog =
        CubeDialog(CubeDialogType.PRIVATE, occupantsIds: users.toList());
    await createDialog(newDialog).then((createdDialog) async {
      await AutoRouter.of(context).push(
        ChatRoute(
          cubeUserId: current,
          chatUserCubeId: users.where((element) => element != current).first,
          cubeDialog: createdDialog,
        ),
      );
    }).catchError((error) {
      logger.e(error);
    });
  }
}
