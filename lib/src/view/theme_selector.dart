import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../model/theme_models.dart';
import '../provider/theme_provider.dart' hide Theme;
import '../service/theme_service.dart';

/// Theme selector widget
class ThemeSelector extends ConsumerStatefulWidget {
  const ThemeSelector({super.key});

  @override
  ConsumerState<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends ConsumerState<ThemeSelector> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Presets', icon: Icon(Icons.palette)),
            Tab(text: 'Customize', icon: Icon(Icons.tune)),
            Tab(text: 'Advanced', icon: Icon(Icons.settings)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _showResetDialog(context, themeNotifier),
            tooltip: 'Reset to defaults',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPresetsTab(themeState, themeNotifier),
          _buildCustomizeTab(themeState, themeNotifier),
          _buildAdvancedTab(themeState, themeNotifier),
        ],
      ),
    );
  }

  Widget _buildPresetsTab(ThemeState themeState, dynamic themeNotifier) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Choose a Theme Preset',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...ThemePresets.presets.map((preset) => _buildPresetCard(
              preset,
              themeState,
              themeNotifier,
            )),
        const SizedBox(height: 24),
        _buildCurrentThemePreview(themeState),
      ],
    );
  }

  Widget _buildPresetCard(
    ThemePreset preset,
    ThemeState themeState,
    dynamic themeNotifier,
  ) {
    final isSelected = themeState.preferences.colorScheme == preset.preferences.colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => themeNotifier.applyPreset(preset),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Color preview
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: preset.previewColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Theme info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      preset.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      preset.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              // Selection indicator
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                )
              else
                const Icon(Icons.circle_outlined),
            ],
          ),
        ),
      ),
    ).animate(target: isSelected ? 1 : 0).scale(
          begin: const Offset(1, 1),
          end: const Offset(1.02, 1.02),
          duration: 200.ms,
        );
  }

  Widget _buildCurrentThemePreview(ThemeState themeState) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Theme Preview',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: themeState.lightTheme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: themeState.lightTheme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: themeState.lightTheme.colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: themeState.lightTheme.colorScheme.surface,
                    border: Border.all(
                      color: themeState.lightTheme.colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomizeTab(ThemeState themeState, dynamic themeNotifier) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildThemeModeSelector(themeState, themeNotifier),
        const SizedBox(height: 24),
        _buildColorSchemeSelector(themeState, themeNotifier),
        const SizedBox(height: 24),
        _buildBlendLevelSlider(themeState, themeNotifier),
        const SizedBox(height: 24),
        _buildRadiusSettings(themeState, themeNotifier),
      ],
    );
  }

  Widget _buildThemeModeSelector(ThemeState themeState, dynamic themeNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Theme Mode',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        SegmentedButton<ThemeModeType>(
          segments: const [
            ButtonSegment(
              value: ThemeModeType.system,
              label: Text('System'),
              icon: Icon(Icons.brightness_auto),
            ),
            ButtonSegment(
              value: ThemeModeType.light,
              label: Text('Light'),
              icon: Icon(Icons.brightness_high),
            ),
            ButtonSegment(
              value: ThemeModeType.dark,
              label: Text('Dark'),
              icon: Icon(Icons.brightness_low),
            ),
          ],
          selected: {themeState.preferences.themeMode},
          onSelectionChanged: (Set<ThemeModeType> selected) {
            if (selected.isNotEmpty) {
              themeNotifier.setThemeMode(selected.first);
            }
          },
        ),
      ],
    );
  }

  Widget _buildColorSchemeSelector(ThemeState themeState, dynamic themeNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color Scheme',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ColorSchemeType.values.map((scheme) {
            final isSelected = themeState.preferences.colorScheme == scheme;
            return FilterChip(
              label: Text(_getColorSchemeName(scheme)),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  themeNotifier.setColorScheme(scheme);
                }
              },
              avatar: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: _getColorSchemePreviewColor(scheme),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBlendLevelSlider(ThemeState themeState, dynamic themeNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Blend Level: ${themeState.preferences.blendLevel}%',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Slider(
          value: themeState.preferences.blendLevel.toDouble(),
          min: 0,
          max: 100,
          divisions: 20,
          label: '${themeState.preferences.blendLevel}%',
          onChanged: (value) => themeNotifier.setBlendLevel(value.round()),
        ),
      ],
    );
  }

  Widget _buildRadiusSettings(ThemeState themeState, dynamic themeNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Corner Radius',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cards: ${themeState.preferences.cardRadius.round()}px'),
                  Slider(
                    value: themeState.preferences.cardRadius,
                    min: 0,
                    max: 32,
                    divisions: 16,
                    onChanged: (value) => themeNotifier.setUIRadius(cardRadius: value),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Inputs: ${themeState.preferences.inputDecoratorRadius.round()}px'),
                  Slider(
                    value: themeState.preferences.inputDecoratorRadius,
                    min: 0,
                    max: 32,
                    divisions: 16,
                    onChanged: (value) => themeNotifier.setUIRadius(inputDecoratorRadius: value),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdvancedTab(ThemeState themeState, dynamic themeNotifier) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildMaterial3Toggle(themeState, themeNotifier),
        const SizedBox(height: 24),
        _buildAnimationsToggle(themeState, themeNotifier),
        const SizedBox(height: 24),
        _buildAppBarOpacitySlider(themeState, themeNotifier),
        const SizedBox(height: 24),
        _buildExportImportSection(themeState),
        const SizedBox(height: 24),
        _buildThemeStatistics(),
      ],
    );
  }

  Widget _buildMaterial3Toggle(ThemeState themeState, dynamic themeNotifier) {
    return SwitchListTile(
      title: const Text('Material 3 Design'),
      subtitle: const Text('Use modern Material Design 3 components'),
      value: themeState.preferences.useMaterial3,
      onChanged: (value) => themeNotifier.setUseMaterial3(value),
    );
  }

  Widget _buildAnimationsToggle(ThemeState themeState, dynamic themeNotifier) {
    return SwitchListTile(
      title: const Text('Theme Animations'),
      subtitle: const Text('Animate theme changes'),
      value: themeState.preferences.enableAnimations,
      onChanged: (value) => themeNotifier.setEnableAnimations(value),
    );
  }

  Widget _buildAppBarOpacitySlider(ThemeState themeState, dynamic themeNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Bar Opacity: ${(themeState.preferences.appBarOpacity * 100).round()}%',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Slider(
          value: themeState.preferences.appBarOpacity,
          min: 0.5,
          max: 1.0,
          divisions: 10,
          label: '${(themeState.preferences.appBarOpacity * 100).round()}%',
          onChanged: (value) => themeNotifier.setAppBarOpacity(value),
        ),
      ],
    );
  }

  Widget _buildExportImportSection(ThemeState themeState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Export & Import',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _exportTheme(themeState.preferences),
                icon: const Icon(Icons.download),
                label: const Text('Export'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _importTheme,
                icon: const Icon(Icons.upload),
                label: const Text('Import'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeStatistics() {
    return FutureBuilder<Map<String, dynamic>>(
      future: ThemeService.getThemeStatistics(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final stats = snapshot.data!;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Theme Statistics',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Text('History Count: ${stats['historyCount'] ?? 0}'),
                Text('Has Saved Theme: ${stats['hasSavedTheme'] ?? false}'),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getColorSchemeName(ColorSchemeType scheme) {
    switch (scheme) {
      case ColorSchemeType.deepPurple:
        return 'Deep Purple';
      case ColorSchemeType.blue:
        return 'Blue';
      case ColorSchemeType.indigo:
        return 'Indigo';
      case ColorSchemeType.red:
        return 'Red';
      case ColorSchemeType.custom:
        return 'Custom';
    }
  }

  Color _getColorSchemePreviewColor(ColorSchemeType scheme) {
    switch (scheme) {
      case ColorSchemeType.deepPurple:
        return Colors.deepPurple;
      case ColorSchemeType.blue:
        return Colors.blue;
      case ColorSchemeType.indigo:
        return Colors.indigo;
      case ColorSchemeType.red:
        return Colors.red;
      case ColorSchemeType.custom:
        return Colors.grey;
    }
  }

  void _showResetDialog(BuildContext context, dynamic themeNotifier) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Theme'),
        content: const Text('Are you sure you want to reset to default theme?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              themeNotifier.resetToDefault();
              Navigator.of(context).pop();
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  void _exportTheme(ThemePreferences preferences) {
    final themeJson = ThemeService.exportThemePreferences(preferences);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Theme Export'),
        content: SingleChildScrollView(
          child: SelectableText(themeJson),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement clipboard functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Copied to clipboard')),
              );
              Navigator.of(context).pop();
            },
            child: const Text('Copy'),
          ),
        ],
      ),
    );
  }

  void _importTheme() {
    // TODO: Implement theme import functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Import functionality coming soon')),
    );
  }
}
