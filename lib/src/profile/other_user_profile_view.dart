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
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/ai_wingman/providers/profile_analysis_provider.dart';
import 'package:wings_dating_app/repo/albums_repo.dart';
import 'package:wings_dating_app/src/album/controller/album_controller.dart';

import '../../helpers/responsive_layout.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'other_user_profile_view.g.dart';

typedef AlbumAccessStateRecord = ({String? albumId, bool hasAlbum, bool canView, bool pending, bool isOwner});

final albumAccessStateProvider =
    FutureProvider.autoDispose.family<AlbumAccessStateRecord, String>((ref, otherUserId) async {
  final viewerId = ref.read(ProfileController.userControllerProvider).userModel?.id;
  if (viewerId == null) {
    return (albumId: null, hasAlbum: false, canView: false, pending: false, isOwner: false);
  }
  final repo = ref.read(albumsRepoProvider);
  final state = await repo.getAlbumAccessState(ownerId: otherUserId, viewerId: viewerId);
  return (
    albumId: state.albumId,
    hasAlbum: state.hasAlbum,
    canView: state.canView,
    pending: state.pending,
    isOwner: state.isOwner,
  );
});

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

class _NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    // Disable material scrollbars on all platforms
    return child;
  }

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    // Disable the glow effect
    return child;
  }
}

class _OtherUserProfileViewState extends ConsumerState<OtherUserProfileView> {
  bool hasTapped = false;
  String tapError = '';

