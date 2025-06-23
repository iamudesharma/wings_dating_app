import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filters_provider.g.dart';

// Model class for filter data
class FiltersModel {
  final bool enabled;
  final String ageRange;
  final String position;
  final bool hasPhotos;
  final bool hasFacePics;
  final bool hasAlbums;
  final double distance;
  final String lastSeen;
  final List<String> interests;
  final String heightRange;
  final String weightRange;
  final String language;

  const FiltersModel({
    this.enabled = false,
    this.ageRange = '18 - 22 yrs',
    this.position = '',
    this.hasPhotos = false,
    this.hasFacePics = false,
    this.hasAlbums = false,
    this.distance = 10.0,
    this.lastSeen = '',
    this.interests = const [],
    this.heightRange = '',
    this.weightRange = '',
    this.language = '',
  });

  FiltersModel copyWith({
    bool? enabled,
    String? ageRange,
    String? position,
    bool? hasPhotos,
    bool? hasFacePics,
    bool? hasAlbums,
    double? distance,
    String? lastSeen,
    List<String>? interests,
    String? heightRange,
    String? weightRange,
    String? language,
  }) {
    return FiltersModel(
      enabled: enabled ?? this.enabled,
      ageRange: ageRange ?? this.ageRange,
      position: position ?? this.position,
      hasPhotos: hasPhotos ?? this.hasPhotos,
      hasFacePics: hasFacePics ?? this.hasFacePics,
      hasAlbums: hasAlbums ?? this.hasAlbums,
      distance: distance ?? this.distance,
      lastSeen: lastSeen ?? this.lastSeen,
      interests: interests ?? this.interests,
      heightRange: heightRange ?? this.heightRange,
      weightRange: weightRange ?? this.weightRange,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enabled': enabled,
      'ageRange': ageRange,
      'position': position,
      'hasPhotos': hasPhotos,
      'hasFacePics': hasFacePics,
      'hasAlbums': hasAlbums,
      'distance': distance.round(),
      'lastSeen': lastSeen,
      'interests': interests,
      'heightRange': heightRange,
      'weightRange': weightRange,
      'language': language,
    };
  }

  @override
  String toString() {
    return 'FiltersModel(enabled: $enabled, ageRange: $ageRange, position: $position, hasPhotos: $hasPhotos, hasFacePics: $hasFacePics, hasAlbums: $hasAlbums, distance: $distance, lastSeen: $lastSeen, interests: $interests, heightRange: $heightRange, weightRange: $weightRange, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FiltersModel &&
        other.enabled == enabled &&
        other.ageRange == ageRange &&
        other.position == position &&
        other.hasPhotos == hasPhotos &&
        other.hasFacePics == hasFacePics &&
        other.hasAlbums == hasAlbums &&
        other.distance == distance &&
        other.lastSeen == lastSeen &&
        other.interests.length == interests.length &&
        other.interests.every(interests.contains) &&
        other.heightRange == heightRange &&
        other.weightRange == weightRange &&
        other.language == language;
  }

  @override
  int get hashCode {
    return Object.hash(
      enabled,
      ageRange,
      position,
      hasPhotos,
      hasFacePics,
      hasAlbums,
      distance,
      lastSeen,
      interests,
      heightRange,
      weightRange,
      language,
    );
  }
}

@riverpod
class UserFilters extends _$UserFilters {
  @override
  FiltersModel build() {
    return const FiltersModel();
  }

  // Toggle filter enabled/disabled
  void toggleEnabled() {
    state = state.copyWith(enabled: !state.enabled);
  }

  // Update individual filter properties
  void updateAgeRange(String ageRange) {
    state = state.copyWith(ageRange: ageRange);
  }

  void updatePosition(String position) {
    state = state.copyWith(position: position);
  }

  void updateHasPhotos(bool hasPhotos) {
    state = state.copyWith(hasPhotos: hasPhotos);
  }

  void updateHasFacePics(bool hasFacePics) {
    state = state.copyWith(hasFacePics: hasFacePics);
  }

  void updateHasAlbums(bool hasAlbums) {
    state = state.copyWith(hasAlbums: hasAlbums);
  }

  void updateDistance(double distance) {
    state = state.copyWith(distance: distance);
  }

  void updateLastSeen(String lastSeen) {
    state = state.copyWith(lastSeen: lastSeen);
  }

  void updateInterests(List<String> interests) {
    state = state.copyWith(interests: List.from(interests));
  }

  void addInterest(String interest) {
    if (!state.interests.contains(interest)) {
      final newInterests = [...state.interests, interest];
      state = state.copyWith(interests: newInterests);
    }
  }

  void removeInterest(String interest) {
    final newInterests = state.interests.where((i) => i != interest).toList();
    state = state.copyWith(interests: newInterests);
  }

  void updateHeightRange(String heightRange) {
    state = state.copyWith(heightRange: heightRange);
  }

  void updateWeightRange(String weightRange) {
    state = state.copyWith(weightRange: weightRange);
  }

  void updateLanguage(String language) {
    state = state.copyWith(language: language);
  }

  // Reset all filters to default
  void resetFilters() {
    state = const FiltersModel();
  }

  // Apply all filters and return as Map for the API
  Map<String, dynamic> applyFilters() {
    return state.toMap();
  }

  // Load filters from a Map (useful for restoring state)
  void loadFromMap(Map<String, dynamic> filterMap) {
    state = FiltersModel(
      enabled: filterMap['enabled'] ?? false,
      ageRange: filterMap['ageRange'] ?? '18 - 22 yrs',
      position: filterMap['position'] ?? '',
      hasPhotos: filterMap['hasPhotos'] ?? false,
      hasFacePics: filterMap['hasFacePics'] ?? false,
      hasAlbums: filterMap['hasAlbums'] ?? false,
      distance: (filterMap['distance'] ?? 10).toDouble(),
      lastSeen: filterMap['lastSeen'] ?? '',
      interests: List<String>.from(filterMap['interests'] ?? []),
      heightRange: filterMap['heightRange'] ?? '',
      weightRange: filterMap['weightRange'] ?? '',
      language: filterMap['language'] ?? '',
    );
  }
}

// Provider for filter options (constants)
@riverpod
List<String> positions(Ref ref) {
  return ['Top', 'Vers Top', 'Versatile', 'Vers Bottom', 'Bottom', 'Side', 'Not Specified'];
}

@riverpod
List<String> ageRanges(Ref ref) {
  return ['18 - 22 yrs', '23 - 30 yrs', '31 - 40 yrs', '41+ yrs'];
}

@riverpod
List<String> lastSeenOptions(Ref ref) {
  return ['Online now', 'Last 24 hours', 'Last 7 days', 'Last 30 days'];
}

@riverpod
List<String> interestOptions(Ref ref) {
  return ['Travel', 'Music', 'Fitness', 'Reading', 'Gaming', 'Cooking'];
}

@riverpod
List<String> heightRanges(Ref ref) {
  return ['< 5\'5"', '5\'5" - 5\'10"', '5\'11" - 6\'2"', '6\'3" and above'];
}

@riverpod
List<String> weightRanges(Ref ref) {
  return ['< 60kg', '60 - 75kg', '76 - 90kg', '90kg+'];
}

@riverpod
List<String> languageOptions(Ref ref) {
  return ['English', 'Spanish', 'French', 'German', 'Chinese'];
}
