import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/routes/app_router.dart';

class QuickActions extends ConsumerWidget {
  final String? targetUserId; // null when on own profile
  const QuickActions({super.key, this.targetUserId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelf = targetUserId == null;
    return Wrap(
      spacing: 8,
      children: [
        FilledButton.tonalIcon(
          icon: const Icon(Icons.lightbulb_outline),
          label: const Text('Icebreakers'),
          onPressed: () {
            // Navigate to AI analysis/wingman screen to suggest openers
            context.router.push(AIAnalysisRoute());
          },
        ),
        if (!isSelf)
          FilledButton.icon(
            icon: const Icon(Icons.touch_app_outlined),
            label: const Text('Nudge'),
            onPressed: () async {
              final id = targetUserId!;
              try {
                await ref.read(profileRepoProvider).sendTap(id);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nudged')));
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to nudge: $e')));
                }
              }
            },
          ),
      ],
    );
  }
}
