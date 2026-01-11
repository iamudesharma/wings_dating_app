// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserFilters)
final userFiltersProvider = UserFiltersProvider._();

final class UserFiltersProvider
    extends $NotifierProvider<UserFilters, FiltersModel> {
  UserFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userFiltersHash();

  @$internal
  @override
  UserFilters create() => UserFilters();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FiltersModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FiltersModel>(value),
    );
  }
}

String _$userFiltersHash() => r'deeb8ec05a2a00ed083bc871dc91fba340a08dce';

abstract class _$UserFilters extends $Notifier<FiltersModel> {
  FiltersModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FiltersModel, FiltersModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FiltersModel, FiltersModel>,
              FiltersModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(positions)
final positionsProvider = PositionsProvider._();

final class PositionsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  PositionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'positionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$positionsHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return positions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$positionsHash() => r'9ebf128cddd088581f6c19a9c83d7aeaff3cbb72';

@ProviderFor(ageRanges)
final ageRangesProvider = AgeRangesProvider._();

final class AgeRangesProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  AgeRangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ageRangesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ageRangesHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return ageRanges(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$ageRangesHash() => r'fc82a83613f84a2ce8ef5269dc77eabd6065e76e';

@ProviderFor(lastSeenOptions)
final lastSeenOptionsProvider = LastSeenOptionsProvider._();

final class LastSeenOptionsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  LastSeenOptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lastSeenOptionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lastSeenOptionsHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return lastSeenOptions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$lastSeenOptionsHash() => r'c1ce7f654660cd27cf5565b676c842f2f66e52f5';

@ProviderFor(interestOptions)
final interestOptionsProvider = InterestOptionsProvider._();

final class InterestOptionsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  InterestOptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'interestOptionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$interestOptionsHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return interestOptions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$interestOptionsHash() => r'00470885f031f43c560d441e4a23165490d69543';

@ProviderFor(heightRanges)
final heightRangesProvider = HeightRangesProvider._();

final class HeightRangesProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  HeightRangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'heightRangesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$heightRangesHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return heightRanges(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$heightRangesHash() => r'435c8c340d88de7e43650e3ab2c37cca82e3c5a0';

@ProviderFor(weightRanges)
final weightRangesProvider = WeightRangesProvider._();

final class WeightRangesProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  WeightRangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weightRangesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weightRangesHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return weightRanges(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$weightRangesHash() => r'20af1876aac5bfc74e4a3eb9b9796c17aaffcb40';

@ProviderFor(languageOptions)
final languageOptionsProvider = LanguageOptionsProvider._();

final class LanguageOptionsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  LanguageOptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageOptionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageOptionsHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return languageOptions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$languageOptionsHash() => r'3581d62666ee9e4c5df5b261377aee5e7078d71b';

@ProviderFor(hasActiveFilters)
final hasActiveFiltersProvider = HasActiveFiltersProvider._();

final class HasActiveFiltersProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  HasActiveFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasActiveFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasActiveFiltersHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasActiveFilters(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasActiveFiltersHash() => r'4fb53fc963f3e9fff6337e42a6539ab2584e84fd';

@ProviderFor(activeFiltersCount)
final activeFiltersCountProvider = ActiveFiltersCountProvider._();

final class ActiveFiltersCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  ActiveFiltersCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeFiltersCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeFiltersCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return activeFiltersCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$activeFiltersCountHash() =>
    r'fe2f7718e298bb4e463ed56573532b8bfafed2f3';

@ProviderFor(filtersDisplayText)
final filtersDisplayTextProvider = FiltersDisplayTextProvider._();

final class FiltersDisplayTextProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  FiltersDisplayTextProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filtersDisplayTextProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filtersDisplayTextHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return filtersDisplayText(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$filtersDisplayTextHash() =>
    r'6fea178c0a8cb61ed8103d0ede38a1943376d31b';

@ProviderFor(isValidFilterConfiguration)
final isValidFilterConfigurationProvider =
    IsValidFilterConfigurationProvider._();

final class IsValidFilterConfigurationProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsValidFilterConfigurationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isValidFilterConfigurationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isValidFilterConfigurationHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isValidFilterConfiguration(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isValidFilterConfigurationHash() =>
    r'd6c6b816e689f3d36dd0a12fac4dcd5bbe242277';

@ProviderFor(formattedFiltersSummary)
final formattedFiltersSummaryProvider = FormattedFiltersSummaryProvider._();

final class FormattedFiltersSummaryProvider
    extends
        $FunctionalProvider<
          Map<String, String>,
          Map<String, String>,
          Map<String, String>
        >
    with $Provider<Map<String, String>> {
  FormattedFiltersSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'formattedFiltersSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$formattedFiltersSummaryHash();

  @$internal
  @override
  $ProviderElement<Map<String, String>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, String> create(Ref ref) {
    return formattedFiltersSummary(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, String>>(value),
    );
  }
}

String _$formattedFiltersSummaryHash() =>
    r'bd3713c1b2d8b8c74baca1a5a50791acd98934a3';

@ProviderFor(hasLocationFilters)
final hasLocationFiltersProvider = HasLocationFiltersProvider._();

final class HasLocationFiltersProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  HasLocationFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasLocationFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasLocationFiltersHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasLocationFilters(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasLocationFiltersHash() =>
    r'3667a7b26581f32cec0f24da6938e9a61023c63c';

@ProviderFor(hasPhysicalFilters)
final hasPhysicalFiltersProvider = HasPhysicalFiltersProvider._();

final class HasPhysicalFiltersProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  HasPhysicalFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasPhysicalFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasPhysicalFiltersHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasPhysicalFilters(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasPhysicalFiltersHash() =>
    r'c1041a5b9b033b6f5fabbc6279736919771013d4';

@ProviderFor(hasPreferenceFilters)
final hasPreferenceFiltersProvider = HasPreferenceFiltersProvider._();

final class HasPreferenceFiltersProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  HasPreferenceFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasPreferenceFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasPreferenceFiltersHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasPreferenceFilters(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasPreferenceFiltersHash() =>
    r'4acbe64144a208caf477769d04ac01f93fb3cb03';

@ProviderFor(FiltersPersistence)
final filtersPersistenceProvider = FiltersPersistenceProvider._();

final class FiltersPersistenceProvider
    extends $NotifierProvider<FiltersPersistence, bool> {
  FiltersPersistenceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filtersPersistenceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filtersPersistenceHash();

  @$internal
  @override
  FiltersPersistence create() => FiltersPersistence();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$filtersPersistenceHash() =>
    r'bc28fb6eccca1143380d9dc525c31c6993257e6a';

abstract class _$FiltersPersistence extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(FiltersAnalytics)
final filtersAnalyticsProvider = FiltersAnalyticsProvider._();

final class FiltersAnalyticsProvider
    extends $NotifierProvider<FiltersAnalytics, Map<String, int>> {
  FiltersAnalyticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filtersAnalyticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filtersAnalyticsHash();

  @$internal
  @override
  FiltersAnalytics create() => FiltersAnalytics();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, int>>(value),
    );
  }
}

String _$filtersAnalyticsHash() => r'2781d826b205eb571afc739ce5ad0e4482e03577';

abstract class _$FiltersAnalytics extends $Notifier<Map<String, int>> {
  Map<String, int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<String, int>, Map<String, int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, int>, Map<String, int>>,
              Map<String, int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filterRecommendations)
final filterRecommendationsProvider = FilterRecommendationsProvider._();

final class FilterRecommendationsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  FilterRecommendationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filterRecommendationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filterRecommendationsHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return filterRecommendations(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$filterRecommendationsHash() =>
    r'7e9014f983d2bdf8d8b818e5c30f0f925933ed40';

@ProviderFor(filterComplexityScore)
final filterComplexityScoreProvider = FilterComplexityScoreProvider._();

final class FilterComplexityScoreProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  FilterComplexityScoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filterComplexityScoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filterComplexityScoreHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return filterComplexityScore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$filterComplexityScoreHash() =>
    r'fbe2d4d32e3d3587bcf632c20e3cebbbd7213766';

@ProviderFor(estimatedMatchCount)
final estimatedMatchCountProvider = EstimatedMatchCountProvider._();

final class EstimatedMatchCountProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  EstimatedMatchCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'estimatedMatchCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$estimatedMatchCountHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return estimatedMatchCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$estimatedMatchCountHash() =>
    r'67cee8a2ae6c161f64b832920ebf761b169a4fd1';
