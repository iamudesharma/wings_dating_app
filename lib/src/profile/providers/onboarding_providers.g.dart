// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPrefsHash() => r'b96dfa2fa6cbae073c31860457b07bacd49ab6c1';

/// See also [sharedPrefs].
@ProviderFor(sharedPrefs)
final sharedPrefsProvider = FutureProvider<SharedPreferences>.internal(
  sharedPrefs,
  name: r'sharedPrefsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sharedPrefsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SharedPrefsRef = FutureProviderRef<SharedPreferences>;
String _$onboardingSkipHash() => r'5fd1ff165e1fe7b2afe85fe38bda8aaa28bad013';

/// See also [OnboardingSkip].
@ProviderFor(OnboardingSkip)
final onboardingSkipProvider =
    NotifierProvider<OnboardingSkip, bool>.internal(
  OnboardingSkip.new,
  name: r'onboardingSkipProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingSkipHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OnboardingSkip = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
