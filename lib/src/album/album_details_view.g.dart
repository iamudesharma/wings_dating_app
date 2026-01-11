// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_details_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AlbumDetails)
final albumDetailsProvider = AlbumDetailsFamily._();

final class AlbumDetailsProvider
    extends $AsyncNotifierProvider<AlbumDetails, UserAlbumModel> {
  AlbumDetailsProvider._({
    required AlbumDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'albumDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$albumDetailsHash();

  @override
  String toString() {
    return r'albumDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AlbumDetails create() => AlbumDetails();

  @override
  bool operator ==(Object other) {
    return other is AlbumDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$albumDetailsHash() => r'74e72a8d85cf49e8a6734ef729a3d4401d8fa706';

final class AlbumDetailsFamily extends $Family
    with
        $ClassFamilyOverride<
          AlbumDetails,
          AsyncValue<UserAlbumModel>,
          UserAlbumModel,
          FutureOr<UserAlbumModel>,
          String
        > {
  AlbumDetailsFamily._()
    : super(
        retry: null,
        name: r'albumDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AlbumDetailsProvider call(String id) =>
      AlbumDetailsProvider._(argument: id, from: this);

  @override
  String toString() => r'albumDetailsProvider';
}

abstract class _$AlbumDetails extends $AsyncNotifier<UserAlbumModel> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<UserAlbumModel> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserAlbumModel>, UserAlbumModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserAlbumModel>, UserAlbumModel>,
              AsyncValue<UserAlbumModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
