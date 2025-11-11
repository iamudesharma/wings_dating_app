import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/profile/models/profile_extras.dart';
import 'package:wings_dating_app/src/profile/providers/onboarding_providers.dart';

class PromptsEditor extends ConsumerWidget {
  const PromptsEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompts = ref.watch(promptsProvider);
    final controllerPrompt = TextEditingController();
    final controllerAnswer = TextEditingController();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Prompts', style: Theme.of(context).textTheme.titleMedium),
                TextButton.icon(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Add prompt'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                                controller: controllerPrompt, decoration: const InputDecoration(labelText: 'Prompt')),
                            TextField(
                                controller: controllerAnswer, decoration: const InputDecoration(labelText: 'Answer')),
                          ],
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                          FilledButton(
                            onPressed: () {
                              if (controllerPrompt.text.trim().isEmpty || controllerAnswer.text.trim().isEmpty) return;
                              ref.read(promptsProvider.notifier).add(
                                  PromptQA(prompt: controllerPrompt.text.trim(), answer: controllerAnswer.text.trim()));
                              Navigator.pop(ctx);
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (prompts.isEmpty) const Text('No prompts yet'),
            for (int i = 0; i < prompts.length; i++)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(prompts[i].prompt),
                subtitle: Text(prompts[i].answer),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => ref.read(promptsProvider.notifier).removeAt(i),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
