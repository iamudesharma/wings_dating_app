// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatRepo)
final chatRepoProvider = ChatRepoProvider._();

final class ChatRepoProvider extends $NotifierProvider<ChatRepo, dynamic> {
  ChatRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRepoHash();

  @$internal
  @override
  ChatRepo create() => ChatRepo();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(dynamic value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<dynamic>(value),
    );
  }
}

String _$chatRepoHash() => r'3e0d0e36022258a05f8062e9535ef715e234a7a6';

abstract class _$ChatRepo extends $Notifier<dynamic> {
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
