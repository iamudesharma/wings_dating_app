import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';
import '../model/user_models.dart';
import '../model/engagement_models.dart';

@RoutePage()
class ProfileVisitsView extends ConsumerStatefulWidget {
  const ProfileVisitsView({super.key});

  @override
  ConsumerState<ProfileVisitsView> createState() => _ProfileVisitsViewState();
}

class _ProfileVisitsViewState extends ConsumerState<ProfileVisitsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Visits'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.visibility),
              text: 'I Visited',
            ),
            Tab(
              icon: Icon(Icons.person_search),
              text: 'Visited Me',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _VisitedProfilesTab(),
          _ProfileVisitorsTab(),
        ],
      ),
    );
  }
}

class _VisitedProfilesTab extends ConsumerStatefulWidget {
  const _VisitedProfilesTab();

  @override
  ConsumerState<_VisitedProfilesTab> createState() =>
      _VisitedProfilesTabState();
}

class _VisitedProfilesTabState extends ConsumerState<_VisitedProfilesTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaginatedVisitsResponse>(
      future: ref.read(profileRepoProvider).getVisitedProfiles(),
      builder: (context, snapshot) {
        // Add debug logging
        print(
            'VisitedProfiles - Connection State: ${snapshot.connectionState}');
        print('VisitedProfiles - Has Error: ${snapshot.hasError}');
        print('VisitedProfiles - Error: ${snapshot.error}');
        print('VisitedProfiles - Data: ${snapshot.data}');
        print('VisitedProfiles - Data Length: ${snapshot.data?.visits.length}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: ${snapshot.error}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => setState(() {}),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final visitedProfiles = snapshot.data?.visits ?? [];

        if (visitedProfiles.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.visibility_off, size: 48, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No visited profiles yet',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Start exploring profiles to see them here',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: visitedProfiles.length,
          itemBuilder: (context, index) {
            final visit = visitedProfiles[index];
            final user = visit.user;
            if (user == null) return const SizedBox.shrink();

            return _VisitCard(
              visit: visit,
              user: user,
              subtitle: 'Visited by you',
              onTap: () {
                context.pushRoute(
                  OtherUserProfileRoute(id: user.id),
                );
              },
            ).animate(delay: (index * 100).ms).slideX().fadeIn();
          },
        );
      },
    );
  }
}

class _ProfileVisitorsTab extends ConsumerStatefulWidget {
  const _ProfileVisitorsTab();

  @override
  ConsumerState<_ProfileVisitorsTab> createState() =>
      _ProfileVisitorsTabState();
}

class _ProfileVisitorsTabState extends ConsumerState<_ProfileVisitorsTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaginatedVisitsResponse>(
      future: ref.read(profileRepoProvider).getProfileVisitors(),
      builder: (context, snapshot) {
        // Add debug logging
        print(
            'ProfileVisitors - Connection State: ${snapshot.connectionState}');
        print('ProfileVisitors - Has Error: ${snapshot.hasError}');
        print('ProfileVisitors - Error: ${snapshot.error}');
        print('ProfileVisitors - Data: ${snapshot.data}');
        print('ProfileVisitors - Data Length: ${snapshot.data?.visits.length}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: ${snapshot.error}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => setState(() {}),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final visitors = snapshot.data?.visits ?? [];

        if (visitors.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_search, size: 48, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No profile visitors yet',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Share your profile to get more visitors',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: visitors.length,
          itemBuilder: (context, index) {
            final visit = visitors[index];
            final user = visit.user;
            if (user == null) return const SizedBox.shrink();

            return _VisitCard(
              visit: visit,
              user: user,
              subtitle: 'Visited your profile',
              onTap: () {
                context.pushRoute(
                  OtherUserProfileRoute(id: user.id),
                );
              },
            ).animate(delay: (index * 100).ms).slideX().fadeIn();
          },
        );
      },
    );
  }
}

class _VisitCard extends StatelessWidget {
  final VisitRecord visit;
  final UserModel user;
  final String subtitle;
  final VoidCallback onTap;

  const _VisitCard({
    required this.visit,
    required this.user,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage:
              user.profileUrl != null && user.profileUrl!.isNotEmpty
                  ? CachedNetworkImageProvider(user.profileUrl!)
                  : null,
          child: user.profileUrl == null || user.profileUrl!.isEmpty
              ? Text(
                  user.username.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              : null,
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                user.username,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            // Visit count badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                visit.formattedVisitCount,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            const SizedBox(height: 4),
            Text(
              visit.visitCountText,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (user.age != null) ...[
              const SizedBox(height: 4),
              Text(
                'Age: ${user.age}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
