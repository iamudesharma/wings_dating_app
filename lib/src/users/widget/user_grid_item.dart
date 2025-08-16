import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/users/providers/favorites_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class UserGridItem extends ConsumerStatefulWidget {
  const UserGridItem({
    super.key,
    required this.users,
    this.isCurrentUser = false,
    this.onTapEditProfile,
    this.userCoordinates,
  });

  final UserModel users;
  final bool? isCurrentUser;
  final VoidCallback? onTapEditProfile;
  final GeoPoint? userCoordinates;

  @override
  ConsumerState<UserGridItem> createState() => _UserGridItemState();
}

class _UserGridItemState extends ConsumerState<UserGridItem> {
  bool isProcessingFavorite = false;

  bool get isFavorited =>
      ref.watch(favoritesProvider).contains(widget.users.id);

  Future<void> _toggleFavorite() async {
    if (isProcessingFavorite) return;

    print('UserGridItem: Toggling favorite for user: ${widget.users.id}');
    print('UserGridItem: Current favorite status: $isFavorited');

    setState(() {
      isProcessingFavorite = true;
    });

    try {
      final success = await ref
          .read(favoritesProvider.notifier)
          .toggleFavorite(widget.users.id);

      if (success) {
        print('UserGridItem: Successfully toggled favorite');
      } else {
        print('UserGridItem: Failed to toggle favorite');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to update favorite. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      print('UserGridItem: Error toggling favorite: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update favorite. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isProcessingFavorite = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference refData =
        FirebaseDatabase.instance.ref('status/${widget.users.id}');
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
          print(
              'DEBUG: Navigating to OtherUserProfileView for user: ${widget.users.id}');
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
                  imageUrl: widget.users.profileUrl ??
                      "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.18),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            // Glassmorphism overlay with better gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.6),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: Online status, verified badge, and edit button
                  Row(
                    children: [
                      StreamBuilder<DatabaseEvent>(
                        stream: refData.onValue,
                        builder: (context, snapshot) {
                          bool isOnline = false;
                          if (snapshot.hasData &&
                              snapshot.data!.snapshot.value != null) {
                            final data = snapshot.data!.snapshot.value as Map;
                            isOnline = data['isOnline'] ?? false;
                          }
                          return Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              color:
                                  isOnline ? Colors.greenAccent : Colors.amber,
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
                      const SizedBox(width: 8),
                      if (widget.users.isVerified)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.verified,
                                  size: 12, color: Colors.white),
                              const SizedBox(width: 2),
                              Text(
                                'Verified',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (isFavorited && !widget.isCurrentUser!)
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.pink.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.favorite,
                                  size: 10, color: Colors.white),
                              const SizedBox(width: 2),
                              Text(
                                'Liked',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const Spacer(),
                      if (widget.isCurrentUser!)
                        InkWell(
                          onTap: widget.onTapEditProfile,
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child:
                                Icon(Icons.edit, size: 16, color: Colors.white),
                          ),
                        ),
                    ],
                  ),

                  const Spacer(),

                  // Main user info at bottom
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username and age with better styling
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.users.username,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (widget.users.age != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "${widget.users.age}",
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Bio preview (if available)
                      if (widget.users.bio != null &&
                          widget.users.bio!.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            widget.users.bio!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 11,
                            ),
                          ),
                        ),

                      const SizedBox(height: 8),

                      // Tags row with multiple info chips
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          // Distance chip
                          if (widget.users.position != null &&
                              widget.userCoordinates != null)
                            _buildInfoChip(
                              icon: Icons.location_on,
                              text: ref
                                  .read(
                                      ProfileController.userControllerProvider)
                                  .getDistance(
                                    GeoPoint(
                                      widget.users.position!.geopoint[1],
                                      widget.users.position!.geopoint[0],
                                    ),
                                    userCoordinates: widget.userCoordinates,
                                  ),
                              color: Colors.red.withOpacity(0.8),
                            ),

                          // Height chip
                          if (widget.users.height != null &&
                              widget.users.height!.isNotEmpty)
                            _buildInfoChip(
                              icon: Icons.height,
                              text: widget.users.height!,
                              color: Colors.purple.withOpacity(0.8),
                            ),

                          // Role chip
                          if (widget.users.role.name != 'doNotShow')
                            _buildInfoChip(
                              icon: Icons.work,
                              text: _formatEnumValue(widget.users.role.name),
                              color: Colors.orange.withOpacity(0.8),
                            ),

                          // Relationship status chip
                          if (widget.users.relationshipStatus.name !=
                              'doNotShow')
                            _buildInfoChip(
                              icon: Icons.favorite,
                              text: _formatEnumValue(
                                  widget.users.relationshipStatus.name),
                              color: Colors.pink.withOpacity(0.8),
                            ),

                          // Looking for chip
                          if (widget.users.lookingFor.name != 'doNotShow')
                            _buildInfoChip(
                              icon: Icons.search,
                              text: _formatEnumValue(
                                  widget.users.lookingFor.name),
                              color: Colors.green.withOpacity(0.8),
                            ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Interests tags (if available)
                      if (widget.users.interests.isNotEmpty)
                        Wrap(
                          spacing: 3,
                          runSpacing: 3,
                          children:
                              widget.users.interests.take(3).map((interest) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 0.5,
                                ),
                              ),
                              child: Text(
                                interest,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            // Like/Favorite button in bottom right (only for other users)
            if (!widget.isCurrentUser!)
              Positioned(
                bottom: 12,
                right: 12,
                child: InkWell(
                  onTap: isProcessingFavorite ? null : _toggleFavorite,
                  borderRadius: BorderRadius.circular(20),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isFavorited
                          ? Colors.red.withOpacity(0.9)
                          : Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: isFavorited
                          ? null
                          : Border.all(
                              color: Colors.white.withOpacity(0.6), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: isFavorited
                              ? Colors.red.withOpacity(0.3)
                              : Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: isProcessingFavorite
                        ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                isFavorited ? Colors.white : Colors.red,
                              ),
                            ),
                          )
                        : Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorited ? Colors.white : Colors.white,
                            size: 16,
                          ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: Colors.white),
          const SizedBox(width: 2),
          Text(
            text,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                ),
          ),
        ],
      ),
    );
  }

  String _formatEnumValue(String enumValue) {
    // Convert camelCase to readable format
    return enumValue
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}')
        .trim()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}

formatedTime({required int timeInSecond}) {
  int sec = timeInSecond % 60;
  int min = (timeInSecond / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute : $second";
}
