// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumsRepoHash() => r'2253b26fd278a9aa1b6576aec54b10d044b50124';

/// See also [albumsRepo].
@ProviderFor(albumsRepo)
final albumsRepoProvider = AutoDisposeProvider<AlbumsRepo>.internal(
  albumsRepo,
  name: r'albumsRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$albumsRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AlbumsRepoRef = AutoDisposeProviderRef<AlbumsRepo>;
String _$sharedAlbumHash() => r'5c149220e45fe3a0a968bb2da4e62587f26c5bca';

/// See also [SharedAlbum].
@ProviderFor(SharedAlbum)
final sharedAlbumProvider =
    AsyncNotifierProvider<SharedAlbum, List<GetMessageResponse>>.internal(
  SharedAlbum.new,
  name: r'sharedAlbumProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sharedAlbumHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SharedAlbum = AsyncNotifier<List<GetMessageResponse>>;
String _$albumClassHash() => r'af37c3cd9bdcf071ac25362aa4246ce9b9a21a8c';

/// See also [AlbumClass].
@ProviderFor(AlbumClass)
final albumClassProvider =
    AutoDisposeNotifierProvider<AlbumClass, Object?>.internal(
  AlbumClass.new,
  name: r'albumClassProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$albumClassHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AlbumClass = AutoDisposeNotifier<Object?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
