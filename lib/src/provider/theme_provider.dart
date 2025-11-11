import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/theme_models.dart';

part 'theme_provider.g.dart';

/// Theme preferences key for SharedPreferences
const String _themePreferencesKey = 'theme_preferences';

/// Theme provider using Riverpod 3.0 syntax
@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  ThemeState build() {
    final initialState = ThemeState.defaultState();
    // Asynchronously load preferences (don't block initial build)
    _loadThemePreferencesAsync();
    return initialState;
  }

  /// Asynchronously load theme preferences without blocking the initial build
  Future<void> _loadThemePreferencesAsync() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeJson = prefs.getString(_themePreferencesKey);

      if (themeJson != null) {
        final jsonMap = json.decode(themeJson) as Map<String, dynamic>;
        final preferences = ThemePreferences.fromJson(jsonMap);
        state = ThemeState.fromPreferences(preferences);
      }
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load theme preferences: $e',
        isLoading: false,
      );
    }
  }

  /// Update theme mode
  Future<void> setThemeMode(ThemeModeType themeMode) async {
    final newPreferences = state.preferences.copyWith(themeMode: themeMode);
    await _updatePreferences(newPreferences);
  }

  /// Update color scheme
  Future<void> setColorScheme(ColorSchemeType colorScheme) async {
    final newPreferences = state.preferences.copyWith(colorScheme: colorScheme);
    await _updatePreferences(newPreferences);
  }

  /// Update Material 3 usage
  Future<void> setUseMaterial3(bool useMaterial3) async {
    final newPreferences = state.preferences.copyWith(useMaterial3: useMaterial3);
    await _updatePreferences(newPreferences);
  }

  /// Update blend level
  Future<void> setBlendLevel(int blendLevel) async {
    final newPreferences = state.preferences.copyWith(blendLevel: blendLevel);
    await _updatePreferences(newPreferences);
  }

  /// Update app bar opacity
  Future<void> setAppBarOpacity(double appBarOpacity) async {
    final newPreferences = state.preferences.copyWith(appBarOpacity: appBarOpacity);
    await _updatePreferences(newPreferences);
  }

  /// Update custom colors
  Future<void> setCustomColors({
    String? primaryColor,
    String? secondaryColor,
    String? tertiaryColor,
  }) async {
    final newPreferences = state.preferences.copyWith(
      customPrimaryColor: primaryColor,
      customSecondaryColor: secondaryColor,
      customTertiaryColor: tertiaryColor,
    );
    await _updatePreferences(newPreferences);
  }

  /// Update animation settings
  Future<void> setEnableAnimations(bool enableAnimations) async {
    final newPreferences = state.preferences.copyWith(enableAnimations: enableAnimations);
    await _updatePreferences(newPreferences);
  }

  /// Update UI radius settings
  Future<void> setUIRadius({
    double? inputDecoratorRadius,
    double? cardRadius,
  }) async {
    final newPreferences = state.preferences.copyWith(
      inputDecoratorRadius: inputDecoratorRadius,
      cardRadius: cardRadius,
    );
    await _updatePreferences(newPreferences);
  }

  /// Apply a theme preset
  Future<void> applyPreset(ThemePreset preset) async {
    await _updatePreferences(preset.preferences);
  }

  /// Reset to default theme
  Future<void> resetToDefault() async {
    const defaultPrefs = ThemePreferences();
    await _updatePreferences(defaultPrefs);
  }

  /// Update preferences and save to storage
  Future<void> _updatePreferences(ThemePreferences newPreferences) async {
    try {
      state = state.copyWith(isLoading: true);

      // Create new theme state
      final newState = ThemeState.fromPreferences(newPreferences);

      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final themeJson = json.encode(newPreferences.toJson());
      await prefs.setString(_themePreferencesKey, themeJson);

      // Update state
      state = newState;
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to save theme preferences: $e',
        isLoading: false,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for accessing current theme mode
@riverpod
ThemeMode themeMode(Ref ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.preferences.actualThemeMode;
}

/// Provider for accessing current light theme
@riverpod
ThemeData lightTheme(Ref ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.lightTheme;
}

/// Provider for accessing current dark theme
@riverpod
ThemeData darkTheme(Ref ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.darkTheme;
}

/// Provider for accessing theme preferences
@riverpod
ThemePreferences themePreferences(Ref ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.preferences;
}

/// Provider for checking if theme is loading
@riverpod
bool themeLoading(Ref ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.isLoading;
}

/// Provider for theme error state
@riverpod
String? themeError(Ref ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.error;
}
