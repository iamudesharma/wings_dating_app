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
mixin _$AlbumListModel {
  List<String> get imageUrls;
  String get name;
  String get userId;
  String get id;

  /// Create a copy of AlbumListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AlbumListModelCopyWith<AlbumListModel> get copyWith =>
      _$AlbumListModelCopyWithImpl<AlbumListModel>(
          this as AlbumListModel, _$identity);

  /// Serializes this AlbumListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlbumListModel &&
            const DeepCollectionEquality().equals(other.imageUrls, imageUrls) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(imageUrls), name, userId, id);

  @override
  String toString() {
    return 'AlbumListModel(imageUrls: $imageUrls, name: $name, userId: $userId, id: $id)';
  }
}

/// @nodoc
abstract mixin class $AlbumListModelCopyWith<$Res> {
  factory $AlbumListModelCopyWith(
          AlbumListModel value, $Res Function(AlbumListModel) _then) =
      _$AlbumListModelCopyWithImpl;
  @useResult
  $Res call({List<String> imageUrls, String name, String userId, String id});
}

/// @nodoc
class _$AlbumListModelCopyWithImpl<$Res>
    implements $AlbumListModelCopyWith<$Res> {
  _$AlbumListModelCopyWithImpl(this._self, this._then);

  final AlbumListModel _self;
  final $Res Function(AlbumListModel) _then;

  /// Create a copy of AlbumListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrls = null,
    Object? name = null,
    Object? userId = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      imageUrls: null == imageUrls
          ? _self.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true)
class _AlbumListModel implements AlbumListModel {
  _AlbumListModel(
      {required final List<String> imageUrls,
      required this.name,
      required this.userId,
      required this.id})
      : _imageUrls = imageUrls;
  factory _AlbumListModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumListModelFromJson(json);

  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final String name;
  @override
  final String userId;
  @override
  final String id;

  /// Create a copy of AlbumListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AlbumListModelCopyWith<_AlbumListModel> get copyWith =>
      __$AlbumListModelCopyWithImpl<_AlbumListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AlbumListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlbumListModel &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_imageUrls), name, userId, id);

  @override
  String toString() {
    return 'AlbumListModel(imageUrls: $imageUrls, name: $name, userId: $userId, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$AlbumListModelCopyWith<$Res>
    implements $AlbumListModelCopyWith<$Res> {
  factory _$AlbumListModelCopyWith(
          _AlbumListModel value, $Res Function(_AlbumListModel) _then) =
      __$AlbumListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> imageUrls, String name, String userId, String id});
}

/// @nodoc
class __$AlbumListModelCopyWithImpl<$Res>
    implements _$AlbumListModelCopyWith<$Res> {
  __$AlbumListModelCopyWithImpl(this._self, this._then);

  final _AlbumListModel _self;
  final $Res Function(_AlbumListModel) _then;

  /// Create a copy of AlbumListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUrls = null,
    Object? name = null,
    Object? userId = null,
    Object? id = null,
  }) {
    return _then(_AlbumListModel(
      imageUrls: null == imageUrls
          ? _self._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
