import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/matching/controller/swipe_deck_controller.dart';
import 'package:wings_dating_app/src/users/widget/user_grid_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

@RoutePage()
class SwipeDeckView extends ConsumerWidget {
  const SwipeDeckView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deck = ref.watch(swipeDeckControllerProvider);
    final currentGeo = _currentUserGeoPoint(ref);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            tooltip: 'Top Picks',
            onPressed: () => ref.read(swipeDeckControllerProvider.notifier).refreshTopPicks(),
          ),
        ],
      ),
      body: deck.when(
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (e, st) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline),
              const SizedBox(height: 8),
              Text('Failed to load. Tap to retry'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.refresh(swipeDeckControllerProvider.future),
                child: const Text('Retry'),
              )
            ],
          ),
        ),
        data: (s) {
          if (s.candidates.isEmpty) {
            return _EmptyDeck(onRefresh: () => ref.refresh(swipeDeckControllerProvider.future));
          }
          final top = s.candidates.first;
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    children: [
                      // Simple single-card view using UserGridItem for now
                      UserGridItem(
                        users: top.user,
                        isCurrentUser: false,
                        userCoordinates: currentGeo,
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Chip(
                          label: Text('Compatibility ${top.compatibility.toStringAsFixed(0)}%'),
                          avatar: const Icon(Icons.favorite_outline, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay),
                      onPressed: s.canRewind ? () => ref.read(swipeDeckControllerProvider.notifier).rewind() : null,
                      tooltip: 'Rewind',
                    ),
                    FilledButton.icon(
                      onPressed: () => ref.read(swipeDeckControllerProvider.notifier).pass(),
                      icon: const Icon(Icons.close),
                      label: const Text('Pass'),
                    ),
                    FilledButton.icon(
                      onPressed: () => ref.read(swipeDeckControllerProvider.notifier).like(),
                      icon: const Icon(Icons.favorite),
                      label: const Text('Like'),
                    ),
                    FilledButton.icon(
                      onPressed: s.superLikesRemaining > 0
                          ? () => ref.read(swipeDeckControllerProvider.notifier).superLike()
                          : null,
                      icon: const Icon(Icons.star),
                      label: Text('Super like (${s.superLikesRemaining})'),
                    ),
                  ],
                ),
              ),
              if (s.limitReached)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text('Daily swipe limit reached. Upgrade to continue.'),
                ),
            ],
          );
        },
      ),
    );
  }

  GeoPoint? _currentUserGeoPoint(WidgetRef ref) {
    final userData = ref.read(ProfileController.userControllerProvider).userModel;
    final coords = userData?.position?.geopoint;
    if (coords != null && coords.length >= 2) {
      return GeoPoint(coords[1], coords[0]);
    }
    return null;
  }
}

class _EmptyDeck extends StatelessWidget {
  final VoidCallback onRefresh;
  const _EmptyDeck({required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.auto_awesome_outlined, size: 48),
          const SizedBox(height: 8),
          const Text('No more profiles. Check back later or adjust filters.'),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
          ),
        ],
      ),
    );
  }
}
