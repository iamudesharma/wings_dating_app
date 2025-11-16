import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

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
        const ListEquality().equals(other.interests, interests) &&
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
      const ListEquality().hash(interests),
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
    // Set up lifecycle management for cleanup
    ref.onDispose(() {
      // Could save filters to persistence here if needed
      print('UserFilters disposed - cleanup logic here');
    });
    return const FiltersModel();
  }

  // Toggle filter enabled/disabled
  void toggleEnabled() {
    state = state.copyWith(enabled: !state.enabled);
  }

  // Update individual filter properties with validation
  void updateAgeRange(String ageRange) {
    if (ageRange.isNotEmpty) {
      state = state.copyWith(ageRange: ageRange);
    }
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
    // Validate distance range
    if (distance >= 0 && distance <= 500) {
      state = state.copyWith(distance: distance);
    }
  }

  void updateLastSeen(String lastSeen) {
    state = state.copyWith(lastSeen: lastSeen);
  }

  void updateInterests(List<String> interests) {
    // Create a defensive copy to ensure immutability
    state = state.copyWith(interests: List<String>.unmodifiable(interests));
  }

  void addInterest(String interest) {
    if (interest.isNotEmpty && !state.interests.contains(interest)) {
      final newInterests = [...state.interests, interest];
      state =
          state.copyWith(interests: List<String>.unmodifiable(newInterests));
    }
  }

  void removeInterest(String interest) {
    if (state.interests.contains(interest)) {
      final newInterests = state.interests.where((i) => i != interest).toList();
      state =
          state.copyWith(interests: List<String>.unmodifiable(newInterests));
    }
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
    try {
      state = FiltersModel(
        enabled: filterMap['enabled'] as bool? ?? false,
        ageRange: filterMap['ageRange'] as String? ?? '18 - 22 yrs',
        position: filterMap['position'] as String? ?? '',
        hasPhotos: filterMap['hasPhotos'] as bool? ?? false,
        hasFacePics: filterMap['hasFacePics'] as bool? ?? false,
        hasAlbums: filterMap['hasAlbums'] as bool? ?? false,
        distance: (filterMap['distance'] as num?)?.toDouble() ?? 10.0,
        lastSeen: filterMap['lastSeen'] as String? ?? '',
        interests: List<String>.unmodifiable(
          (filterMap['interests'] as List<dynamic>?)?.cast<String>() ??
              <String>[],
        ),
        heightRange: filterMap['heightRange'] as String? ?? '',
        weightRange: filterMap['weightRange'] as String? ?? '',
        language: filterMap['language'] as String? ?? '',
      );
    } catch (e) {
      // If loading fails, reset to default
      print('Error loading filters from map: $e');
      resetFilters();
    }
  }

  // Check if any filters are active (useful for UI state)
  bool get hasActiveFilters {
    final defaultFilters = const FiltersModel();
    return state != defaultFilters;
  }

  // Get a summary of active filters for display
  String get activeFiltersSummary {
    final activeFilters = <String>[];

    if (state.enabled) activeFilters.add('Enabled');
    if (state.ageRange != '18 - 22 yrs') {
      activeFilters.add('Age: ${state.ageRange}');
    }
    if (state.position.isNotEmpty) {
      activeFilters.add('Position: ${state.position}');
    }
    if (state.hasPhotos) activeFilters.add('Has Photos');
    if (state.hasFacePics) activeFilters.add('Has Face Pics');
    if (state.hasAlbums) activeFilters.add('Has Albums');
    if (state.distance != 10.0) {
      activeFilters.add('Distance: ${state.distance.toInt()}km');
    }
    if (state.lastSeen.isNotEmpty) {
      activeFilters.add('Last Seen: ${state.lastSeen}');
    }
    if (state.interests.isNotEmpty) {
      activeFilters.add('Interests: ${state.interests.length}');
    }
    if (state.heightRange.isNotEmpty) {
      activeFilters.add('Height: ${state.heightRange}');
    }
    if (state.weightRange.isNotEmpty) {
      activeFilters.add('Weight: ${state.weightRange}');
    }
    if (state.language.isNotEmpty) {
      activeFilters.add('Language: ${state.language}');
    }

    return activeFilters.isEmpty
        ? 'No filters active'
        : activeFilters.join(', ');
  }
}

// Provider for filter options (constants) - using keepAlive for performance
@Riverpod(keepAlive: true)
List<String> positions(Ref ref) {
  return const [
    'Top',
    'Vers Top',
    'Versatile',
    'Vers Bottom',
    'Bottom',
    'Side',
    'Not Specified'
  ];
}

@Riverpod(keepAlive: true)
List<String> ageRanges(Ref ref) {
  return const ['18 - 22 yrs', '23 - 30 yrs', '31 - 40 yrs', '41+ yrs'];
}

@Riverpod(keepAlive: true)
List<String> lastSeenOptions(Ref ref) {
  return const ['Online now', 'Last 24 hours', 'Last 7 days', 'Last 30 days'];
}

