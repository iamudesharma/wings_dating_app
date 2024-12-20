import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

class UserGridItem extends ConsumerStatefulWidget {
  const UserGridItem({super.key, required this.users, this.isCurrentUser = false, this.onTapEditProfile});

  final UserModel users;

  final bool? isCurrentUser;

  final VoidCallback? onTapEditProfile;

  @override
  ConsumerState<UserGridItem> createState() => _UserGridItemState();
}

class _UserGridItemState extends ConsumerState<UserGridItem> {
  @override
  Widget build(BuildContext context) {
    // final userActive = ref.watch(userLastActiveProvider(widget.users.cubeUser.id!));

    return InkWell(
      onTap: () {
        if (widget.isCurrentUser!) {
          AutoTabsRouter.of(context).setActiveIndex(2);
        } else {
          AutoRouter.of(context).push(
            OtherUserProfileRoute(
              id: widget.users.id,
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                widget.users.profileUrl ?? "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).primaryColor.withOpacity(0.6),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  ref.read(ProfileController.userControllerProvider).getDistance(
                        GeoPoint(
                          widget.users.position!.geopoint.latitude,
                          widget.users.position!.geopoint.longitude,
                        ),
                      ),
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                widget.isCurrentUser!
                    ? InkWell(onTap: widget.onTapEditProfile, child: const Icon(Icons.edit))
                    : Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: widget.users.isOnline ? Colors.green : Colors.amber,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text(
                        widget.users.username,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      widget.users.age.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.users.height == null
                        ? const SizedBox.shrink()
                        : Text(
                            widget.users.height!,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                    widget.users.weight == null
                        ? const SizedBox.shrink()
                        : Text(
                            widget.users.weight!,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                    // if (!widget.isCurrentUser!)
                    // userActive.when(
                    //   data: (value) {
                    //     return Text(
                    //       DateTime.fromMillisecondsSinceEpoch(value).day.toString(),
                    //       style: const TextStyle(
                    //         fontSize: 10,
                    //       ),
                    //     );
                    //   },
                    //   loading: () => const SizedBox.shrink(),
                    //   error: (error, stack) {
                    //     // print(error);
                    //     return const SizedBox.shrink();
                    //   },
                    // )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

formatedTime({required int timeInSecond}) {
  int sec = timeInSecond % 60;
  int min = (timeInSecond / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute : $second";
}
