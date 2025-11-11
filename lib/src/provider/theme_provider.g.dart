// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeModeHash() => r'1bcd9d7b5e497b928afa6343b9d383415e1ce587';

/// Provider for accessing current theme mode
///
/// Copied from [themeMode].
@ProviderFor(themeMode)
final themeModeProvider = AutoDisposeProvider<ThemeMode>.internal(
  themeMode,
  name: r'themeModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemeModeRef = AutoDisposeProviderRef<ThemeMode>;
String _$lightThemeHash() => r'7328049d93c0d090151f2e12245446f8bdab79a2';

/// Provider for accessing current light theme
///
/// Copied from [lightTheme].
@ProviderFor(lightTheme)
final lightThemeProvider = AutoDisposeProvider<ThemeData>.internal(
  lightTheme,
  name: r'lightThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$lightThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LightThemeRef = AutoDisposeProviderRef<ThemeData>;
String _$darkThemeHash() => r'974a683dbd31e48d6e9037022634517b7b164880';

/// Provider for accessing current dark theme
///
/// Copied from [darkTheme].
@ProviderFor(darkTheme)
final darkThemeProvider = AutoDisposeProvider<ThemeData>.internal(
  darkTheme,
  name: r'darkThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$darkThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DarkThemeRef = AutoDisposeProviderRef<ThemeData>;
String _$themePreferencesHash() => r'6f8eb0522761d10bc28de55a722c66c821d20f53';

/// Provider for accessing theme preferences
///
/// Copied from [themePreferences].
@ProviderFor(themePreferences)
final themePreferencesProvider = AutoDisposeProvider<ThemePreferences>.internal(
  themePreferences,
  name: r'themePreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themePreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemePreferencesRef = AutoDisposeProviderRef<ThemePreferences>;
String _$themeLoadingHash() => r'4c9047829b5ac71d2bf8c880a0d74dd621a1731b';

/// Provider for checking if theme is loading
///
/// Copied from [themeLoading].
@ProviderFor(themeLoading)
final themeLoadingProvider = AutoDisposeProvider<bool>.internal(
  themeLoading,
  name: r'themeLoadingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemeLoadingRef = AutoDisposeProviderRef<bool>;
String _$themeErrorHash() => r'643ec2c264804c85f2431223b191eee87e775f7e';

/// Provider for theme error state
///
/// Copied from [themeError].
@ProviderFor(themeError)
final themeErrorProvider = AutoDisposeProvider<String?>.internal(
  themeError,
  name: r'themeErrorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemeErrorRef = AutoDisposeProviderRef<String?>;
String _$themeHash() => r'680f3a7a5d1b484ed2afb054c6a2d79fd715fce3';

/// Theme provider using Riverpod 3.0 syntax
///
/// Copied from [Theme].
@ProviderFor(Theme)
final themeProvider = NotifierProvider<Theme, ThemeState>.internal(
  Theme.new,
  name: r'themeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Theme = Notifier<ThemeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