  Future<void> _openAlbumRequestSelector(BuildContext context, String ownerId) async {
    final repo = ref.read(albumsRepoProvider);
    final viewerId = ref.read(ProfileController.userControllerProvider).userModel?.id;
    if (viewerId == null) return;

    // Fetch owner's albums
    final albums = await repo.getAllAlbums(id: ownerId);
    if (albums.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No albums to request')));
      return;
    }

    // Precompute per-album pending flags (sequential to keep it simple)
    final Map<String, bool> pendingMap = {};
    for (final a in albums) {
      if (a.id == null) continue;
      try {
        final p = await ref.read(albumsRepoProvider).getPendingRequestForAlbum(albumId: a.id!);
        pendingMap[a.id!] = p != null;
      } catch (_) {
        pendingMap[a.id!] = false;
      }
    }

    String? selectedAlbumId;
    final messageController = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setState) {
          return AlertDialog(
            title: const Text('Request album access'),
            content: SizedBox(
              width: 420,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 320,
                    child: ListView.separated(
                      shrinkWrap: false,
                      primary: false,
                      itemCount: albums.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (_, i) {
                        final a = albums[i];
                        final id = a.id ?? '${a.name}-$i';
                        final canView = a.sharedWith.contains(viewerId);
                        final isPending = pendingMap[id] == true;
                        return RadioListTile<String>(
                          value: id,
                          groupValue: selectedAlbumId,
                          onChanged: (canView || isPending) ? null : (v) => setState(() => selectedAlbumId = v),
                          title: Text(a.name, overflow: TextOverflow.ellipsis),
                          subtitle: canView
                              ? const Text('Shared with you', style: TextStyle(color: Colors.green))
                              : isPending
                                  ? const Text('Request pending', style: TextStyle(color: Colors.orange))
                                  : null,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: messageController,
                    decoration: const InputDecoration(hintText: 'Add a message (optional)'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
              ElevatedButton(
                onPressed: selectedAlbumId == null
                    ? null
                    : () async {
                        final id = selectedAlbumId!;
                        final target = albums.firstWhere((a) => (a.id ?? '') == id, orElse: () => albums.first);
                        final albumId = target.id!; // safe, owner albums should have id
                        final res = await ref.read(AlbumControllerProvider(albumId).notifier).requestAccess(
                              messageController.text.trim(),
                              albumId: albumId,
                            );
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(res != null ? 'Request sent' : 'Failed to send request')),
                          );
                          if (res != null) {
                            // Refresh access state so the CTA reflects 'Requested'
                            ref.invalidate(albumAccessStateProvider(ownerId));
                          }
                        }
                        if (context.mounted) Navigator.pop(ctx);
                      },
                child: const Text('Send Request'),
              ),
            ],
          );
        });
      },
    );
  }

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
        final bool isWide = isDesktop || isTablet;
        final double maxWidth = isDesktop
            ? 980
            : isTablet
                ? 720
                : double.infinity;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.08),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.08),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.router.maybePop(),
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  Expanded(
                    child: otherUser.when(
                      data: (userData) => Text(
                        userData?.username ?? "Profile",
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      loading: () => const Text("Profile"),
                      error: (_, __) => const Text("Profile"),
                    ),
                  ),
                  // AI Chat Analysis Button
                  otherUser.when(
                    data: (userData) => userData != null
                        ? IconButton(
                            icon: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(context).colorScheme.secondary,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.psychology,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            tooltip: "Get AI Dating Analysis",
                            onPressed: () async {
                              // Set the profile data for analysis
                              triggerProfileAnalysis(ref, userData);

                              // Navigate directly to the standalone AI Analysis screen
                              context.router.push(AIAnalysisRoute());
                            },
                          )
                        : const SizedBox.shrink(),
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
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

                  return ScrollConfiguration(
                    behavior: _NoScrollbarBehavior(),
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        vertical: isDesktop
                            ? 32
                            : isTablet
                                ? 24
                                : 16,
                        horizontal: isDesktop
                            ? 24
                            : isTablet
                                ? 16
                                : 12,
                      ),
                      children: [
                        // Modern profile header
                        _buildProfileHeader(context, userData, refData, isWide),
                        const SizedBox(height: 16),

                        // About section
                        _buildSectionCard(
                          context,
                          title: 'About',
                          child: Text(
                            userData.bio?.trim().isNotEmpty == true ? userData.bio!.trim() : 'No bio provided',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Details grid
                        _buildDetailsGrid(context, userData, isWide),
                      ],
                    ),
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
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(
                        Icons.whatshot,
                        color: hasTapped ? Colors.red : Theme.of(context).colorScheme.onPrimary,
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
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
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

  Widget _buildProfileHeader(
      BuildContext context, dynamic userData, firebase_database.DatabaseReference refData, bool isWide) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.12),
            Theme.of(context).colorScheme.secondary.withOpacity(0.12),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAvatar(context, userData),
                const SizedBox(width: 20),
                Expanded(child: _buildHeaderInfo(context, userData, refData)),
                const SizedBox(width: 12),
                // Album access actions (wide layout)
                if (userData != null)
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 200, maxWidth: 260),
                    child: Consumer(
                      builder: (context, ref, _) {
                        final access = ref.watch(albumAccessStateProvider(userData.id));
                        return access.when(
                          loading: () => const Center(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                            ),
                          ),
                          error: (_, __) => const SizedBox.shrink(),
                          data: (state) {
                            // If current viewer is the owner, do not show request/view CTA here
                            if (state.isOwner) {
                              return const SizedBox.shrink();
                            }
                            if (!state.hasAlbum || state.albumId == null) {
                              return const SizedBox.shrink();
                            }
                            if (state.canView) {
                              return ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                icon: const Icon(Icons.photo_album),
                                label: const Text('View album'),
                                onPressed: () {
                                  context.router.push(AlbumDetailsRoute(id: state.albumId!));
                                },
                              );
                            }
                            if (state.pending) {
                              return OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                icon: const Icon(Icons.hourglass_top),
                                label: const Text('Requested'),
                                onPressed: null,
                              );
                            }
                            return ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              icon: const Icon(Icons.lock_open),
                              label: const Text('Request album'),
                              onPressed: () async {
                                await _openAlbumRequestSelector(context, userData.id);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAvatar(context, userData),
                const SizedBox(height: 16),
                _buildHeaderInfo(context, userData, refData),
                const SizedBox(height: 12),
                if (userData != null)
                  Consumer(
                    builder: (context, ref, _) {
                      final access = ref.watch(albumAccessStateProvider(userData.id));
                      return access.when(
                        loading: () => const Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                          ),
                        ),
                        error: (_, __) => const SizedBox.shrink(),
                        data: (state) {
                          if (state.isOwner) {
                            return const SizedBox.shrink();
                          }
                          if (!state.hasAlbum || state.albumId == null) {
                            return const SizedBox.shrink();
                          }
                          if (state.canView) {
                            return ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.secondary,
                                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              icon: const Icon(Icons.photo_album),
                              label: const Text('View album'),
                              onPressed: () {
                                context.router.push(AlbumDetailsRoute(id: state.albumId!));
                              },
                            );
                          }
                          if (state.pending) {
                            return OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              icon: const Icon(Icons.hourglass_top),
                              label: const Text('Requested'),
                              onPressed: null,
                            );
                          }
                          // Default: allow user to request access
                          return ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              foregroundColor: Theme.of(context).colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            icon: const Icon(Icons.lock_open),
                            label: const Text('Request album'),
                            onPressed: () async {
                              await _openAlbumRequestSelector(context, userData.id);
                            },
                          );
                        },
                      );
                    },
                  ),
              ],
            ),
    );
  }

  Widget _buildAvatar(BuildContext context, dynamic userData) {
    return Container(
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
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              )
            : Container(
                width: 120,
                height: 120,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Icon(Icons.person, size: 60, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
              ),
      ),
    );
  }

  Widget _buildHeaderInfo(BuildContext context, dynamic userData, firebase_database.DatabaseReference refData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                userData.username ?? 'Profile',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _buildFavoriteButton(context, userData),
          ],
        ),
        const SizedBox(height: 6),
        // Online badge
        StreamBuilder<firebase_database.DatabaseEvent>(
          stream: refData.onValue,
          builder: (context, snapshot) {
            bool isOnline = false;
            Timestamp? lastSeen;
            if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
              final data = snapshot.data!.snapshot.value as Map;
              isOnline = data['isOnline'] == true;
              lastSeen = data['lastSeen'] != null ? Timestamp.fromMillisecondsSinceEpoch(data['lastSeen']) : null;
            }
            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isOnline ? Colors.green.withOpacity(0.15) : Colors.amber.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isOnline ? Colors.greenAccent : Colors.amberAccent,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: isOnline ? Colors.greenAccent : Colors.amberAccent,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isOnline
                            ? 'Online'
                            : lastSeen != null
                                ? 'Last seen: '
                                    '${timeago.format(DateTime.fromMillisecondsSinceEpoch(lastSeen.millisecondsSinceEpoch))}'
                                : 'Offline',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        // Chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildChip(context, Icons.person, userData.role.value),
            _buildChip(context, Icons.favorite, userData.relationshipStatus.value),
            _buildChip(context, Icons.search, userData.lookingFor.value),
            _buildChip(context, Icons.place, userData.whereToMeet.value),
          ],
        ),
      ],
    );
  }

  Widget _buildFavoriteButton(BuildContext context, dynamic userData) {
    return Consumer(builder: (context, ref, child) {
      final isFav = ref.watch(favProvider(widget.id!));
      return isFav.when(
        error: (_, __) => const SizedBox(),
        loading: () => const SizedBox(),
        data: (value) => Tooltip(
          message: value ? 'Favorited' : 'Favorite',
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: value
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.12)
                    : Theme.of(context).colorScheme.surface.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: value ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outlineVariant,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    value ? Icons.favorite : Icons.favorite_border,
                    color: value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    size: 18,
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
        ),
      );
    });
  }

  Widget _buildChip(BuildContext context, IconData icon, String value) {
    if (value.isEmpty || value == 'Do not show' || value == 'Do not Show') return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, {required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildDetailsGrid(BuildContext context, dynamic userData, bool isWide) {
    final details = <(IconData, String, String)>[
      (Icons.person, 'Role', userData.role.value),
      (Icons.accessibility_new, 'Body Type', userData.bodyType.value),
      (Icons.people, 'Ethnicity', userData.ethnicity.value),
      (Icons.favorite, 'Relationship Status', userData.relationshipStatus.value),
      (Icons.search, 'Looking for', userData.lookingFor.value),
      (Icons.place, 'Where to meet', userData.whereToMeet.value),
      (Icons.height, 'Height', userData.height ?? 'Do not Show'),
      (Icons.monitor_weight, 'Weight', userData.weight ?? 'Do not Show'),
    ];

    final filtered = details.where((d) => d.$3.isNotEmpty && d.$3 != 'Do not show' && d.$3 != 'Do not Show').toList();

    return _buildSectionCard(
      context,
      title: 'Details',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = isWide ? 3 : 2;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 3.2,
            ),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final item = filtered[index];
              return _detailTile(context, item.$1, item.$2, item.$3);
            },
          );
        },
      ),
    );
  }

  Widget _detailTile(BuildContext context, IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.06),
            Theme.of(context).colorScheme.secondary.withOpacity(0.06),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
            ),
            child: Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center text vertically within tile
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
