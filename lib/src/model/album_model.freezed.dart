// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  String? get id;

  /// Create a copy of UserAlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAlbumModelCopyWith<UserAlbumModel> get copyWith =>
      _$UserAlbumModelCopyWithImpl<UserAlbumModel>(
          this as UserAlbumModel, _$identity);

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
      String? id});

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

/// Adds pattern-matching-related methods to [UserAlbumModel].
extension UserAlbumModelPatterns on UserAlbumModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserAlbumModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserAlbumModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserAlbumModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAlbumModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserAlbumModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAlbumModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String ownerId,
            String name,
            List<String> photos,
            List<String> sharedWith,
            DateTime createdAt,
            DateTime updatedAt,
            bool isShared,
            AlbumOwnerModel? owner,
            String? id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserAlbumModel() when $default != null:
        return $default(
            _that.ownerId,
            _that.name,
            _that.photos,
            _that.sharedWith,
            _that.createdAt,
            _that.updatedAt,
            _that.isShared,
            _that.owner,
            _that.id);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String ownerId,
            String name,
            List<String> photos,
            List<String> sharedWith,
            DateTime createdAt,
            DateTime updatedAt,
            bool isShared,
            AlbumOwnerModel? owner,
            String? id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAlbumModel():
        return $default(
            _that.ownerId,
            _that.name,
            _that.photos,
            _that.sharedWith,
            _that.createdAt,
            _that.updatedAt,
            _that.isShared,
            _that.owner,
            _that.id);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String ownerId,
            String name,
            List<String> photos,
            List<String> sharedWith,
            DateTime createdAt,
            DateTime updatedAt,
            bool isShared,
            AlbumOwnerModel? owner,
            String? id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserAlbumModel() when $default != null:
        return $default(
            _that.ownerId,
            _that.name,
            _that.photos,
            _that.sharedWith,
            _that.createdAt,
            _that.updatedAt,
            _that.isShared,
            _that.owner,
            _that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, createToJson: true)
class _UserAlbumModel implements UserAlbumModel {
  _UserAlbumModel(
      {required this.ownerId,
      required this.name,
      final List<String> photos = const <String>[],
      final List<String> sharedWith = const <String>[],
      required this.createdAt,
      required this.updatedAt,
      this.isShared = false,
      this.owner,
      this.id})
      : _photos = photos,
        _sharedWith = sharedWith;

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
  final String? id;

  /// Create a copy of UserAlbumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAlbumModelCopyWith<_UserAlbumModel> get copyWith =>
      __$UserAlbumModelCopyWithImpl<_UserAlbumModel>(this, _$identity);

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
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
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
      String? id});

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
