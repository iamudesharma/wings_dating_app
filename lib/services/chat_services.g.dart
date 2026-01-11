// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatClient)
final chatClientProvider = ChatClientProvider._();

final class ChatClientProvider
    extends
        $FunctionalProvider<
          StreamChatClient,
          StreamChatClient,
          StreamChatClient
        >
    with $Provider<StreamChatClient> {
  ChatClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatClientHash();

  @$internal
  @override
  $ProviderElement<StreamChatClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StreamChatClient create(Ref ref) {
    return chatClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StreamChatClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StreamChatClient>(value),
    );
  }
}

String _$chatClientHash() => r'c0b8934ba35de0d5a5eebdb3ff7952e15f0153e4';