@Riverpod(keepAlive: true)
List<String> interestOptions(Ref ref) {
  return const [
    'Travel',
    'Music',
    'Fitness',
    'Reading',
    'Gaming',
    'Cooking',
    'Art',
    'Sports',
    'Movies',
    'Technology'
  ];
}

@Riverpod(keepAlive: true)
List<String> heightRanges(Ref ref) {
  return const [
    '< 5\'5"',
    '5\'5" - 5\'10"',
    '5\'11" - 6\'2"',
    '6\'3" and above'
  ];
}

@Riverpod(keepAlive: true)
List<String> weightRanges(Ref ref) {
  return const ['< 60kg', '60 - 75kg', '76 - 90kg', '90kg+'];
}

@Riverpod(keepAlive: true)
List<String> languageOptions(Ref ref) {
  return const [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Portuguese',
    'Italian'
  ];
}

// Computed providers based on filter state
@riverpod
bool hasActiveFilters(Ref ref) {
  final filters = ref.watch(userFiltersProvider);
  final defaultFilters = const FiltersModel();
  return filters != defaultFilters;
}

@riverpod
int activeFiltersCount(Ref ref) {
  final filters = ref.watch(userFiltersProvider);
  final defaultFilters = const FiltersModel();
  int count = 0;
  if (filters.enabled != defaultFilters.enabled) count++;
  if (filters.ageRange != defaultFilters.ageRange) count++;
  if (filters.position != defaultFilters.position) count++;
  if (filters.hasPhotos != defaultFilters.hasPhotos) count++;
  if (filters.hasFacePics != defaultFilters.hasFacePics) count++;
  if (filters.hasAlbums != defaultFilters.hasAlbums) count++;
  if (filters.distance != defaultFilters.distance) count++;
  if (filters.lastSeen != defaultFilters.lastSeen) count++;
  if (filters.interests.isNotEmpty) count++;
  if (filters.heightRange != defaultFilters.heightRange) count++;
  if (filters.weightRange != defaultFilters.weightRange) count++;
  if (filters.language != defaultFilters.language) count++;
  return count;
}

@riverpod
String filtersDisplayText(Ref ref) {
  final count = ref.watch(activeFiltersCountProvider);
  if (count == 0) return 'No filters';
  if (count == 1) return '1 filter active';
  return '$count filters active';
}

// Additional provider for filter validation
@riverpod
bool isValidFilterConfiguration(Ref ref) {
  final filters = ref.watch(userFiltersProvider);

  // Basic validation rules
  if (filters.distance < 0 || filters.distance > 500) return false;
  if (filters.ageRange.isEmpty) return false;

  return true;
}

// Provider for formatted filter summary
@riverpod
Map<String, String> formattedFiltersSummary(Ref ref) {
  final filters = ref.watch(userFiltersProvider);
  final summary = <String, String>{};

  if (filters.enabled) summary['Status'] = 'Enabled';
  if (filters.ageRange != '18 - 22 yrs') {
    summary['Age Range'] = filters.ageRange;
  }
  if (filters.position.isNotEmpty) summary['Position'] = filters.position;
  if (filters.distance != 10.0) {
    summary['Distance'] = '${filters.distance.toInt()}km';
  }
  if (filters.interests.isNotEmpty) {
    summary['Interests'] = filters.interests.length > 3
        ? '${filters.interests.take(3).join(', ')}...'
        : filters.interests.join(', ');
  }
  if (filters.heightRange.isNotEmpty) summary['Height'] = filters.heightRange;
  if (filters.weightRange.isNotEmpty) summary['Weight'] = filters.weightRange;
  if (filters.language.isNotEmpty) summary['Language'] = filters.language;
  if (filters.lastSeen.isNotEmpty) summary['Last Seen'] = filters.lastSeen;
  return summary;
}

// Provider for checking if specific filter types are active
@riverpod
bool hasLocationFilters(Ref ref) {
  final filters = ref.watch(userFiltersProvider);
  return filters.distance != 10.0; // Assuming 10.0 is default
}

@riverpod
bool hasPhysicalFilters(Ref ref) {
  final filters = ref.watch(userFiltersProvider);
  return filters.heightRange.isNotEmpty || filters.weightRange.isNotEmpty;
}

@riverpod
bool hasPreferenceFilters(Ref ref) {
  final filters = ref.watch(userFiltersProvider);
  return filters.position.isNotEmpty ||
      filters.hasPhotos ||
      filters.hasFacePics ||
      filters.hasAlbums;
}

// Provider for filter persistence (following Riverpod best practices)
@riverpod
class FiltersPersistence extends _$FiltersPersistence {
  @override
  bool build() {
    // Initialize persistence monitoring
    ref.listen(userFiltersProvider, (previous, next) {
      _saveFilters(next);
    });

    return true; // Indicates persistence is ready
  }

