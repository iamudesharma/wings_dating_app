import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool _filterEnabled = false;

  // Age, Position, Photos
  String _selectedAgeRange = '18 - 22 yrs';
  String _selectedPosition = '';
  bool _hasPhotos = false;
  bool _hasFacePics = false;
  bool _hasAlbums = false;

  // New filters
  double _distance = 10; // in km
  String _lastSeen = '';
  List<String> _selectedInterests = [];
  String _selectedHeightRange = '';
  String _selectedWeightRange = '';
  String _selectedLanguage = '';

  final List<String> _positions = ['Top', 'Vers Top', 'Versatile', 'Vers Bottom', 'Bottom', 'Side', 'Not Specified'];
  final List<String> _ageRanges = ['18 - 22 yrs', '23 - 30 yrs', '31 - 40 yrs', '41+ yrs'];
  final List<String> _lastSeenOptions = ['Online now', 'Last 24 hours', 'Last 7 days', 'Last 30 days'];
  final List<String> _interestOptions = ['Travel', 'Music', 'Fitness', 'Reading', 'Gaming', 'Cooking'];
  final List<String> _heightRanges = ['< 5\'5"', '5\'5" - 5\'10"', '5\'11" - 6\'2"', '6\'3" and above'];
  final List<String> _weightRanges = ['< 60kg', '60 - 75kg', '76 - 90kg', '90kg+'];
  final List<String> _languageOptions = ['English', 'Spanish', 'French', 'German', 'Chinese'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          Switch(
            value: _filterEnabled,
            onChanged: (val) => setState(() => _filterEnabled = val),
            activeColor: Colors.yellow,
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Age Range'),
          _buildDropdown(_ageRanges, _selectedAgeRange, (val) => setState(() => _selectedAgeRange = val)),
          _buildSectionTitle('Position'),
          _buildPositionGrid(),
          _buildSectionTitle('Photos'),
          _buildPhotosOptions(),
          _buildSectionTitle('Distance (km)'),
          Slider(
            value: _distance,
            min: 1,
            max: 100,
            divisions: 20,
            label: '${_distance.round()} km',
            onChanged: (val) => setState(() => _distance = val),
          ),
          _buildSectionTitle('Last Seen'),
          _buildChips(_lastSeenOptions, _lastSeen, (val) => setState(() => _lastSeen = val)),
          _buildSectionTitle('Interests'),
          _buildMultiSelectChips(),
          _buildSectionTitle('Height Range'),
          _buildDropdown(_heightRanges, _selectedHeightRange, (val) => setState(() => _selectedHeightRange = val)),
          _buildSectionTitle('Weight Range'),
          _buildDropdown(_weightRanges, _selectedWeightRange, (val) => setState(() => _selectedWeightRange = val)),
          _buildSectionTitle('Language'),
          _buildDropdown(_languageOptions, _selectedLanguage, (val) => setState(() => _selectedLanguage = val)),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: StadiumBorder(),
            ),
            onPressed: _filterEnabled ? _applyFilters : null,
            child: Text('Apply', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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

  Widget _buildMultiSelectChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _interestOptions.map((interest) {
        final isSelected = _selectedInterests.contains(interest);
        return FilterChip(
          label: Text(interest),
          selected: isSelected,
          onSelected: (val) {
            setState(() {
              if (val) {
                _selectedInterests.add(interest);
              } else {
                _selectedInterests.remove(interest);
              }
            });
          },
          selectedColor: Colors.yellow,
          backgroundColor: Colors.grey[800],
          labelStyle: TextStyle(color: isSelected ? Colors.black : Colors.white),
        );
      }).toList(),
    );
  }

  Widget _buildPositionGrid() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _positions.map((pos) {
        final selected = _selectedPosition == pos;
        return ChoiceChip(
          label: Text(pos),
          selected: selected,
          onSelected: (_) => setState(() => _selectedPosition = pos),
          selectedColor: Colors.yellow,
          backgroundColor: Colors.grey[800],
          labelStyle: TextStyle(color: selected ? Colors.black : Colors.white),
        );
      }).toList(),
    );
  }

  Widget _buildPhotosOptions() {
    return Column(
      children: [
        CheckboxListTile(
          title: Text('Has photos'),
          value: _hasPhotos,
          onChanged: (val) => setState(() => _hasPhotos = val ?? false),
        ),
        CheckboxListTile(
          title: Text('Has face pics'),
          value: _hasFacePics,
          onChanged: (val) => setState(() => _hasFacePics = val ?? false),
        ),
        CheckboxListTile(
          title: Text('Has album(s)'),
          value: _hasAlbums,
          onChanged: (val) => setState(() => _hasAlbums = val ?? false),
        ),
      ],
    );
  }

  void _applyFilters() {
    final filters = {
      'enabled': _filterEnabled,
      'ageRange': _selectedAgeRange,
      'position': _selectedPosition,
      'hasPhotos': _hasPhotos,
      'hasFacePics': _hasFacePics,
      'hasAlbums': _hasAlbums,
      'distance': _distance.round(),
      'lastSeen': _lastSeen,
      'interests': _selectedInterests,
      'heightRange': _selectedHeightRange,
      'weightRange': _selectedWeightRange,
      'language': _selectedLanguage,
    };
    print('Applying filters: $filters');
    Navigator.pop(context, filters);
  }
}
