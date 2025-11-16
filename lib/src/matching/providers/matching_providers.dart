import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/paginated_response.dart';
import 'package:wings_dating_app/src/matching/providers/filters_provider.dart';
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

class DiscoveryController extends AsyncNotifier<DiscoveryState> {
  // We only show a few profiles per cycle.
  static const int limit = 3;
  
  // Profiles reset every 24 hours.
  static const Duration cooldown = Duration(hours: 24);

  static const _kUsers = 'discovery_users_json';
  static const _kFetchedAt = 'discovery_fetched_at';
  static const _kNextAt = 'discovery_next_at';
  // Persisted schema/version to support migrations (e.g., 1h -> 24h window)
  static const _kVersion = 'discovery_version';
  static const int _version = 2; // bump when changing persistence semantics

  Timer? _cooldownTimer;

  @override
  Future<DiscoveryState> build() async {
    // Try restore persisted state first
    final restored = await _restore();
    if (restored != null) {
      // If we restored but have no users cached, fetch immediately regardless of cooldown
      if (restored.users.isEmpty) {
        final fresh = await _fetchDiscovery();
        _scheduleCooldownCheck(fresh.nextAvailableAt);
        ref.onDispose(() => _cooldownTimer?.cancel());
        return fresh;
      }
      // If cooldown already expired while we were disposed, fetch a fresh batch immediately
      if (DateTime.now().isAfter(restored.nextAvailableAt)) {
        final fresh = await _fetchDiscovery();
        _scheduleCooldownCheck(fresh.nextAvailableAt);
        ref.onDispose(() => _cooldownTimer?.cancel());
        return fresh;
      }
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
    if (remaining.isNegative || remaining == Duration.zero) return; // cooldown already expired or zero-delay
    _cooldownTimer = Timer(remaining, () async {
      // When the countdown ends, automatically refresh the batch and start a new cycle.
      try {
        final newState = await _fetchDiscovery();
        _scheduleCooldownCheck(newState.nextAvailableAt);
        state = AsyncData(newState);
      } catch (_) {
        // If fetch fails, at least mark cooldown as over to enable manual retry
        final current = state.value;
        if (current != null) {
          state = AsyncData(current.copyWith(isCooldown: false));
        }
      }
    });
  }

  Future<void> refreshIfAllowed() async {
    final current = state.value;
    if (current != null && current.isCooldown) return;
    final newState = await _fetchDiscovery();
    _scheduleCooldownCheck(newState.nextAvailableAt);
    state = AsyncData(newState);
  }

  Future<DiscoveryState> _fetchDiscovery() async {
    final repo = ref.read(profileRepoProvider);
    // Read current filters
    final filtersState = await ref.read(discoveryFiltersProvider.future);
    final filters = filtersState.current.toApiFilters();
    // Reuse getFilterList hitting /users/discover with limit as server source of truth
    final PaginatedUserResponse resp = await repo.getFilterList(filters: filters, page: 1, limit: limit);

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
    // If we received no users, don't lock the user in a long cooldown.
    // Let them retry immediately.
    final nextAvailableAt = users.isEmpty ? fetchedAt : fetchedAt.add(cooldown);
    final newState = DiscoveryState(
      users: users,
      fetchedAt: fetchedAt,
      nextAvailableAt: nextAvailableAt,
      isCooldown: users.isNotEmpty, // start cooldown only when we actually have results
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
    await prefs.setInt(_kVersion, _version);
  }

  Future<DiscoveryState?> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final usersStr = prefs.getString(_kUsers);
    final fetchedStr = prefs.getString(_kFetchedAt);
    final nextStr = prefs.getString(_kNextAt);
    final savedVersion = prefs.getInt(_kVersion) ?? 0; // 0 means legacy (pre-versioned)

    if (usersStr == null || fetchedStr == null || nextStr == null) return null;

    try {
      final List<dynamic> decoded = jsonDecode(usersStr) as List<dynamic>;
      final users = decoded.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
      final fetchedAt = DateTime.parse(fetchedStr);
      DateTime nextAvailableAt = DateTime.parse(nextStr);
      final now = DateTime.now();

      // Migration: if legacy state (e.g., 1-hour cooldown) exists, re-anchor to 24h policy
      final desiredNext = fetchedAt.add(cooldown);
      final legacyWindow = nextAvailableAt.isBefore(desiredNext);
      if (savedVersion < _version || legacyWindow) {
        nextAvailableAt = desiredNext;
        // Persist upgraded version and nextAt so subsequent restores are consistent
        await prefs.setInt(_kVersion, _version);
        await prefs.setString(_kNextAt, nextAvailableAt.toIso8601String());
      }
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

final discoveryControllerProvider = AsyncNotifierProvider<DiscoveryController, DiscoveryState>(
  DiscoveryController.new,
);

/// Emits the remaining time until the next discovery refresh.
/// If the countdown is negative or reaches zero, it emits Duration.zero.
final discoveryCountdownProvider = StreamProvider.autoDispose<Duration>((ref) async* {
  // Recompute when discovery state changes (e.g., after auto-refresh)
  final asyncState = ref.watch(discoveryControllerProvider);
  final state = asyncState.value;
  if (state == null) {
    yield Duration.zero;
    return;
  }
  // Tick every second until nextAvailableAt
  while (true) {
    final remaining = state.nextAvailableAt.difference(DateTime.now());
    if (remaining.isNegative) {
      yield Duration.zero;
      break;
    }
    yield remaining;
    // Small delay; autoDispose ensures cancellation on widget dispose
    await Future<void>.delayed(const Duration(seconds: 1));
    // If discovery state changed (e.g., auto-refresh), restart loop to use new target time
    final latest = ref.read(discoveryControllerProvider).value;
    if (latest == null || latest.nextAvailableAt != state.nextAvailableAt) {
      // Exit so the outer watch triggers a new stream with updated target
      break;
    }
  }
});
