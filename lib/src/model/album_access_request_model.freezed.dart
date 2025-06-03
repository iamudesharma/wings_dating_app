// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_access_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlbumAccessRequestModel {
  String get albumId;
  String get requesterId;
  String get message;
  AccessRequestStatus get status;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of AlbumAccessRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AlbumAccessRequestModelCopyWith<AlbumAccessRequestModel> get copyWith =>
      _$AlbumAccessRequestModelCopyWithImpl<AlbumAccessRequestModel>(
          this as AlbumAccessRequestModel, _$identity);

  /// Serializes this AlbumAccessRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AlbumAccessRequestModel &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.requesterId, requesterId) ||
                other.requesterId == requesterId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, albumId, requesterId, message, status, createdAt, updatedAt);

  @override
  String toString() {
    return 'AlbumAccessRequestModel(albumId: $albumId, requesterId: $requesterId, message: $message, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AlbumAccessRequestModelCopyWith<$Res> {
  factory $AlbumAccessRequestModelCopyWith(AlbumAccessRequestModel value,
          $Res Function(AlbumAccessRequestModel) _then) =
      _$AlbumAccessRequestModelCopyWithImpl;
  @useResult
  $Res call(
      {String albumId,
      String requesterId,
      String message,
      AccessRequestStatus status,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AlbumAccessRequestModelCopyWithImpl<$Res>
    implements $AlbumAccessRequestModelCopyWith<$Res> {
  _$AlbumAccessRequestModelCopyWithImpl(this._self, this._then);

  final AlbumAccessRequestModel _self;
  final $Res Function(AlbumAccessRequestModel) _then;

  /// Create a copy of AlbumAccessRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumId = null,
    Object? requesterId = null,
    Object? message = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      albumId: null == albumId
          ? _self.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String,
      requesterId: null == requesterId
          ? _self.requesterId
          : requesterId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AccessRequestStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    explicitToJson: true,
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true)
class _AlbumAccessRequestModel implements AlbumAccessRequestModel {
  const _AlbumAccessRequestModel(
      {required this.albumId,
      required this.requesterId,
      required this.message,
      this.status = AccessRequestStatus.pending,
      required this.createdAt,
      required this.updatedAt});
  factory _AlbumAccessRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumAccessRequestModelFromJson(json);

  @override
  final String albumId;
  @override
  final String requesterId;
  @override
  final String message;
  @override
  @JsonKey()
  final AccessRequestStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of AlbumAccessRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AlbumAccessRequestModelCopyWith<_AlbumAccessRequestModel> get copyWith =>
      __$AlbumAccessRequestModelCopyWithImpl<_AlbumAccessRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AlbumAccessRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlbumAccessRequestModel &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.requesterId, requesterId) ||
                other.requesterId == requesterId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, albumId, requesterId, message, status, createdAt, updatedAt);

  @override
  String toString() {
    return 'AlbumAccessRequestModel(albumId: $albumId, requesterId: $requesterId, message: $message, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AlbumAccessRequestModelCopyWith<$Res>
    implements $AlbumAccessRequestModelCopyWith<$Res> {
  factory _$AlbumAccessRequestModelCopyWith(_AlbumAccessRequestModel value,
          $Res Function(_AlbumAccessRequestModel) _then) =
      __$AlbumAccessRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String albumId,
      String requesterId,
      String message,
      AccessRequestStatus status,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$AlbumAccessRequestModelCopyWithImpl<$Res>
    implements _$AlbumAccessRequestModelCopyWith<$Res> {
  __$AlbumAccessRequestModelCopyWithImpl(this._self, this._then);

  final _AlbumAccessRequestModel _self;
  final $Res Function(_AlbumAccessRequestModel) _then;

  /// Create a copy of AlbumAccessRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? albumId = null,
    Object? requesterId = null,
    Object? message = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_AlbumAccessRequestModel(
      albumId: null == albumId
          ? _self.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as String,
      requesterId: null == requesterId
          ? _self.requesterId
          : requesterId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AccessRequestStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
