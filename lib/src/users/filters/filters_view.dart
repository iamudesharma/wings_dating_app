import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'filters_provider.dart';

@RoutePage()
class FilterView extends ConsumerWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(userFiltersProvider);
    final filtersNotifier = ref.read(userFiltersProvider.notifier);

    // Watch filter options
    final ageRanges = ref.watch(ageRangesProvider);
    final positions = ref.watch(positionsProvider);
    final lastSeenOptions = ref.watch(lastSeenOptionsProvider);
    final interestOptions = ref.watch(interestOptionsProvider);
    final heightRanges = ref.watch(heightRangesProvider);
    final weightRanges = ref.watch(weightRangesProvider);
    final languageOptions = ref.watch(languageOptionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          Switch(
            value: filters.enabled,
            onChanged: (_) => filtersNotifier.toggleEnabled(),
            activeColor: Colors.yellow,
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Age Range'),
          _buildDropdown(
            ageRanges,
            filters.ageRange,
            (val) => filtersNotifier.updateAgeRange(val),
          ),
          _buildSectionTitle('Position'),
          _buildPositionGrid(positions, filters.position, filtersNotifier),
          _buildSectionTitle('Photos'),
          _buildPhotosOptions(filters, filtersNotifier),
          _buildSectionTitle('Distance (km)'),
          Slider(
            value: filters.distance,
            min: 1,
            max: 100,
            divisions: 20,
            label: '${filters.distance.round()} km',
            onChanged: (val) => filtersNotifier.updateDistance(val),
          ),
          _buildSectionTitle('Last Seen'),
          _buildChips(
            lastSeenOptions,
            filters.lastSeen,
            (val) => filtersNotifier.updateLastSeen(val),
          ),
          _buildSectionTitle('Interests'),
          _buildMultiSelectChips(interestOptions, filters.interests, filtersNotifier),
          _buildSectionTitle('Height Range'),
          _buildDropdown(
            heightRanges,
            filters.heightRange,
            (val) => filtersNotifier.updateHeightRange(val),
          ),
          _buildSectionTitle('Weight Range'),
          _buildDropdown(
            weightRanges,
            filters.weightRange,
            (val) => filtersNotifier.updateWeightRange(val),
          ),
          _buildSectionTitle('Language'),
          _buildDropdown(
            languageOptions,
            filters.language,
            (val) => filtersNotifier.updateLanguage(val),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: const StadiumBorder(),
            ),
            onPressed: filters.enabled ? () => _applyFilters(context, ref) : null,
            child: const Text('Apply', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _buildDropdown(List<String> items, String currentValue, Function(String) onChanged) {
    return DropdownButtonFormField<String>(
      value: currentValue.isEmpty ? null : currentValue,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      ),
      onChanged: (val) => onChanged(val!),
    );
  }

  Widget _buildChips(List<String> options, String selected, Function(String) onSelected) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((opt) {
        final isSelected = selected == opt;
        return ChoiceChip(
          label: Text(opt),
          selected: isSelected,
          onSelected: (_) => onSelected(opt),
          selectedColor: Colors.yellow,
          backgroundColor: Colors.grey[800],
          labelStyle: TextStyle(color: isSelected ? Colors.black : Colors.white),
        );
      }).toList(),
    );
  }

  Widget _buildMultiSelectChips(List<String> options, List<String> selectedInterests, UserFilters filtersNotifier) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((interest) {
        final isSelected = selectedInterests.contains(interest);
        return FilterChip(
          label: Text(interest),
          selected: isSelected,
          onSelected: (val) {
            if (val) {
              filtersNotifier.addInterest(interest);
            } else {
              filtersNotifier.removeInterest(interest);
            }
          },
          selectedColor: Colors.yellow,
          backgroundColor: Colors.grey[800],
          labelStyle: TextStyle(color: isSelected ? Colors.black : Colors.white),
        );
      }).toList(),
    );
  }

  Widget _buildPositionGrid(List<String> positions, String selectedPosition, UserFilters filtersNotifier) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: positions.map((pos) {
        final selected = selectedPosition == pos;
        return ChoiceChip(
          label: Text(pos),
          selected: selected,
          onSelected: (_) => filtersNotifier.updatePosition(pos),
          selectedColor: Colors.yellow,
          backgroundColor: Colors.grey[800],
          labelStyle: TextStyle(color: selected ? Colors.black : Colors.white),
        );
      }).toList(),
    );
  }

  Widget _buildPhotosOptions(FiltersModel filters, UserFilters filtersNotifier) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text('Has photos'),
          value: filters.hasPhotos,
          onChanged: (val) => filtersNotifier.updateHasPhotos(val ?? false),
        ),
        CheckboxListTile(
          title: const Text('Has face pics'),
          value: filters.hasFacePics,
          onChanged: (val) => filtersNotifier.updateHasFacePics(val ?? false),
        ),
        CheckboxListTile(
          title: const Text('Has album(s)'),
          value: filters.hasAlbums,
          onChanged: (val) => filtersNotifier.updateHasAlbums(val ?? false),
        ),
      ],
    );
  }

  void _applyFilters(BuildContext context, WidgetRef ref) {
    final filtersNotifier = ref.read(userFiltersProvider.notifier);
    final filters = filtersNotifier.applyFilters();
    print('Applying filters: $filters');
    Navigator.pop(context, filters);
  }
}
