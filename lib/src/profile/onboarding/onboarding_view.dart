import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/profile/providers/onboarding_providers.dart';
import 'package:wings_dating_app/src/profile/widgets/chips_selector.dart';
import 'package:wings_dating_app/src/profile/widgets/profile_completion_meter.dart';
import 'package:wings_dating_app/src/profile/widgets/prompts_editor.dart';
import 'package:wings_dating_app/src/profile/widgets/social_links_form.dart';
import 'package:wings_dating_app/src/profile/widgets/video_clip_uploader.dart';

@RoutePage()
class ProfileOnboardingView extends ConsumerStatefulWidget {
  const ProfileOnboardingView({super.key});

  @override
  ConsumerState<ProfileOnboardingView> createState() => _ProfileOnboardingViewState();
}

class _ProfileOnboardingViewState extends ConsumerState<ProfileOnboardingView> {
  bool _dontAskAgain = false;

  @override
  Widget build(BuildContext context) {
    final habits = ref.watch(habitsProvider);
    final values = ref.watch(valuesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Complete your profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ProfileCompletionMeter(),
          const SizedBox(height: 16),
          const PromptsEditor(),
          const SizedBox(height: 16),
          ChipsSelector(
            title: 'Habits',
            options: defaultHabits,
            selected: habits,
            onToggle: (v) => ref.read(habitsProvider.notifier).toggle(v),
          ),
          const SizedBox(height: 16),
          ChipsSelector(
            title: 'Values',
            options: defaultValues,
            selected: values,
            onToggle: (v) => ref.read(valuesProvider.notifier).toggle(v),
          ),
          const SizedBox(height: 16),
          const SocialLinksForm(),
          const SizedBox(height: 16),
          const VideoClipUploader(),
          const SizedBox(height: 12),
          Row(
            children: [
              Checkbox(
                value: _dontAskAgain,
                onChanged: (v) => setState(() => _dontAskAgain = v ?? false),
              ),
              const Text("Don't ask again"),
            ],
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () async {
              // Ensure current selections are persisted and optionally skip future prompts
              ref.read(habitsProvider.notifier).save();
              ref.read(valuesProvider.notifier).save();
              if (_dontAskAgain) {
                await ref.read(onboardingSkipProvider.notifier).set(true);
              }
              if (context.mounted) {
                context.router.pop();
              }
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
