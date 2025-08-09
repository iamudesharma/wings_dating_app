import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/paginated_response.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

part 'paginated_users_provider.g.dart';

class PaginatedUsersState {
  final List<UserModel> users;
  final bool hasNext;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final int currentPage;
  final int totalPages;
  final int total;

  const PaginatedUsersState({
    this.users = const [],
    this.hasNext = false,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.currentPage = 0,
    this.totalPages = 0,
    this.total = 0,
  });

  PaginatedUsersState copyWith({
    List<UserModel>? users,
    bool? hasNext,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    int? currentPage,
    int? totalPages,
    int? total,
  }) {
    return PaginatedUsersState(
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      total: total ?? this.total,
    );
  }
}

@riverpod
class PaginatedUsers extends _$PaginatedUsers {
  static const int _pageSize = 20;
  Map<String, dynamic>? _currentFilters;

  @override
  PaginatedUsersState build(Map<String, dynamic>? filters) {
    print('PaginatedUsers: build() called with filters: $filters');
    _currentFilters = filters;
    print('PaginatedUsers: returning initial state');
    return const PaginatedUsersState();
  }

  Future<void> loadUsers({bool refresh = false}) async {
    print('PaginatedUsers: loadUsers() called with refresh: $refresh');

    if (state.isLoading || state.isLoadingMore) {
      print(
          'PaginatedUsers: Already loading, skipping request. isLoading: ${state.isLoading}, isLoadingMore: ${state.isLoadingMore}');
      return;
    }

    try {
      print('PaginatedUsers: Starting load process...');

      if (refresh) {
        print('PaginatedUsers: Setting loading state for refresh');
        state = state.copyWith(isLoading: true, error: null);
      } else {
        print('PaginatedUsers: Setting loading more state');
        state = state.copyWith(isLoadingMore: true, error: null);
      }

      final page = refresh ? 1 : state.currentPage + 1;
      print('PaginatedUsers: Loading page: $page');

      PaginatedUserResponse response;

      if (_currentFilters != null && _currentFilters!['enabled'] == true) {
        print('PaginatedUsers: Using filtered list with filters: $_currentFilters');
        response = await ref.read(profileRepoProvider).getFilterList(
              filters: _currentFilters!,
              page: page,
              limit: _pageSize,
            );
      } else {
        print('PaginatedUsers: Using regular user list');
        response = await ref.read(profileRepoProvider).getUserList(
              page: page,
              limit: _pageSize,
            );
      }

      print('PaginatedUsers: Received response with ${response.data.length} users');
      print(
          'PaginatedUsers: Response details - total: ${response.total}, hasNext: ${response.hasNext}, totalPages: ${response.totalPages}');

      final newUsers = response.data
          .map((userData) {
            try {
              return UserModel.fromJson(userData);
            } catch (e) {
              print('PaginatedUsers: Error parsing user data: $e');
              print('PaginatedUsers: Problematic user data: $userData');
              return null;
            }
          })
          .where((user) => user != null)
          .cast<UserModel>()
          .toList();

      print('PaginatedUsers: Successfully parsed ${newUsers.length} users');

      final List<UserModel> allUsers;
      if (refresh) {
        print('PaginatedUsers: Refresh mode - replacing all users');
        allUsers = newUsers;
      } else {
        print('PaginatedUsers: Load more mode - appending users');
        // Avoid duplicates when loading more
        final existingIds = state.users.map((u) => u.id).toSet();
        print('PaginatedUsers: Existing user count: ${state.users.length}, existing IDs: ${existingIds.length}');

        final filteredNewUsers = newUsers.where((u) => !existingIds.contains(u.id)).toList();
        print('PaginatedUsers: Filtered new users (no duplicates): ${filteredNewUsers.length}');

        allUsers = [...state.users, ...filteredNewUsers];
      }

      print('PaginatedUsers: Final user count: ${allUsers.length}');

      state = state.copyWith(
        users: allUsers,
        hasNext: response.hasNext,
        isLoading: false,
        isLoadingMore: false,
        currentPage: page,
        totalPages: response.totalPages,
        total: response.total,
        error: null,
      );

      print('PaginatedUsers: State updated successfully - currentPage: $page, hasNext: ${response.hasNext}');
    } catch (e) {
      print('PaginatedUsers: Error in loadUsers: $e');
      print('PaginatedUsers: Error type: ${e.runtimeType}');

      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error: e.toString(),
      );

      print('PaginatedUsers: Error state set with message: ${e.toString()}');
    }
  }

  Future<void> refresh() async {
    print('PaginatedUsers: refresh() called');
    await loadUsers(refresh: true);
    print('PaginatedUsers: refresh() completed');
  }

  Future<void> loadMore() async {
    print('PaginatedUsers: loadMore() called - hasNext: ${state.hasNext}, isLoadingMore: ${state.isLoadingMore}');
    if (state.hasNext && !state.isLoadingMore) {
      print('PaginatedUsers: Conditions met, calling loadUsers(refresh: false)');
      await loadUsers(refresh: false);
    } else {
      print('PaginatedUsers: Skipping loadMore - hasNext: ${state.hasNext}, isLoadingMore: ${state.isLoadingMore}');
    }
    print('PaginatedUsers: loadMore() completed');
  }

  void updateFilters(Map<String, dynamic>? filters) {
    print('PaginatedUsers: updateFilters() called with: $filters');
    _currentFilters = filters;
    print('PaginatedUsers: Invalidating provider state');
    ref.invalidateSelf();
    print('PaginatedUsers: updateFilters() completed');
  }
}
