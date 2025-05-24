// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:wings_dating_app/src/model/user_models.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/users/users_view.dart';
import '../../repo/profile_repo.dart';
import '../../routes/app_router.dart';
import 'widgets/profile_input_card.dart';

// import 'package:velocity_x/velocity_x.dart';

final getUserByIdProvider = FutureProvider.family<UserModel?, String>((ref, id) {
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
    var userData = ref.watch(ProfileController.userControllerProvider).userModel;

    // logger.i(userData?.profileUrl);

    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Scaffold(
        body: ResponsiveBuilder(builder: (context, sizingInformation) {
          return ListView(
            children: [
              AppBar(
                actions: [
                  IconButton(
                    icon: Icon(Icons.app_blocking),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        context.router.replaceAll([const SignOptionsRoute()]);
                      });
                    },
                  ),
                ],
                // centerTitle: true,
                title: Text(userData!.username),
              ),
              Row(
                children: [
                  NavigationBarWidget(
                    sizingInformation: sizingInformation,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // 20.heightBox,
                              SizedBox(height: 20),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(userData.profileUrl ?? ""),
                                  ),
                                  // 10.widthBox,
                                  SizedBox(width: 10),

                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [],
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
                                    label: const Text(
                                      "Edit Profile",
                                      // style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                "About",
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              // 10.heightBox,
                              SizedBox(height: 10),

                              Text(
                                userData.bio ?? "",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              // 20.heightBox,
                              SizedBox(height: 20),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ProfileInputCard(title: "Role", value: userData.role.value),
                                  ProfileInputCard(title: "Body Type", value: userData.bodyType.value),
                                  ProfileInputCard(title: "Ethnicity", value: userData.ethnicity.value),
                                  ProfileInputCard(
                                      title: "Relationship Status", value: userData.relationshipStatus.value),
                                  ProfileInputCard(title: "Looking for", value: userData.lookingFor.value),
                                  ProfileInputCard(title: "Where to meet", value: userData.whereToMeet.value),
                                  ProfileInputCard(title: "Height", value: userData.height ?? "Do not Show"),
                                  ProfileInputCard(title: "Weight", value: userData.weight ?? "Do not Show"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
