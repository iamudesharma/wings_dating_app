// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appRoute)
const appRouteProvider = AppRouteProvider._();

final class AppRouteProvider
    extends $FunctionalProvider<AppRouter, AppRouter, AppRouter>
    with $Provider<AppRouter> {
  const AppRouteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouteProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouteHash();

  @$internal
  @override
  $ProviderElement<AppRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppRouter create(Ref ref) {
    return appRoute(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppRouter>(value),
    );
  }
}

String _$appRouteHash() => r'442874f4a6f3584d7663d8b1a09a383b8f18cf3e';
