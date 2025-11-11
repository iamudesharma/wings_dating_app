import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/model/engagement_models.dart';
import 'package:wings_dating_app/helpers/responsive_layout.dart';

part 'profile_providers.g.dart';

// Legacy provider for backward compatibility
@riverpod
Future<UserModel?> getUserById(Ref ref, String userId) async {
  return ref.watch(userProfileProvider(userId).future);
}

// User Profile Provider with proper error handling and caching
@riverpod
class UserProfile extends _$UserProfile {
  @override
  Future<UserModel?> build(String userId) async {
    try {
      return await ref.read(profileRepoProvider).getUserById(userId);
    } catch (e) {
      throw Exception('Failed to load user profile: $e');
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// Favorite Status Provider
@riverpod
class UserFavoriteStatus extends _$UserFavoriteStatus {
  @override
  Future<bool> build(String userId) async {
    // Check if user is in favorites
    return await isUserFavorite(userId);
  }

  Future<void> addToFavorites(String userId) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(profileRepoProvider).addUserToFavorite(userId);
      state = const AsyncValue.data(true);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> removeFromFavorites(String userId) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(profileRepoProvider).removeUserFromFavorite(userId);
      state = const AsyncValue.data(false);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Profile Visits Provider
@riverpod
class ProfileVisits extends _$ProfileVisits {
  @override
  Future<PaginatedVisitsResponse> build() async {
    try {
      return await ref.read(profileRepoProvider).getVisitedProfiles();
    } catch (e) {
      throw Exception('Failed to load visited profiles: $e');
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// Profile Visitors Provider
@riverpod
class ProfileVisitors extends _$ProfileVisitors {
  @override
  Future<PaginatedVisitsResponse> build() async {
    try {
      return await ref.read(profileRepoProvider).getProfileVisitors();
    } catch (e) {
      throw Exception('Failed to load profile visitors: $e');
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// Block List Provider
@riverpod
class UserBlockList extends _$UserBlockList {
  @override
  Future<List<UserModel?>> build() async {
    try {
      return await ref.read(profileRepoProvider).getBlockList();
    } catch (e) {
      throw Exception('Failed to load block list: $e');
    }
  }

  Future<void> removeFromBlockList(String userId) async {
    state = const AsyncValue.loading();
    try {
      // Call API to remove from block list
      // await ref.read(profileRepoProvider).removeFromBlockList(userId);
      ref.invalidateSelf();
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// Tap List Provider with better error handling
@riverpod
class UserTapList extends _$UserTapList {
  @override
  Future<List<UserModel?>> build(String userId) async {
    try {
      final response =
          await ref.read(profileRepoProvider).getUserTapStats(userId);

      List<String> tappedByIds = response.tappedBy;
      List<UserModel?> users = [];

      for (final id in tappedByIds) {
        try {
          final user = await ref.read(profileRepoProvider).getUserById(id);
          users.add(user);
        } catch (e) {
          print('Error getting user $id: $e');
          // Continue with other users even if one fails
        }
      }
      return users;
    } catch (e) {
      throw Exception('Failed to load tap list: $e');
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// Engagement Status Provider
@riverpod
class UserEngagementStatus extends _$UserEngagementStatus {
  @override
  Future<EngagementStatus?> build(String userId) async {
    try {
      final response =
          await ref.read(profileRepoProvider).getUserTapStats(userId);
      return response.engagementStatus;
    } catch (e) {
      throw Exception('Failed to load engagement status: $e');
    }
  }

  Future<void> recordProfileVisit(String userId) async {
    try {
      final result = await ref.read(profileRepoProvider).visitProfile(userId);
      if (result.engagementStatus != null) {
        state = AsyncValue.data(result.engagementStatus);
      }
    } catch (e) {
      // Don't throw error for visit recording failure
      print('Error recording profile visit: $e');
    }
  }
}
