// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_request_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchingRequestController)
final matchingRequestControllerProvider = MatchingRequestControllerProvider._();

final class MatchingRequestControllerProvider
    extends $NotifierProvider<MatchingRequestController, dynamic> {
  MatchingRequestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchingRequestControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchingRequestControllerHash();

  @$internal
  @override
  MatchingRequestController create() => MatchingRequestController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(dynamic value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<dynamic>(value),
    );
  }
}

String _$matchingRequestControllerHash() =>
    r'50c93070cb0f9a561ecdc7134506f56d0488dc93';

abstract class _$MatchingRequestController extends $Notifier<dynamic> {
  dynamic build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<dynamic, dynamic>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<dynamic, dynamic>,
              dynamic,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
