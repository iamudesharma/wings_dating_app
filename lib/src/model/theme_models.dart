import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Available theme modes
enum ThemeModeType {
  system,
  light,
  dark,
}

/// Available color schemes
enum ColorSchemeType {
  deepPurple,
  blue,
  indigo,
  red,
  custom,
}

/// Theme preferences model
class ThemePreferences {
  final ThemeModeType themeMode;
  final ColorSchemeType colorScheme;
  final bool useMaterial3;
  final bool useFlexColorScheme;
  final int blendLevel;
  final double appBarOpacity;
  final String? customPrimaryColor;
  final String? customSecondaryColor;
  final String? customTertiaryColor;
  final bool enableAnimations;
  final double inputDecoratorRadius;
  final double cardRadius;

  const ThemePreferences({
    this.themeMode = ThemeModeType.system,
    this.colorScheme = ColorSchemeType.deepPurple,
    this.useMaterial3 = true,
    this.useFlexColorScheme = true,
    this.blendLevel = 20,
    this.appBarOpacity = 0.95,
    this.customPrimaryColor,
    this.customSecondaryColor,
    this.customTertiaryColor,
    this.enableAnimations = true,
    this.inputDecoratorRadius = 12.0,
    this.cardRadius = 16.0,
  });

  /// Get the actual ThemeMode from ThemeModeType
  ThemeMode get actualThemeMode {
    switch (themeMode) {
      case ThemeModeType.light:
        return ThemeMode.light;
      case ThemeModeType.dark:
        return ThemeMode.dark;
      case ThemeModeType.system:
        return ThemeMode.system;
    }
  }

  /// Get FlexScheme from ColorSchemeType
  FlexScheme get flexScheme {
    switch (colorScheme) {
      case ColorSchemeType.blue:
        return FlexScheme.blue;
      case ColorSchemeType.indigo:
        return FlexScheme.indigo;
      case ColorSchemeType.red:
        return FlexScheme.red;
      case ColorSchemeType.custom:
        // For custom, we'll use deepPurple as base and override with custom colors
        return FlexScheme.deepPurple;
      case ColorSchemeType.deepPurple:
        return FlexScheme.deepPurple;
    }
  }

  /// Create a copy with custom colors if available
  ThemePreferences copyWith({
    ThemeModeType? themeMode,
    ColorSchemeType? colorScheme,
    bool? useMaterial3,
    bool? useFlexColorScheme,
    int? blendLevel,
    double? appBarOpacity,
    String? customPrimaryColor,
    String? customSecondaryColor,
    String? customTertiaryColor,
    bool? enableAnimations,
    double? inputDecoratorRadius,
    double? cardRadius,
  }) {
    return ThemePreferences(
      themeMode: themeMode ?? this.themeMode,
      colorScheme: colorScheme ?? this.colorScheme,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      useFlexColorScheme: useFlexColorScheme ?? this.useFlexColorScheme,
      blendLevel: blendLevel ?? this.blendLevel,
      appBarOpacity: appBarOpacity ?? this.appBarOpacity,
      customPrimaryColor: customPrimaryColor ?? this.customPrimaryColor,
      customSecondaryColor: customSecondaryColor ?? this.customSecondaryColor,
      customTertiaryColor: customTertiaryColor ?? this.customTertiaryColor,
      enableAnimations: enableAnimations ?? this.enableAnimations,
      inputDecoratorRadius: inputDecoratorRadius ?? this.inputDecoratorRadius,
      cardRadius: cardRadius ?? this.cardRadius,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.name,
      'colorScheme': colorScheme.name,
      'useMaterial3': useMaterial3,
      'useFlexColorScheme': useFlexColorScheme,
      'blendLevel': blendLevel,
      'appBarOpacity': appBarOpacity,
      'customPrimaryColor': customPrimaryColor,
      'customSecondaryColor': customSecondaryColor,
      'customTertiaryColor': customTertiaryColor,
      'enableAnimations': enableAnimations,
      'inputDecoratorRadius': inputDecoratorRadius,
      'cardRadius': cardRadius,
    };
  }

