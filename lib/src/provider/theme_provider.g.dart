// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Theme provider using Riverpod 3.0 syntax

@ProviderFor(Theme)
const themeProvider = ThemeProvider._();

/// Theme provider using Riverpod 3.0 syntax
final class ThemeProvider extends $NotifierProvider<Theme, ThemeState> {
  /// Theme provider using Riverpod 3.0 syntax
  const ThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeHash();

  @$internal
  @override
  Theme create() => Theme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeState>(value),
    );
  }
}

String _$themeHash() => r'680f3a7a5d1b484ed2afb054c6a2d79fd715fce3';

/// Theme provider using Riverpod 3.0 syntax

abstract class _$Theme extends $Notifier<ThemeState> {
  ThemeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeState, ThemeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeState, ThemeState>,
              ThemeState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider for accessing current theme mode

@ProviderFor(themeMode)
const themeModeProvider = ThemeModeProvider._();

/// Provider for accessing current theme mode

final class ThemeModeProvider
    extends $FunctionalProvider<ThemeMode, ThemeMode, ThemeMode>
    with $Provider<ThemeMode> {
  /// Provider for accessing current theme mode
  const ThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeHash();

  @$internal
  @override
  $ProviderElement<ThemeMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeMode create(Ref ref) {
    return themeMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeModeHash() => r'1bcd9d7b5e497b928afa6343b9d383415e1ce587';

/// Provider for accessing current light theme

@ProviderFor(lightTheme)
const lightThemeProvider = LightThemeProvider._();

/// Provider for accessing current light theme

final class LightThemeProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  /// Provider for accessing current light theme
  const LightThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lightThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lightThemeHash();

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    return lightTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }
}

String _$lightThemeHash() => r'7328049d93c0d090151f2e12245446f8bdab79a2';

/// Provider for accessing current dark theme

@ProviderFor(darkTheme)
const darkThemeProvider = DarkThemeProvider._();

/// Provider for accessing current dark theme

final class DarkThemeProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  /// Provider for accessing current dark theme
  const DarkThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'darkThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$darkThemeHash();

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    return darkTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }
}

String _$darkThemeHash() => r'974a683dbd31e48d6e9037022634517b7b164880';

/// Provider for accessing theme preferences

@ProviderFor(themePreferences)
const themePreferencesProvider = ThemePreferencesProvider._();

/// Provider for accessing theme preferences

final class ThemePreferencesProvider
    extends
        $FunctionalProvider<
          ThemePreferences,
          ThemePreferences,
          ThemePreferences
        >
    with $Provider<ThemePreferences> {
  /// Provider for accessing theme preferences
  const ThemePreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themePreferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themePreferencesHash();

  @$internal
  @override
  $ProviderElement<ThemePreferences> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemePreferences create(Ref ref) {
    return themePreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemePreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemePreferences>(value),
    );
  }
}

String _$themePreferencesHash() => r'6f8eb0522761d10bc28de55a722c66c821d20f53';

/// Provider for checking if theme is loading

@ProviderFor(themeLoading)
const themeLoadingProvider = ThemeLoadingProvider._();

/// Provider for checking if theme is loading

final class ThemeLoadingProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Provider for checking if theme is loading
  const ThemeLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeLoadingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return themeLoading(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$themeLoadingHash() => r'4c9047829b5ac71d2bf8c880a0d74dd621a1731b';

/// Provider for theme error state

@ProviderFor(themeError)
const themeErrorProvider = ThemeErrorProvider._();

/// Provider for theme error state

final class ThemeErrorProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  /// Provider for theme error state
  const ThemeErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeErrorHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return themeError(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$themeErrorHash() => r'643ec2c264804c85f2431223b191eee87e775f7e';
