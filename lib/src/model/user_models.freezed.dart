// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String get username => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  List<String>? get albumUrl => throw _privateConstructorUsedError;
  String? get profileUrl => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: "position")
  GeoPointData? get position => throw _privateConstructorUsedError;
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
  String get id => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserModel value) $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserModel value)? $default,
  ) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserModel value)? $default, {
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
      {String username,
      String? bio,
      List<String>? albumUrl,
      String? profileUrl,
      String? birthday,
      int? age,
      @JsonKey(name: "position") GeoPointData? position,
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
      String id});

  $GeoPointDataCopyWith<$Res>? get position;
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
    Object? username = null,
    Object? bio = freezed,
    Object? albumUrl = freezed,
    Object? profileUrl = freezed,
    Object? birthday = freezed,
    Object? age = freezed,
    Object? position = freezed,
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
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      albumUrl: freezed == albumUrl
          ? _value.albumUrl
          : albumUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoPointData?,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoPointDataCopyWith<$Res>? get position {
    if (_value.position == null) {
      return null;
    }

    return $GeoPointDataCopyWith<$Res>(_value.position!, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
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
      {String username,
      String? bio,
      List<String>? albumUrl,
      String? profileUrl,
      String? birthday,
      int? age,
      @JsonKey(name: "position") GeoPointData? position,
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
      String id});

  @override
  $GeoPointDataCopyWith<$Res>? get position;
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
    Object? username = null,
    Object? bio = freezed,
    Object? albumUrl = freezed,
    Object? profileUrl = freezed,
    Object? birthday = freezed,
    Object? age = freezed,
    Object? position = freezed,
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
    Object? id = null,
  }) {
    return _then(_$_UserModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      albumUrl: freezed == albumUrl
          ? _value._albumUrl
          : albumUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoPointData?,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {required this.username,
      this.bio,
      final List<String>? albumUrl,
      this.profileUrl,
      this.birthday,
      this.age,
      @JsonKey(name: "position") this.position,
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
      required this.id})
      : _albumUrl = albumUrl;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String username;
  @override
  final String? bio;
  final List<String>? _albumUrl;
  @override
  List<String>? get albumUrl {
    final value = _albumUrl;
    if (value == null) return null;
    if (_albumUrl is EqualUnmodifiableListView) return _albumUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? profileUrl;
  @override
  final String? birthday;
  @override
  final int? age;
  @override
  @JsonKey(name: "position")
  final GeoPointData? position;
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
  final String id;

  @override
  String toString() {
    return 'UserModel(username: $username, bio: $bio, albumUrl: $albumUrl, profileUrl: $profileUrl, birthday: $birthday, age: $age, position: $position, userBasicModel: $userBasicModel, role: $role, bodyType: $bodyType, relationshipStatus: $relationshipStatus, ethnicity: $ethnicity, lookingFor: $lookingFor, whereToMeet: $whereToMeet, isOnline: $isOnline, isVerified: $isVerified, isBlocked: $isBlocked, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other._albumUrl, _albumUrl) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.position, position) ||
                other.position == position) &&
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
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      bio,
      const DeepCollectionEquality().hash(_albumUrl),
      profileUrl,
      birthday,
      age,
      position,
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
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserModel value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserModel value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserModel value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String username,
      final String? bio,
      final List<String>? albumUrl,
      final String? profileUrl,
      final String? birthday,
      final int? age,
      @JsonKey(name: "position") final GeoPointData? position,
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
      required final String id}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get username;
  @override
  String? get bio;
  @override
  List<String>? get albumUrl;
  @override
  String? get profileUrl;
  @override
  String? get birthday;
  @override
  int? get age;
  @override
  @JsonKey(name: "position")
  GeoPointData? get position;
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
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
