import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/providers/onboarding_providers.dart';

class VideoClipUploader extends ConsumerStatefulWidget {
  const VideoClipUploader({super.key});

  @override
  ConsumerState<VideoClipUploader> createState() => _VideoClipUploaderState();
}

class _VideoClipUploaderState extends ConsumerState<VideoClipUploader> {
  bool _uploading = false;

  @override
  Widget build(BuildContext context) {
    final videoUrl = ref.watch(videoUrlProvider);
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
                const Text('Video profile clip'),
                if (_uploading) const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: _uploading
                      ? null
                      : () async {
                          final picker = ImagePicker();
                          final file = await picker.pickVideo(
                              source: ImageSource.gallery, maxDuration: const Duration(seconds: 15));
                          if (file == null) return;
                          setState(() => _uploading = true);
                          try {
                            final url = await ref
                                .read(ProfileController.userControllerProvider)
                                .uploadVideo(await file.readAsBytes());
                            await ref.read(videoUrlProvider.notifier).set(url);
                          } finally {
                            if (mounted) setState(() => _uploading = false);
                          }
                        },
                  icon: const Icon(Icons.video_call_outlined),
                  label: Text(videoUrl == null ? 'Upload short clip' : 'Replace video'),
                ),
                const SizedBox(width: 12),
                if (videoUrl != null)
                  Text(
                    'Uploaded',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.green),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
