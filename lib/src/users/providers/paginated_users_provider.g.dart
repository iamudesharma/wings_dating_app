// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedUsersHash() => r'61e90d0014fadc53ef49d91f8fea4d3d4c45be3a';

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

abstract class _$PaginatedUsers
    extends BuildlessAutoDisposeNotifier<PaginatedUsersState> {
  late final Map<String, dynamic>? filters;

  PaginatedUsersState build(
    Map<String, dynamic>? filters,
  );
}

/// See also [PaginatedUsers].
@ProviderFor(PaginatedUsers)
const paginatedUsersProvider = PaginatedUsersFamily();

/// See also [PaginatedUsers].
class PaginatedUsersFamily extends Family<PaginatedUsersState> {
  /// See also [PaginatedUsers].
  const PaginatedUsersFamily();

  /// See also [PaginatedUsers].
  PaginatedUsersProvider call(
    Map<String, dynamic>? filters,
  ) {
    return PaginatedUsersProvider(
      filters,
    );
  }

  @override
  PaginatedUsersProvider getProviderOverride(
    covariant PaginatedUsersProvider provider,
  ) {
    return call(
      provider.filters,
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
  String? get name => r'paginatedUsersProvider';
}

/// See also [PaginatedUsers].
class PaginatedUsersProvider extends AutoDisposeNotifierProviderImpl<
    PaginatedUsers, PaginatedUsersState> {
  /// See also [PaginatedUsers].
  PaginatedUsersProvider(
    Map<String, dynamic>? filters,
  ) : this._internal(
          () => PaginatedUsers()..filters = filters,
          from: paginatedUsersProvider,
          name: r'paginatedUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedUsersHash,
          dependencies: PaginatedUsersFamily._dependencies,
          allTransitiveDependencies:
              PaginatedUsersFamily._allTransitiveDependencies,
          filters: filters,
        );

  PaginatedUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filters,
  }) : super.internal();

  final Map<String, dynamic>? filters;

  @override
  PaginatedUsersState runNotifierBuild(
    covariant PaginatedUsers notifier,
  ) {
    return notifier.build(
      filters,
    );
  }

  @override
  Override overrideWith(PaginatedUsers Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedUsersProvider._internal(
        () => create()..filters = filters,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filters: filters,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PaginatedUsers, PaginatedUsersState>
      createElement() {
    return _PaginatedUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUsersProvider && other.filters == filters;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedUsersRef on AutoDisposeNotifierProviderRef<PaginatedUsersState> {
  /// The parameter `filters` of this provider.
  Map<String, dynamic>? get filters;
}

class _PaginatedUsersProviderElement extends AutoDisposeNotifierProviderElement<
    PaginatedUsers, PaginatedUsersState> with PaginatedUsersRef {
  _PaginatedUsersProviderElement(super.provider);

  @override
  Map<String, dynamic>? get filters =>
      (origin as PaginatedUsersProvider).filters;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
