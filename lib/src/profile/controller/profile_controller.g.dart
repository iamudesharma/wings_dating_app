// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileController)
const profileControllerProvider = ProfileControllerProvider._();

final class ProfileControllerProvider
    extends $NotifierProvider<ProfileController, ProfileState> {
  const ProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileControllerHash();

  @$internal
  @override
  ProfileController create() => ProfileController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileState>(value),
    );
  }
}

String _$profileControllerHash() => r'13d77d94eb2be5821987e17430b8848b3c116af8';

abstract class _$ProfileController extends $Notifier<ProfileState> {
  ProfileState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProfileState, ProfileState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileState, ProfileState>,
              ProfileState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(RoleNotifier)
const roleProvider = RoleNotifierProvider._();

final class RoleNotifierProvider extends $NotifierProvider<RoleNotifier, Role> {
  const RoleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleNotifierHash();

  @$internal
  @override
  RoleNotifier create() => RoleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Role value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Role>(value),
    );
  }
}

String _$roleNotifierHash() => r'b7ba246ca66d4052a99100359abb6d604d91f95a';

abstract class _$RoleNotifier extends $Notifier<Role> {
  Role build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Role, Role>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Role, Role>,
              Role,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(BodyTypeNotifier)
const bodyTypeProvider = BodyTypeNotifierProvider._();

final class BodyTypeNotifierProvider
    extends $NotifierProvider<BodyTypeNotifier, BodyType> {
  const BodyTypeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bodyTypeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bodyTypeNotifierHash();

  @$internal
  @override
  BodyTypeNotifier create() => BodyTypeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BodyType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BodyType>(value),
    );
  }
}

String _$bodyTypeNotifierHash() => r'7f4fd32bedfcedeb819da6a6e15cde68765ce86d';

abstract class _$BodyTypeNotifier extends $Notifier<BodyType> {
  BodyType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BodyType, BodyType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BodyType, BodyType>,
              BodyType,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(RelationshipStatusNotifier)
const relationshipStatusProvider = RelationshipStatusNotifierProvider._();

final class RelationshipStatusNotifierProvider
    extends $NotifierProvider<RelationshipStatusNotifier, RelationshipStatus> {
  const RelationshipStatusNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'relationshipStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$relationshipStatusNotifierHash();

  @$internal
  @override
  RelationshipStatusNotifier create() => RelationshipStatusNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RelationshipStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RelationshipStatus>(value),
    );
  }
}

String _$relationshipStatusNotifierHash() =>
    r'0d7411ba92f5cc93ae465b5badf65fde351008e0';

abstract class _$RelationshipStatusNotifier
    extends $Notifier<RelationshipStatus> {
  RelationshipStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RelationshipStatus, RelationshipStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RelationshipStatus, RelationshipStatus>,
              RelationshipStatus,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(EthnicityNotifier)
const ethnicityProvider = EthnicityNotifierProvider._();

final class EthnicityNotifierProvider
    extends $NotifierProvider<EthnicityNotifier, Ethnicity> {
  const EthnicityNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ethnicityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ethnicityNotifierHash();

  @$internal
  @override
  EthnicityNotifier create() => EthnicityNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Ethnicity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Ethnicity>(value),
    );
  }
}

String _$ethnicityNotifierHash() => r'cb04913404e688110bb47ed1c437e85b7bc7c927';

abstract class _$EthnicityNotifier extends $Notifier<Ethnicity> {
  Ethnicity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Ethnicity, Ethnicity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Ethnicity, Ethnicity>,
              Ethnicity,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(LookingForNotifier)
const lookingForProvider = LookingForNotifierProvider._();

final class LookingForNotifierProvider
    extends $NotifierProvider<LookingForNotifier, LookingFor> {
  const LookingForNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lookingForProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lookingForNotifierHash();

  @$internal
  @override
  LookingForNotifier create() => LookingForNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LookingFor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LookingFor>(value),
    );
  }
}

String _$lookingForNotifierHash() =>
    r'55226a4eb2f6d7e3fadd53d2f232159b335a5171';

abstract class _$LookingForNotifier extends $Notifier<LookingFor> {
  LookingFor build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LookingFor, LookingFor>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LookingFor, LookingFor>,
              LookingFor,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(WhereToMeetNotifier)
const whereToMeetProvider = WhereToMeetNotifierProvider._();

final class WhereToMeetNotifierProvider
    extends $NotifierProvider<WhereToMeetNotifier, WhereToMeet> {
  const WhereToMeetNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'whereToMeetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$whereToMeetNotifierHash();

  @$internal
  @override
  WhereToMeetNotifier create() => WhereToMeetNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WhereToMeet value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WhereToMeet>(value),
    );
  }
}

String _$whereToMeetNotifierHash() =>
    r'c7bc5b191237a3ffe13d6d8cc4ca39c2cf92e703';

abstract class _$WhereToMeetNotifier extends $Notifier<WhereToMeet> {
  WhereToMeet build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<WhereToMeet, WhereToMeet>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WhereToMeet, WhereToMeet>,
              WhereToMeet,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
