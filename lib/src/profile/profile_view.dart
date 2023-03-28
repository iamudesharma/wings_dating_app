// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wings_dating_app/src/model/user_models.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import '../../repo/profile_repo.dart';
import '../../routes/app_router.dart';

import 'package:velocity_x/velocity_x.dart';

final getUserByIdProvider =
    FutureProvider.family<UserModel?, String>((ref, id) {
  return ref.read(profileRepoProvider).getUserById(id);
});

@RoutePage()

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({
    super.key,
  });

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var userData =
        ref.watch(ProfileController.userControllerProvider).userModel;

    // logger.i(userData?.profileUrl);

    return PlatformScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // flexibleSpace: FlexibleSpaceBar(
            //   centerTitle: true,
            //   title: Text(
            //     userData?.username ?? "",
            //     style: const TextStyle(
            //       color: Colors.white,
            //       fontSize: 16.0,
            //     ),
            //   ),
            //   background: Image.network(
            //     userData!.profileUrl ?? "",
            //     fit: BoxFit.cover,
            //   ),
            // ),
            pinned: true,
    
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {
                  context.router.push(
                    const UserBlockListRoute(),
                  );
                },
              ),
            ],
            // centerTitle: true,
            title: Text(userData!.username),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  20.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(userData.profileUrl ?? ""),
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [],
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
                ],
              ),
            ),
          ),
        ],
      ),
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
    return value == "Do not Show"
        ? const SizedBox.shrink()
        : SizedBox(
            height: 50,
            width: context.screenWidth - 20,
            child: Column(
              children: [
                const Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisSize,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
