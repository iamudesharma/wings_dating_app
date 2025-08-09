// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserByIdHash() => r'f119cbbad83c4e27b9fc42506d4da0d04694c09e';

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

/// See also [getUserById].
@ProviderFor(getUserById)
const getUserByIdProvider = GetUserByIdFamily();

/// See also [getUserById].
class GetUserByIdFamily extends Family<AsyncValue<UserModel?>> {
  /// See also [getUserById].
  const GetUserByIdFamily();

  /// See also [getUserById].
  GetUserByIdProvider call(
    String userId,
  ) {
    return GetUserByIdProvider(
      userId,
    );
  }

  @override
  GetUserByIdProvider getProviderOverride(
    covariant GetUserByIdProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getUserByIdProvider';
}

/// See also [getUserById].
class GetUserByIdProvider extends AutoDisposeFutureProvider<UserModel?> {
  /// See also [getUserById].
  GetUserByIdProvider(
    String userId,
  ) : this._internal(
          (ref) => getUserById(
            ref as GetUserByIdRef,
            userId,
          ),
          from: getUserByIdProvider,
          name: r'getUserByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserByIdHash,
          dependencies: GetUserByIdFamily._dependencies,
          allTransitiveDependencies:
              GetUserByIdFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetUserByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<UserModel?> Function(GetUserByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserByIdProvider._internal(
        (ref) => create(ref as GetUserByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserModel?> createElement() {
    return _GetUserByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserByIdProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUserByIdRef on AutoDisposeFutureProviderRef<UserModel?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetUserByIdProviderElement
    extends AutoDisposeFutureProviderElement<UserModel?> with GetUserByIdRef {
  _GetUserByIdProviderElement(super.provider);

  @override
  String get userId => (origin as GetUserByIdProvider).userId;
}

String _$userProfileHash() => r'be7fa4aa261f52567d618b2a5faf0e0549232ad7';

abstract class _$UserProfile
    extends BuildlessAutoDisposeAsyncNotifier<UserModel?> {
  late final String userId;

  FutureOr<UserModel?> build(
    String userId,
  );
}

/// See also [UserProfile].
@ProviderFor(UserProfile)
const userProfileProvider = UserProfileFamily();

/// See also [UserProfile].
class UserProfileFamily extends Family<AsyncValue<UserModel?>> {
  /// See also [UserProfile].
  const UserProfileFamily();

  /// See also [UserProfile].
  UserProfileProvider call(
    String userId,
  ) {
    return UserProfileProvider(
      userId,
    );
  }

  @override
  UserProfileProvider getProviderOverride(
    covariant UserProfileProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'userProfileProvider';
}

/// See also [UserProfile].
class UserProfileProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserProfile, UserModel?> {
  /// See also [UserProfile].
  UserProfileProvider(
    String userId,
  ) : this._internal(
          () => UserProfile()..userId = userId,
          from: userProfileProvider,
          name: r'userProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userProfileHash,
          dependencies: UserProfileFamily._dependencies,
          allTransitiveDependencies:
              UserProfileFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<UserModel?> runNotifierBuild(
    covariant UserProfile notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserProfile Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserProfileProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserProfile, UserModel?>
      createElement() {
    return _UserProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserProfileRef on AutoDisposeAsyncNotifierProviderRef<UserModel?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserProfileProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserProfile, UserModel?>
    with UserProfileRef {
  _UserProfileProviderElement(super.provider);

  @override
  String get userId => (origin as UserProfileProvider).userId;
}

String _$userFavoriteStatusHash() =>
    r'd5bbc574c549498a8bf7b30b61c896b9dfb0867f';

abstract class _$UserFavoriteStatus
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String userId;

  FutureOr<bool> build(
    String userId,
  );
}

/// See also [UserFavoriteStatus].
@ProviderFor(UserFavoriteStatus)
const userFavoriteStatusProvider = UserFavoriteStatusFamily();

/// See also [UserFavoriteStatus].
class UserFavoriteStatusFamily extends Family<AsyncValue<bool>> {
  /// See also [UserFavoriteStatus].
  const UserFavoriteStatusFamily();

  /// See also [UserFavoriteStatus].
  UserFavoriteStatusProvider call(
    String userId,
  ) {
    return UserFavoriteStatusProvider(
      userId,
    );
  }

  @override
  UserFavoriteStatusProvider getProviderOverride(
    covariant UserFavoriteStatusProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'userFavoriteStatusProvider';
}

/// See also [UserFavoriteStatus].
class UserFavoriteStatusProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserFavoriteStatus, bool> {
  /// See also [UserFavoriteStatus].
  UserFavoriteStatusProvider(
    String userId,
  ) : this._internal(
          () => UserFavoriteStatus()..userId = userId,
          from: userFavoriteStatusProvider,
          name: r'userFavoriteStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userFavoriteStatusHash,
          dependencies: UserFavoriteStatusFamily._dependencies,
          allTransitiveDependencies:
              UserFavoriteStatusFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserFavoriteStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<bool> runNotifierBuild(
    covariant UserFavoriteStatus notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserFavoriteStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserFavoriteStatusProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserFavoriteStatus, bool>
      createElement() {
    return _UserFavoriteStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFavoriteStatusProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserFavoriteStatusRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserFavoriteStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserFavoriteStatus, bool>
    with UserFavoriteStatusRef {
  _UserFavoriteStatusProviderElement(super.provider);

  @override
  String get userId => (origin as UserFavoriteStatusProvider).userId;
}

String _$profileVisitsHash() => r'32cfc7dd38f0cec65ee51ded63f1fa76cc443eaa';

/// See also [ProfileVisits].
@ProviderFor(ProfileVisits)
final profileVisitsProvider = AutoDisposeAsyncNotifierProvider<ProfileVisits,
    PaginatedVisitsResponse>.internal(
  ProfileVisits.new,
  name: r'profileVisitsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileVisitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileVisits = AutoDisposeAsyncNotifier<PaginatedVisitsResponse>;
String _$profileVisitorsHash() => r'1b4ac317b5ff6bab55f1de1c5bf954e6d76753a8';

/// See also [ProfileVisitors].
@ProviderFor(ProfileVisitors)
final profileVisitorsProvider = AutoDisposeAsyncNotifierProvider<
    ProfileVisitors, PaginatedVisitsResponse>.internal(
  ProfileVisitors.new,
  name: r'profileVisitorsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileVisitorsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileVisitors = AutoDisposeAsyncNotifier<PaginatedVisitsResponse>;
String _$userBlockListHash() => r'3c031589952a46a76e9eac093fe64709b2d42b41';

/// See also [UserBlockList].
@ProviderFor(UserBlockList)
final userBlockListProvider =
    AutoDisposeAsyncNotifierProvider<UserBlockList, List<UserModel?>>.internal(
  UserBlockList.new,
  name: r'userBlockListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userBlockListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserBlockList = AutoDisposeAsyncNotifier<List<UserModel?>>;
String _$userTapListHash() => r'3f215c316cc30f93b6199ba3fd0e186a96fdca94';

abstract class _$UserTapList
    extends BuildlessAutoDisposeAsyncNotifier<List<UserModel?>> {
  late final String userId;

  FutureOr<List<UserModel?>> build(
    String userId,
  );
}

/// See also [UserTapList].
@ProviderFor(UserTapList)
const userTapListProvider = UserTapListFamily();

/// See also [UserTapList].
class UserTapListFamily extends Family<AsyncValue<List<UserModel?>>> {
  /// See also [UserTapList].
  const UserTapListFamily();

  /// See also [UserTapList].
  UserTapListProvider call(
    String userId,
  ) {
    return UserTapListProvider(
      userId,
    );
  }

  @override
  UserTapListProvider getProviderOverride(
    covariant UserTapListProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'userTapListProvider';
}

/// See also [UserTapList].
class UserTapListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserTapList, List<UserModel?>> {
  /// See also [UserTapList].
  UserTapListProvider(
    String userId,
  ) : this._internal(
          () => UserTapList()..userId = userId,
          from: userTapListProvider,
          name: r'userTapListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userTapListHash,
          dependencies: UserTapListFamily._dependencies,
          allTransitiveDependencies:
              UserTapListFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserTapListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<List<UserModel?>> runNotifierBuild(
    covariant UserTapList notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserTapList Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserTapListProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserTapList, List<UserModel?>>
      createElement() {
    return _UserTapListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserTapListProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserTapListRef on AutoDisposeAsyncNotifierProviderRef<List<UserModel?>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserTapListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserTapList,
        List<UserModel?>> with UserTapListRef {
  _UserTapListProviderElement(super.provider);

  @override
  String get userId => (origin as UserTapListProvider).userId;
}

String _$userEngagementStatusHash() =>
    r'edf4bc88223614315505d496b8ecebd0764f65a1';

abstract class _$UserEngagementStatus
    extends BuildlessAutoDisposeAsyncNotifier<EngagementStatus?> {
  late final String userId;

  FutureOr<EngagementStatus?> build(
    String userId,
  );
}

/// See also [UserEngagementStatus].
@ProviderFor(UserEngagementStatus)
const userEngagementStatusProvider = UserEngagementStatusFamily();

/// See also [UserEngagementStatus].
class UserEngagementStatusFamily extends Family<AsyncValue<EngagementStatus?>> {
  /// See also [UserEngagementStatus].
  const UserEngagementStatusFamily();

  /// See also [UserEngagementStatus].
  UserEngagementStatusProvider call(
    String userId,
  ) {
    return UserEngagementStatusProvider(
      userId,
    );
  }

  @override
  UserEngagementStatusProvider getProviderOverride(
    covariant UserEngagementStatusProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'userEngagementStatusProvider';
}

/// See also [UserEngagementStatus].
class UserEngagementStatusProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserEngagementStatus, EngagementStatus?> {
  /// See also [UserEngagementStatus].
  UserEngagementStatusProvider(
    String userId,
  ) : this._internal(
          () => UserEngagementStatus()..userId = userId,
          from: userEngagementStatusProvider,
          name: r'userEngagementStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userEngagementStatusHash,
          dependencies: UserEngagementStatusFamily._dependencies,
          allTransitiveDependencies:
              UserEngagementStatusFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserEngagementStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<EngagementStatus?> runNotifierBuild(
    covariant UserEngagementStatus notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserEngagementStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserEngagementStatusProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserEngagementStatus,
      EngagementStatus?> createElement() {
    return _UserEngagementStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserEngagementStatusProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserEngagementStatusRef
    on AutoDisposeAsyncNotifierProviderRef<EngagementStatus?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserEngagementStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserEngagementStatus,
        EngagementStatus?> with UserEngagementStatusRef {
  _UserEngagementStatusProviderElement(super.provider);

  @override
  String get userId => (origin as UserEngagementStatusProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
