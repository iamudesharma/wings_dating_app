// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SharedAlbum)
const sharedAlbumProvider = SharedAlbumProvider._();

final class SharedAlbumProvider
    extends $AsyncNotifierProvider<SharedAlbum, List<GetMessageResponse>> {
  const SharedAlbumProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedAlbumProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedAlbumHash();

  @$internal
  @override
  SharedAlbum create() => SharedAlbum();
}

String _$sharedAlbumHash() => r'5c149220e45fe3a0a968bb2da4e62587f26c5bca';

abstract class _$SharedAlbum extends $AsyncNotifier<List<GetMessageResponse>> {
  FutureOr<List<GetMessageResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<GetMessageResponse>>,
              List<GetMessageResponse>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<GetMessageResponse>>,
                List<GetMessageResponse>
              >,
              AsyncValue<List<GetMessageResponse>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(albumsRepo)
const albumsRepoProvider = AlbumsRepoProvider._();

final class AlbumsRepoProvider
    extends $FunctionalProvider<AlbumsRepo, AlbumsRepo, AlbumsRepo>
    with $Provider<AlbumsRepo> {
  const AlbumsRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'albumsRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$albumsRepoHash();

  @$internal
  @override
  $ProviderElement<AlbumsRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AlbumsRepo create(Ref ref) {
    return albumsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlbumsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlbumsRepo>(value),
    );
  }
}

String _$albumsRepoHash() => r'2253b26fd278a9aa1b6576aec54b10d044b50124';

@ProviderFor(AlbumClass)
const albumClassProvider = AlbumClassProvider._();

final class AlbumClassProvider extends $NotifierProvider<AlbumClass, dynamic> {
  const AlbumClassProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'albumClassProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$albumClassHash();

  @$internal
  @override
  AlbumClass create() => AlbumClass();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(dynamic value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<dynamic>(value),
    );
  }
}

String _$albumClassHash() => r'af37c3cd9bdcf071ac25362aa4246ce9b9a21a8c';

abstract class _$AlbumClass extends $Notifier<dynamic> {
  dynamic build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<dynamic, dynamic>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<dynamic, dynamic>,
              dynamic,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
