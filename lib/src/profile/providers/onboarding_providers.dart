import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';
import 'package:wings_dating_app/src/profile/models/profile_extras.dart';
import 'package:wings_dating_app/repo/profile_extras_api_repo.dart';
import 'package:wings_dating_app/helpers/extra_data.dart';

part 'onboarding_providers.g.dart';

// Persistence keys
const _kPromptsKey = 'profile.prompts';
const _kHabitsKey = 'profile.habits';
const _kValuesKey = 'profile.values';
const _kInterestsKey = 'profile.interests';
const _kSocialKey = 'profile.social';
const _kOnboardingSkipKey = 'onboarding.skipPrompt';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefs(SharedPrefsRef ref) async {
  return SharedPreferences.getInstance();
}

@Riverpod(keepAlive: true)
class OnboardingSkip extends _$OnboardingSkip {
  bool _loadStarted = false;
  bool _loaded = false;

  bool get isLoaded => _loaded;

  @override
  bool build() {
    if (!_loadStarted) {
      _loadStarted = true;
      _load();
    }
    return false;
  }

  Future<void> _load() async {
    final prefs = await ref.read(sharedPrefsProvider.future);
    state = prefs.getBool(_kOnboardingSkipKey) ?? false;
    _loaded = true;
  }

  Future<void> set(bool value) async {
    state = value;
    _loaded = true;
    final prefs = await ref.read(sharedPrefsProvider.future);
    await prefs.setBool(_kOnboardingSkipKey, value);
  }
}

// Backward compatibility alias
// final onboardingSkipProvider = onboardingSkipProvider;

class PromptsNotifier extends StateNotifier<List<PromptQA>> {
  final Ref ref;
  PromptsNotifier(this.ref) : super(const []) {
    _load();
  }
  Future<void> _load() async {
    final prefs = await ref.read(sharedPrefsProvider.future);
    final raw = prefs.getStringList(_kPromptsKey) ?? [];
    var local = raw.map((e) => PromptQA.fromJson(jsonDecode(e) as Map<String, dynamic>)).toList();
    // Try remote
    final extras = await ref.read(profileExtrasApiRepoProvider).fetch();
    if (extras != null && extras['prompts'] is List) {
      final remote = (extras['prompts'] as List).whereType<Map<String, dynamic>>().map(PromptQA.fromJson).toList();
      if (remote.isNotEmpty) {
        local = remote;
      }
    }
    state = local;
    // Keep local cache in sync
    await save();
  }

  Future<void> save() async {
    final prefs = await ref.read(sharedPrefsProvider.future);
    await prefs.setStringList(
      _kPromptsKey,
      state.map((e) => jsonEncode(e.toJson())).toList(),
    );
    await ref.read(profileExtrasApiRepoProvider).saveAll(prompts: state);
  }

  void add(PromptQA qa) {
    state = [...state, qa];
    save();
  }

  void removeAt(int index) {
    final list = [...state];
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = list;
      save();
    }
  }

  void update(int index, PromptQA qa) {
    final list = [...state];
    if (index >= 0 && index < list.length) {
      list[index] = qa;
      state = list;
      save();
    }
  }
}

final promptsProvider = StateNotifierProvider<PromptsNotifier, List<PromptQA>>(
  (ref) => PromptsNotifier(ref),
);

class SimpleListNotifier extends StateNotifier<List<String>> {
  final Ref ref;
  final String key;
  final String field;
  SimpleListNotifier(this.ref, this.key, this.field) : super(const []) {
    _load();
  }
  Future<void> _load() async {
    final prefs = await ref.read(sharedPrefsProvider.future);
    var local = prefs.getStringList(key) ?? [];
    final extras = await ref.read(profileExtrasApiRepoProvider).fetch();
    if (extras != null && extras[field] is List) {
      final remote = (extras[field] as List).whereType<String>().toList();
      if (remote.isNotEmpty) {
        local = remote;
      }
    }
    state = local;
    await save();
  }

  Future<void> save() async {
    final prefs = await ref.read(sharedPrefsProvider.future);
    await prefs.setStringList(key, state);
    await ref.read(profileExtrasApiRepoProvider).saveAll(
          habits: field == 'habits' ? state : null,
          values: field == 'values' ? state : null,
          interests: field == 'interests' ? state : null,
        );
  }

  void setAll(List<String> values) {
    state = values;
    save();
  }

