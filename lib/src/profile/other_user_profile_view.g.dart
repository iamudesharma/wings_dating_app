// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user_profile_view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Fav)
const favProvider = FavFamily._();

final class FavProvider extends $AsyncNotifierProvider<Fav, bool> {
  const FavProvider._({
    required FavFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'favProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$favHash();

  @override
  String toString() {
    return r'favProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Fav create() => Fav();

  @override
  bool operator ==(Object other) {
    return other is FavProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$favHash() => r'2778855792ba0349b1d5d5340c52d22422d769a4';

final class FavFamily extends $Family
    with
        $ClassFamilyOverride<
          Fav,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          String
        > {
  const FavFamily._()
    : super(
        retry: null,
        name: r'favProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FavProvider call(String id) => FavProvider._(argument: id, from: this);

  @override
  String toString() => r'favProvider';
}

abstract class _$Fav extends $AsyncNotifier<bool> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<bool> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
