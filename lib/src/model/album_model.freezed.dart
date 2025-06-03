// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAlbumModel {
  String get ownerId;
  String get name;
  List<String> get photos;
  List<String> get sharedWith;
  DateTime get createdAt;
  DateTime get updatedAt;
  bool get isShared;
  AlbumOwnerModel? get owner;
  @JsonKey(name: "_id")
  String? get id;

  /// Create a copy of UserAlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAlbumModelCopyWith<UserAlbumModel> get copyWith =>
      _$UserAlbumModelCopyWithImpl<UserAlbumModel>(
          this as UserAlbumModel, _$identity);

  /// Serializes this UserAlbumModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAlbumModel &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.photos, photos) &&
            const DeepCollectionEquality()
                .equals(other.sharedWith, sharedWith) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ownerId,
      name,
      const DeepCollectionEquality().hash(photos),
      const DeepCollectionEquality().hash(sharedWith),
      createdAt,
      updatedAt,
      isShared,
      owner,
      id);

  @override
  String toString() {
    return 'UserAlbumModel(ownerId: $ownerId, name: $name, photos: $photos, sharedWith: $sharedWith, createdAt: $createdAt, updatedAt: $updatedAt, isShared: $isShared, owner: $owner, id: $id)';
  }
}

/// @nodoc
abstract mixin class $UserAlbumModelCopyWith<$Res> {
  factory $UserAlbumModelCopyWith(
          UserAlbumModel value, $Res Function(UserAlbumModel) _then) =
      _$UserAlbumModelCopyWithImpl;
  @useResult
  $Res call(
      {String ownerId,
      String name,
      List<String> photos,
      List<String> sharedWith,
      DateTime createdAt,
      DateTime updatedAt,
      bool isShared,
      AlbumOwnerModel? owner,
      @JsonKey(name: "_id") String? id});

  $AlbumOwnerModelCopyWith<$Res>? get owner;
}

/// @nodoc
class _$UserAlbumModelCopyWithImpl<$Res>
    implements $UserAlbumModelCopyWith<$Res> {
  _$UserAlbumModelCopyWithImpl(this._self, this._then);

  final UserAlbumModel _self;
  final $Res Function(UserAlbumModel) _then;

  /// Create a copy of UserAlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? name = null,
    Object? photos = null,
    Object? sharedWith = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isShared = null,
    Object? owner = freezed,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _self.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sharedWith: null == sharedWith
          ? _self.sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isShared: null == isShared
          ? _self.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as AlbumOwnerModel?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UserAlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlbumOwnerModelCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $AlbumOwnerModelCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

/// @nodoc

@JsonSerializable(
    explicitToJson: true,
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true)
class _UserAlbumModel implements UserAlbumModel {
  const _UserAlbumModel(
      {required this.ownerId,
      required this.name,
      final List<String> photos = const [],
      final List<String> sharedWith = const [],
      required this.createdAt,
      required this.updatedAt,
      this.isShared = false,
      this.owner,
      @JsonKey(name: "_id") this.id})
      : _photos = photos,
        _sharedWith = sharedWith;
  factory _UserAlbumModel.fromJson(Map<String, dynamic> json) =>
      _$UserAlbumModelFromJson(json);

  @override
  final String ownerId;
  @override
  final String name;
  final List<String> _photos;
  @override
  @JsonKey()
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final List<String> _sharedWith;
  @override
  @JsonKey()
  List<String> get sharedWith {
    if (_sharedWith is EqualUnmodifiableListView) return _sharedWith;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sharedWith);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isShared;
  @override
  final AlbumOwnerModel? owner;
  @override
  @JsonKey(name: "_id")
  final String? id;

  /// Create a copy of UserAlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAlbumModelCopyWith<_UserAlbumModel> get copyWith =>
      __$UserAlbumModelCopyWithImpl<_UserAlbumModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAlbumModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAlbumModel &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality()
                .equals(other._sharedWith, _sharedWith) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ownerId,
      name,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_sharedWith),
      createdAt,
      updatedAt,
      isShared,
      owner,
      id);

  @override
  String toString() {
    return 'UserAlbumModel(ownerId: $ownerId, name: $name, photos: $photos, sharedWith: $sharedWith, createdAt: $createdAt, updatedAt: $updatedAt, isShared: $isShared, owner: $owner, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$UserAlbumModelCopyWith<$Res>
    implements $UserAlbumModelCopyWith<$Res> {
  factory _$UserAlbumModelCopyWith(
          _UserAlbumModel value, $Res Function(_UserAlbumModel) _then) =
      __$UserAlbumModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String ownerId,
      String name,
      List<String> photos,
      List<String> sharedWith,
      DateTime createdAt,
      DateTime updatedAt,
      bool isShared,
      AlbumOwnerModel? owner,
      @JsonKey(name: "_id") String? id});

  @override
  $AlbumOwnerModelCopyWith<$Res>? get owner;
}

/// @nodoc
class __$UserAlbumModelCopyWithImpl<$Res>
    implements _$UserAlbumModelCopyWith<$Res> {
  __$UserAlbumModelCopyWithImpl(this._self, this._then);

  final _UserAlbumModel _self;
  final $Res Function(_UserAlbumModel) _then;

  /// Create a copy of UserAlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ownerId = null,
    Object? name = null,
    Object? photos = null,
    Object? sharedWith = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isShared = null,
    Object? owner = freezed,
    Object? id = freezed,
  }) {
    return _then(_UserAlbumModel(
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _self._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sharedWith: null == sharedWith
          ? _self._sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isShared: null == isShared
          ? _self.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as AlbumOwnerModel?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UserAlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AlbumOwnerModelCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $AlbumOwnerModelCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

// dart format on
