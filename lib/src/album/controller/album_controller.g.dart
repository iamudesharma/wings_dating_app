// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AlbumController)
const albumControllerProvider = AlbumControllerFamily._();

final class AlbumControllerProvider
    extends $AsyncNotifierProvider<AlbumController, UserAlbumModel> {
  const AlbumControllerProvider._({
    required AlbumControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'albumControllerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$albumControllerHash();

  @override
  String toString() {
    return r'albumControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AlbumController create() => AlbumController();

  @override
  bool operator ==(Object other) {
    return other is AlbumControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$albumControllerHash() => r'e5bb7717f119bca884e041cdb4cc1760cd0c07b6';

final class AlbumControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          AlbumController,
          AsyncValue<UserAlbumModel>,
          UserAlbumModel,
          FutureOr<UserAlbumModel>,
          String
        > {
  const AlbumControllerFamily._()
    : super(
        retry: null,
        name: r'albumControllerProvider',
        dependencies: const <ProviderOrFamily>[],
        $allTransitiveDependencies: const <ProviderOrFamily>[],
        isAutoDispose: false,
      );

  AlbumControllerProvider call(String id) =>
      AlbumControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'albumControllerProvider';
}

abstract class _$AlbumController extends $AsyncNotifier<UserAlbumModel> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<UserAlbumModel> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<UserAlbumModel>, UserAlbumModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserAlbumModel>, UserAlbumModel>,
              AsyncValue<UserAlbumModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
