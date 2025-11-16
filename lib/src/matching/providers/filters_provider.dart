import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscoveryFilters {
  final int distanceKm; // 1..500
  final int minAge; // 18..99
  final int maxAge; // 18..99
  final bool hasPhotos;
  final bool hasFacePics;
  final bool hasAlbums;
  final List<String> interests; // comma-separated in API
  final String? position; // lifestyle / role etc (free text)
  final String? lastSeen; // e.g., '15m', '1h'

  const DiscoveryFilters({
    this.distanceKm = 50,
    this.minAge = 18,
    this.maxAge = 99,
    this.hasPhotos = false,
    this.hasFacePics = false,
    this.hasAlbums = false,
    this.interests = const [],
    this.position,
    this.lastSeen,
  });

  DiscoveryFilters copyWith({
    int? distanceKm,
    int? minAge,
    int? maxAge,
    bool? hasPhotos,
    bool? hasFacePics,
    bool? hasAlbums,
    List<String>? interests,
    String? position,
    String? lastSeen,
  }) =>
      DiscoveryFilters(
        distanceKm: distanceKm ?? this.distanceKm,
        minAge: minAge ?? this.minAge,
        maxAge: maxAge ?? this.maxAge,
        hasPhotos: hasPhotos ?? this.hasPhotos,
        hasFacePics: hasFacePics ?? this.hasFacePics,
        hasAlbums: hasAlbums ?? this.hasAlbums,
        interests: interests ?? this.interests,
        position: position ?? this.position,
        lastSeen: lastSeen ?? this.lastSeen,
      );

  Map<String, dynamic> toApiFilters() {
    return {
      'distance': distanceKm,
      'ageRange': '$minAge-$maxAge',
      if (position != null && position!.isNotEmpty) 'position': position,
      if (hasPhotos) 'hasPhotos': true,
      if (hasFacePics) 'hasFacePics': true,
      if (hasAlbums) 'hasAlbums': true,
      if (lastSeen != null && lastSeen!.isNotEmpty) 'lastSeen': lastSeen,
      if (interests.isNotEmpty) 'interests': interests,
    };
  }

  Map<String, dynamic> toJson() => {
        'distanceKm': distanceKm,
        'minAge': minAge,
        'maxAge': maxAge,
        'hasPhotos': hasPhotos,
        'hasFacePics': hasFacePics,
        'hasAlbums': hasAlbums,
        'interests': interests,
        'position': position,
        'lastSeen': lastSeen,
      };

  factory DiscoveryFilters.fromJson(Map<String, dynamic> json) => DiscoveryFilters(
        distanceKm: (json['distanceKm'] as num?)?.toInt() ?? 50,
        minAge: (json['minAge'] as num?)?.toInt() ?? 18,
        maxAge: (json['maxAge'] as num?)?.toInt() ?? 99,
        hasPhotos: json['hasPhotos'] == true,
        hasFacePics: json['hasFacePics'] == true,
        hasAlbums: json['hasAlbums'] == true,
        interests: (json['interests'] as List?)?.whereType<String>().toList() ?? const [],
        position: json['position'] as String?,
        lastSeen: json['lastSeen'] as String?,
      );
}

class FiltersState {
  final DiscoveryFilters current;
  final List<DiscoveryFilters> saved; // up to 3
  const FiltersState({required this.current, this.saved = const []});

  FiltersState copyWith({DiscoveryFilters? current, List<DiscoveryFilters>? saved}) =>
      FiltersState(current: current ?? this.current, saved: saved ?? this.saved);
}

class DiscoveryFiltersController extends AutoDisposeAsyncNotifier<FiltersState> {
  static const _kFilters = 'discovery_filters_current';
  static const _kSaved = 'discovery_filters_saved';

  @override
  Future<FiltersState> build() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kFilters);
    final savedRaw = prefs.getString(_kSaved);
    DiscoveryFilters current = const DiscoveryFilters();
    List<DiscoveryFilters> saved = const [];
    try {
      if (raw != null) current = DiscoveryFilters.fromJson(jsonDecode(raw));
      if (savedRaw != null) {
        final list = (jsonDecode(savedRaw) as List?)?.cast<Map<String, dynamic>>() ?? const [];
        saved = list.map(DiscoveryFilters.fromJson).toList();
      }
    } catch (_) {}
    return FiltersState(current: current, saved: saved);
  }

  Future<void> _persist(FiltersState s) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kFilters, jsonEncode(s.current.toJson()));
    await prefs.setString(_kSaved, jsonEncode(s.saved.map((e) => e.toJson()).toList()));
  }

  void setFilters(DiscoveryFilters f) {
    final s = state.valueOrNull;
    if (s == null) return;
    final next = s.copyWith(current: f);
    state = AsyncData(next);
    _persist(next);
  }

  void savePreset() {
    final s = state.valueOrNull;
    if (s == null) return;
    final list = [...s.saved];
    if (list.length >= 3) list.removeAt(0);
    list.add(s.current);
    final next = s.copyWith(saved: list);
    state = AsyncData(next);
    _persist(next);
  }

  void applyPreset(int index) {
    final s = state.valueOrNull;
    if (s == null) return;
    if (index < 0 || index >= s.saved.length) return;
    final next = s.copyWith(current: s.saved[index]);
    state = AsyncData(next);
    _persist(next);
  }
}

final discoveryFiltersProvider = AutoDisposeAsyncNotifierProvider<DiscoveryFiltersController, FiltersState>(
  DiscoveryFiltersController.new,
);
