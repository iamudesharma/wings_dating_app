import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/theme_models.dart';

/// Service class for managing theme operations
class ThemeService {
  static const String _themePreferencesKey = 'theme_preferences';
  static const String _themeHistoryKey = 'theme_history';

  /// Get SharedPreferences instance
  static Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();

  /// Save theme preferences to storage
  static Future<void> saveThemePreferences(ThemePreferences preferences) async {
    try {
      final prefs = await _prefs;
      final themeJson = json.encode(preferences.toJson());
      await prefs.setString(_themePreferencesKey, themeJson);
    } catch (e) {
      throw Exception('Failed to save theme preferences: $e');
    }
  }

  /// Load theme preferences from storage
  static Future<ThemePreferences?> loadThemePreferences() async {
    try {
      final prefs = await _prefs;
      final themeJson = prefs.getString(_themePreferencesKey);

      if (themeJson != null) {
        final jsonMap = json.decode(themeJson) as Map<String, dynamic>;
        return ThemePreferences.fromJson(jsonMap);
      }

      return null;
    } catch (e) {
      throw Exception('Failed to load theme preferences: $e');
    }
  }

  /// Save theme to history
  static Future<void> saveToHistory(ThemePreferences preferences) async {
    try {
      final prefs = await _prefs;
      final historyJson = prefs.getString(_themeHistoryKey);
      List<Map<String, dynamic>> history = [];

      if (historyJson != null) {
        final decoded = json.decode(historyJson) as List<dynamic>;
        history = decoded.map((e) => e as Map<String, dynamic>).toList();
      }

      // Add current preferences to history
      final currentJson = preferences.toJson();
      history.insert(0, currentJson);

      // Keep only last 10 themes in history
      if (history.length > 10) {
        history = history.sublist(0, 10);
      }

      await prefs.setString(_themeHistoryKey, json.encode(history));
    } catch (e) {
      throw Exception('Failed to save theme to history: $e');
    }
  }

  /// Load theme history
  static Future<List<ThemePreferences>> loadThemeHistory() async {
    try {
      final prefs = await _prefs;
      final historyJson = prefs.getString(_themeHistoryKey);

      if (historyJson != null) {
        final decoded = json.decode(historyJson) as List<dynamic>;
        return decoded.map((e) => ThemePreferences.fromJson(e as Map<String, dynamic>)).toList();
      }

      return [];
    } catch (e) {
      throw Exception('Failed to load theme history: $e');
    }
  }

  /// Clear theme history
  static Future<void> clearThemeHistory() async {
    try {
      final prefs = await _prefs;
      await prefs.remove(_themeHistoryKey);
    } catch (e) {
      throw Exception('Failed to clear theme history: $e');
    }
  }

  /// Export theme preferences as JSON string
  static String exportThemePreferences(ThemePreferences preferences) {
    return json.encode(preferences.toJson());
  }

  /// Import theme preferences from JSON string
  static ThemePreferences importThemePreferences(String jsonString) {
    try {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return ThemePreferences.fromJson(jsonMap);
    } catch (e) {
      throw Exception('Invalid theme preferences JSON: $e');
    }
  }

  /// Get theme preview colors
  static List<Color> getThemePreviewColors(ThemePreferences preferences) {
    // Create a temporary theme to get colors
    final theme = _createPreviewTheme(preferences);
    return [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      theme.colorScheme.tertiary,
      theme.colorScheme.surface,
    ];
  }

  /// Create a preview theme for color extraction
  static ThemeData _createPreviewTheme(ThemePreferences prefs) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _getSeedColor(prefs),
        brightness: Brightness.light,
      ),
      useMaterial3: prefs.useMaterial3,
    );
  }

  /// Get seed color for theme generation
  static Color _getSeedColor(ThemePreferences prefs) {
    switch (prefs.colorScheme) {
      case ColorSchemeType.blue:
        return Colors.blue;
      case ColorSchemeType.indigo:
        return Colors.indigo;
      case ColorSchemeType.red:
        return Colors.red;
      case ColorSchemeType.custom:
        // Use custom primary color or fallback to deep purple
        if (prefs.customPrimaryColor != null) {
          return Color(int.parse(prefs.customPrimaryColor!));
        }
        return Colors.deepPurple;
      case ColorSchemeType.deepPurple:
        return Colors.deepPurple;
    }
  }

  /// Validate theme preferences
  static bool validateThemePreferences(ThemePreferences preferences) {
    try {
      // Check if blend level is within valid range
      if (preferences.blendLevel < 0 || preferences.blendLevel > 100) {
        return false;
      }

      // Check if opacity is within valid range
      if (preferences.appBarOpacity < 0.0 || preferences.appBarOpacity > 1.0) {
        return false;
      }

      // Check if radius values are reasonable
      if (preferences.inputDecoratorRadius < 0.0 || preferences.cardRadius < 0.0) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get theme statistics
  static Future<Map<String, dynamic>> getThemeStatistics() async {
    try {
      final prefs = await _prefs;
      final history = await loadThemeHistory();
      final currentPrefs = await loadThemePreferences();

      return {
        'hasSavedTheme': currentPrefs != null,
        'historyCount': history.length,
        'mostUsedColorScheme': _getMostUsedColorScheme(history),
        'lastModified': prefs.getString('${_themePreferencesKey}_timestamp'),
      };
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  /// Get most used color scheme from history
  static ColorSchemeType _getMostUsedColorScheme(List<ThemePreferences> history) {
    if (history.isEmpty) return ColorSchemeType.deepPurple;

    final colorSchemeCounts = <ColorSchemeType, int>{};

    for (final prefs in history) {
      colorSchemeCounts[prefs.colorScheme] = (colorSchemeCounts[prefs.colorScheme] ?? 0) + 1;
    }

    return colorSchemeCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  /// Reset theme to system defaults
  static Future<void> resetToSystemDefaults() async {
    try {
      final prefs = await _prefs;
      await prefs.remove(_themePreferencesKey);
    } catch (e) {
      throw Exception('Failed to reset theme: $e');
    }
  }
}
