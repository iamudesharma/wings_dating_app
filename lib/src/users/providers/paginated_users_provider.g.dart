// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaginatedUsers)
const paginatedUsersProvider = PaginatedUsersFamily._();

final class PaginatedUsersProvider
    extends $NotifierProvider<PaginatedUsers, PaginatedUsersState> {
  const PaginatedUsersProvider._({
    required PaginatedUsersFamily super.from,
    required Map<String, dynamic>? super.argument,
  }) : super(
         retry: null,
         name: r'paginatedUsersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paginatedUsersHash();

  @override
  String toString() {
    return r'paginatedUsersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaginatedUsers create() => PaginatedUsers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaginatedUsersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaginatedUsersState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUsersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paginatedUsersHash() => r'd2f48a91ed30fcf5b565c42a07c1a505c04fc85c';

final class PaginatedUsersFamily extends $Family
    with
        $ClassFamilyOverride<
          PaginatedUsers,
          PaginatedUsersState,
          PaginatedUsersState,
          PaginatedUsersState,
          Map<String, dynamic>?
        > {
  const PaginatedUsersFamily._()
    : super(
        retry: null,
        name: r'paginatedUsersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaginatedUsersProvider call(Map<String, dynamic>? filters) =>
      PaginatedUsersProvider._(argument: filters, from: this);

  @override
  String toString() => r'paginatedUsersProvider';
}

abstract class _$PaginatedUsers extends $Notifier<PaginatedUsersState> {
  late final _$args = ref.$arg as Map<String, dynamic>?;
  Map<String, dynamic>? get filters => _$args;

  PaginatedUsersState build(Map<String, dynamic>? filters);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<PaginatedUsersState, PaginatedUsersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaginatedUsersState, PaginatedUsersState>,
              PaginatedUsersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
