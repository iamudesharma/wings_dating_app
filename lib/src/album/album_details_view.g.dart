// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_details_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumDetailsHash() => r'74e72a8d85cf49e8a6734ef729a3d4401d8fa706';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AlbumDetails
    extends BuildlessAutoDisposeAsyncNotifier<UserAlbumModel> {
  late final String id;

  FutureOr<UserAlbumModel> build(
    String id,
  );
}

/// See also [AlbumDetails].
@ProviderFor(AlbumDetails)
const albumDetailsProvider = AlbumDetailsFamily();

/// See also [AlbumDetails].
class AlbumDetailsFamily extends Family<AsyncValue<UserAlbumModel>> {
  /// See also [AlbumDetails].
  const AlbumDetailsFamily();

  /// See also [AlbumDetails].
  AlbumDetailsProvider call(
    String id,
  ) {
    return AlbumDetailsProvider(
      id,
    );
  }

  @override
  AlbumDetailsProvider getProviderOverride(
    covariant AlbumDetailsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'albumDetailsProvider';
}

/// See also [AlbumDetails].
class AlbumDetailsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AlbumDetails, UserAlbumModel> {
  /// See also [AlbumDetails].
  AlbumDetailsProvider(
    String id,
  ) : this._internal(
          () => AlbumDetails()..id = id,
          from: albumDetailsProvider,
          name: r'albumDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$albumDetailsHash,
          dependencies: AlbumDetailsFamily._dependencies,
          allTransitiveDependencies:
              AlbumDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  AlbumDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<UserAlbumModel> runNotifierBuild(
    covariant AlbumDetails notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(AlbumDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: AlbumDetailsProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AlbumDetails, UserAlbumModel>
      createElement() {
    return _AlbumDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AlbumDetailsRef on AutoDisposeAsyncNotifierProviderRef<UserAlbumModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AlbumDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AlbumDetails,
        UserAlbumModel> with AlbumDetailsRef {
  _AlbumDetailsProviderElement(super.provider);

  @override
  String get id => (origin as AlbumDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
