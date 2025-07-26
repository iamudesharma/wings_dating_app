import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart' as firebase_database;
// import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/providers/profile_providers.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../helpers/responsive_layout.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'other_user_profile_view.g.dart';

@riverpod
class Fav extends _$Fav {
  Future<void> addUserToFavorite(String id) async {
    await ref.read(profileRepoProvider).addUserToFavorite(id);
    // Refresh state to reflect the addition
    state = AsyncValue.data(true);
  }

  Future<void> removeUserFromFavorite(String id) async {
    await ref.read(profileRepoProvider).removeUserFromFavorite(id);
    // Refresh state to reflect the removal
    state = AsyncValue.data(false);
  }

  @override
  Future<bool> build(String id) async {
    return await isUserFavorite(id);
  }
}

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
  bool hasTapped = false;
  String tapError = '';

  @override
  void initState() {
    super.initState();
    print('DEBUG: OtherUserProfileView initState called for user ID: ${widget.id}');
    Future.delayed(Duration.zero, () async {
      print('DEBUG: Starting async operations in initState');
      // Record profile visit first, which might give us the tap status
      await _recordProfileVisit();
      // Then check tap status as fallback if not already set
      await _checkTapStatus();
    });
  }

  Future<void> _recordProfileVisit() async {
    print('DEBUG: _recordProfileVisit called - UPDATED');
    final currentUser = ref.read(ProfileController.userControllerProvider).userModel;
    final viewedUserId = widget.id;

    print('DEBUG: Current user: ${currentUser?.id}, Viewed user: $viewedUserId');

    if (currentUser == null) {
      print('DEBUG: No current user - skipping visit recording');
      return;
    }

    if (viewedUserId == null) {
      print('DEBUG: No viewed user ID - skipping visit recording');
      return;
    }

    if (currentUser.id == viewedUserId) {
      print('DEBUG: Self-visit detected - skipping visit recording');
      return;
    }

    try {
      print('DEBUG: Recording profile visit - Viewer: ${currentUser.id}, Viewed: $viewedUserId');
      final result = await ref.read(profileRepoProvider).visitProfile(viewedUserId);
      print('DEBUG: Profile visit recorded successfully: ${result.toString()}');

      // Check if the response includes engagement status
      if (result.engagementStatus != null) {
        final engagementStatus = result.engagementStatus!;
        print('DEBUG: Found engagement status in visit response: ${engagementStatus.toString()}');

        setState(() {
          hasTapped = engagementStatus.hasTapped;
        });
        print('DEBUG: Updated hasTapped from visit response: $hasTapped');
      }
    } catch (e) {
      print('DEBUG: Error recording profile visit: $e');
    }
  }

  Future<void> _checkTapStatus() async {
    print('DEBUG: _checkTapStatus called - UPDATED');
    final currentUser = ref.read(ProfileController.userControllerProvider).userModel;
    final viewedUserId = widget.id;
    if (currentUser == null || viewedUserId == null) return;

    // Only check tap status if we haven't already got it from the profile visit
    if (hasTapped) {
      print('DEBUG: Tap status already known from profile visit');
      return;
    }

    try {
      // Fallback: Fetch tap stats for the viewed user
      final tapStats = await ref.read(profileRepoProvider).getUserTapStats(viewedUserId);
      print("DEBUG: Fallback tap stats: $tapStats");

      // Check both new format (engagementStatus) and old format (tappedBy array)
      bool tapStatus = false;

      if (tapStats.engagementStatus != null) {
        tapStatus = tapStats.engagementStatus!.hasTapped;
        print('DEBUG: Got tap status from new format: $tapStatus');
      } else if (tapStats.tappedBy.contains(currentUser.id)) {
        // Fallback to old format
        tapStatus = true;
        print('DEBUG: Got tap status from old format: $tapStatus');
      }

      setState(() {
        hasTapped = tapStatus;
      });
    } catch (e) {
      print('DEBUG: Error checking tap status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logEvent(
      name: 'user_profile_view',
      parameters: <String, Object>{
        'user_id': widget.id as Object,
      },
    );
    final currentUser = ref.watch(ProfileController.userControllerProvider).userModel;
    final otherUser = ref.watch(getUserByIdProvider(widget.id!));
    final refData = firebase_database.FirebaseDatabase.instance.ref('status/${widget.id}');

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isDesktop = sizingInformation.isDesktop;
        final isTablet = sizingInformation.isTablet;
        final double maxWidth = isDesktop
            ? 700
            : isTablet
                ? 550
                : double.infinity;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.router.maybePop(),
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  Expanded(
                    child: otherUser.when(
                      data: (userData) =>
                          Text(userData?.username ?? "Profile", style: Theme.of(context).textTheme.titleLarge),
                      loading: () => const Text("Profile"),
                      error: (_, __) => const Text("Profile"),
                    ),
                  ),
                  otherUser.when(
                    data: (userData) => PopupMenuButton<int>(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () => context.router.maybePop(),
                          value: 1,
                          child: const Row(
                            children: [Icon(Icons.block), SizedBox(width: 10), Text("Block")],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: [Icon(Icons.chrome_reader_mode), SizedBox(width: 10), Text("About")],
                          ),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.surface,
                      elevation: 2,
                    ),
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: otherUser.when(
                loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                error: (error, stackTrace) => (error is Exception)
                    ? const Center(child: Text("User not found"))
                    : const Center(child: Text("Something went wrong")),
                data: (userData) {
                  if (userData == null) {
                    return const Center(child: Text("User not found"));
                  }
                  if (kIsWeb) {
                    MetaSEO meta = MetaSEO();
                    meta.author(author: userData.username);
                    meta.description(description: userData.bio ?? "No Bio");
                    meta.keywords(keywords: userData.bodyType.value);
                    meta.ogImage(ogImage: userData.profileUrl ?? "https://img.icons8.com/ios/500/null.png");
                  }
                  return ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: isDesktop
                          ? 32
                          : isTablet
                              ? 24
                              : 16,
                      horizontal: isDesktop
                          ? 32
                          : isTablet
                              ? 24
                              : 8,
                    ),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 24,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.background,
                                  width: 6,
                                ),
                              ),
                              child: ClipOval(
                                child: (userData.profileUrl != null && userData.profileUrl!.isNotEmpty)
                                    ? CachedNetworkImage(
                                        imageUrl: userData.profileUrl!,
                                        width: 140,
                                        height: 140,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Container(
                                          width: 140,
                                          height: 140,
                                          color: Theme.of(context).colorScheme.surfaceVariant,
                                          child: Icon(Icons.person,
                                              size: 60,
                                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          width: 140,
                                          height: 140,
                                          color: Theme.of(context).colorScheme.surfaceVariant,
                                          child: Icon(Icons.person,
                                              size: 60,
                                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                                        ),
                                      )
                                    : Container(
                                        width: 140,
                                        height: 140,
                                        color: Theme.of(context).colorScheme.surfaceVariant,
                                        child: Icon(Icons.person,
                                            size: 60, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Consumer(builder: (context, ref, child) {
                            final isFav = ref.watch(favProvider(widget.id!));
                            return isFav.when(
                                error: (_, __) => const SizedBox(),
                                loading: () => const SizedBox(),
                                data: (value) => Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(30),
                                        onTap: () async {
                                          final favNotifier = ref.read(favProvider(widget.id!).notifier);
                                          if (value) {
                                            await favNotifier.removeUserFromFavorite(widget.id!);
                                          } else {
                                            await favNotifier.addUserToFavorite(widget.id!);
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 300),
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: value
                                                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                                                : Theme.of(context).colorScheme.surfaceVariant,
                                            borderRadius: BorderRadius.circular(30),
                                            border: Border.all(
                                              color: value
                                                  ? Theme.of(context).colorScheme.primary
                                                  : Theme.of(context).colorScheme.outline,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                value ? Icons.favorite : Icons.favorite_border,
                                                color: value
                                                    ? Theme.of(context).colorScheme.primary
                                                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                value ? 'Favorited' : 'Favorite',
                                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                                      color: value
                                                          ? Theme.of(context).colorScheme.primary
                                                          : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          }),
                          const SizedBox(height: 24),
                          Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StreamBuilder<firebase_database.DatabaseEvent>(
                                    stream: refData.onValue,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        bool isOnline = false;
                                        Timestamp? lastSeen;
                                        if (snapshot.data!.snapshot.value != null) {
                                          final data = snapshot.data!.snapshot.value as Map;
                                          isOnline = data['isOnline'];
                                          lastSeen = data['lastSeen'] != null
                                              ? Timestamp.fromMillisecondsSinceEpoch(data['lastSeen'])
                                              : null;
                                        } else {
                                          isOnline = false;
                                        }
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 7,
                                              backgroundColor: isOnline ? Colors.green : Colors.amber,
                                            ),
                                            const SizedBox(width: 8),
                                            isOnline == false && lastSeen != null
                                                ? Text(
                                                    "Last seen: ${timeago.format(DateTime.fromMillisecondsSinceEpoch(lastSeen.millisecondsSinceEpoch))}",
                                                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                                                  )
                                                : Text(
                                                    isOnline ? "Online" : "Offline",
                                                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                                                  ),
                                          ],
                                        );
                                      }
                                      return const SizedBox(height: 20);
                                    },
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    "About",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    userData.bio ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 24),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary.withOpacity(0.07),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _profileDetailRow(Icons.person, "Role", userData.role.value),
                                        _profileDetailRow(
                                            Icons.accessibility_new, "Body Type", userData.bodyType.value),
                                        _profileDetailRow(Icons.people, "Ethnicity", userData.ethnicity.value),
                                        _profileDetailRow(
                                            Icons.favorite, "Relationship Status", userData.relationshipStatus.value),
                                        _profileDetailRow(Icons.search, "Looking for", userData.lookingFor.value),
                                        _profileDetailRow(Icons.place, "Where to meet", userData.whereToMeet.value),
                                        _profileDetailRow(Icons.height, "Height", userData.height ?? "Do not Show"),
                                        _profileDetailRow(
                                            Icons.monitor_weight, "Weight", userData.weight ?? "Do not Show"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: otherUser.when(
              data: (userData) => Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(
                        Icons.whatshot,
                        color: hasTapped
                            ? Colors.red // or Colors.yellow for fire effect
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                      label: Text(
                        hasTapped ? "Tapped" : "Tap",
                        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      onPressed: hasTapped
                          ? null
                          : () async {
                              try {
                                final tapResponse = await ref.read(profileRepoProvider).sendTap(userData!.id);
                                setState(() {
                                  hasTapped = true;
                                  tapError = '';
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(tapResponse.message)),
                                );
                              } catch (e) {
                                if (e.toString().contains('already tapped')) {
                                  setState(() {
                                    hasTapped = true;
                                    tapError = 'You have already tapped this user today';
                                  });
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Failed to send tap: ${e.toString()}')),
                                );
                              }
                            },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(Icons.chat_bubble, color: Theme.of(context).colorScheme.onPrimary),
                      label: (currentUser != null && userData != null && currentUser.blockList.contains(userData.id))
                          ? Text("Unblock", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary))
                          : Text("Message", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                      onPressed: () async {
                        // Todo: create chat one to one chat
                      },
                    ),
                  ),
                ],
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }

  Widget _profileDetailRow(IconData icon, String title, String? value) {
    if (value == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
          const SizedBox(width: 12),
          Text(
            title + ':',
            style: TextStyle(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7), fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
