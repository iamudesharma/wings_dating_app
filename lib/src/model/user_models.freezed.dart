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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  String? get dob => throw _privateConstructorUsedError;
  String? get height => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  String? get lived => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  BodyType get bodyType => throw _privateConstructorUsedError;
  RelationshipStatus get relationshipStatus =>
      throw _privateConstructorUsedError;
  Ethnicity get ethnicity => throw _privateConstructorUsedError;
  LookingFor get lookingFor => throw _privateConstructorUsedError;
  WhereToMeet get whereToMeet => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  List<String> get blockList => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      String? dob,
      String? height,
      String? weight,
      String? lived,
      Role role,
      BodyType bodyType,
      RelationshipStatus relationshipStatus,
      Ethnicity ethnicity,
      LookingFor lookingFor,
      WhereToMeet whereToMeet,
      bool isOnline,
      bool isVerified,
      bool isBlocked,
      List<String> blockList,
      String id,
      String fcmToken});

  $GeoPointDataCopyWith<$Res>? get position;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
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
    Object? dob = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? lived = freezed,
    Object? role = null,
    Object? bodyType = null,
    Object? relationshipStatus = null,
    Object? ethnicity = null,
    Object? lookingFor = null,
    Object? whereToMeet = null,
    Object? isOnline = null,
    Object? isVerified = null,
    Object? isBlocked = null,
    Object? blockList = null,
    Object? id = null,
    Object? fcmToken = null,
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
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      lived: freezed == lived
          ? _value.lived
          : lived // ignore: cast_nullable_to_non_nullable
              as String?,
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
      lookingFor: null == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as LookingFor,
      whereToMeet: null == whereToMeet
          ? _value.whereToMeet
          : whereToMeet // ignore: cast_nullable_to_non_nullable
              as WhereToMeet,
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
      blockList: null == blockList
          ? _value.blockList
          : blockList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
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
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
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
      String? dob,
      String? height,
      String? weight,
      String? lived,
      Role role,
      BodyType bodyType,
      RelationshipStatus relationshipStatus,
      Ethnicity ethnicity,
      LookingFor lookingFor,
      WhereToMeet whereToMeet,
      bool isOnline,
      bool isVerified,
      bool isBlocked,
      List<String> blockList,
      String id,
      String fcmToken});

  @override
  $GeoPointDataCopyWith<$Res>? get position;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
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
    Object? dob = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? lived = freezed,
    Object? role = null,
    Object? bodyType = null,
    Object? relationshipStatus = null,
    Object? ethnicity = null,
    Object? lookingFor = null,
    Object? whereToMeet = null,
    Object? isOnline = null,
    Object? isVerified = null,
    Object? isBlocked = null,
    Object? blockList = null,
    Object? id = null,
    Object? fcmToken = null,
  }) {
    return _then(_$UserModelImpl(
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
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      lived: freezed == lived
          ? _value.lived
          : lived // ignore: cast_nullable_to_non_nullable
              as String?,
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
      lookingFor: null == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as LookingFor,
      whereToMeet: null == whereToMeet
          ? _value.whereToMeet
          : whereToMeet // ignore: cast_nullable_to_non_nullable
              as WhereToMeet,
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
      blockList: null == blockList
          ? _value._blockList
          : blockList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
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
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.username,
      this.bio,
      final List<String>? albumUrl,
      this.profileUrl =
          "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
      this.birthday,
      this.age,
      @JsonKey(name: "position") this.position,
      this.dob,
      this.height,
      this.weight,
      this.lived,
      this.role = Role.doNotShow,
      this.bodyType = BodyType.doNotShow,
      this.relationshipStatus = RelationshipStatus.doNotShow,
      this.ethnicity = Ethnicity.doNotShow,
      this.lookingFor = LookingFor.doNotShow,
      this.whereToMeet = WhereToMeet.doNotShow,
      this.isOnline = false,
      this.isVerified = false,
      this.isBlocked = false,
      final List<String> blockList = const [],
      required this.id,
      required this.fcmToken})
      : _albumUrl = albumUrl,
        _blockList = blockList;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

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
  @JsonKey()
  final String? profileUrl;
  @override
  final String? birthday;
  @override
  final int? age;
  @override
  @JsonKey(name: "position")
  final GeoPointData? position;
  @override
  final String? dob;
  @override
  final String? height;
  @override
  final String? weight;
  @override
  final String? lived;
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
  @JsonKey()
  final LookingFor lookingFor;
  @override
  @JsonKey()
  final WhereToMeet whereToMeet;
  @override
  @JsonKey()
  final bool isOnline;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isBlocked;
  final List<String> _blockList;
  @override
  @JsonKey()
  List<String> get blockList {
    if (_blockList is EqualUnmodifiableListView) return _blockList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockList);
  }

  @override
  final String id;
  @override
  final String fcmToken;

  @override
  String toString() {
    return 'UserModel(username: $username, bio: $bio, albumUrl: $albumUrl, profileUrl: $profileUrl, birthday: $birthday, age: $age, position: $position, dob: $dob, height: $height, weight: $weight, lived: $lived, role: $role, bodyType: $bodyType, relationshipStatus: $relationshipStatus, ethnicity: $ethnicity, lookingFor: $lookingFor, whereToMeet: $whereToMeet, isOnline: $isOnline, isVerified: $isVerified, isBlocked: $isBlocked, blockList: $blockList, id: $id, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
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
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.lived, lived) || other.lived == lived) &&
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
            const DeepCollectionEquality()
                .equals(other._blockList, _blockList) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        username,
        bio,
        const DeepCollectionEquality().hash(_albumUrl),
        profileUrl,
        birthday,
        age,
        position,
        dob,
        height,
        weight,
        lived,
        role,
        bodyType,
        relationshipStatus,
        ethnicity,
        lookingFor,
        whereToMeet,
        isOnline,
        isVerified,
        isBlocked,
        const DeepCollectionEquality().hash(_blockList),
        id,
        fcmToken
      ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
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
      final String? dob,
      final String? height,
      final String? weight,
      final String? lived,
      final Role role,
      final BodyType bodyType,
      final RelationshipStatus relationshipStatus,
      final Ethnicity ethnicity,
      final LookingFor lookingFor,
      final WhereToMeet whereToMeet,
      final bool isOnline,
      final bool isVerified,
      final bool isBlocked,
      final List<String> blockList,
      required final String id,
      required final String fcmToken}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

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
  String? get dob;
  @override
  String? get height;
  @override
  String? get weight;
  @override
  String? get lived;
  @override
  Role get role;
  @override
  BodyType get bodyType;
  @override
  RelationshipStatus get relationshipStatus;
  @override
  Ethnicity get ethnicity;
  @override
  LookingFor get lookingFor;
  @override
  WhereToMeet get whereToMeet;
  @override
  bool get isOnline;
  @override
  bool get isVerified;
  @override
  bool get isBlocked;
  @override
  List<String> get blockList;
  @override
  String get id;
  @override
  String get fcmToken;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
