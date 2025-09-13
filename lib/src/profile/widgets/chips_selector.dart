import 'package:flutter/material.dart';

class ChipsSelector extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<String> selected;
  final ValueChanged<String> onToggle;
  const ChipsSelector(
      {super.key, required this.title, required this.options, required this.selected, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final opt in options)
              FilterChip(
                label: Text(opt),
                selected: selected.contains(opt),
                onSelected: (_) => onToggle(opt),
              ),
          ],
        ),
      ],
    );
  }
}
