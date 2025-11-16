import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// Simple StateProvider for managing favorites list
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
  final currentUser =
      ref.watch(ProfileController.userControllerProvider).userModel;
  return FavoritesNotifier(ref, currentUser?.favoriteList ?? []);
});

class FavoritesNotifier extends StateNotifier<List<String>> {
  final Ref ref;

  FavoritesNotifier(this.ref, List<String> initialFavorites)
      : super(initialFavorites);

  bool isFavorited(String userId) {
    return state.contains(userId);
  }

  Future<bool> toggleFavorite(String userId) async {
    final isFavorited = state.contains(userId);

    try {
      if (isFavorited) {
        // Remove from favorites
        print('FavoritesProvider: Removing $userId from favorites');
        final response =
            await ref.read(profileRepoProvider).removeUserFromFavorite(userId);
        print(
            'FavoritesProvider: Remove response: ${response.status} - ${response.message}');

        if (response.status == 'success') {
          state = state.where((id) => id != userId).toList();
          print(
              'FavoritesProvider: Successfully removed from global favorites');

          FirebaseAnalytics.instance.logEvent(
            name: 'user_unfavorited',
            parameters: <String, Object>{
              'unfavorited_user_id': userId as Object,
            },
          );
          return true;
        }
      } else {
        // Add to favorites
        print('FavoritesProvider: Adding $userId to favorites');
        final response =
            await ref.read(profileRepoProvider).addUserToFavorite(userId);
        print(
            'FavoritesProvider: Add response: ${response.status} - ${response.message}');

        if (response.status == 'success') {
          state = [...state, userId];
          print('FavoritesProvider: Successfully added to global favorites');

          FirebaseAnalytics.instance.logEvent(
            name: 'user_favorited',
            parameters: <String, Object>{
              'favorited_user_id': userId as Object,
            },
          );
          return true;
        }
      }
      return false;
    } catch (e) {
      print('FavoritesProvider: Error toggling favorite: $e');
      return false;
    }
  }

  void updateFromUserData(List<String> favorites) {
    print('FavoritesProvider: Updating favorites from user data: $favorites');
    state = favorites;
  }
}
