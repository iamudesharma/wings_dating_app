import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/paginated_response.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

/// Holds discovery results with a cooldown timestamp
class DiscoveryState {
  final List<UserModel> users; // up to 10
  final DateTime fetchedAt; // when this batch was fetched
  final DateTime nextAvailableAt; // fetchedAt + cooldown
  final bool isCooldown; // true if within 1 hour of fetch

  const DiscoveryState({
    required this.users,
    required this.fetchedAt,
    required this.nextAvailableAt,
    required this.isCooldown,
  });

  DiscoveryState copyWith({
    List<UserModel>? users,
    DateTime? fetchedAt,
    DateTime? nextAvailableAt,
    bool? isCooldown,
  }) =>
      DiscoveryState(
        users: users ?? this.users,
        fetchedAt: fetchedAt ?? this.fetchedAt,
        nextAvailableAt: nextAvailableAt ?? this.nextAvailableAt,
        isCooldown: isCooldown ?? this.isCooldown,
      );
}

class DiscoveryController extends AutoDisposeAsyncNotifier<DiscoveryState> {
  static const int limit = 10;
  static const Duration cooldown = Duration(hours: 1);

  static const _kUsers = 'discovery_users_json';
  static const _kFetchedAt = 'discovery_fetched_at';
  static const _kNextAt = 'discovery_next_at';

  Timer? _cooldownTimer;

  @override
  Future<DiscoveryState> build() async {
    // Try restore persisted state first
    final restored = await _restore();
    if (restored != null) {
      _scheduleCooldownCheck(restored.nextAvailableAt);
      ref.onDispose(() => _cooldownTimer?.cancel());
      return restored;
    }

    // Otherwise fetch a fresh batch
    final fresh = await _fetchDiscovery();
    _scheduleCooldownCheck(fresh.nextAvailableAt);
    ref.onDispose(() => _cooldownTimer?.cancel());
    return fresh;
  }

  void _scheduleCooldownCheck(DateTime nextAvailableAt) {
    _cooldownTimer?.cancel();
    final now = DateTime.now();
    final remaining = nextAvailableAt.difference(now);
    if (remaining.isNegative) return; // cooldown already expired
    _cooldownTimer = Timer(remaining, () {
      final current = state.valueOrNull;
      if (current != null) {
        state = AsyncData(current.copyWith(isCooldown: false));
      }
    });
  }

  Future<void> refreshIfAllowed() async {
    final current = state.valueOrNull;
    if (current != null && current.isCooldown) return;
    final newState = await _fetchDiscovery();
    _scheduleCooldownCheck(newState.nextAvailableAt);
    state = AsyncData(newState);
  }

  Future<DiscoveryState> _fetchDiscovery() async {
    final repo = ref.read(profileRepoProvider);
    // Reuse getFilterList hitting /users/discover with limit=10 as server source of truth
    final PaginatedUserResponse resp = await repo.getFilterList(filters: {}, page: 1, limit: limit);

    final users = <UserModel>[];
    for (final raw in resp.data) {
      if (users.length >= limit) break;
      try {
        final map = Map<String, dynamic>.from(raw);

        // Coerce required fields to String and validate
        final idRaw = map['id'];
        final usernameRaw = map['username'];
        final idStr = idRaw is String ? idRaw : idRaw?.toString();
        final usernameStr = usernameRaw is String ? usernameRaw : usernameRaw?.toString();
        if (idStr == null || idStr.isEmpty || usernameStr == null || usernameStr.isEmpty) {
          continue; // skip invalid entries
        }
        map['id'] = idStr;
        map['username'] = usernameStr;

        // Provide safe defaults for required/non-nullable fields
        final profileUrl = map['profileUrl'];
        map['profileUrl'] = (profileUrl is String && profileUrl.isNotEmpty)
            ? profileUrl
            : 'https://img.icons8.com/ios/500/null/user-male-circle--v1.png';
        map['fcmToken'] = (map['fcmToken'] is String) ? map['fcmToken'] : '';

        // Normalize optional collections
        if (map['interests'] is List) {
          map['interests'] = (map['interests'] as List).whereType<String>().toList();
        } else {
          map['interests'] = <String>[];
        }
        if (map['albumUrl'] is List) {
          map['albumUrl'] = (map['albumUrl'] as List).whereType<String>().toList();
        }

        // Sanitize position if malformed
        final pos = map['position'];
        if (pos is Map<String, dynamic>) {
          final geopoint = pos['geopoint'];
          if (geopoint is List && geopoint.length >= 2) {
            // ok
          } else {
            map.remove('position');
          }
        } else if (pos != null) {
          map.remove('position');
        }

        users.add(UserModel.fromJson(map));
      } catch (_) {
        // Skip malformed entries
        continue;
      }
    }

    final fetchedAt = DateTime.now();
    final nextAvailableAt = fetchedAt.add(cooldown);
    final newState = DiscoveryState(
      users: users,
      fetchedAt: fetchedAt,
      nextAvailableAt: nextAvailableAt,
      isCooldown: true, // start cooldown immediately after fetch
    );
    await _persist(newState);
    return newState;
  }

  Future<void> _persist(DiscoveryState s) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = jsonEncode(s.users.map((u) => u.toJson()).toList());
    await prefs.setString(_kUsers, usersJson);
    await prefs.setString(_kFetchedAt, s.fetchedAt.toIso8601String());
    await prefs.setString(_kNextAt, s.nextAvailableAt.toIso8601String());
  }

  Future<DiscoveryState?> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final usersStr = prefs.getString(_kUsers);
    final fetchedStr = prefs.getString(_kFetchedAt);
    final nextStr = prefs.getString(_kNextAt);

    if (usersStr == null || fetchedStr == null || nextStr == null) return null;

    try {
      final List<dynamic> decoded = jsonDecode(usersStr) as List<dynamic>;
      final users = decoded.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
      final fetchedAt = DateTime.parse(fetchedStr);
      final nextAvailableAt = DateTime.parse(nextStr);
      final now = DateTime.now();
      final isCooldown = now.isBefore(nextAvailableAt);

      return DiscoveryState(
        users: users,
        fetchedAt: fetchedAt,
        nextAvailableAt: nextAvailableAt,
        isCooldown: isCooldown,
      );
    } catch (_) {
      return null;
    }
  }
}

final discoveryControllerProvider = AutoDisposeAsyncNotifierProvider<DiscoveryController, DiscoveryState>(
  DiscoveryController.new,
);
