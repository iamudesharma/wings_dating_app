import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/profile/providers/onboarding_providers.dart';

class ProfileCompletionMeter extends ConsumerWidget {
  final EdgeInsetsGeometry padding;
  const ProfileCompletionMeter({super.key, this.padding = const EdgeInsets.all(12)});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final percent = ref.watch(profileCompletionProvider);
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Profile completeness', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(value: percent, minHeight: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text('${(percent * 100).round()}%',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
