// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import '../../routes/app_router.dart';

import 'package:velocity_x/velocity_x.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userData =
        ref.watch(ProfileController.userControllerProvider).userModel;

    // logger.i(userData?.profileUrl);

    return CustomScrollView(
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
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () async {
                    // await ref.read(profileRepoProvider).getUserList();

                    context.router.push(
                      EditProfileRoute(isEditProfile: true),
                    );
                  },
                  icon: const Icon(Icons.edit, size: 10),
                  label: Text(
                    "Edit Profile",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
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
                            title: "Body Type", value: userData.bodyType.value),
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
    );
  }
}

class ProfileInputCard extends StatelessWidget {
  const ProfileInputCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  // final UserModel? userData;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        10.heightBox,
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
