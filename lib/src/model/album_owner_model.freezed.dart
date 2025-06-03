// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_owner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlbumOwnerModel {
  String get id;
  String get username;
  String get profilePicture;

  /// Create a copy of AlbumOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AlbumOwnerModelCopyWith<AlbumOwnerModel> get copyWith =>
      _$AlbumOwnerModelCopyWithImpl<AlbumOwnerModel>(
          this as AlbumOwnerModel, _$identity);

  /// Serializes this AlbumOwnerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlbumOwnerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, profilePicture);

  @override
  String toString() {
    return 'AlbumOwnerModel(id: $id, username: $username, profilePicture: $profilePicture)';
  }
}

/// @nodoc
abstract mixin class $AlbumOwnerModelCopyWith<$Res> {
  factory $AlbumOwnerModelCopyWith(
          AlbumOwnerModel value, $Res Function(AlbumOwnerModel) _then) =
      _$AlbumOwnerModelCopyWithImpl;
  @useResult
  $Res call({String id, String username, String profilePicture});
}

/// @nodoc
class _$AlbumOwnerModelCopyWithImpl<$Res>
    implements $AlbumOwnerModelCopyWith<$Res> {
  _$AlbumOwnerModelCopyWithImpl(this._self, this._then);

  final AlbumOwnerModel _self;
  final $Res Function(AlbumOwnerModel) _then;

  /// Create a copy of AlbumOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? profilePicture = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AlbumOwnerModel implements AlbumOwnerModel {
  const _AlbumOwnerModel(
      {required this.id, required this.username, required this.profilePicture});
  factory _AlbumOwnerModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumOwnerModelFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String profilePicture;

  /// Create a copy of AlbumOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AlbumOwnerModelCopyWith<_AlbumOwnerModel> get copyWith =>
      __$AlbumOwnerModelCopyWithImpl<_AlbumOwnerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AlbumOwnerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlbumOwnerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, profilePicture);

  @override
  String toString() {
    return 'AlbumOwnerModel(id: $id, username: $username, profilePicture: $profilePicture)';
  }
}

/// @nodoc
abstract mixin class _$AlbumOwnerModelCopyWith<$Res>
    implements $AlbumOwnerModelCopyWith<$Res> {
  factory _$AlbumOwnerModelCopyWith(
          _AlbumOwnerModel value, $Res Function(_AlbumOwnerModel) _then) =
      __$AlbumOwnerModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String username, String profilePicture});
}

/// @nodoc
class __$AlbumOwnerModelCopyWithImpl<$Res>
    implements _$AlbumOwnerModelCopyWith<$Res> {
  __$AlbumOwnerModelCopyWithImpl(this._self, this._then);

  final _AlbumOwnerModel _self;
  final $Res Function(_AlbumOwnerModel) _then;

  /// Create a copy of AlbumOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? profilePicture = null,
  }) {
    return _then(_AlbumOwnerModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
