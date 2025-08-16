// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/users/users_view.dart';
import '../../routes/app_router.dart';
import '../notifications/album_requests_view.dart';
import 'widgets/profile_input_card.dart';

// import 'package:velocity_x/velocity_x.dart';

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
    final userData =
        ref.watch(ProfileController.userControllerProvider).userModel;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (userData == null) {
      // Lightweight skeleton while user data loads
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator.adaptive(),
              SizedBox(height: 12),
              Text('Loading your profile...'),
            ],
          ),
        ),
      );
    }

    Widget avatar({double size = 56}) {
      final url = userData.profileUrl;
      if (url != null && url.isNotEmpty) {
        return CircleAvatar(
          radius: size / 2,
          backgroundImage: CachedNetworkImageProvider(url),
        );
      }
      return CircleAvatar(
        radius: size / 2,
        backgroundColor: colorScheme.primaryContainer,
        child: Text(
          userData.username.isNotEmpty
              ? userData.username.characters.first.toUpperCase()
              : '?',
          style: theme.textTheme.titleLarge
              ?.copyWith(color: colorScheme.onPrimaryContainer),
        ),
      );
    }

    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final content = CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                title: Text(userData.username),
                actions: [
                  IconButton(
                    tooltip: 'Album Requests',
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const AlbumRequestsView()),
                      );
                    },
                  ),
                  PopupMenuButton<String>(
                    tooltip: 'More',
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                          value: 'edit', child: Text('Edit Profile')),
                      const PopupMenuItem(
                          value: 'visits', child: Text('Profile Visits')),
                      const PopupMenuItem(
                          value: 'signout', child: Text('Sign out')),
                    ],
                    onSelected: (value) async {
                      switch (value) {
                        case 'edit':
                          context.router
                              .push(EditProfileRoute(isEditProfile: true));
                          break;
                        case 'visits':
                          context.router.push(const ProfileVisitsRoute());
                          break;
                        case 'signout':
                          await FirebaseAuth.instance.signOut();
                          if (!context.mounted) return;
                          context.router.replaceAll([const SignOptionsRoute()]);
                          break;
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme.primaryContainer,
                          colorScheme.secondaryContainer,
                        ],
                      ),
                    ),
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 64, 24, 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            avatar(size: 96),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userData.username,
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      color: colorScheme.onSecondaryContainer,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  if ((userData.bio ?? '').isNotEmpty)
                                    Text(
                                      userData.bio!,
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onSecondaryContainer
                                            .withValues(alpha: 0.85),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  const SizedBox(height: 12),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      _pill(context, Icons.work_outline,
                                          userData.role.value),
                                      _pill(context, Icons.favorite_outline,
                                          userData.relationshipStatus.value),
                                      _pill(context, Icons.search,
                                          userData.lookingFor.value),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FilledButton.icon(
                            onPressed: () => context.router
                                .push(EditProfileRoute(isEditProfile: true)),
                            icon: const Icon(Icons.edit_outlined),
                            label: const Text('Edit Profile'),
                          ),
                          const SizedBox(width: 12),
                          OutlinedButton.icon(
                            onPressed: () =>
                                context.router.push(const ProfileVisitsRoute()),
                            icon: const Icon(Icons.visibility_outlined),
                            label: const Text('Profile Visits'),
                          ),
                          const SizedBox(width: 12),
                          IconButton.filledTonal(
                            tooltip: 'Album Requests',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const AlbumRequestsView()),
                              );
                            },
                            icon: const Icon(Icons.notifications_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // About Section
                      Text('About',
                          style: theme.textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Card(
                        elevation: 0,
                        color: colorScheme.surface,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            (userData.bio ?? '').isEmpty
                                ? 'No bio added yet.'
                                : userData.bio!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodyMedium?.color
                                  ?.withValues(alpha: 0.9),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Details grid
                      Text('Details',
                          style: theme.textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Card(
                        elevation: 0,
                        color: colorScheme.surface,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Column(
                            children: [
                              ProfileInputCard(
                                  title: 'Role', value: userData.role.value),
                              ProfileInputCard(
                                  title: 'Body Type',
                                  value: userData.bodyType.value),
                              ProfileInputCard(
                                  title: 'Ethnicity',
                                  value: userData.ethnicity.value),
                              ProfileInputCard(
                                  title: 'Relationship Status',
                                  value: userData.relationshipStatus.value),
                              ProfileInputCard(
                                  title: 'Looking for',
                                  value: userData.lookingFor.value),
                              ProfileInputCard(
                                  title: 'Where to meet',
                                  value: userData.whereToMeet.value),
                              ProfileInputCard(
                                  title: 'Height',
                                  value: userData.height ?? 'Do not Show'),
                              ProfileInputCard(
                                  title: 'Weight',
                                  value: userData.weight ?? 'Do not Show'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          );

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationBarWidget(sizingInformation: sizingInformation),
              Expanded(flex: 5, child: content),
            ],
          );
        },
      ),
    );
  }

  Widget _pill(BuildContext context, IconData icon, String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
            color:
                theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.onSecondaryContainer),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.labelMedium
                ?.copyWith(color: theme.colorScheme.onSecondaryContainer),
          ),
        ],
      ),
    );
  }
}
