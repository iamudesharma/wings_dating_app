// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUserById)
final getUserByIdProvider = GetUserByIdFamily._();

final class GetUserByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserModel?>,
          UserModel?,
          FutureOr<UserModel?>
        >
    with $FutureModifier<UserModel?>, $FutureProvider<UserModel?> {
  GetUserByIdProvider._({
    required GetUserByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getUserByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserByIdHash();

  @override
  String toString() {
    return r'getUserByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserModel?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UserModel?> create(Ref ref) {
    final argument = this.argument as String;
    return getUserById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserByIdHash() => r'f119cbbad83c4e27b9fc42506d4da0d04694c09e';

final class GetUserByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserModel?>, String> {
  GetUserByIdFamily._()
    : super(
        retry: null,
        name: r'getUserByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUserByIdProvider call(String userId) =>
      GetUserByIdProvider._(argument: userId, from: this);

  @override
  String toString() => r'getUserByIdProvider';
}

@ProviderFor(UserProfile)
final userProfileProvider = UserProfileFamily._();

final class UserProfileProvider
    extends $AsyncNotifierProvider<UserProfile, UserModel?> {
  UserProfileProvider._({
    required UserProfileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userProfileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userProfileHash();

  @override
  String toString() {
    return r'userProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserProfile create() => UserProfile();

  @override
  bool operator ==(Object other) {
    return other is UserProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userProfileHash() => r'be7fa4aa261f52567d618b2a5faf0e0549232ad7';

final class UserProfileFamily extends $Family
    with
        $ClassFamilyOverride<
          UserProfile,
          AsyncValue<UserModel?>,
          UserModel?,
          FutureOr<UserModel?>,
          String
        > {
  UserProfileFamily._()
    : super(
        retry: null,
        name: r'userProfileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserProfileProvider call(String userId) =>
      UserProfileProvider._(argument: userId, from: this);

  @override
  String toString() => r'userProfileProvider';
}

abstract class _$UserProfile extends $AsyncNotifier<UserModel?> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  FutureOr<UserModel?> build(String userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserModel?>, UserModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserModel?>, UserModel?>,
              AsyncValue<UserModel?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(UserFavoriteStatus)
final userFavoriteStatusProvider = UserFavoriteStatusFamily._();

final class UserFavoriteStatusProvider
    extends $AsyncNotifierProvider<UserFavoriteStatus, bool> {
  UserFavoriteStatusProvider._({
    required UserFavoriteStatusFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userFavoriteStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userFavoriteStatusHash();

  @override
  String toString() {
    return r'userFavoriteStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserFavoriteStatus create() => UserFavoriteStatus();

  @override
  bool operator ==(Object other) {
    return other is UserFavoriteStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userFavoriteStatusHash() =>
    r'd5bbc574c549498a8bf7b30b61c896b9dfb0867f';

final class UserFavoriteStatusFamily extends $Family
    with
        $ClassFamilyOverride<
          UserFavoriteStatus,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          String
        > {
  UserFavoriteStatusFamily._()
    : super(
        retry: null,
        name: r'userFavoriteStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserFavoriteStatusProvider call(String userId) =>
      UserFavoriteStatusProvider._(argument: userId, from: this);

  @override
  String toString() => r'userFavoriteStatusProvider';
}

abstract class _$UserFavoriteStatus extends $AsyncNotifier<bool> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  FutureOr<bool> build(String userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ProfileVisits)
final profileVisitsProvider = ProfileVisitsProvider._();

final class ProfileVisitsProvider
    extends $AsyncNotifierProvider<ProfileVisits, PaginatedVisitsResponse> {
  ProfileVisitsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileVisitsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileVisitsHash();

  @$internal
  @override
  ProfileVisits create() => ProfileVisits();
}

String _$profileVisitsHash() => r'32cfc7dd38f0cec65ee51ded63f1fa76cc443eaa';

abstract class _$ProfileVisits extends $AsyncNotifier<PaginatedVisitsResponse> {
  FutureOr<PaginatedVisitsResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PaginatedVisitsResponse>,
              PaginatedVisitsResponse
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedVisitsResponse>,
                PaginatedVisitsResponse
              >,
              AsyncValue<PaginatedVisitsResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProfileVisitors)
final profileVisitorsProvider = ProfileVisitorsProvider._();

final class ProfileVisitorsProvider
    extends $AsyncNotifierProvider<ProfileVisitors, PaginatedVisitsResponse> {
  ProfileVisitorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileVisitorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileVisitorsHash();

  @$internal
  @override
  ProfileVisitors create() => ProfileVisitors();
}

String _$profileVisitorsHash() => r'1b4ac317b5ff6bab55f1de1c5bf954e6d76753a8';

abstract class _$ProfileVisitors
    extends $AsyncNotifier<PaginatedVisitsResponse> {
  FutureOr<PaginatedVisitsResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PaginatedVisitsResponse>,
              PaginatedVisitsResponse
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedVisitsResponse>,
                PaginatedVisitsResponse
              >,
              AsyncValue<PaginatedVisitsResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UserBlockList)
final userBlockListProvider = UserBlockListProvider._();

final class UserBlockListProvider
    extends $AsyncNotifierProvider<UserBlockList, List<UserModel?>> {
  UserBlockListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userBlockListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userBlockListHash();

  @$internal
  @override
  UserBlockList create() => UserBlockList();
}

String _$userBlockListHash() => r'3c031589952a46a76e9eac093fe64709b2d42b41';

abstract class _$UserBlockList extends $AsyncNotifier<List<UserModel?>> {
  FutureOr<List<UserModel?>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<UserModel?>>, List<UserModel?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UserModel?>>, List<UserModel?>>,
              AsyncValue<List<UserModel?>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UserTapList)
final userTapListProvider = UserTapListFamily._();

final class UserTapListProvider
    extends $AsyncNotifierProvider<UserTapList, List<UserModel?>> {
  UserTapListProvider._({
    required UserTapListFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userTapListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userTapListHash();

  @override
  String toString() {
    return r'userTapListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserTapList create() => UserTapList();

  @override
  bool operator ==(Object other) {
    return other is UserTapListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userTapListHash() => r'3f215c316cc30f93b6199ba3fd0e186a96fdca94';

final class UserTapListFamily extends $Family
    with
        $ClassFamilyOverride<
          UserTapList,
          AsyncValue<List<UserModel?>>,
          List<UserModel?>,
          FutureOr<List<UserModel?>>,
          String
        > {
  UserTapListFamily._()
    : super(
        retry: null,
        name: r'userTapListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserTapListProvider call(String userId) =>
      UserTapListProvider._(argument: userId, from: this);

  @override
  String toString() => r'userTapListProvider';
}

abstract class _$UserTapList extends $AsyncNotifier<List<UserModel?>> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  FutureOr<List<UserModel?>> build(String userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<UserModel?>>, List<UserModel?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UserModel?>>, List<UserModel?>>,
              AsyncValue<List<UserModel?>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(UserEngagementStatus)
final userEngagementStatusProvider = UserEngagementStatusFamily._();

final class UserEngagementStatusProvider
    extends $AsyncNotifierProvider<UserEngagementStatus, EngagementStatus?> {
  UserEngagementStatusProvider._({
    required UserEngagementStatusFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userEngagementStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userEngagementStatusHash();

  @override
  String toString() {
    return r'userEngagementStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserEngagementStatus create() => UserEngagementStatus();

  @override
  bool operator ==(Object other) {
    return other is UserEngagementStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userEngagementStatusHash() =>
    r'edf4bc88223614315505d496b8ecebd0764f65a1';

final class UserEngagementStatusFamily extends $Family
    with
        $ClassFamilyOverride<
          UserEngagementStatus,
          AsyncValue<EngagementStatus?>,
          EngagementStatus?,
          FutureOr<EngagementStatus?>,
          String
        > {
  UserEngagementStatusFamily._()
    : super(
        retry: null,
        name: r'userEngagementStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserEngagementStatusProvider call(String userId) =>
      UserEngagementStatusProvider._(argument: userId, from: this);

  @override
  String toString() => r'userEngagementStatusProvider';
}

abstract class _$UserEngagementStatus
    extends $AsyncNotifier<EngagementStatus?> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  FutureOr<EngagementStatus?> build(String userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<EngagementStatus?>, EngagementStatus?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<EngagementStatus?>, EngagementStatus?>,
              AsyncValue<EngagementStatus?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
