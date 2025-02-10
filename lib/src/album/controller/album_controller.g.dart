// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumControllerHash() => r'6486d1e5c37c6d345eb3e5a75f96bf9ef3413a66';

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

abstract class _$AlbumController
    extends BuildlessAsyncNotifier<AlbumListModel?> {
  late final String? id;

  FutureOr<AlbumListModel?> build(
    String? id,
  );
}

/// See also [AlbumController].
@ProviderFor(AlbumController)
const albumControllerProvider = AlbumControllerFamily();

/// See also [AlbumController].
class AlbumControllerFamily extends Family<AsyncValue<AlbumListModel?>> {
  /// See also [AlbumController].
  const AlbumControllerFamily();

  /// See also [AlbumController].
  AlbumControllerProvider call(
    String? id,
  ) {
    return AlbumControllerProvider(
      id,
    );
  }

  @override
  AlbumControllerProvider getProviderOverride(
    covariant AlbumControllerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies =
      const <ProviderOrFamily>[];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      const <ProviderOrFamily>{};

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'albumControllerProvider';
}

/// See also [AlbumController].
class AlbumControllerProvider
    extends AsyncNotifierProviderImpl<AlbumController, AlbumListModel?> {
  /// See also [AlbumController].
  AlbumControllerProvider(
    String? id,
  ) : this._internal(
          () => AlbumController()..id = id,
          from: albumControllerProvider,
          name: r'albumControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$albumControllerHash,
          dependencies: AlbumControllerFamily._dependencies,
          allTransitiveDependencies:
              AlbumControllerFamily._allTransitiveDependencies,
          id: id,
        );

  AlbumControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  FutureOr<AlbumListModel?> runNotifierBuild(
    covariant AlbumController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(AlbumController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AlbumControllerProvider._internal(
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
  AsyncNotifierProviderElement<AlbumController, AlbumListModel?>
      createElement() {
    return _AlbumControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumControllerProvider && other.id == id;
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
mixin AlbumControllerRef on AsyncNotifierProviderRef<AlbumListModel?> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _AlbumControllerProviderElement
    extends AsyncNotifierProviderElement<AlbumController, AlbumListModel?>
    with AlbumControllerRef {
  _AlbumControllerProviderElement(super.provider);

  @override
  String? get id => (origin as AlbumControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