  void toggle(String value) {
    final list = [...state];
    if (list.contains(value)) {
      list.remove(value);
    } else {
      list.add(value);
    }
    state = list;
    save();
  }
}

final habitsProvider = StateNotifierProvider<SimpleListNotifier, List<String>>(
    (ref) => SimpleListNotifier(ref, _kHabitsKey, 'habits'));
final valuesProvider = StateNotifierProvider<SimpleListNotifier, List<String>>(
    (ref) => SimpleListNotifier(ref, _kValuesKey, 'values'));
final interestsProvider = StateNotifierProvider<SimpleListNotifier, List<String>>(
    (ref) => SimpleListNotifier(ref, _kInterestsKey, 'interests'));

class SocialNotifier extends StateNotifier<SocialLinks> {
  final Ref ref;
  SocialNotifier(this.ref) : super(const SocialLinks()) {
    _load();
  }
  Future<void> _load() async {
    final prefs = await ref.read(sharedPrefsProvider.future);
    final raw = prefs.getString(_kSocialKey);
    if (raw != null) {
      state = SocialLinks.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    }
    final extras = await ref.read(profileExtrasApiRepoProvider).fetch();
    if (extras != null && extras['social'] is Map<String, dynamic>) {
      state = SocialLinks.fromJson(extras['social'] as Map<String, dynamic>);
      await save();
    }
  }

  Future<void> save() async {
    final prefs = await ref.read(sharedPrefsProvider.future);
    await prefs.setString(_kSocialKey, jsonEncode(state.toJson()));
    await ref.read(profileExtrasApiRepoProvider).saveAll(social: state);
  }

  Future<void> update(SocialLinks links) async {
    state = links;
    await save();
  }
}

final socialProvider = StateNotifierProvider<SocialNotifier, SocialLinks>((ref) => SocialNotifier(ref));

class VideoUrlNotifier extends StateNotifier<String?> {
  final Ref ref;
  bool _loaded = false;
  VideoUrlNotifier(this.ref) : super(null) {
    _load();
  }
  Future<void> _load() async {
    if (_loaded) return;
    _loaded = true;
    final data = await ref.read(profileExtrasApiRepoProvider).fetch();
    if (data != null && data['videoUrl'] is String) {
      state = data['videoUrl'] as String;
    }
  }

  Future<void> set(String? url) async {
    state = url;
    if (url != null) {
      await ref.read(profileExtrasApiRepoProvider).saveAll(videoUrl: url);
    }
  }
}

final videoUrlProvider = StateNotifierProvider<VideoUrlNotifier, String?>((ref) => VideoUrlNotifier(ref));

final profileCompletionProvider = Provider<double>((ref) {
  // Compute completeness out of simple items
  final user = ref.watch(ProfileController.userControllerProvider).userModel;
  final prompts = ref.watch(promptsProvider);
  final habits = ref.watch(habitsProvider);
  final values = ref.watch(valuesProvider);
  final social = ref.watch(socialProvider);

  int score = 0;
  int total = 10; // arbitrary points

  if (user != null) {
    if ((user.profileUrl ?? '').isNotEmpty) score++;
    if ((user.bio ?? '').isNotEmpty) score++;
    if (user.albumUrl != null && user.albumUrl!.isNotEmpty) score++;
    if ((user.username).isNotEmpty) score++;
    if (user.interests.isNotEmpty) score++;
    if (user.role != Role.doNotShow) score++;
    if (user.bodyType != BodyType.doNotShow) score++;
  }
  if (prompts.isNotEmpty) score++;
  if (habits.isNotEmpty) score++;
  if (values.isNotEmpty) score++;
  if ((social.instagram ?? social.linkedin ?? social.twitter ?? social.tiktok ?? social.website) != null) score++;

  return (score / total).clamp(0, 1).toDouble();
});

// Some defaults for chips
const defaultInterests = <String>[
  'Travel',
  'Music',
  'Fitness',
  'Foodie',
  'Art',
  'Gaming',
  'Outdoors',
  'Movies',
  'Tech',
  'Books'
];
const defaultHabits = <String>[
  'Early Bird',
  'Night Owl',
  'Non-smoker',
  'Social Drinker',
  'Pet Lover',
  'Vegan',
  'Runner',
  'Yoga'
];
const defaultValues = <String>[
  'Kindness',
  'Honesty',
  'Ambition',
  'Humor',
  'Family',
  'Adventure',
  'Creativity',
  'Empathy'
];
