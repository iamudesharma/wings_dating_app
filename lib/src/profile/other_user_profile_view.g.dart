// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user_profile_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favHash() => r'2778855792ba0349b1d5d5340c52d22422d769a4';

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

abstract class _$Fav extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String id;

  FutureOr<bool> build(
    String id,
  );
}

/// See also [Fav].
@ProviderFor(Fav)
const favProvider = FavFamily();

/// See also [Fav].
class FavFamily extends Family<AsyncValue<bool>> {
  /// See also [Fav].
  const FavFamily();

  /// See also [Fav].
  FavProvider call(
    String id,
  ) {
    return FavProvider(
      id,
    );
  }

  @override
  FavProvider getProviderOverride(
    covariant FavProvider provider,
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
  String? get name => r'favProvider';
}

/// See also [Fav].
class FavProvider extends AutoDisposeAsyncNotifierProviderImpl<Fav, bool> {
  /// See also [Fav].
  FavProvider(
    String id,
  ) : this._internal(
          () => Fav()..id = id,
          from: favProvider,
          name: r'favProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$favHash,
          dependencies: FavFamily._dependencies,
          allTransitiveDependencies: FavFamily._allTransitiveDependencies,
          id: id,
        );

  FavProvider._internal(
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
  FutureOr<bool> runNotifierBuild(
    covariant Fav notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(Fav Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<Fav, bool> createElement() {
    return _FavProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavProvider && other.id == id;
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
mixin FavRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FavProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Fav, bool> with FavRef {
  _FavProviderElement(super.provider);

  @override
  String get id => (origin as FavProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
