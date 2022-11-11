// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get nickname => throw _privateConstructorUsedError;
  String? get aboutMe => throw _privateConstructorUsedError;
  List<String>? get albumUrl => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  UserBasicModel? get userBasicModel => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  BodyType get bodyType => throw _privateConstructorUsedError;
  RelationshipStatus get relationshipStatus =>
      throw _privateConstructorUsedError;
  Ethnicity get ethnicity => throw _privateConstructorUsedError;
  LookingFor? get lookingFor => throw _privateConstructorUsedError;
  WhereToMeet? get whereToMeet => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String nickname,
      String? aboutMe,
      List<String>? albumUrl,
      String? avatarUrl,
      UserBasicModel? userBasicModel,
      Role role,
      BodyType bodyType,
      RelationshipStatus relationshipStatus,
      Ethnicity ethnicity,
      LookingFor? lookingFor,
      WhereToMeet? whereToMeet,
      bool isOnline,
      bool isVerified,
      bool isBlocked,
      int? age});

  $UserBasicModelCopyWith<$Res>? get userBasicModel;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? aboutMe = freezed,
    Object? albumUrl = freezed,
    Object? avatarUrl = freezed,
    Object? userBasicModel = freezed,
    Object? role = null,
    Object? bodyType = null,
    Object? relationshipStatus = null,
    Object? ethnicity = null,
    Object? lookingFor = freezed,
    Object? whereToMeet = freezed,
    Object? isOnline = null,
    Object? isVerified = null,
    Object? isBlocked = null,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: freezed == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String?,
      albumUrl: freezed == albumUrl
          ? _value.albumUrl
          : albumUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userBasicModel: freezed == userBasicModel
          ? _value.userBasicModel
          : userBasicModel // ignore: cast_nullable_to_non_nullable
              as UserBasicModel?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      bodyType: null == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyType,
      relationshipStatus: null == relationshipStatus
          ? _value.relationshipStatus
          : relationshipStatus // ignore: cast_nullable_to_non_nullable
              as RelationshipStatus,
      ethnicity: null == ethnicity
          ? _value.ethnicity
          : ethnicity // ignore: cast_nullable_to_non_nullable
              as Ethnicity,
      lookingFor: freezed == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as LookingFor?,
      whereToMeet: freezed == whereToMeet
          ? _value.whereToMeet
          : whereToMeet // ignore: cast_nullable_to_non_nullable
              as WhereToMeet?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserBasicModelCopyWith<$Res>? get userBasicModel {
    if (_value.userBasicModel == null) {
      return null;
    }

    return $UserBasicModelCopyWith<$Res>(_value.userBasicModel!, (value) {
      return _then(_value.copyWith(userBasicModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      String? aboutMe,
      List<String>? albumUrl,
      String? avatarUrl,
      UserBasicModel? userBasicModel,
      Role role,
      BodyType bodyType,
      RelationshipStatus relationshipStatus,
      Ethnicity ethnicity,
      LookingFor? lookingFor,
      WhereToMeet? whereToMeet,
      bool isOnline,
      bool isVerified,
      bool isBlocked,
      int? age});

  @override
  $UserBasicModelCopyWith<$Res>? get userBasicModel;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? aboutMe = freezed,
    Object? albumUrl = freezed,
    Object? avatarUrl = freezed,
    Object? userBasicModel = freezed,
    Object? role = null,
    Object? bodyType = null,
    Object? relationshipStatus = null,
    Object? ethnicity = null,
    Object? lookingFor = freezed,
    Object? whereToMeet = freezed,
    Object? isOnline = null,
    Object? isVerified = null,
    Object? isBlocked = null,
    Object? age = freezed,
  }) {
    return _then(_$_UserModel(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: freezed == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String?,
      albumUrl: freezed == albumUrl
          ? _value._albumUrl
          : albumUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userBasicModel: freezed == userBasicModel
          ? _value.userBasicModel
          : userBasicModel // ignore: cast_nullable_to_non_nullable
              as UserBasicModel?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      bodyType: null == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyType,
      relationshipStatus: null == relationshipStatus
          ? _value.relationshipStatus
          : relationshipStatus // ignore: cast_nullable_to_non_nullable
              as RelationshipStatus,
      ethnicity: null == ethnicity
          ? _value.ethnicity
          : ethnicity // ignore: cast_nullable_to_non_nullable
              as Ethnicity,
      lookingFor: freezed == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as LookingFor?,
      whereToMeet: freezed == whereToMeet
          ? _value.whereToMeet
          : whereToMeet // ignore: cast_nullable_to_non_nullable
              as WhereToMeet?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {required this.nickname,
      this.aboutMe,
      final List<String>? albumUrl,
      this.avatarUrl,
      this.userBasicModel,
      this.role = Role.doNotShow,
      this.bodyType = BodyType.doNotShow,
      this.relationshipStatus = RelationshipStatus.doNotShow,
      this.ethnicity = Ethnicity.doNotShow,
      this.lookingFor,
      this.whereToMeet,
      this.isOnline = false,
      this.isVerified = false,
      this.isBlocked = false,
      this.age})
      : _albumUrl = albumUrl;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String nickname;
  @override
  final String? aboutMe;
  final List<String>? _albumUrl;
  @override
  List<String>? get albumUrl {
    final value = _albumUrl;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? avatarUrl;
  @override
  final UserBasicModel? userBasicModel;
  @override
  @JsonKey()
  final Role role;
  @override
  @JsonKey()
  final BodyType bodyType;
  @override
  @JsonKey()
  final RelationshipStatus relationshipStatus;
  @override
  @JsonKey()
  final Ethnicity ethnicity;
  @override
  final LookingFor? lookingFor;
  @override
  final WhereToMeet? whereToMeet;
  @override
  @JsonKey()
  final bool isOnline;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isBlocked;
  @override
  final int? age;

  @override
  String toString() {
    return 'UserModel(nickname: $nickname, aboutMe: $aboutMe, albumUrl: $albumUrl, avatarUrl: $avatarUrl, userBasicModel: $userBasicModel, role: $role, bodyType: $bodyType, relationshipStatus: $relationshipStatus, ethnicity: $ethnicity, lookingFor: $lookingFor, whereToMeet: $whereToMeet, isOnline: $isOnline, isVerified: $isVerified, isBlocked: $isBlocked, age: $age)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            const DeepCollectionEquality().equals(other._albumUrl, _albumUrl) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.userBasicModel, userBasicModel) ||
                other.userBasicModel == userBasicModel) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.relationshipStatus, relationshipStatus) ||
                other.relationshipStatus == relationshipStatus) &&
            (identical(other.ethnicity, ethnicity) ||
                other.ethnicity == ethnicity) &&
            (identical(other.lookingFor, lookingFor) ||
                other.lookingFor == lookingFor) &&
            (identical(other.whereToMeet, whereToMeet) ||
                other.whereToMeet == whereToMeet) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickname,
      aboutMe,
      const DeepCollectionEquality().hash(_albumUrl),
      avatarUrl,
      userBasicModel,
      role,
      bodyType,
      relationshipStatus,
      ethnicity,
      lookingFor,
      whereToMeet,
      isOnline,
      isVerified,
      isBlocked,
      age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String nickname,
      final String? aboutMe,
      final List<String>? albumUrl,
      final String? avatarUrl,
      final UserBasicModel? userBasicModel,
      final Role role,
      final BodyType bodyType,
      final RelationshipStatus relationshipStatus,
      final Ethnicity ethnicity,
      final LookingFor? lookingFor,
      final WhereToMeet? whereToMeet,
      final bool isOnline,
      final bool isVerified,
      final bool isBlocked,
      final int? age}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get nickname;
  @override
  String? get aboutMe;
  @override
  List<String>? get albumUrl;
  @override
  String? get avatarUrl;
  @override
  UserBasicModel? get userBasicModel;
  @override
  Role get role;
  @override
  BodyType get bodyType;
  @override
  RelationshipStatus get relationshipStatus;
  @override
  Ethnicity get ethnicity;
  @override
  LookingFor? get lookingFor;
  @override
  WhereToMeet? get whereToMeet;
  @override
  bool get isOnline;
  @override
  bool get isVerified;
  @override
  bool get isBlocked;
  @override
  int? get age;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