  /// Create from JSON
  factory ThemePreferences.fromJson(Map<String, dynamic> json) {
    return ThemePreferences(
      themeMode: ThemeModeType.values.firstWhere(
        (e) => e.name == json['themeMode'],
        orElse: () => ThemeModeType.system,
      ),
      colorScheme: ColorSchemeType.values.firstWhere(
        (e) => e.name == json['colorScheme'],
        orElse: () => ColorSchemeType.deepPurple,
      ),
      useMaterial3: json['useMaterial3'] ?? true,
      useFlexColorScheme: json['useFlexColorScheme'] ?? true,
      blendLevel: json['blendLevel'] ?? 20,
      appBarOpacity: json['appBarOpacity'] ?? 0.95,
      customPrimaryColor: json['customPrimaryColor'],
      customSecondaryColor: json['customSecondaryColor'],
      customTertiaryColor: json['customTertiaryColor'],
      enableAnimations: json['enableAnimations'] ?? true,
      inputDecoratorRadius: json['inputDecoratorRadius'] ?? 12.0,
      cardRadius: json['cardRadius'] ?? 16.0,
    );
  }
}

/// Theme state for the app
class ThemeState {
  final ThemePreferences preferences;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final bool isLoading;
  final String? error;

  const ThemeState({
    required this.preferences,
    required this.lightTheme,
    required this.darkTheme,
    this.isLoading = false,
    this.error,
  });

  /// Create default theme state
  factory ThemeState.defaultState() {
    const defaultPrefs = ThemePreferences();
    return ThemeState(
      preferences: defaultPrefs,
      lightTheme: _createLightTheme(defaultPrefs),
      darkTheme: _createDarkTheme(defaultPrefs),
    );
  }

  /// Create theme state from preferences
  factory ThemeState.fromPreferences(ThemePreferences preferences) {
    return ThemeState(
      preferences: preferences,
      lightTheme: _createLightTheme(preferences),
      darkTheme: _createDarkTheme(preferences),
    );
  }

  /// Create copy with loading state
  ThemeState copyWith({
    ThemePreferences? preferences,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    bool? isLoading,
    String? error,
  }) {
    return ThemeState(
      preferences: preferences ?? this.preferences,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// Create light theme from preferences
ThemeData _createLightTheme(ThemePreferences prefs) {
  return FlexThemeData.light(
    lightIsWhite: true,
    scheme: prefs.flexScheme,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: prefs.blendLevel,
    appBarOpacity: prefs.appBarOpacity,
    subThemesData: FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      inputDecoratorRadius: prefs.inputDecoratorRadius,
      cardRadius: prefs.cardRadius,
      blendTextTheme: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: prefs.useMaterial3,
    fontFamily: 'NotoSans',
  );
}

/// Create dark theme from preferences
ThemeData _createDarkTheme(ThemePreferences prefs) {
  return FlexThemeData.dark(
    darkIsTrueBlack: true,
    scheme: prefs.flexScheme,
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    tones: FlexTones.jolly(Brightness.dark),
    blendLevel: prefs.blendLevel,
    appBarOpacity: prefs.appBarOpacity,
    subThemesData: FlexSubThemesData(
      blendOnLevel: 30,
      inputDecoratorRadius: prefs.inputDecoratorRadius,
      cardRadius: prefs.cardRadius,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: prefs.useMaterial3,
    fontFamily: 'NotoSans',
    appBarStyle: FlexAppBarStyle.material,
    useMaterial3ErrorColors: true,
  );
}

/// Predefined theme presets
class ThemePresets {
  static const List<ThemePreset> presets = [
    ThemePreset(
      name: 'Deep Purple',
      description: 'Classic deep purple theme',
      preferences: ThemePreferences(colorScheme: ColorSchemeType.deepPurple),
    ),
    ThemePreset(
      name: 'Ocean Blue',
      description: 'Calm blue ocean theme',
      preferences: ThemePreferences(colorScheme: ColorSchemeType.blue),
    ),
    ThemePreset(
      name: 'Royal Indigo',
      description: 'Elegant indigo theme',
      preferences: ThemePreferences(colorScheme: ColorSchemeType.indigo),
    ),
    ThemePreset(
      name: 'Crimson Red',
      description: 'Bold red theme',
      preferences: ThemePreferences(colorScheme: ColorSchemeType.red),
    ),
  ];
}

/// Theme preset model
class ThemePreset {
  final String name;
  final String description;
  final ThemePreferences preferences;
  final bool isPro;

  const ThemePreset({
    required this.name,
    required this.description,
    required this.preferences,
    this.isPro = false,
  });

  /// Get preview colors for the theme
  List<Color> get previewColors {
    final theme = _createLightTheme(preferences);

    return [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      theme.colorScheme.tertiary,
      theme.colorScheme.surface,
    ];
  }
}
