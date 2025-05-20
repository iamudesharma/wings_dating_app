import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wings_dating_app/src/users/users_view.dart'; // Import UsersView for NavigationBarWidget

// TODO: Define a provider to fetch potential matches if needed
// For now, let's reuse the userListProvider for demonstration
import 'package:wings_dating_app/src/users/users_view.dart' show userListProvider;

@RoutePage()
class MatchingView extends ConsumerStatefulWidget {
  const MatchingView({super.key});

  @override
  ConsumerState<MatchingView> createState() => _MatchingViewState();
}

class _MatchingViewState extends ConsumerState<MatchingView> {
  @override
  Widget build(BuildContext context) {
    // For demonstration, reusing the userListProvider. Replace with actual matching logic provider.
    final potentialMatches = ref.watch(userListProvider({}));

    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AppBar(
                  title: const Text("Matching"),
                  // Add actions if needed
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    // Include the NavigationRail/Bar from UsersView for consistent navigation
                    NavigationBarWidget(
                      sizingInformation: sizingInformation,
                    ),
                    Expanded(
                      flex: 5,
                      child: potentialMatches.when(
                        loading: () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        error: (error, stackTrace) => Center(
                          child: Text("Error loading matches: $error"),
                        ),
                        data: (data) {
                          if (data == null || data.isEmpty) {
                            return const Center(
                              child: Text("No potential matches found."),
                            );
                          }
                          // Display the list of potential matches
                          return SizedBox(
                            height: sizingInformation.screenSize.height - kToolbarHeight, // Adjust height as needed
                            width: sizingInformation.screenSize.width,
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final user = data[index];
                                if (user == null) return const SizedBox.shrink(); // Handle null users if necessary
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(user.profileUrl ??
                                        "https://img.icons8.com/ios/500/null/user-male-circle--v1.png"),
                                  ),
                                  title: Text(user.username),
                                  // Add trailing actions like 'like', 'dislike' buttons
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.favorite_border, color: Colors.red),
                                        onPressed: () {
                                          // Handle like action
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close, color: Colors.grey),
                                        onPressed: () {
                                          // Handle dislike action
                                        },
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    // Optional: Navigate to user profile or details
                                  },
                                );
                              },
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
}
