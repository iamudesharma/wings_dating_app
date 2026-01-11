import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

// import '../../dependency/dependencies.dart';
// import '../../routes/app_router.dart';
// import '../notifications/album_requests_view.dart';
import 'controller/profile_controller.dart';
import 'package:wings_dating_app/routes/app_router.dart';
// import 'providers/onboarding_providers.dart';
// import 'widgets/chips_selector.dart';
import 'widgets/profile_completion_meter.dart';
import 'widgets/profile_input_card.dart';
// import 'widgets/prompts_editor.dart';
// import 'widgets/quick_actions.dart';
// import 'widgets/social_links_form.dart';
// import 'widgets/video_clip_uploader.dart';
import '../view/theme_selector.dart';
import '../users/users_view.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(ProfileController.userControllerProvider).userModel;
    final profileState = ref.watch(ProfileController.userControllerProvider);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (userData == null) {
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
        return CircleAvatar(radius: size / 2, backgroundImage: CachedNetworkImageProvider(url));
      }
      return CircleAvatar(
        radius: size / 2,
        backgroundColor: colorScheme.primaryContainer,
        child: Text(
          userData.username.isNotEmpty ? userData.username.characters.first.toUpperCase() : '?',
          style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.onPrimaryContainer),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(userData.username)),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Navigate to edit profile screen via AutoRoute
            context.router.push(EditProfileRoute(isEditProfile: true));
          },
          icon: const Icon(Icons.edit_outlined),
          label: const Text('Edit'),
        ),
        body: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return Row(
              children: [
                NavigationBarWidget(sizingInformation: sizingInformation),
                Expanded(
                  flex: 5,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Row(
                        children: [
                          avatar(size: 64),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userData.username, style: theme.textTheme.titleLarge),
                                if (profileState.hasPendingProfilePicture)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.hourglass_empty, size: 16, color: Colors.amber.shade700),
                                        const SizedBox(width: 4),
                                        Flexible(
                                          child: Text(
                                            'Profile picture under review',
                                            style: TextStyle(
                                              color: Colors.amber.shade700,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if ((userData.bio ?? '').isNotEmpty && !profileState.hasPendingProfilePicture)
                                  Text(userData.bio!, maxLines: 2, overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const ProfileCompletionMeter(),
                      if (profileState.hasPendingProfilePicture) ...[
                        const SizedBox(height: 16),
                        Card(
                          elevation: 0,
                          color: Colors.amber.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.amber.shade200, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(color: Colors.amber.shade100, shape: BoxShape.circle),
                                  child: Icon(Icons.schedule, color: Colors.amber.shade700, size: 24),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Profile Picture Under Review',
                                        style: theme.textTheme.titleSmall?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber.shade900,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Your new profile picture is being reviewed by our admin team. Once approved, it will be visible to other users.',
                                        style: theme.textTheme.bodySmall?.copyWith(color: Colors.amber.shade800),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      // Settings Section
                      Text('Settings', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Card(
                        elevation: 0,
                        color: colorScheme.surface,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.palette_outlined, color: colorScheme.primary),
                              title: const Text('Theme Settings'),
                              subtitle: const Text('Customize app appearance'),
                              trailing: Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).push(MaterialPageRoute(builder: (context) => const ThemeSelector()));
                              },
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: Icon(Icons.logout, color: colorScheme.error),
                              title: Text('Logout', style: TextStyle(color: colorScheme.error)),
                              subtitle: const Text('Sign out of your account'),
                              onTap: () async {
                                await ref.read(ProfileController.userControllerProvider.notifier).logout();
                                if (context.mounted) {
                                  context.router.replaceAll([const SignOptionsRoute()]);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // About Section
                      Text('About', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Card(
                        elevation: 0,
                        color: colorScheme.surface,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            (userData.bio ?? '').isEmpty ? 'No bio added yet.' : userData.bio!,
                            style: theme.textTheme.bodyMedium?.copyWith(color: theme.textTheme.bodyMedium?.color),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Interests (display only)
                      Text('Interests', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 8,
                        children: userData.interests.isNotEmpty
                            ? userData.interests.map((e) => Chip(label: Text(e))).toList()
                            : [Text('No interests added yet.', style: theme.textTheme.bodySmall)],
                      ),
                      const SizedBox(height: 16),
                      // Details grid
                      Text('Details', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Card(
                        elevation: 0,
                        color: colorScheme.surface,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Column(
                            children: [
                              ProfileInputCard(title: 'Role', value: userData.role.value),
                              ProfileInputCard(title: 'Body Type', value: userData.bodyType.value),
                              ProfileInputCard(title: 'Ethnicity', value: userData.ethnicity.value),
                              ProfileInputCard(title: 'Relationship Status', value: userData.relationshipStatus.value),
                              ProfileInputCard(title: 'Looking for', value: userData.lookingFor.value),
                              ProfileInputCard(title: 'Where to meet', value: userData.whereToMeet.value),
                              ProfileInputCard(title: 'Height', value: userData.height ?? 'Do not Show'),
                              ProfileInputCard(title: 'Weight', value: userData.weight ?? 'Do not Show'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
