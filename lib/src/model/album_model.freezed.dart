// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumListModel _$AlbumListModelFromJson(Map<String, dynamic> json) {
  return _AlbumListModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumListModel {
  List<String> get imageUrls => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this AlbumListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlbumListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumListModelCopyWith<AlbumListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumListModelCopyWith<$Res> {
  factory $AlbumListModelCopyWith(
          AlbumListModel value, $Res Function(AlbumListModel) then) =
      _$AlbumListModelCopyWithImpl<$Res, AlbumListModel>;
  @useResult
  $Res call({List<String> imageUrls, String name, String userId, String id});
}

/// @nodoc
class _$AlbumListModelCopyWithImpl<$Res, $Val extends AlbumListModel>
    implements $AlbumListModelCopyWith<$Res> {
  _$AlbumListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumListModelImplCopyWith<$Res>
    implements $AlbumListModelCopyWith<$Res> {
  factory _$$AlbumListModelImplCopyWith(_$AlbumListModelImpl value,
          $Res Function(_$AlbumListModelImpl) then) =
      __$$AlbumListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> imageUrls, String name, String userId, String id});
}

/// @nodoc
class __$$AlbumListModelImplCopyWithImpl<$Res>
    extends _$AlbumListModelCopyWithImpl<$Res, _$AlbumListModelImpl>
    implements _$$AlbumListModelImplCopyWith<$Res> {
  __$$AlbumListModelImplCopyWithImpl(
      _$AlbumListModelImpl _value, $Res Function(_$AlbumListModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$AlbumListModelImpl(
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
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
class _$AlbumListModelImpl implements _AlbumListModel {
  const _$AlbumListModelImpl(
      {required final List<String> imageUrls,
      required this.name,
      required this.userId,
      required this.id})
      : _imageUrls = imageUrls;

  factory _$AlbumListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumListModelImplFromJson(json);

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

  @override
  String toString() {
    return 'AlbumListModel(imageUrls: $imageUrls, name: $name, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumListModelImpl &&
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

  /// Create a copy of AlbumListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumListModelImplCopyWith<_$AlbumListModelImpl> get copyWith =>
      __$$AlbumListModelImplCopyWithImpl<_$AlbumListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumListModelImplToJson(
      this,
    );
  }
}

abstract class _AlbumListModel implements AlbumListModel {
  const factory _AlbumListModel(
      {required final List<String> imageUrls,
      required final String name,
      required final String userId,
      required final String id}) = _$AlbumListModelImpl;

  factory _AlbumListModel.fromJson(Map<String, dynamic> json) =
      _$AlbumListModelImpl.fromJson;

  @override
  List<String> get imageUrls;
  @override
  String get name;
  @override
  String get userId;
  @override
  String get id;

  /// Create a copy of AlbumListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumListModelImplCopyWith<_$AlbumListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
