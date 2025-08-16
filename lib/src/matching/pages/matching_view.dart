import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/src/matching/providers/matching_providers.dart';
import 'package:wings_dating_app/src/users/users_view.dart'
    show NavigationBarWidget;
import 'package:wings_dating_app/src/users/widget/user_grid_item.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

@RoutePage()
class MatchingView extends ConsumerStatefulWidget {
  const MatchingView({super.key});

  @override
  ConsumerState<MatchingView> createState() => _MatchingViewState();
}

class _MatchingViewState extends ConsumerState<MatchingView> {
  GeoPoint? _currentUserGeoPoint() {
    final userData =
        ref.read(ProfileController.userControllerProvider).userModel;
    final coords = userData?.position?.geopoint;
    if (coords != null && coords.length >= 2) {
      // GeoPoint expects (lat, lon) while stored order is [lon, lat]
      return GeoPoint(coords[1], coords[0]);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final discovery = ref.watch(discoveryControllerProvider);
    final countdown = ref.watch(discoveryCountdownProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AppBar(
                  title: const Text("Matching"),
                  actions: [
                    discovery.when(
                      data: (data) => Tooltip(
                        message: data.isCooldown
                            ? _cooldownTooltip(countdown.value ??
                                data.nextAvailableAt.difference(DateTime.now()))
                            : 'Refresh matches',
                        child: IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: data.isCooldown
                                ? theme.colorScheme.onSurface.withOpacity(0.4)
                                : theme.colorScheme.primary,
                          ),
                          onPressed: data.isCooldown
                              ? null
                              : () async {
                                  await ref
                                      .read(
                                          discoveryControllerProvider.notifier)
                                      .refreshIfAllowed();
                                },
                        ),
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => ref
                            .read(discoveryControllerProvider.notifier)
                            .refreshIfAllowed(),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    // Include the NavigationRail/Bar for consistent layout
                    NavigationBarWidget(
                      sizingInformation: sizingInformation,
                    ),
                    Expanded(
                      flex: 5,
                      child: discovery.when(
                        loading: () => const Center(
                            child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: CircularProgressIndicator.adaptive(),
                        )),
                        error: (err, st) => _ErrorCard(
                          message: 'Failed to load matches',
                          onRetry: () => ref
                              .read(discoveryControllerProvider.notifier)
                              .refreshIfAllowed(),
                        ),
                        data: (data) {
                          if (data.users.isEmpty) {
                            return _EmptyCard(
                              isCooldown: data.isCooldown,
                              nextAt: data.nextAvailableAt,
                              onRefresh: () => ref
                                  .read(discoveryControllerProvider.notifier)
                                  .refreshIfAllowed(),
                              remaining: countdown.value,
                            );
                          }

                          // Grid of up to 3 users
                          final currentGeo = _currentUserGeoPoint();
                          final crossAxisCount = sizingInformation.isDesktop
                              ? 4
                              : sizingInformation.isTablet
                                  ? 3
                                  : 2;
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (data.isCooldown)
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      margin: const EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.surface,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        _cooldownTooltip(countdown.value ??
                                            data.nextAvailableAt
                                                .difference(DateTime.now())),
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 0.75,
                                  ),
                                  itemCount: data.users.length > 3
                                      ? 3
                                      : data.users.length,
                                  itemBuilder: (context, index) {
                                    final user = data.users[index];
                                    return UserGridItem(
                                      users: user,
                                      isCurrentUser: false,
                                      userCoordinates: currentGeo,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _cooldownTooltip(Duration remaining) {
    if (remaining.isNegative || remaining == Duration.zero)
      return 'Refresh matches';
    final hours = remaining.inHours;
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds.remainder(60);
    if (hours > 0) {
      return 'Profiles refresh in ${hours}h ${minutes}m ${seconds}s';
    }
    return 'Profiles refresh in ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

class _EmptyCard extends StatelessWidget {
  final bool isCooldown;
  final DateTime nextAt;
  final VoidCallback onRefresh;
  final Duration? remaining;
  const _EmptyCard(
      {required this.isCooldown,
      required this.nextAt,
      required this.onRefresh,
      this.remaining});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.people, size: 48, color: theme.colorScheme.primary),
            const SizedBox(height: 12),
            Text('No matches right now',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(
              isCooldown
                  ? 'Please wait until new matches are available.'
                  : 'Tap refresh to discover new profiles.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(isCooldown
                  ? _cooldownDurationText(
                      remaining ?? nextAt.difference(DateTime.now()))
                  : 'Refresh'),
              onPressed: isCooldown ? null : onRefresh,
            ),
          ],
        ),
      ),
    );
  }

  static String _cooldownDurationText(Duration remaining) {
    if (remaining.isNegative || remaining == Duration.zero) return 'Refresh';
    final hours = remaining.inHours;
    final minutes = remaining.inMinutes % 60;
    final seconds = remaining.inSeconds % 60;
    if (hours > 0) return 'Try again in ${hours}h ${minutes}m';
    return 'Try again in ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

class _ErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorCard({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 12),
            Text(message, style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
