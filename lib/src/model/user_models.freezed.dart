// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  String get username;
  String? get bio;
  List<String>? get albumUrl;
  String? get profileUrl;
  String? get birthday;
  int? get age;
  @JsonKey(name: "position")
  GeoPointData? get position;
  String? get dob;
  String? get height;
  String? get weight;
  String? get lived;
  Role get role;
  BodyType get bodyType;
  RelationshipStatus get relationshipStatus;
  Ethnicity get ethnicity;
  LookingFor get lookingFor;
  WhereToMeet get whereToMeet;
  bool get isOnline;
  bool get isVerified;
  bool get isBlocked;
  List<String> get blockList;
  String get id;
  String get fcmToken;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other.albumUrl, albumUrl) &&
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
            const DeepCollectionEquality().equals(other.blockList, blockList) &&
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
        const DeepCollectionEquality().hash(albumUrl),
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
        const DeepCollectionEquality().hash(blockList),
        id,
        fcmToken
      ]);

  @override
  String toString() {
    return 'UserModel(username: $username, bio: $bio, albumUrl: $albumUrl, profileUrl: $profileUrl, birthday: $birthday, age: $age, position: $position, dob: $dob, height: $height, weight: $weight, lived: $lived, role: $role, bodyType: $bodyType, relationshipStatus: $relationshipStatus, ethnicity: $ethnicity, lookingFor: $lookingFor, whereToMeet: $whereToMeet, isOnline: $isOnline, isVerified: $isVerified, isBlocked: $isBlocked, blockList: $blockList, id: $id, fcmToken: $fcmToken)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
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
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

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
    return _then(_self.copyWith(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      albumUrl: freezed == albumUrl
          ? _self.albumUrl
          : albumUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profileUrl: freezed == profileUrl
          ? _self.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _self.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoPointData?,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      lived: freezed == lived
          ? _self.lived
          : lived // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      bodyType: null == bodyType
          ? _self.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyType,
      relationshipStatus: null == relationshipStatus
          ? _self.relationshipStatus
          : relationshipStatus // ignore: cast_nullable_to_non_nullable
              as RelationshipStatus,
      ethnicity: null == ethnicity
          ? _self.ethnicity
          : ethnicity // ignore: cast_nullable_to_non_nullable
              as Ethnicity,
      lookingFor: null == lookingFor
          ? _self.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as LookingFor,
      whereToMeet: null == whereToMeet
          ? _self.whereToMeet
          : whereToMeet // ignore: cast_nullable_to_non_nullable
              as WhereToMeet,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockList: null == blockList
          ? _self.blockList
          : blockList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoPointDataCopyWith<$Res>? get position {
    if (_self.position == null) {
      return null;
    }

    return $GeoPointDataCopyWith<$Res>(_self.position!, (value) {
      return _then(_self.copyWith(position: value));
    });
  }
}

/// @nodoc

@JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true)
class _UserModel implements UserModel {
  _UserModel(
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
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

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

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
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

  @override
  String toString() {
    return 'UserModel(username: $username, bio: $bio, albumUrl: $albumUrl, profileUrl: $profileUrl, birthday: $birthday, age: $age, position: $position, dob: $dob, height: $height, weight: $weight, lived: $lived, role: $role, bodyType: $bodyType, relationshipStatus: $relationshipStatus, ethnicity: $ethnicity, lookingFor: $lookingFor, whereToMeet: $whereToMeet, isOnline: $isOnline, isVerified: $isVerified, isBlocked: $isBlocked, blockList: $blockList, id: $id, fcmToken: $fcmToken)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
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
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_UserModel(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      albumUrl: freezed == albumUrl
          ? _self._albumUrl
          : albumUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profileUrl: freezed == profileUrl
          ? _self.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _self.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as GeoPointData?,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      lived: freezed == lived
          ? _self.lived
          : lived // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      bodyType: null == bodyType
          ? _self.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as BodyType,
      relationshipStatus: null == relationshipStatus
          ? _self.relationshipStatus
          : relationshipStatus // ignore: cast_nullable_to_non_nullable
              as RelationshipStatus,
      ethnicity: null == ethnicity
          ? _self.ethnicity
          : ethnicity // ignore: cast_nullable_to_non_nullable
              as Ethnicity,
      lookingFor: null == lookingFor
          ? _self.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as LookingFor,
      whereToMeet: null == whereToMeet
          ? _self.whereToMeet
          : whereToMeet // ignore: cast_nullable_to_non_nullable
              as WhereToMeet,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockList: null == blockList
          ? _self._blockList
          : blockList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoPointDataCopyWith<$Res>? get position {
    if (_self.position == null) {
      return null;
    }

    return $GeoPointDataCopyWith<$Res>(_self.position!, (value) {
      return _then(_self.copyWith(position: value));
    });
  }
}

// dart format on