  void _saveFilters(FiltersModel filters) {
    // In a real app, this would save to SharedPreferences, Hive, etc.
    print('Saving filters: ${filters.toMap()}');
  }
  Future<FiltersModel?> loadSavedFilters() async {
    try {
      // In a real app, this would load from SharedPreferences, Hive, etc.
      // For now, return null to indicate no saved filters
      return null;
    } catch (e) {
      print('Error loading saved filters: $e');
      return null;
    }
  }
  Future<void> clearSavedFilters() async {
    try {
      // In a real app, this would clear from SharedPreferences, Hive, etc.
      print('Clearing saved filters');
    } catch (e) {
      print('Error clearing saved filters: $e');
    }
  }
}

// Provider for filter analytics/metrics (following Riverpod patterns)
@riverpod
class FiltersAnalytics extends _$FiltersAnalytics {
  @override
  Map<String, int> build() {
    // Track filter usage metrics
    final initialMetrics = <String, int>{
      'totalChanges': 0,
      'enabledToggle': 0,
      'ageRangeChanges': 0,
      'positionChanges': 0,
      'distanceChanges': 0,
      'interestChanges': 0,
    };
    // Listen to filter changes for analytics
    ref.listen(userFiltersProvider, (previous, next) {
      if (previous != null) {
        _trackFilterChange(previous, next);
      }
    });

    return initialMetrics;
  }

  void _trackFilterChange(FiltersModel previous, FiltersModel current) {
    final currentMetrics = Map<String, int>.from(state);
    currentMetrics['totalChanges'] = (currentMetrics['totalChanges'] ?? 0) + 1;

    if (previous.enabled != current.enabled) {
      currentMetrics['enabledToggle'] =
          (currentMetrics['enabledToggle'] ?? 0) + 1;
    }
    if (previous.ageRange != current.ageRange) {
      currentMetrics['ageRangeChanges'] =
          (currentMetrics['ageRangeChanges'] ?? 0) + 1;
    }
    if (previous.position != current.position) {
      currentMetrics['positionChanges'] =
          (currentMetrics['positionChanges'] ?? 0) + 1;
    }
    if (previous.distance != current.distance) {
      currentMetrics['distanceChanges'] =
          (currentMetrics['distanceChanges'] ?? 0) + 1;
    }
    if (!const ListEquality().equals(previous.interests, current.interests)) {
      currentMetrics['interestChanges'] =
          (currentMetrics['interestChanges'] ?? 0) + 1;
    }

    state = currentMetrics;
  }

  void resetMetrics() {
    state = {
      'totalChanges': 0,
      'enabledToggle': 0,
      'ageRangeChanges': 0,
      'positionChanges': 0,
      'distanceChanges': 0,
      'interestChanges': 0,
    };
  }
}

// Provider for filter recommendations based on user behavior
@riverpod
List<String> filterRecommendations(Ref ref) {
  final filters = ref.watch(userFiltersProvider);
  final analytics = ref.watch(filtersAnalyticsProvider);
  final recommendations = <String>[];
  // Provide smart recommendations based on current state
  if (!filters.enabled) {
    recommendations.add('Enable filters to find better matches');
  }

  if (filters.interests.isEmpty) {
    recommendations.add('Add interests to find people with similar hobbies');
  }

  if (filters.distance == 10.0 && (analytics['distanceChanges'] ?? 0) == 0) {
    recommendations.add('Adjust distance to see more or fewer matches');
  }

  if (filters.ageRange == '18 - 22 yrs' &&
      (analytics['ageRangeChanges'] ?? 0) == 0) {
    recommendations.add('Consider expanding your age range');
  }

  if (filters.position.isEmpty) {
    recommendations
        .add('Specify position preferences for better compatibility');
  }

  return recommendations;
}

// Advanced computed provider for filter complexity score
@riverpod
double filterComplexityScore(Ref ref) {
  final filters = ref.watch(userFiltersProvider);
  double score = 0.0;
  // Calculate complexity based on active filters
  if (filters.enabled) score += 1.0;
  if (filters.ageRange != '18 - 22 yrs') score += 0.5;
  if (filters.position.isNotEmpty) score += 0.8;
  if (filters.hasPhotos) score += 0.3;
  if (filters.hasFacePics) score += 0.3;
  if (filters.hasAlbums) score += 0.3;
  if (filters.distance != 10.0) score += 0.7;
  if (filters.lastSeen.isNotEmpty) score += 0.6;
  if (filters.interests.isNotEmpty) score += 0.4 * filters.interests.length;
  if (filters.heightRange.isNotEmpty) score += 0.4;
  if (filters.weightRange.isNotEmpty) score += 0.4;
  if (filters.language.isNotEmpty) score += 0.5;
  return score;
}

// Provider for estimated match count based on filters
@riverpod
String estimatedMatchCount(Ref ref) {
  final complexity = ref.watch(filterComplexityScoreProvider);
  // Simulate match count estimation based on filter complexity
  if (complexity == 0) return '1000+ matches';
  if (complexity <= 1.0) return '500-1000 matches';
  if (complexity <= 2.0) return '200-500 matches';
  if (complexity <= 3.0) return '50-200 matches';
  if (complexity <= 4.0) return '10-50 matches';
  return 'Less than 10 matches';
}
