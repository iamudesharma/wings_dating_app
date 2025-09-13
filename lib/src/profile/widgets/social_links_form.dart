import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/profile/models/profile_extras.dart';
import 'package:wings_dating_app/src/profile/providers/onboarding_providers.dart';

class SocialLinksForm extends ConsumerStatefulWidget {
  const SocialLinksForm({super.key});

  @override
  ConsumerState<SocialLinksForm> createState() => _SocialLinksFormState();
}

class _SocialLinksFormState extends ConsumerState<SocialLinksForm> {
  final _instagramCtrl = TextEditingController();
  final _twitterCtrl = TextEditingController();
  final _linkedinCtrl = TextEditingController();
  final _tiktokCtrl = TextEditingController();
  final _websiteCtrl = TextEditingController();

  Timer? _debounce;
  SocialLinks? _lastApplied;

  @override
  void initState() {
    super.initState();
    final social = ref.read(socialProvider);
    _applyToCtrls(social);
  }

  void _applyToCtrls(SocialLinks s) {
    _instagramCtrl.text = s.instagram ?? '';
    _twitterCtrl.text = s.twitter ?? '';
    _linkedinCtrl.text = s.linkedin ?? '';
    _tiktokCtrl.text = s.tiktok ?? '';
    _websiteCtrl.text = s.website ?? '';
    _lastApplied = s;
  }

  bool _equals(SocialLinks a, SocialLinks b) {
    return a.instagram == b.instagram &&
        a.twitter == b.twitter &&
        a.linkedin == b.linkedin &&
        a.tiktok == b.tiktok &&
        a.website == b.website;
  }

  void _scheduleSave() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), _saveNow);
  }

  Future<void> _saveNow() async {
    final draft = SocialLinks(
      instagram: _instagramCtrl.text.trim().isEmpty ? null : _instagramCtrl.text.trim(),
      twitter: _twitterCtrl.text.trim().isEmpty ? null : _twitterCtrl.text.trim(),
      linkedin: _linkedinCtrl.text.trim().isEmpty ? null : _linkedinCtrl.text.trim(),
      tiktok: _tiktokCtrl.text.trim().isEmpty ? null : _tiktokCtrl.text.trim(),
      website: _websiteCtrl.text.trim().isEmpty ? null : _websiteCtrl.text.trim(),
    );
    await ref.read(socialProvider.notifier).update(draft);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    // Persist latest values before leaving
    _saveNow();
    _instagramCtrl.dispose();
    _twitterCtrl.dispose();
    _linkedinCtrl.dispose();
    _tiktokCtrl.dispose();
    _websiteCtrl.dispose();
    super.dispose();
  }

  Widget _field({
    required String label,
    required TextEditingController controller,
    IconData? icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label, prefixIcon: icon != null ? Icon(icon) : null),
      onChanged: (_) => _scheduleSave(),
      onEditingComplete: _saveNow,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Keep controllers in sync with provider state without using ref.listen in initState
    final social = ref.watch(socialProvider);
    if (_lastApplied == null || !_equals(_lastApplied!, social)) {
      _applyToCtrls(social);
    }
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Social links & verification', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            _field(label: 'Instagram', controller: _instagramCtrl, icon: Icons.camera_alt_outlined),
            _field(label: 'Twitter/X', controller: _twitterCtrl, icon: Icons.alternate_email),
            _field(label: 'LinkedIn', controller: _linkedinCtrl, icon: Icons.business_center_outlined),
            _field(label: 'TikTok', controller: _tiktokCtrl, icon: Icons.movie_outlined),
            _field(label: 'Website', controller: _websiteCtrl, icon: Icons.link_outlined),
            const SizedBox(height: 4),
            Text(
              'Changes auto-save',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
            ),
          ],
        ),
      ),
    );
  }
}
