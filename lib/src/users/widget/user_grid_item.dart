import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class UserGridItem extends ConsumerStatefulWidget {
  const UserGridItem(
      {super.key, required this.users, this.isCurrentUser = false, this.onTapEditProfile, this.userCoordinates});

  final UserModel users;

  final bool? isCurrentUser;

  final VoidCallback? onTapEditProfile;
  final GeoPoint? userCoordinates;

  @override
  ConsumerState<UserGridItem> createState() => _UserGridItemState();
}

class _UserGridItemState extends ConsumerState<UserGridItem> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference refData = FirebaseDatabase.instance.ref('status/${widget.users.id}');
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        FirebaseAnalytics.instance.logEvent(
          name: 'user_grid_item_tapped',
          parameters: <String, Object>{
            'user_id': widget.users.id as Object,
          },
        );
        if (widget.isCurrentUser!) {
          AutoTabsRouter.of(context).setActiveIndex(3);
        } else {
          print('DEBUG: Navigating to OtherUserProfileView for user: ${widget.users.id}');
          AutoRouter.of(context).push(
            OtherUserProfileRoute(
              id: widget.users.id,
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.surface.withOpacity(0.85),
              theme.colorScheme.primary.withOpacity(0.10),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Profile image
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: widget.users.profileUrl ?? "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.18),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            // Glassmorphism overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white.withOpacity(0.10),
                  // Optionally add blur effect if desired
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Online status and edit button
                  Row(
                    children: [
                      StreamBuilder<DatabaseEvent>(
                        stream: refData.onValue,
                        builder: (context, snapshot) {
                          bool isOnline = false;
                          if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
                            final data = snapshot.data!.snapshot.value as Map;
                            isOnline = data['isOnline'] ?? false;
                          }
                          return Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              color: isOnline ? Colors.greenAccent : Colors.amber,
                              boxShadow: [
                                if (isOnline)
                                  BoxShadow(
                                    color: Colors.greenAccent.withOpacity(0.5),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      if (widget.isCurrentUser!)
                        InkWell(
                          onTap: widget.onTapEditProfile,
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.edit, size: 18, color: theme.colorScheme.primary),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Circular profile image
                  // CircleAvatar(
                  //   radius: 32,
                  //   backgroundColor: Colors.white,
                  //   child: CircleAvatar(
                  //     radius: 29,
                  //     backgroundImage: CachedNetworkImageProvider(
                  //       widget.users.profileUrl ?? "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  // Username and age
                  Text(
                    widget.users.username,
                    maxLines: 1,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${widget.users.age} years",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Height and weight with icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.users.height != null)
                        Row(
                          children: [
                            Icon(Icons.height, size: 16, color: Colors.white70),
                            const SizedBox(width: 4),
                            Text(
                              widget.users.height!,
                              style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      if (widget.users.height != null && widget.users.weight != null) const SizedBox(width: 12),
                      if (widget.users.weight != null)
                        Row(
                          children: [
                            Icon(Icons.monitor_weight, size: 16, color: Colors.white70),
                            const SizedBox(width: 4),
                            Text(
                              widget.users.weight!,
                              style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const Spacer(),
                  // Distance (if available)
                  if (widget.users.position != null && widget.userCoordinates != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text(
                          ref.read(ProfileController.userControllerProvider).getDistance(
                                GeoPoint(
                                  widget.users.position!.geopoint[1],
                                  widget.users.position!.geopoint[0],
                                ),
                                userCoordinates: widget.userCoordinates,
                              ),
                          style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  // Optionally, add a favorite/like button here for more interactivity
                ],
              ),
            ),
          ],
        ),
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
