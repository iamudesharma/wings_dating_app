import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/src/profile/profile_view.dart';

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
    //   userData = ref.watch(ProfileController.userControllerProvider).userModel;
    // } else {
    var otherUser = ref.watch(getUserByIdProvider(widget.id!));
    // }

    // logger.i(userData?.profileUrl);

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
            SliverAppBar.medium(
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  userData?.username ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  userData!.profileUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,

              actions: [
                IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ],
              // centerTitle: true,
              title: Text(userData.username),
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
          icon: Icon(Icons.chat_bubble),
          label: Text("Message"),
          onPressed: () {},
        ),
      ),
    );
  }
}
