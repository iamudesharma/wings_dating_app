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
  String _selectedCategory = '';
  String _selectedAgeRange = '18 - 22 yrs';

  // Position options
  final List<String> _positions = ['Top', 'Vers Top', 'Versatile', 'Vers Bottom', 'Bottom', 'Side', 'Not Specified'];
  String _selectedPosition = '';

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
          _buildRadioCategory('Online'),
          _buildRadioCategory('Age'),
          if (_selectedCategory == 'Age') _buildAgeDropdown(),
          _buildRadioCategory('Position'),
          if (_selectedCategory == 'Position') _buildPositionGrid(),
          // Placeholder for Photos section
          _buildRadioCategory('Photos'),
          if (_selectedCategory == 'Photos') _buildPhotosOptions(),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // primary: Colors.yellow,
              // onPrimary: Colors.black,
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

  Widget _buildRadioCategory(String label) {
    return RadioListTile<String>(
      title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      value: label,
      groupValue: _selectedCategory,
      onChanged: (val) => setState(() {
        _selectedCategory = val!;
      }),
    );
  }

  Widget _buildAgeDropdown() {
    final ranges = ['18 - 22 yrs', '23 - 30 yrs', '31 - 40 yrs', '41+ yrs'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        ),
        value: _selectedAgeRange,
        items: ranges.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
        onChanged: (val) => setState(() => _selectedAgeRange = val!),
      ),
    );
  }

  Widget _buildPositionGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
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
      ),
    );
  }

  Widget _buildPhotosOptions() {
    // placeholders for toggles or checkboxes
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
            title: Text('Has photos'),
            value: false,
            onChanged: (_) {},
          ),
          CheckboxListTile(
            title: Text('Has face pics'),
            value: false,
            onChanged: (_) {},
          ),
          CheckboxListTile(
            title: Text('Has album(s)'),
            value: false,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }

  void _applyFilters() {
    // Collect and apply filter logic
    final filters = {
      'enabled': _filterEnabled,
      'category': _selectedCategory,
      'ageRange': _selectedAgeRange,
      'position': _selectedPosition,
    };
    print('Applying filters: \$filters');
    // Pop and return or trigger fetch
    Navigator.pop(context, filters);
  }
}
