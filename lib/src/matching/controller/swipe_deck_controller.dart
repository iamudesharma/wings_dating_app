import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/const/http_templete.dart';
import 'package:wings_dating_app/repo/engagement_repo.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/matching/providers/matching_providers.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

class SwipeCandidate {
  final UserModel user;
  final double compatibility; // 0..100
  SwipeCandidate(this.user, this.compatibility);
}

class SwipeDeckController extends AutoDisposeAsyncNotifier<SwipeDeckState> {
  static const int freeDailyLimit = 20; // free swipes/day
  static const int freeSuperlikes = 1; // free/day

  final Queue<SwipeCandidate> _queue = Queue();
  final List<SwipeCandidate> _history = []; // for rewind
  int _superLikesUsed = 0;
  DateTime _dayAnchor = _today();

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  @override
  Future<SwipeDeckState> build() async {
    // Seed from discovery provider and rebuild when it changes
    final discovery = await ref.watch(discoveryControllerProvider.future);
    _queue.clear();
    for (final u in discovery.users) {
      _queue.add(SwipeCandidate(u, _compatibilityScore(u)));
    }
    return SwipeDeckState(
      candidates: _queue.toList(growable: false),
      swipesToday: 0,
      dailyLimit: freeDailyLimit,
      superLikesRemaining: freeSuperlikes - _superLikesUsed,
      canRewind: false,
    );
  }

  double _compatibilityScore(UserModel user) {
    // Simple rules-based heuristic for now
    final current = ref.read(ProfileController.userControllerProvider).userModel;
    double score = 50;
    if (current != null) {
      // Shared interests weight
      final setA = current.interests.toSet();
      final setB = user.interests.toSet();
      final common = setA.intersection(setB).length;
      score += (common * 10).clamp(0, 30);
      // Age proximity if available
      if (current.age != null && user.age != null) {
        final diff = (current.age! - user.age!).abs();
        score += (10 - diff).clamp(0, 10).toDouble();
      }
    }
    return score.clamp(0, 100);
  }

  Future<void> like() async {
    final engagement = ref.read(engagementRepoProvider);
    final s = state.valueOrNull;
    if (s == null || _queue.isEmpty) return;

    // Daily resets
    if (DateTime.now().difference(_dayAnchor).inDays >= 1) {
      _dayAnchor = _today();
      _superLikesUsed = 0;
      state = AsyncData(s.copyWith(swipesToday: 0, superLikesRemaining: freeSuperlikes));
    }

    if (s.swipesToday >= s.dailyLimit) {
      state = AsyncData(s.copyWith(limitReached: true));
      return;
    }

    final top = _queue.removeFirst();
    _history.add(top);
    state = AsyncData(s.copyWith(
      candidates: _queue.toList(growable: false),
      swipesToday: s.swipesToday + 1,
      canRewind: true,
    ));

    // Fire and forget to backend
    try {
      await engagement.likeUser(top.user.id);
    } catch (_) {}
  }

  Future<void> superLike() async {
    final engagement = ref.read(engagementRepoProvider);
    final s = state.valueOrNull;
    if (s == null || _queue.isEmpty) return;

    if (s.superLikesRemaining <= 0) {
      // surface no superlikes left
      state = AsyncData(s.copyWith(noSuperLikesLeft: true));
      return;
    }

    final top = _queue.removeFirst();
    _history.add(top);
    _superLikesUsed += 1;
    state = AsyncData(s.copyWith(
      candidates: _queue.toList(growable: false),
      swipesToday: s.swipesToday + 1,
      superLikesRemaining: (s.superLikesRemaining - 1).clamp(0, 99),
      canRewind: true,
    ));
    try {
      await engagement.superLikeUser(top.user.id);
    } catch (_) {}
  }

  Future<void> pass() async {
    final s = state.valueOrNull;
    if (s == null || _queue.isEmpty) return;
    final top = _queue.removeFirst();
    _history.add(top);
    state = AsyncData(s.copyWith(
      candidates: _queue.toList(growable: false),
      swipesToday: s.swipesToday + 1,
      canRewind: true,
    ));
  }

  Future<void> rewind() async {
    final engagement = ref.read(engagementRepoProvider);
    final s = state.valueOrNull;
    if (s == null || _history.isEmpty) return;

    final last = _history.removeLast();
    _queue.addFirst(last);
    state = AsyncData(s.copyWith(
      candidates: _queue.toList(growable: false),
      canRewind: _history.isNotEmpty,
    ));
    // Also ask backend to rewind last swipe (premium-gated server may error; ignore)
    try {
      await engagement.rewindLastSwipe();
    } catch (_) {}
  }

  Future<void> refreshTopPicks() async {
    // Pull from backend recommended
    final repo = ref.read(profileRepoProvider);
    try {
      final me = await repo.getCurrentUser();
      final res = await HttpTemplate().get('/users/${me.id}/recommended?limit=10');
      final data = res['data'];
      final list = data is List
          ? data
          : (data is Map<String, dynamic> && data['data'] is List)
              ? data['data']
              : <dynamic>[];
      final users = list.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e))).toList();
      _queue.clear();
      for (final u in users) {
        _queue.add(SwipeCandidate(u, _compatibilityScore(u)));
      }
      final s = state.valueOrNull;
      if (s != null) {
        state = AsyncData(s.copyWith(candidates: _queue.toList(growable: false)));
      }
    } catch (_) {}
  }
}

class SwipeDeckState {
  final List<SwipeCandidate> candidates;
  final int swipesToday;
  final int dailyLimit;
  final int superLikesRemaining;
  final bool canRewind;
  final bool limitReached;
  final bool noSuperLikesLeft;

  SwipeDeckState({
    required this.candidates,
    required this.swipesToday,
    required this.dailyLimit,
    required this.superLikesRemaining,
    required this.canRewind,
    this.limitReached = false,
    this.noSuperLikesLeft = false,
  });

  SwipeDeckState copyWith({
    List<SwipeCandidate>? candidates,
    int? swipesToday,
    int? dailyLimit,
    int? superLikesRemaining,
    bool? canRewind,
    bool? limitReached,
    bool? noSuperLikesLeft,
  }) =>
      SwipeDeckState(
        candidates: candidates ?? this.candidates,
        swipesToday: swipesToday ?? this.swipesToday,
        dailyLimit: dailyLimit ?? this.dailyLimit,
        superLikesRemaining: superLikesRemaining ?? this.superLikesRemaining,
        canRewind: canRewind ?? this.canRewind,
        limitReached: limitReached ?? this.limitReached,
        noSuperLikesLeft: noSuperLikesLeft ?? this.noSuperLikesLeft,
      );
}

final swipeDeckControllerProvider = AutoDisposeAsyncNotifierProvider<SwipeDeckController, SwipeDeckState>(
  SwipeDeckController.new,
);
