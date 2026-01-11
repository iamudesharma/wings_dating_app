// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_users_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchUser)
final searchUserProvider = SearchUserProvider._();

final class SearchUserProvider
    extends $AsyncNotifierProvider<SearchUser, List<UserModel?>?> {
  SearchUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchUserHash();

  @$internal
  @override
  SearchUser create() => SearchUser();
}

String _$searchUserHash() => r'113325d9511d31bca0d8012a25511527ff429ec1';

abstract class _$SearchUser extends $AsyncNotifier<List<UserModel?>?> {
  FutureOr<List<UserModel?>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<UserModel?>?>, List<UserModel?>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UserModel?>?>, List<UserModel?>?>,
              AsyncValue<List<UserModel?>?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
