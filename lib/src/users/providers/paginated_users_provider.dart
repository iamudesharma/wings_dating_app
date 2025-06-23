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
    _currentFilters = filters;
    return const PaginatedUsersState();
  }

  Future<void> loadUsers({bool refresh = false}) async {
    if (state.isLoading || state.isLoadingMore) return;

    try {
      if (refresh) {
        state = state.copyWith(isLoading: true, error: null);
      } else {
        state = state.copyWith(isLoadingMore: true, error: null);
      }

      final page = refresh ? 1 : state.currentPage + 1;

      PaginatedUserResponse response;

      if (_currentFilters != null && _currentFilters!['enabled'] == true) {
        response = await ref.read(profileRepoProvider).getFilterList(
              filters: _currentFilters!,
              page: page,
              limit: _pageSize,
            );
      } else {
        response = await ref.read(profileRepoProvider).getUserList(
              page: page,
              limit: _pageSize,
            );
      }

      final newUsers = response.data
          .map((userData) {
            try {
              return UserModel.fromJson(userData);
            } catch (e) {
              print('Error parsing user data: $e');
              return null;
            }
          })
          .where((user) => user != null)
          .cast<UserModel>()
          .toList();

      final List<UserModel> allUsers;
      if (refresh) {
        allUsers = newUsers;
      } else {
        // Avoid duplicates when loading more
        final existingIds = state.users.map((u) => u.id).toSet();
        final filteredNewUsers = newUsers.where((u) => !existingIds.contains(u.id)).toList();
        allUsers = [...state.users, ...filteredNewUsers];
      }

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
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    await loadUsers(refresh: true);
  }

  Future<void> loadMore() async {
    if (state.hasNext && !state.isLoadingMore) {
      await loadUsers(refresh: false);
    }
  }

  void updateFilters(Map<String, dynamic>? filters) {
    _currentFilters = filters;
    ref.invalidateSelf();
  }
}
