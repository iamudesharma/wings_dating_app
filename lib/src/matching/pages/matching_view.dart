import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/src/matching/pages/swipe_deck_view.dart';
import 'package:wings_dating_app/src/matching/providers/filters_provider.dart';
import 'package:wings_dating_app/src/matching/providers/matching_providers.dart';
import 'package:wings_dating_app/src/matching/providers/near_me_provider.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/users/users_view.dart';
// import 'package:wings_dating_app/src/users/users_view.dart' show NavigationBarWidget;
import 'package:wings_dating_app/src/users/widget/user_grid_item.dart';

@RoutePage()
class MatchingView extends ConsumerStatefulWidget {
  const MatchingView({super.key});

  @override
  ConsumerState<MatchingView> createState() => _MatchingViewState();
}

class _MatchingViewState extends ConsumerState<MatchingView> {
  GeoPoint? _currentUserGeoPoint() {
    final userData = ref.read(ProfileController.userControllerProvider).userModel;
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
    final filtersAsync = ref.watch(discoveryFiltersProvider);

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Matching'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Discover'),
                  Tab(text: 'Grid'),
                  Tab(text: 'Near me'),
                ],
              ),
              actions: [
                discovery.when(
                  data: (data) => Tooltip(
                    message: data.isCooldown
                        ? _cooldownTooltip(countdown.value ?? data.nextAvailableAt.difference(DateTime.now()))
                        : 'Refresh matches',
                    child: IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color:
                            data.isCooldown ? theme.colorScheme.onSurface.withOpacity(0.4) : theme.colorScheme.primary,
                      ),
                      onPressed: data.isCooldown
                          ? null
                          : () async {
                              await ref.read(discoveryControllerProvider.notifier).refreshIfAllowed();
                            },
                    ),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () => ref.read(discoveryControllerProvider.notifier).refreshIfAllowed(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.tune),
                  tooltip: 'Filters',
                  onPressed: () async {
                    final current = filtersAsync.valueOrNull?.current ?? const DiscoveryFilters();
                    final updated = await showModalBottomSheet<DiscoveryFilters>(
                      context: context,
                      isScrollControlled: true,
                      builder: (ctx) => _FiltersSheet(initial: current),
                    );
                    if (updated != null) {
                      ref.read(discoveryFiltersProvider.notifier).setFilters(updated);
                      await ref.read(discoveryControllerProvider.notifier).refreshIfAllowed();
                    }
                  },
                ),
              ],
            ),
            body: Row(
              children: [
                NavigationBarWidget(
                  sizingInformation: sizingInformation,
                ),
                Expanded(
                  flex: 5,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Discover: swipe deck
                      const SwipeDeckView(),
                      // Grid tab
                      Builder(
                        builder: (context) {
                          return discovery.when(
                            loading: () => const Center(
                              child: Padding(
                                padding: EdgeInsets.all(24.0),
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            ),
                            error: (err, st) => _ErrorCard(
                              message: 'Failed to load matches',
                              onRetry: () => ref.read(discoveryControllerProvider.notifier).refreshIfAllowed(),
                            ),
                            data: (data) {
                              if (data.users.isEmpty) {
                                return _EmptyCard(
                                  isCooldown: data.isCooldown,
                                  nextAt: data.nextAvailableAt,
                                  onRefresh: () => ref.read(discoveryControllerProvider.notifier).refreshIfAllowed(),
                                  remaining: countdown.value,
                                );
                              }
                              final currentGeo = _currentUserGeoPoint();
                              final crossAxisCount = sizingInformation.isDesktop
                                  ? 4
                                  : sizingInformation.isTablet
                                      ? 3
                                      : 2;
                              return GridView.builder(
                                padding: const EdgeInsets.all(12),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 0.75,
                                ),
                                itemCount: data.users.length > 3 ? 3 : data.users.length,
                                itemBuilder: (context, index) {
                                  final user = data.users[index];
                                  return UserGridItem(
                                    users: user,
                                    isCurrentUser: false,
                                    userCoordinates: currentGeo,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                      // Near me tab
                      Builder(builder: (context) {
                        final near = ref.watch(nearMeProvider);
                        return near.when(
                          loading: () => const Center(
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                          error: (err, st) => _ErrorCard(
                            message: 'Failed to load nearby users',
                            onRetry: () => ref.read(nearMeProvider.notifier).refresh(),
                          ),
                          data: (data) {
                            if (data.users.isEmpty) {
                              return Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.location_on_outlined, size: 48),
                                    const SizedBox(height: 8),
                                    const Text('No one nearby right now'),
                                    const SizedBox(height: 8),
                                    OutlinedButton.icon(
                                      icon: const Icon(Icons.refresh),
                                      label: const Text('Refresh'),
                                      onPressed: () => ref.read(nearMeProvider.notifier).refresh(),
                                    ),
                                  ],
                                ),
                              );
                            }
                            final currentGeo = _currentUserGeoPoint();
                            return GridView.builder(
                              padding: const EdgeInsets.all(12),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 0.75,
                              ),
                              itemCount: data.users.length,
                              itemBuilder: (ctx, i) {
                                final user = data.users[i];
                                return UserGridItem(
                                  users: user,
                                  isCurrentUser: false,
                                  userCoordinates: currentGeo,
                                );
                              },
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String _cooldownTooltip(Duration remaining) {
  if (remaining.isNegative || remaining == Duration.zero) return 'Refresh matches';
  final h = remaining.inHours;
  final m = remaining.inMinutes % 60;
  final s = remaining.inSeconds % 60;
  if (h > 0) return 'New matches in ${h}h ${m}m';
  return 'New matches in ${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
}

class _FiltersSheet extends ConsumerStatefulWidget {
  final DiscoveryFilters initial;
  const _FiltersSheet({required this.initial});

  @override
  ConsumerState<_FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends ConsumerState<_FiltersSheet> {
  late double distance;
  late RangeValues ages;
  bool hasPhotos = false;
  bool hasFace = false;
  bool hasAlbums = false;
  final interestsCtrl = TextEditingController();
  final positionCtrl = TextEditingController();
  final lastSeenCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    distance = widget.initial.distanceKm.toDouble();
    ages = RangeValues(widget.initial.minAge.toDouble(), widget.initial.maxAge.toDouble());
    hasPhotos = widget.initial.hasPhotos;
    hasFace = widget.initial.hasFacePics;
    hasAlbums = widget.initial.hasAlbums;
    interestsCtrl.text = widget.initial.interests.join(', ');
    positionCtrl.text = widget.initial.position ?? '';
    lastSeenCtrl.text = widget.initial.lastSeen ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Filters', style: theme.textTheme.titleLarge),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {
                      final f = DiscoveryFilters(
                        distanceKm: distance.toInt(),
                        minAge: ages.start.toInt(),
                        maxAge: ages.end.toInt(),
                        hasPhotos: hasPhotos,
                        hasFacePics: hasFace,
                        hasAlbums: hasAlbums,
                        interests:
                            interestsCtrl.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
                        position: positionCtrl.text.trim().isEmpty ? null : positionCtrl.text.trim(),
                        lastSeen: lastSeenCtrl.text.trim().isEmpty ? null : lastSeenCtrl.text.trim(),
                      );
                      ref.read(discoveryFiltersProvider.notifier).setFilters(f);
                      ref.read(discoveryFiltersProvider.notifier).savePreset();
                    },
                    icon: const Icon(Icons.bookmark_add_outlined),
                    label: const Text('Save preset'),
                  ),
                  TextButton(
                    onPressed: () {
                      final f = DiscoveryFilters(
                        distanceKm: distance.toInt(),
                        minAge: ages.start.toInt(),
                        maxAge: ages.end.toInt(),
                        hasPhotos: hasPhotos,
                        hasFacePics: hasFace,
                        hasAlbums: hasAlbums,
                        interests:
                            interestsCtrl.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
                        position: positionCtrl.text.trim().isEmpty ? null : positionCtrl.text.trim(),
                        lastSeen: lastSeenCtrl.text.trim().isEmpty ? null : lastSeenCtrl.text.trim(),
                      );
                      Navigator.of(context).pop(f);
                    },
                    child: const Text('Apply'),
                  )
                ],
              ),
              const SizedBox(height: 8),
              _SavedPresetsRow(onSelect: (p) {
                setState(() {
                  distance = p.distanceKm.toDouble();
                  ages = RangeValues(p.minAge.toDouble(), p.maxAge.toDouble());
                  hasPhotos = p.hasPhotos;
                  hasFace = p.hasFacePics;
                  hasAlbums = p.hasAlbums;
                  interestsCtrl.text = p.interests.join(', ');
                  positionCtrl.text = p.position ?? '';
                  lastSeenCtrl.text = p.lastSeen ?? '';
                });
              }),
              const SizedBox(height: 8),
              Text('Distance (${distance.toInt()} km)'),
              Slider(
                min: 1,
                max: 500,
                divisions: 499,
                value: distance,
                label: '${distance.toInt()} km',
                onChanged: (v) => setState(() => distance = v),
              ),
              const SizedBox(height: 8),
              Text('Age range: ${ages.start.toInt()} - ${ages.end.toInt()}'),
              RangeSlider(
                min: 18,
                max: 99,
                values: ages,
                divisions: 81,
                onChanged: (v) => setState(() => ages = v),
              ),
              const Divider(),
              CheckboxListTile(
                value: hasPhotos,
                onChanged: (v) => setState(() => hasPhotos = v ?? false),
                title: const Text('Has photos'),
              ),
              CheckboxListTile(
                value: hasFace,
                onChanged: (v) => setState(() => hasFace = v ?? false),
                title: const Text('Has face pics'),
              ),
              CheckboxListTile(
                value: hasAlbums,
                onChanged: (v) => setState(() => hasAlbums = v ?? false),
                title: const Text('Has albums'),
              ),
              const Divider(),
              TextField(
                controller: interestsCtrl,
                decoration: const InputDecoration(labelText: 'Interests (comma separated)'),
              ),
              TextField(
                controller: positionCtrl,
                decoration: const InputDecoration(labelText: 'Lifestyle/Role (optional)'),
              ),
              TextField(
                controller: lastSeenCtrl,
                decoration: const InputDecoration(labelText: 'Last seen e.g., 15m, 1h (optional)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SavedPresetsRow extends ConsumerWidget {
  final void Function(DiscoveryFilters) onSelect;
  const _SavedPresetsRow({required this.onSelect});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(discoveryFiltersProvider).valueOrNull;
    final saved = state?.saved ?? const [];
    if (saved.isEmpty) return const SizedBox.shrink();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < saved.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ActionChip(
                label: Text('Preset ${i + 1}'),
                onPressed: () => onSelect(saved[i]),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  final bool isCooldown;
  final DateTime nextAt;
  final VoidCallback onRefresh;
  final Duration? remaining;
  const _EmptyCard({required this.isCooldown, required this.nextAt, required this.onRefresh, this.remaining});

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
            Text('No matches right now', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(
              isCooldown ? 'Please wait until new matches are available.' : 'Tap refresh to discover new profiles.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(
                isCooldown ? _cooldownDurationText(remaining ?? nextAt.difference(DateTime.now())) : 'Refresh',
              ),
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
