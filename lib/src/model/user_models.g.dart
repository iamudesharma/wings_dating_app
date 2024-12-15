// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserModelCollectionReference
    implements
        UserModelQuery,
        FirestoreCollectionReference<UserModel, UserModelQuerySnapshot> {
  factory UserModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserModelCollectionReference;

  static UserModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return UserModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<UserModel> get reference;

  @override
  UserModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserModelDocumentReference> add(UserModel value);
}

class _$UserModelCollectionReference extends _$UserModelQuery
    implements UserModelCollectionReference {
  factory _$UserModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserModelCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserModelCollectionReference.fromFirestore,
            toFirestore: UserModelCollectionReference.toFirestore,
          ),
    );
  }

  _$UserModelCollectionReference._(
    CollectionReference<UserModel> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<UserModel> get reference =>
      super.reference as CollectionReference<UserModel>;

  @override
  UserModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserModelDocumentReference> add(UserModel value) {
    return reference.add(value).then((ref) => UserModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserModelDocumentReference
    extends FirestoreDocumentReference<UserModel, UserModelDocumentSnapshot> {
  factory UserModelDocumentReference(DocumentReference<UserModel> reference) =
      _$UserModelDocumentReference;

  DocumentReference<UserModel> get reference;

  /// A reference to the [UserModelCollectionReference] containing this document.
  UserModelCollectionReference get parent {
    return _$UserModelCollectionReference(reference.firestore);
  }

  @override
  Stream<UserModelDocumentSnapshot> snapshots();

  @override
  Future<UserModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    UserModel model, {
    SetOptions? options,
    FieldValue usernameFieldValue,
    FieldValue bioFieldValue,
    FieldValue albumUrlFieldValue,
    FieldValue profileUrlFieldValue,
    FieldValue birthdayFieldValue,
    FieldValue ageFieldValue,
    FieldValue positionFieldValue,
    FieldValue dobFieldValue,
    FieldValue heightFieldValue,
    FieldValue weightFieldValue,
    FieldValue livedFieldValue,
    FieldValue roleFieldValue,
    FieldValue bodyTypeFieldValue,
    FieldValue relationshipStatusFieldValue,
    FieldValue ethnicityFieldValue,
    FieldValue lookingForFieldValue,
    FieldValue whereToMeetFieldValue,
    FieldValue isOnlineFieldValue,
    FieldValue isVerifiedFieldValue,
    FieldValue isBlockedFieldValue,
    FieldValue blockListFieldValue,
    FieldValue idFieldValue,
    FieldValue fcmTokenFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    UserModel model, {
    SetOptions? options,
    FieldValue usernameFieldValue,
    FieldValue bioFieldValue,
    FieldValue albumUrlFieldValue,
    FieldValue profileUrlFieldValue,
    FieldValue birthdayFieldValue,
    FieldValue ageFieldValue,
    FieldValue positionFieldValue,
    FieldValue dobFieldValue,
    FieldValue heightFieldValue,
    FieldValue weightFieldValue,
    FieldValue livedFieldValue,
    FieldValue roleFieldValue,
    FieldValue bodyTypeFieldValue,
    FieldValue relationshipStatusFieldValue,
    FieldValue ethnicityFieldValue,
    FieldValue lookingForFieldValue,
    FieldValue whereToMeetFieldValue,
    FieldValue isOnlineFieldValue,
    FieldValue isVerifiedFieldValue,
    FieldValue isBlockedFieldValue,
    FieldValue blockListFieldValue,
    FieldValue idFieldValue,
    FieldValue fcmTokenFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    UserModel model, {
    SetOptions? options,
    FieldValue usernameFieldValue,
    FieldValue bioFieldValue,
    FieldValue albumUrlFieldValue,
    FieldValue profileUrlFieldValue,
    FieldValue birthdayFieldValue,
    FieldValue ageFieldValue,
    FieldValue positionFieldValue,
    FieldValue dobFieldValue,
    FieldValue heightFieldValue,
    FieldValue weightFieldValue,
    FieldValue livedFieldValue,
    FieldValue roleFieldValue,
    FieldValue bodyTypeFieldValue,
    FieldValue relationshipStatusFieldValue,
    FieldValue ethnicityFieldValue,
    FieldValue lookingForFieldValue,
    FieldValue whereToMeetFieldValue,
    FieldValue isOnlineFieldValue,
    FieldValue isVerifiedFieldValue,
    FieldValue isBlockedFieldValue,
    FieldValue blockListFieldValue,
    FieldValue idFieldValue,
    FieldValue fcmTokenFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String username,
    FieldValue usernameFieldValue,
    String? bio,
    FieldValue bioFieldValue,
    List<String>? albumUrl,
    FieldValue albumUrlFieldValue,
    String? profileUrl,
    FieldValue profileUrlFieldValue,
    String? birthday,
    FieldValue birthdayFieldValue,
    int? age,
    FieldValue ageFieldValue,
    GeoPointData? position,
    FieldValue positionFieldValue,
    String? dob,
    FieldValue dobFieldValue,
    String? height,
    FieldValue heightFieldValue,
    String? weight,
    FieldValue weightFieldValue,
    String? lived,
    FieldValue livedFieldValue,
    Role role,
    FieldValue roleFieldValue,
    BodyType bodyType,
    FieldValue bodyTypeFieldValue,
    RelationshipStatus relationshipStatus,
    FieldValue relationshipStatusFieldValue,
    Ethnicity ethnicity,
    FieldValue ethnicityFieldValue,
    LookingFor lookingFor,
    FieldValue lookingForFieldValue,
    WhereToMeet whereToMeet,
    FieldValue whereToMeetFieldValue,
    bool isOnline,
    FieldValue isOnlineFieldValue,
    bool isVerified,
    FieldValue isVerifiedFieldValue,
    bool isBlocked,
    FieldValue isBlockedFieldValue,
    List<String> blockList,
    FieldValue blockListFieldValue,
    String id,
    FieldValue idFieldValue,
    String fcmToken,
    FieldValue fcmTokenFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String username,
    FieldValue usernameFieldValue,
    String? bio,
    FieldValue bioFieldValue,
    List<String>? albumUrl,
    FieldValue albumUrlFieldValue,
    String? profileUrl,
    FieldValue profileUrlFieldValue,
    String? birthday,
    FieldValue birthdayFieldValue,
    int? age,
    FieldValue ageFieldValue,
    GeoPointData? position,
    FieldValue positionFieldValue,
    String? dob,
    FieldValue dobFieldValue,
    String? height,
    FieldValue heightFieldValue,
    String? weight,
    FieldValue weightFieldValue,
    String? lived,
    FieldValue livedFieldValue,
    Role role,
    FieldValue roleFieldValue,
    BodyType bodyType,
    FieldValue bodyTypeFieldValue,
    RelationshipStatus relationshipStatus,
    FieldValue relationshipStatusFieldValue,
    Ethnicity ethnicity,
    FieldValue ethnicityFieldValue,
    LookingFor lookingFor,
    FieldValue lookingForFieldValue,
    WhereToMeet whereToMeet,
    FieldValue whereToMeetFieldValue,
    bool isOnline,
    FieldValue isOnlineFieldValue,
    bool isVerified,
    FieldValue isVerifiedFieldValue,
    bool isBlocked,
    FieldValue isBlockedFieldValue,
    List<String> blockList,
    FieldValue blockListFieldValue,
    String id,
    FieldValue idFieldValue,
    String fcmToken,
    FieldValue fcmTokenFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String username,
    FieldValue usernameFieldValue,
    String? bio,
    FieldValue bioFieldValue,
    List<String>? albumUrl,
    FieldValue albumUrlFieldValue,
    String? profileUrl,
    FieldValue profileUrlFieldValue,
    String? birthday,
    FieldValue birthdayFieldValue,
    int? age,
    FieldValue ageFieldValue,
    GeoPointData? position,
    FieldValue positionFieldValue,
    String? dob,
    FieldValue dobFieldValue,
    String? height,
    FieldValue heightFieldValue,
    String? weight,
    FieldValue weightFieldValue,
    String? lived,
    FieldValue livedFieldValue,
    Role role,
    FieldValue roleFieldValue,
    BodyType bodyType,
    FieldValue bodyTypeFieldValue,
    RelationshipStatus relationshipStatus,
    FieldValue relationshipStatusFieldValue,
    Ethnicity ethnicity,
    FieldValue ethnicityFieldValue,
    LookingFor lookingFor,
    FieldValue lookingForFieldValue,
    WhereToMeet whereToMeet,
    FieldValue whereToMeetFieldValue,
    bool isOnline,
    FieldValue isOnlineFieldValue,
    bool isVerified,
    FieldValue isVerifiedFieldValue,
    bool isBlocked,
    FieldValue isBlockedFieldValue,
    List<String> blockList,
    FieldValue blockListFieldValue,
    String id,
    FieldValue idFieldValue,
    String fcmToken,
    FieldValue fcmTokenFieldValue,
  });
}

class _$UserModelDocumentReference
    extends FirestoreDocumentReference<UserModel, UserModelDocumentSnapshot>
    implements UserModelDocumentReference {
  _$UserModelDocumentReference(this.reference);

  @override
  final DocumentReference<UserModel> reference;

  /// A reference to the [UserModelCollectionReference] containing this document.
  UserModelCollectionReference get parent {
    return _$UserModelCollectionReference(reference.firestore);
  }

  @override
  Stream<UserModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserModelDocumentSnapshot._);
  }

  @override
  Future<UserModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserModelDocumentSnapshot._);
  }

  @override
  Future<UserModelDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserModelDocumentSnapshot._);
  }

  Future<void> set(
    UserModel model, {
    SetOptions? options,
    FieldValue? usernameFieldValue,
    FieldValue? bioFieldValue,
    FieldValue? albumUrlFieldValue,
    FieldValue? profileUrlFieldValue,
    FieldValue? birthdayFieldValue,
    FieldValue? ageFieldValue,
    FieldValue? positionFieldValue,
    FieldValue? dobFieldValue,
    FieldValue? heightFieldValue,
    FieldValue? weightFieldValue,
    FieldValue? livedFieldValue,
    FieldValue? roleFieldValue,
    FieldValue? bodyTypeFieldValue,
    FieldValue? relationshipStatusFieldValue,
    FieldValue? ethnicityFieldValue,
    FieldValue? lookingForFieldValue,
    FieldValue? whereToMeetFieldValue,
    FieldValue? isOnlineFieldValue,
    FieldValue? isVerifiedFieldValue,
    FieldValue? isBlockedFieldValue,
    FieldValue? blockListFieldValue,
    FieldValue? idFieldValue,
    FieldValue? fcmTokenFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (usernameFieldValue != null)
        _$$UserModelImplFieldMap['username']!: usernameFieldValue,
      if (bioFieldValue != null)
        _$$UserModelImplFieldMap['bio']!: bioFieldValue,
      if (albumUrlFieldValue != null)
        _$$UserModelImplFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrlFieldValue != null)
        _$$UserModelImplFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthdayFieldValue != null)
        _$$UserModelImplFieldMap['birthday']!: birthdayFieldValue,
      if (ageFieldValue != null)
        _$$UserModelImplFieldMap['age']!: ageFieldValue,
      if (positionFieldValue != null)
        _$$UserModelImplFieldMap['position']!: positionFieldValue,
      if (dobFieldValue != null)
        _$$UserModelImplFieldMap['dob']!: dobFieldValue,
      if (heightFieldValue != null)
        _$$UserModelImplFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null)
        _$$UserModelImplFieldMap['weight']!: weightFieldValue,
      if (livedFieldValue != null)
        _$$UserModelImplFieldMap['lived']!: livedFieldValue,
      if (roleFieldValue != null)
        _$$UserModelImplFieldMap['role']!: roleFieldValue,
      if (bodyTypeFieldValue != null)
        _$$UserModelImplFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatusFieldValue != null)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicityFieldValue != null)
        _$$UserModelImplFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingForFieldValue != null)
        _$$UserModelImplFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeetFieldValue != null)
        _$$UserModelImplFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnlineFieldValue != null)
        _$$UserModelImplFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerifiedFieldValue != null)
        _$$UserModelImplFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlockedFieldValue != null)
        _$$UserModelImplFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockListFieldValue != null)
        _$$UserModelImplFieldMap['blockList']!: blockListFieldValue,
      if (idFieldValue != null) _$$UserModelImplFieldMap['id']!: idFieldValue,
      if (fcmTokenFieldValue != null)
        _$$UserModelImplFieldMap['fcmToken']!: fcmTokenFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    UserModel model, {
    SetOptions? options,
    FieldValue? usernameFieldValue,
    FieldValue? bioFieldValue,
    FieldValue? albumUrlFieldValue,
    FieldValue? profileUrlFieldValue,
    FieldValue? birthdayFieldValue,
    FieldValue? ageFieldValue,
    FieldValue? positionFieldValue,
    FieldValue? dobFieldValue,
    FieldValue? heightFieldValue,
    FieldValue? weightFieldValue,
    FieldValue? livedFieldValue,
    FieldValue? roleFieldValue,
    FieldValue? bodyTypeFieldValue,
    FieldValue? relationshipStatusFieldValue,
    FieldValue? ethnicityFieldValue,
    FieldValue? lookingForFieldValue,
    FieldValue? whereToMeetFieldValue,
    FieldValue? isOnlineFieldValue,
    FieldValue? isVerifiedFieldValue,
    FieldValue? isBlockedFieldValue,
    FieldValue? blockListFieldValue,
    FieldValue? idFieldValue,
    FieldValue? fcmTokenFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (usernameFieldValue != null)
        _$$UserModelImplFieldMap['username']!: usernameFieldValue,
      if (bioFieldValue != null)
        _$$UserModelImplFieldMap['bio']!: bioFieldValue,
      if (albumUrlFieldValue != null)
        _$$UserModelImplFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrlFieldValue != null)
        _$$UserModelImplFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthdayFieldValue != null)
        _$$UserModelImplFieldMap['birthday']!: birthdayFieldValue,
      if (ageFieldValue != null)
        _$$UserModelImplFieldMap['age']!: ageFieldValue,
      if (positionFieldValue != null)
        _$$UserModelImplFieldMap['position']!: positionFieldValue,
      if (dobFieldValue != null)
        _$$UserModelImplFieldMap['dob']!: dobFieldValue,
      if (heightFieldValue != null)
        _$$UserModelImplFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null)
        _$$UserModelImplFieldMap['weight']!: weightFieldValue,
      if (livedFieldValue != null)
        _$$UserModelImplFieldMap['lived']!: livedFieldValue,
      if (roleFieldValue != null)
        _$$UserModelImplFieldMap['role']!: roleFieldValue,
      if (bodyTypeFieldValue != null)
        _$$UserModelImplFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatusFieldValue != null)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicityFieldValue != null)
        _$$UserModelImplFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingForFieldValue != null)
        _$$UserModelImplFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeetFieldValue != null)
        _$$UserModelImplFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnlineFieldValue != null)
        _$$UserModelImplFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerifiedFieldValue != null)
        _$$UserModelImplFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlockedFieldValue != null)
        _$$UserModelImplFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockListFieldValue != null)
        _$$UserModelImplFieldMap['blockList']!: blockListFieldValue,
      if (idFieldValue != null) _$$UserModelImplFieldMap['id']!: idFieldValue,
      if (fcmTokenFieldValue != null)
        _$$UserModelImplFieldMap['fcmToken']!: fcmTokenFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    UserModel model, {
    SetOptions? options,
    FieldValue? usernameFieldValue,
    FieldValue? bioFieldValue,
    FieldValue? albumUrlFieldValue,
    FieldValue? profileUrlFieldValue,
    FieldValue? birthdayFieldValue,
    FieldValue? ageFieldValue,
    FieldValue? positionFieldValue,
    FieldValue? dobFieldValue,
    FieldValue? heightFieldValue,
    FieldValue? weightFieldValue,
    FieldValue? livedFieldValue,
    FieldValue? roleFieldValue,
    FieldValue? bodyTypeFieldValue,
    FieldValue? relationshipStatusFieldValue,
    FieldValue? ethnicityFieldValue,
    FieldValue? lookingForFieldValue,
    FieldValue? whereToMeetFieldValue,
    FieldValue? isOnlineFieldValue,
    FieldValue? isVerifiedFieldValue,
    FieldValue? isBlockedFieldValue,
    FieldValue? blockListFieldValue,
    FieldValue? idFieldValue,
    FieldValue? fcmTokenFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (usernameFieldValue != null)
        _$$UserModelImplFieldMap['username']!: usernameFieldValue,
      if (bioFieldValue != null)
        _$$UserModelImplFieldMap['bio']!: bioFieldValue,
      if (albumUrlFieldValue != null)
        _$$UserModelImplFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrlFieldValue != null)
        _$$UserModelImplFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthdayFieldValue != null)
        _$$UserModelImplFieldMap['birthday']!: birthdayFieldValue,
      if (ageFieldValue != null)
        _$$UserModelImplFieldMap['age']!: ageFieldValue,
      if (positionFieldValue != null)
        _$$UserModelImplFieldMap['position']!: positionFieldValue,
      if (dobFieldValue != null)
        _$$UserModelImplFieldMap['dob']!: dobFieldValue,
      if (heightFieldValue != null)
        _$$UserModelImplFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null)
        _$$UserModelImplFieldMap['weight']!: weightFieldValue,
      if (livedFieldValue != null)
        _$$UserModelImplFieldMap['lived']!: livedFieldValue,
      if (roleFieldValue != null)
        _$$UserModelImplFieldMap['role']!: roleFieldValue,
      if (bodyTypeFieldValue != null)
        _$$UserModelImplFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatusFieldValue != null)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicityFieldValue != null)
        _$$UserModelImplFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingForFieldValue != null)
        _$$UserModelImplFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeetFieldValue != null)
        _$$UserModelImplFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnlineFieldValue != null)
        _$$UserModelImplFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerifiedFieldValue != null)
        _$$UserModelImplFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlockedFieldValue != null)
        _$$UserModelImplFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockListFieldValue != null)
        _$$UserModelImplFieldMap['blockList']!: blockListFieldValue,
      if (idFieldValue != null) _$$UserModelImplFieldMap['id']!: idFieldValue,
      if (fcmTokenFieldValue != null)
        _$$UserModelImplFieldMap['fcmToken']!: fcmTokenFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? bio = _sentinel,
    FieldValue? bioFieldValue,
    Object? albumUrl = _sentinel,
    FieldValue? albumUrlFieldValue,
    Object? profileUrl = _sentinel,
    FieldValue? profileUrlFieldValue,
    Object? birthday = _sentinel,
    FieldValue? birthdayFieldValue,
    Object? age = _sentinel,
    FieldValue? ageFieldValue,
    Object? position = _sentinel,
    FieldValue? positionFieldValue,
    Object? dob = _sentinel,
    FieldValue? dobFieldValue,
    Object? height = _sentinel,
    FieldValue? heightFieldValue,
    Object? weight = _sentinel,
    FieldValue? weightFieldValue,
    Object? lived = _sentinel,
    FieldValue? livedFieldValue,
    Object? role = _sentinel,
    FieldValue? roleFieldValue,
    Object? bodyType = _sentinel,
    FieldValue? bodyTypeFieldValue,
    Object? relationshipStatus = _sentinel,
    FieldValue? relationshipStatusFieldValue,
    Object? ethnicity = _sentinel,
    FieldValue? ethnicityFieldValue,
    Object? lookingFor = _sentinel,
    FieldValue? lookingForFieldValue,
    Object? whereToMeet = _sentinel,
    FieldValue? whereToMeetFieldValue,
    Object? isOnline = _sentinel,
    FieldValue? isOnlineFieldValue,
    Object? isVerified = _sentinel,
    FieldValue? isVerifiedFieldValue,
    Object? isBlocked = _sentinel,
    FieldValue? isBlockedFieldValue,
    Object? blockList = _sentinel,
    FieldValue? blockListFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? fcmToken = _sentinel,
    FieldValue? fcmTokenFieldValue,
  }) async {
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      bio == _sentinel || bioFieldValue == null,
      "Cannot specify both bio and bioFieldValue",
    );
    assert(
      albumUrl == _sentinel || albumUrlFieldValue == null,
      "Cannot specify both albumUrl and albumUrlFieldValue",
    );
    assert(
      profileUrl == _sentinel || profileUrlFieldValue == null,
      "Cannot specify both profileUrl and profileUrlFieldValue",
    );
    assert(
      birthday == _sentinel || birthdayFieldValue == null,
      "Cannot specify both birthday and birthdayFieldValue",
    );
    assert(
      age == _sentinel || ageFieldValue == null,
      "Cannot specify both age and ageFieldValue",
    );
    assert(
      position == _sentinel || positionFieldValue == null,
      "Cannot specify both position and positionFieldValue",
    );
    assert(
      dob == _sentinel || dobFieldValue == null,
      "Cannot specify both dob and dobFieldValue",
    );
    assert(
      height == _sentinel || heightFieldValue == null,
      "Cannot specify both height and heightFieldValue",
    );
    assert(
      weight == _sentinel || weightFieldValue == null,
      "Cannot specify both weight and weightFieldValue",
    );
    assert(
      lived == _sentinel || livedFieldValue == null,
      "Cannot specify both lived and livedFieldValue",
    );
    assert(
      role == _sentinel || roleFieldValue == null,
      "Cannot specify both role and roleFieldValue",
    );
    assert(
      bodyType == _sentinel || bodyTypeFieldValue == null,
      "Cannot specify both bodyType and bodyTypeFieldValue",
    );
    assert(
      relationshipStatus == _sentinel || relationshipStatusFieldValue == null,
      "Cannot specify both relationshipStatus and relationshipStatusFieldValue",
    );
    assert(
      ethnicity == _sentinel || ethnicityFieldValue == null,
      "Cannot specify both ethnicity and ethnicityFieldValue",
    );
    assert(
      lookingFor == _sentinel || lookingForFieldValue == null,
      "Cannot specify both lookingFor and lookingForFieldValue",
    );
    assert(
      whereToMeet == _sentinel || whereToMeetFieldValue == null,
      "Cannot specify both whereToMeet and whereToMeetFieldValue",
    );
    assert(
      isOnline == _sentinel || isOnlineFieldValue == null,
      "Cannot specify both isOnline and isOnlineFieldValue",
    );
    assert(
      isVerified == _sentinel || isVerifiedFieldValue == null,
      "Cannot specify both isVerified and isVerifiedFieldValue",
    );
    assert(
      isBlocked == _sentinel || isBlockedFieldValue == null,
      "Cannot specify both isBlocked and isBlockedFieldValue",
    );
    assert(
      blockList == _sentinel || blockListFieldValue == null,
      "Cannot specify both blockList and blockListFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      fcmToken == _sentinel || fcmTokenFieldValue == null,
      "Cannot specify both fcmToken and fcmTokenFieldValue",
    );
    final json = {
      if (username != _sentinel)
        _$$UserModelImplFieldMap['username']!:
            _$$UserModelImplPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$$UserModelImplFieldMap['username']!: usernameFieldValue,
      if (bio != _sentinel)
        _$$UserModelImplFieldMap['bio']!:
            _$$UserModelImplPerFieldToJson.bio(bio as String?),
      if (bioFieldValue != null)
        _$$UserModelImplFieldMap['bio']!: bioFieldValue,
      if (albumUrl != _sentinel)
        _$$UserModelImplFieldMap['albumUrl']!:
            _$$UserModelImplPerFieldToJson.albumUrl(albumUrl as List<String>?),
      if (albumUrlFieldValue != null)
        _$$UserModelImplFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrl != _sentinel)
        _$$UserModelImplFieldMap['profileUrl']!:
            _$$UserModelImplPerFieldToJson.profileUrl(profileUrl as String?),
      if (profileUrlFieldValue != null)
        _$$UserModelImplFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthday != _sentinel)
        _$$UserModelImplFieldMap['birthday']!:
            _$$UserModelImplPerFieldToJson.birthday(birthday as String?),
      if (birthdayFieldValue != null)
        _$$UserModelImplFieldMap['birthday']!: birthdayFieldValue,
      if (age != _sentinel)
        _$$UserModelImplFieldMap['age']!:
            _$$UserModelImplPerFieldToJson.age(age as int?),
      if (ageFieldValue != null)
        _$$UserModelImplFieldMap['age']!: ageFieldValue,
      if (position != _sentinel)
        _$$UserModelImplFieldMap['position']!:
            _$$UserModelImplPerFieldToJson.position(position as GeoPointData?),
      if (positionFieldValue != null)
        _$$UserModelImplFieldMap['position']!: positionFieldValue,
      if (dob != _sentinel)
        _$$UserModelImplFieldMap['dob']!:
            _$$UserModelImplPerFieldToJson.dob(dob as String?),
      if (dobFieldValue != null)
        _$$UserModelImplFieldMap['dob']!: dobFieldValue,
      if (height != _sentinel)
        _$$UserModelImplFieldMap['height']!:
            _$$UserModelImplPerFieldToJson.height(height as String?),
      if (heightFieldValue != null)
        _$$UserModelImplFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$$UserModelImplFieldMap['weight']!:
            _$$UserModelImplPerFieldToJson.weight(weight as String?),
      if (weightFieldValue != null)
        _$$UserModelImplFieldMap['weight']!: weightFieldValue,
      if (lived != _sentinel)
        _$$UserModelImplFieldMap['lived']!:
            _$$UserModelImplPerFieldToJson.lived(lived as String?),
      if (livedFieldValue != null)
        _$$UserModelImplFieldMap['lived']!: livedFieldValue,
      if (role != _sentinel)
        _$$UserModelImplFieldMap['role']!:
            _$$UserModelImplPerFieldToJson.role(role as Role),
      if (roleFieldValue != null)
        _$$UserModelImplFieldMap['role']!: roleFieldValue,
      if (bodyType != _sentinel)
        _$$UserModelImplFieldMap['bodyType']!:
            _$$UserModelImplPerFieldToJson.bodyType(bodyType as BodyType),
      if (bodyTypeFieldValue != null)
        _$$UserModelImplFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatus != _sentinel)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            _$$UserModelImplPerFieldToJson
                .relationshipStatus(relationshipStatus as RelationshipStatus),
      if (relationshipStatusFieldValue != null)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicity != _sentinel)
        _$$UserModelImplFieldMap['ethnicity']!:
            _$$UserModelImplPerFieldToJson.ethnicity(ethnicity as Ethnicity),
      if (ethnicityFieldValue != null)
        _$$UserModelImplFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingFor != _sentinel)
        _$$UserModelImplFieldMap['lookingFor']!:
            _$$UserModelImplPerFieldToJson.lookingFor(lookingFor as LookingFor),
      if (lookingForFieldValue != null)
        _$$UserModelImplFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeet != _sentinel)
        _$$UserModelImplFieldMap['whereToMeet']!: _$$UserModelImplPerFieldToJson
            .whereToMeet(whereToMeet as WhereToMeet),
      if (whereToMeetFieldValue != null)
        _$$UserModelImplFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnline != _sentinel)
        _$$UserModelImplFieldMap['isOnline']!:
            _$$UserModelImplPerFieldToJson.isOnline(isOnline as bool),
      if (isOnlineFieldValue != null)
        _$$UserModelImplFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerified != _sentinel)
        _$$UserModelImplFieldMap['isVerified']!:
            _$$UserModelImplPerFieldToJson.isVerified(isVerified as bool),
      if (isVerifiedFieldValue != null)
        _$$UserModelImplFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlocked != _sentinel)
        _$$UserModelImplFieldMap['isBlocked']!:
            _$$UserModelImplPerFieldToJson.isBlocked(isBlocked as bool),
      if (isBlockedFieldValue != null)
        _$$UserModelImplFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockList != _sentinel)
        _$$UserModelImplFieldMap['blockList']!:
            _$$UserModelImplPerFieldToJson.blockList(blockList as List<String>),
      if (blockListFieldValue != null)
        _$$UserModelImplFieldMap['blockList']!: blockListFieldValue,
      if (id != _sentinel)
        _$$UserModelImplFieldMap['id']!:
            _$$UserModelImplPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$$UserModelImplFieldMap['id']!: idFieldValue,
      if (fcmToken != _sentinel)
        _$$UserModelImplFieldMap['fcmToken']!:
            _$$UserModelImplPerFieldToJson.fcmToken(fcmToken as String),
      if (fcmTokenFieldValue != null)
        _$$UserModelImplFieldMap['fcmToken']!: fcmTokenFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? bio = _sentinel,
    FieldValue? bioFieldValue,
    Object? albumUrl = _sentinel,
    FieldValue? albumUrlFieldValue,
    Object? profileUrl = _sentinel,
    FieldValue? profileUrlFieldValue,
    Object? birthday = _sentinel,
    FieldValue? birthdayFieldValue,
    Object? age = _sentinel,
    FieldValue? ageFieldValue,
    Object? position = _sentinel,
    FieldValue? positionFieldValue,
    Object? dob = _sentinel,
    FieldValue? dobFieldValue,
    Object? height = _sentinel,
    FieldValue? heightFieldValue,
    Object? weight = _sentinel,
    FieldValue? weightFieldValue,
    Object? lived = _sentinel,
    FieldValue? livedFieldValue,
    Object? role = _sentinel,
    FieldValue? roleFieldValue,
    Object? bodyType = _sentinel,
    FieldValue? bodyTypeFieldValue,
    Object? relationshipStatus = _sentinel,
    FieldValue? relationshipStatusFieldValue,
    Object? ethnicity = _sentinel,
    FieldValue? ethnicityFieldValue,
    Object? lookingFor = _sentinel,
    FieldValue? lookingForFieldValue,
    Object? whereToMeet = _sentinel,
    FieldValue? whereToMeetFieldValue,
    Object? isOnline = _sentinel,
    FieldValue? isOnlineFieldValue,
    Object? isVerified = _sentinel,
    FieldValue? isVerifiedFieldValue,
    Object? isBlocked = _sentinel,
    FieldValue? isBlockedFieldValue,
    Object? blockList = _sentinel,
    FieldValue? blockListFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? fcmToken = _sentinel,
    FieldValue? fcmTokenFieldValue,
  }) {
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      bio == _sentinel || bioFieldValue == null,
      "Cannot specify both bio and bioFieldValue",
    );
    assert(
      albumUrl == _sentinel || albumUrlFieldValue == null,
      "Cannot specify both albumUrl and albumUrlFieldValue",
    );
    assert(
      profileUrl == _sentinel || profileUrlFieldValue == null,
      "Cannot specify both profileUrl and profileUrlFieldValue",
    );
    assert(
      birthday == _sentinel || birthdayFieldValue == null,
      "Cannot specify both birthday and birthdayFieldValue",
    );
    assert(
      age == _sentinel || ageFieldValue == null,
      "Cannot specify both age and ageFieldValue",
    );
    assert(
      position == _sentinel || positionFieldValue == null,
      "Cannot specify both position and positionFieldValue",
    );
    assert(
      dob == _sentinel || dobFieldValue == null,
      "Cannot specify both dob and dobFieldValue",
    );
    assert(
      height == _sentinel || heightFieldValue == null,
      "Cannot specify both height and heightFieldValue",
    );
    assert(
      weight == _sentinel || weightFieldValue == null,
      "Cannot specify both weight and weightFieldValue",
    );
    assert(
      lived == _sentinel || livedFieldValue == null,
      "Cannot specify both lived and livedFieldValue",
    );
    assert(
      role == _sentinel || roleFieldValue == null,
      "Cannot specify both role and roleFieldValue",
    );
    assert(
      bodyType == _sentinel || bodyTypeFieldValue == null,
      "Cannot specify both bodyType and bodyTypeFieldValue",
    );
    assert(
      relationshipStatus == _sentinel || relationshipStatusFieldValue == null,
      "Cannot specify both relationshipStatus and relationshipStatusFieldValue",
    );
    assert(
      ethnicity == _sentinel || ethnicityFieldValue == null,
      "Cannot specify both ethnicity and ethnicityFieldValue",
    );
    assert(
      lookingFor == _sentinel || lookingForFieldValue == null,
      "Cannot specify both lookingFor and lookingForFieldValue",
    );
    assert(
      whereToMeet == _sentinel || whereToMeetFieldValue == null,
      "Cannot specify both whereToMeet and whereToMeetFieldValue",
    );
    assert(
      isOnline == _sentinel || isOnlineFieldValue == null,
      "Cannot specify both isOnline and isOnlineFieldValue",
    );
    assert(
      isVerified == _sentinel || isVerifiedFieldValue == null,
      "Cannot specify both isVerified and isVerifiedFieldValue",
    );
    assert(
      isBlocked == _sentinel || isBlockedFieldValue == null,
      "Cannot specify both isBlocked and isBlockedFieldValue",
    );
    assert(
      blockList == _sentinel || blockListFieldValue == null,
      "Cannot specify both blockList and blockListFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      fcmToken == _sentinel || fcmTokenFieldValue == null,
      "Cannot specify both fcmToken and fcmTokenFieldValue",
    );
    final json = {
      if (username != _sentinel)
        _$$UserModelImplFieldMap['username']!:
            _$$UserModelImplPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$$UserModelImplFieldMap['username']!: usernameFieldValue,
      if (bio != _sentinel)
        _$$UserModelImplFieldMap['bio']!:
            _$$UserModelImplPerFieldToJson.bio(bio as String?),
      if (bioFieldValue != null)
        _$$UserModelImplFieldMap['bio']!: bioFieldValue,
      if (albumUrl != _sentinel)
        _$$UserModelImplFieldMap['albumUrl']!:
            _$$UserModelImplPerFieldToJson.albumUrl(albumUrl as List<String>?),
      if (albumUrlFieldValue != null)
        _$$UserModelImplFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrl != _sentinel)
        _$$UserModelImplFieldMap['profileUrl']!:
            _$$UserModelImplPerFieldToJson.profileUrl(profileUrl as String?),
      if (profileUrlFieldValue != null)
        _$$UserModelImplFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthday != _sentinel)
        _$$UserModelImplFieldMap['birthday']!:
            _$$UserModelImplPerFieldToJson.birthday(birthday as String?),
      if (birthdayFieldValue != null)
        _$$UserModelImplFieldMap['birthday']!: birthdayFieldValue,
      if (age != _sentinel)
        _$$UserModelImplFieldMap['age']!:
            _$$UserModelImplPerFieldToJson.age(age as int?),
      if (ageFieldValue != null)
        _$$UserModelImplFieldMap['age']!: ageFieldValue,
      if (position != _sentinel)
        _$$UserModelImplFieldMap['position']!:
            _$$UserModelImplPerFieldToJson.position(position as GeoPointData?),
      if (positionFieldValue != null)
        _$$UserModelImplFieldMap['position']!: positionFieldValue,
      if (dob != _sentinel)
        _$$UserModelImplFieldMap['dob']!:
            _$$UserModelImplPerFieldToJson.dob(dob as String?),
      if (dobFieldValue != null)
        _$$UserModelImplFieldMap['dob']!: dobFieldValue,
      if (height != _sentinel)
        _$$UserModelImplFieldMap['height']!:
            _$$UserModelImplPerFieldToJson.height(height as String?),
      if (heightFieldValue != null)
        _$$UserModelImplFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$$UserModelImplFieldMap['weight']!:
            _$$UserModelImplPerFieldToJson.weight(weight as String?),
      if (weightFieldValue != null)
        _$$UserModelImplFieldMap['weight']!: weightFieldValue,
      if (lived != _sentinel)
        _$$UserModelImplFieldMap['lived']!:
            _$$UserModelImplPerFieldToJson.lived(lived as String?),
      if (livedFieldValue != null)
        _$$UserModelImplFieldMap['lived']!: livedFieldValue,
      if (role != _sentinel)
        _$$UserModelImplFieldMap['role']!:
            _$$UserModelImplPerFieldToJson.role(role as Role),
      if (roleFieldValue != null)
        _$$UserModelImplFieldMap['role']!: roleFieldValue,
      if (bodyType != _sentinel)
        _$$UserModelImplFieldMap['bodyType']!:
            _$$UserModelImplPerFieldToJson.bodyType(bodyType as BodyType),
      if (bodyTypeFieldValue != null)
        _$$UserModelImplFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatus != _sentinel)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            _$$UserModelImplPerFieldToJson
                .relationshipStatus(relationshipStatus as RelationshipStatus),
      if (relationshipStatusFieldValue != null)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicity != _sentinel)
        _$$UserModelImplFieldMap['ethnicity']!:
            _$$UserModelImplPerFieldToJson.ethnicity(ethnicity as Ethnicity),
      if (ethnicityFieldValue != null)
        _$$UserModelImplFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingFor != _sentinel)
        _$$UserModelImplFieldMap['lookingFor']!:
            _$$UserModelImplPerFieldToJson.lookingFor(lookingFor as LookingFor),
      if (lookingForFieldValue != null)
        _$$UserModelImplFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeet != _sentinel)
        _$$UserModelImplFieldMap['whereToMeet']!: _$$UserModelImplPerFieldToJson
            .whereToMeet(whereToMeet as WhereToMeet),
      if (whereToMeetFieldValue != null)
        _$$UserModelImplFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnline != _sentinel)
        _$$UserModelImplFieldMap['isOnline']!:
            _$$UserModelImplPerFieldToJson.isOnline(isOnline as bool),
      if (isOnlineFieldValue != null)
        _$$UserModelImplFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerified != _sentinel)
        _$$UserModelImplFieldMap['isVerified']!:
            _$$UserModelImplPerFieldToJson.isVerified(isVerified as bool),
      if (isVerifiedFieldValue != null)
        _$$UserModelImplFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlocked != _sentinel)
        _$$UserModelImplFieldMap['isBlocked']!:
            _$$UserModelImplPerFieldToJson.isBlocked(isBlocked as bool),
      if (isBlockedFieldValue != null)
        _$$UserModelImplFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockList != _sentinel)
        _$$UserModelImplFieldMap['blockList']!:
            _$$UserModelImplPerFieldToJson.blockList(blockList as List<String>),
      if (blockListFieldValue != null)
        _$$UserModelImplFieldMap['blockList']!: blockListFieldValue,
      if (id != _sentinel)
        _$$UserModelImplFieldMap['id']!:
            _$$UserModelImplPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$$UserModelImplFieldMap['id']!: idFieldValue,
      if (fcmToken != _sentinel)
        _$$UserModelImplFieldMap['fcmToken']!:
            _$$UserModelImplPerFieldToJson.fcmToken(fcmToken as String),
      if (fcmTokenFieldValue != null)
        _$$UserModelImplFieldMap['fcmToken']!: fcmTokenFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? bio = _sentinel,
    FieldValue? bioFieldValue,
    Object? albumUrl = _sentinel,
    FieldValue? albumUrlFieldValue,
    Object? profileUrl = _sentinel,
    FieldValue? profileUrlFieldValue,
    Object? birthday = _sentinel,
    FieldValue? birthdayFieldValue,
    Object? age = _sentinel,
    FieldValue? ageFieldValue,
    Object? position = _sentinel,
    FieldValue? positionFieldValue,
    Object? dob = _sentinel,
    FieldValue? dobFieldValue,
    Object? height = _sentinel,
    FieldValue? heightFieldValue,
    Object? weight = _sentinel,
    FieldValue? weightFieldValue,
    Object? lived = _sentinel,
    FieldValue? livedFieldValue,
    Object? role = _sentinel,
    FieldValue? roleFieldValue,
    Object? bodyType = _sentinel,
    FieldValue? bodyTypeFieldValue,
    Object? relationshipStatus = _sentinel,
    FieldValue? relationshipStatusFieldValue,
    Object? ethnicity = _sentinel,
    FieldValue? ethnicityFieldValue,
    Object? lookingFor = _sentinel,
    FieldValue? lookingForFieldValue,
    Object? whereToMeet = _sentinel,
    FieldValue? whereToMeetFieldValue,
    Object? isOnline = _sentinel,
    FieldValue? isOnlineFieldValue,
    Object? isVerified = _sentinel,
    FieldValue? isVerifiedFieldValue,
    Object? isBlocked = _sentinel,
    FieldValue? isBlockedFieldValue,
    Object? blockList = _sentinel,
    FieldValue? blockListFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? fcmToken = _sentinel,
    FieldValue? fcmTokenFieldValue,
  }) {
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      bio == _sentinel || bioFieldValue == null,
      "Cannot specify both bio and bioFieldValue",
    );
    assert(
      albumUrl == _sentinel || albumUrlFieldValue == null,
      "Cannot specify both albumUrl and albumUrlFieldValue",
    );
    assert(
      profileUrl == _sentinel || profileUrlFieldValue == null,
      "Cannot specify both profileUrl and profileUrlFieldValue",
    );
    assert(
      birthday == _sentinel || birthdayFieldValue == null,
      "Cannot specify both birthday and birthdayFieldValue",
    );
    assert(
      age == _sentinel || ageFieldValue == null,
      "Cannot specify both age and ageFieldValue",
    );
    assert(
      position == _sentinel || positionFieldValue == null,
      "Cannot specify both position and positionFieldValue",
    );
    assert(
      dob == _sentinel || dobFieldValue == null,
      "Cannot specify both dob and dobFieldValue",
    );
    assert(
      height == _sentinel || heightFieldValue == null,
      "Cannot specify both height and heightFieldValue",
    );
    assert(
      weight == _sentinel || weightFieldValue == null,
      "Cannot specify both weight and weightFieldValue",
    );
    assert(
      lived == _sentinel || livedFieldValue == null,
      "Cannot specify both lived and livedFieldValue",
    );
    assert(
      role == _sentinel || roleFieldValue == null,
      "Cannot specify both role and roleFieldValue",
    );
    assert(
      bodyType == _sentinel || bodyTypeFieldValue == null,
      "Cannot specify both bodyType and bodyTypeFieldValue",
    );
    assert(
      relationshipStatus == _sentinel || relationshipStatusFieldValue == null,
      "Cannot specify both relationshipStatus and relationshipStatusFieldValue",
    );
    assert(
      ethnicity == _sentinel || ethnicityFieldValue == null,
      "Cannot specify both ethnicity and ethnicityFieldValue",
    );
    assert(
      lookingFor == _sentinel || lookingForFieldValue == null,
      "Cannot specify both lookingFor and lookingForFieldValue",
    );
    assert(
      whereToMeet == _sentinel || whereToMeetFieldValue == null,
      "Cannot specify both whereToMeet and whereToMeetFieldValue",
    );
    assert(
      isOnline == _sentinel || isOnlineFieldValue == null,
      "Cannot specify both isOnline and isOnlineFieldValue",
    );
    assert(
      isVerified == _sentinel || isVerifiedFieldValue == null,
      "Cannot specify both isVerified and isVerifiedFieldValue",
    );
    assert(
      isBlocked == _sentinel || isBlockedFieldValue == null,
      "Cannot specify both isBlocked and isBlockedFieldValue",
    );
    assert(
      blockList == _sentinel || blockListFieldValue == null,
      "Cannot specify both blockList and blockListFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      fcmToken == _sentinel || fcmTokenFieldValue == null,
      "Cannot specify both fcmToken and fcmTokenFieldValue",
    );
    final json = {
      if (username != _sentinel)
        _$$UserModelImplFieldMap['username']!:
            _$$UserModelImplPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$$UserModelImplFieldMap['username']!: usernameFieldValue,
      if (bio != _sentinel)
        _$$UserModelImplFieldMap['bio']!:
            _$$UserModelImplPerFieldToJson.bio(bio as String?),
      if (bioFieldValue != null)
        _$$UserModelImplFieldMap['bio']!: bioFieldValue,
      if (albumUrl != _sentinel)
        _$$UserModelImplFieldMap['albumUrl']!:
            _$$UserModelImplPerFieldToJson.albumUrl(albumUrl as List<String>?),
      if (albumUrlFieldValue != null)
        _$$UserModelImplFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrl != _sentinel)
        _$$UserModelImplFieldMap['profileUrl']!:
            _$$UserModelImplPerFieldToJson.profileUrl(profileUrl as String?),
      if (profileUrlFieldValue != null)
        _$$UserModelImplFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthday != _sentinel)
        _$$UserModelImplFieldMap['birthday']!:
            _$$UserModelImplPerFieldToJson.birthday(birthday as String?),
      if (birthdayFieldValue != null)
        _$$UserModelImplFieldMap['birthday']!: birthdayFieldValue,
      if (age != _sentinel)
        _$$UserModelImplFieldMap['age']!:
            _$$UserModelImplPerFieldToJson.age(age as int?),
      if (ageFieldValue != null)
        _$$UserModelImplFieldMap['age']!: ageFieldValue,
      if (position != _sentinel)
        _$$UserModelImplFieldMap['position']!:
            _$$UserModelImplPerFieldToJson.position(position as GeoPointData?),
      if (positionFieldValue != null)
        _$$UserModelImplFieldMap['position']!: positionFieldValue,
      if (dob != _sentinel)
        _$$UserModelImplFieldMap['dob']!:
            _$$UserModelImplPerFieldToJson.dob(dob as String?),
      if (dobFieldValue != null)
        _$$UserModelImplFieldMap['dob']!: dobFieldValue,
      if (height != _sentinel)
        _$$UserModelImplFieldMap['height']!:
            _$$UserModelImplPerFieldToJson.height(height as String?),
      if (heightFieldValue != null)
        _$$UserModelImplFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$$UserModelImplFieldMap['weight']!:
            _$$UserModelImplPerFieldToJson.weight(weight as String?),
      if (weightFieldValue != null)
        _$$UserModelImplFieldMap['weight']!: weightFieldValue,
      if (lived != _sentinel)
        _$$UserModelImplFieldMap['lived']!:
            _$$UserModelImplPerFieldToJson.lived(lived as String?),
      if (livedFieldValue != null)
        _$$UserModelImplFieldMap['lived']!: livedFieldValue,
      if (role != _sentinel)
        _$$UserModelImplFieldMap['role']!:
            _$$UserModelImplPerFieldToJson.role(role as Role),
      if (roleFieldValue != null)
        _$$UserModelImplFieldMap['role']!: roleFieldValue,
      if (bodyType != _sentinel)
        _$$UserModelImplFieldMap['bodyType']!:
            _$$UserModelImplPerFieldToJson.bodyType(bodyType as BodyType),
      if (bodyTypeFieldValue != null)
        _$$UserModelImplFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatus != _sentinel)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            _$$UserModelImplPerFieldToJson
                .relationshipStatus(relationshipStatus as RelationshipStatus),
      if (relationshipStatusFieldValue != null)
        _$$UserModelImplFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicity != _sentinel)
        _$$UserModelImplFieldMap['ethnicity']!:
            _$$UserModelImplPerFieldToJson.ethnicity(ethnicity as Ethnicity),
      if (ethnicityFieldValue != null)
        _$$UserModelImplFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingFor != _sentinel)
        _$$UserModelImplFieldMap['lookingFor']!:
            _$$UserModelImplPerFieldToJson.lookingFor(lookingFor as LookingFor),
      if (lookingForFieldValue != null)
        _$$UserModelImplFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeet != _sentinel)
        _$$UserModelImplFieldMap['whereToMeet']!: _$$UserModelImplPerFieldToJson
            .whereToMeet(whereToMeet as WhereToMeet),
      if (whereToMeetFieldValue != null)
        _$$UserModelImplFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnline != _sentinel)
        _$$UserModelImplFieldMap['isOnline']!:
            _$$UserModelImplPerFieldToJson.isOnline(isOnline as bool),
      if (isOnlineFieldValue != null)
        _$$UserModelImplFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerified != _sentinel)
        _$$UserModelImplFieldMap['isVerified']!:
            _$$UserModelImplPerFieldToJson.isVerified(isVerified as bool),
      if (isVerifiedFieldValue != null)
        _$$UserModelImplFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlocked != _sentinel)
        _$$UserModelImplFieldMap['isBlocked']!:
            _$$UserModelImplPerFieldToJson.isBlocked(isBlocked as bool),
      if (isBlockedFieldValue != null)
        _$$UserModelImplFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockList != _sentinel)
        _$$UserModelImplFieldMap['blockList']!:
            _$$UserModelImplPerFieldToJson.blockList(blockList as List<String>),
      if (blockListFieldValue != null)
        _$$UserModelImplFieldMap['blockList']!: blockListFieldValue,
      if (id != _sentinel)
        _$$UserModelImplFieldMap['id']!:
            _$$UserModelImplPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$$UserModelImplFieldMap['id']!: idFieldValue,
      if (fcmToken != _sentinel)
        _$$UserModelImplFieldMap['fcmToken']!:
            _$$UserModelImplPerFieldToJson.fcmToken(fcmToken as String),
      if (fcmTokenFieldValue != null)
        _$$UserModelImplFieldMap['fcmToken']!: fcmTokenFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserModelQuery
    implements QueryReference<UserModel, UserModelQuerySnapshot> {
  @override
  UserModelQuery limit(int limit);

  @override
  UserModelQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserModelQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereUsername({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereBio({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereAlbumUrl({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  UserModelQuery whereProfileUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereBirthday({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery wherePosition({
    GeoPointData? isEqualTo,
    GeoPointData? isNotEqualTo,
    GeoPointData? isLessThan,
    GeoPointData? isLessThanOrEqualTo,
    GeoPointData? isGreaterThan,
    GeoPointData? isGreaterThanOrEqualTo,
    List<GeoPointData?>? whereIn,
    List<GeoPointData?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereDob({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereHeight({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereWeight({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereLived({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereRole({
    Role? isEqualTo,
    Role? isNotEqualTo,
    Role? isLessThan,
    Role? isLessThanOrEqualTo,
    Role? isGreaterThan,
    Role? isGreaterThanOrEqualTo,
    List<Role>? whereIn,
    List<Role>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereBodyType({
    BodyType? isEqualTo,
    BodyType? isNotEqualTo,
    BodyType? isLessThan,
    BodyType? isLessThanOrEqualTo,
    BodyType? isGreaterThan,
    BodyType? isGreaterThanOrEqualTo,
    List<BodyType>? whereIn,
    List<BodyType>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereRelationshipStatus({
    RelationshipStatus? isEqualTo,
    RelationshipStatus? isNotEqualTo,
    RelationshipStatus? isLessThan,
    RelationshipStatus? isLessThanOrEqualTo,
    RelationshipStatus? isGreaterThan,
    RelationshipStatus? isGreaterThanOrEqualTo,
    List<RelationshipStatus>? whereIn,
    List<RelationshipStatus>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereEthnicity({
    Ethnicity? isEqualTo,
    Ethnicity? isNotEqualTo,
    Ethnicity? isLessThan,
    Ethnicity? isLessThanOrEqualTo,
    Ethnicity? isGreaterThan,
    Ethnicity? isGreaterThanOrEqualTo,
    List<Ethnicity>? whereIn,
    List<Ethnicity>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereLookingFor({
    LookingFor? isEqualTo,
    LookingFor? isNotEqualTo,
    LookingFor? isLessThan,
    LookingFor? isLessThanOrEqualTo,
    LookingFor? isGreaterThan,
    LookingFor? isGreaterThanOrEqualTo,
    List<LookingFor>? whereIn,
    List<LookingFor>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereWhereToMeet({
    WhereToMeet? isEqualTo,
    WhereToMeet? isNotEqualTo,
    WhereToMeet? isLessThan,
    WhereToMeet? isLessThanOrEqualTo,
    WhereToMeet? isGreaterThan,
    WhereToMeet? isGreaterThanOrEqualTo,
    List<WhereToMeet>? whereIn,
    List<WhereToMeet>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereIsOnline({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereIsVerified({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereIsBlocked({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereBlockList({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  UserModelQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserModelQuery whereFcmToken({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserModelQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByUsername({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByBio({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByAlbumUrl({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByProfileUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByBirthday({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByAge({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByPosition({
    bool descending = false,
    GeoPointData? startAt,
    GeoPointData? startAfter,
    GeoPointData? endAt,
    GeoPointData? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByDob({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByHeight({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByWeight({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByLived({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByRole({
    bool descending = false,
    Role startAt,
    Role startAfter,
    Role endAt,
    Role endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByBodyType({
    bool descending = false,
    BodyType startAt,
    BodyType startAfter,
    BodyType endAt,
    BodyType endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByRelationshipStatus({
    bool descending = false,
    RelationshipStatus startAt,
    RelationshipStatus startAfter,
    RelationshipStatus endAt,
    RelationshipStatus endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByEthnicity({
    bool descending = false,
    Ethnicity startAt,
    Ethnicity startAfter,
    Ethnicity endAt,
    Ethnicity endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByLookingFor({
    bool descending = false,
    LookingFor startAt,
    LookingFor startAfter,
    LookingFor endAt,
    LookingFor endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByWhereToMeet({
    bool descending = false,
    WhereToMeet startAt,
    WhereToMeet startAfter,
    WhereToMeet endAt,
    WhereToMeet endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByIsOnline({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByIsVerified({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByIsBlocked({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByBlockList({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });

  UserModelQuery orderByFcmToken({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  });
}

class _$UserModelQuery extends QueryReference<UserModel, UserModelQuerySnapshot>
    implements UserModelQuery {
  _$UserModelQuery(
    this._collection, {
    required Query<UserModel> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserModelQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(UserModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserModelQuery limit(int limit) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery limitToLast(int limit) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereUsername({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['username']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.username(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.username(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.username(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .username(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.username(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .username(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.username(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.username(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereBio({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['bio']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.bio(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.bio(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.bio(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson.bio(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.bio(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .bio(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$$UserModelImplPerFieldToJson.bio(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.bio(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereAlbumUrl({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['albumUrl']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .albumUrl(isEqualTo as List<String>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .albumUrl(isNotEqualTo as List<String>?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson
                .albumUrl(isLessThan as List<String>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .albumUrl(isLessThanOrEqualTo as List<String>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson
                .albumUrl(isGreaterThan as List<String>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .albumUrl(isGreaterThanOrEqualTo as List<String>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$$UserModelImplPerFieldToJson
                    .albumUrl([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$UserModelImplPerFieldToJson.albumUrl(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereProfileUrl({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['profileUrl']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.profileUrl(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.profileUrl(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.profileUrl(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .profileUrl(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson
                .profileUrl(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .profileUrl(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.profileUrl(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$UserModelImplPerFieldToJson.profileUrl(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereBirthday({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['birthday']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.birthday(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.birthday(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.birthday(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .birthday(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.birthday(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .birthday(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.birthday(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.birthday(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereAge({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['age']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.age(isEqualTo as int?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.age(isNotEqualTo as int?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.age(isLessThan as int?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson.age(isLessThanOrEqualTo as int?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.age(isGreaterThan as int?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson.age(isGreaterThanOrEqualTo as int?)
            : null,
        whereIn: whereIn?.map((e) => _$$UserModelImplPerFieldToJson.age(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.age(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery wherePosition({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<GeoPointData?>? whereIn,
    List<GeoPointData?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['position']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .position(isEqualTo as GeoPointData?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .position(isNotEqualTo as GeoPointData?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson
                .position(isLessThan as GeoPointData?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .position(isLessThanOrEqualTo as GeoPointData?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson
                .position(isGreaterThan as GeoPointData?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .position(isGreaterThanOrEqualTo as GeoPointData?)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.position(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.position(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereDob({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['dob']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.dob(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.dob(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.dob(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson.dob(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.dob(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .dob(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$$UserModelImplPerFieldToJson.dob(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.dob(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereHeight({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['height']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.height(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.height(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.height(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .height(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.height(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .height(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$$UserModelImplPerFieldToJson.height(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.height(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereWeight({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['weight']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.weight(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.weight(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.weight(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .weight(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.weight(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .weight(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$$UserModelImplPerFieldToJson.weight(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.weight(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereLived({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['lived']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.lived(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.lived(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.lived(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .lived(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.lived(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .lived(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$$UserModelImplPerFieldToJson.lived(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.lived(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereRole({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Role>? whereIn,
    List<Role>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['role']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.role(isEqualTo as Role)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.role(isNotEqualTo as Role)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.role(isLessThan as Role)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson.role(isLessThanOrEqualTo as Role)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.role(isGreaterThan as Role)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .role(isGreaterThanOrEqualTo as Role)
            : null,
        whereIn: whereIn?.map((e) => _$$UserModelImplPerFieldToJson.role(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.role(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereBodyType({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<BodyType>? whereIn,
    List<BodyType>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['bodyType']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.bodyType(isEqualTo as BodyType)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.bodyType(isNotEqualTo as BodyType)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.bodyType(isLessThan as BodyType)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .bodyType(isLessThanOrEqualTo as BodyType)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.bodyType(isGreaterThan as BodyType)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .bodyType(isGreaterThanOrEqualTo as BodyType)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.bodyType(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.bodyType(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereRelationshipStatus({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<RelationshipStatus>? whereIn,
    List<RelationshipStatus>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['relationshipStatus']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .relationshipStatus(isEqualTo as RelationshipStatus)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .relationshipStatus(isNotEqualTo as RelationshipStatus)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson
                .relationshipStatus(isLessThan as RelationshipStatus)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .relationshipStatus(isLessThanOrEqualTo as RelationshipStatus)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson
                .relationshipStatus(isGreaterThan as RelationshipStatus)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson.relationshipStatus(
                isGreaterThanOrEqualTo as RelationshipStatus)
            : null,
        whereIn: whereIn
            ?.map((e) => _$$UserModelImplPerFieldToJson.relationshipStatus(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$UserModelImplPerFieldToJson.relationshipStatus(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereEthnicity({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Ethnicity>? whereIn,
    List<Ethnicity>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['ethnicity']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.ethnicity(isEqualTo as Ethnicity)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .ethnicity(isNotEqualTo as Ethnicity)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.ethnicity(isLessThan as Ethnicity)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .ethnicity(isLessThanOrEqualTo as Ethnicity)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson
                .ethnicity(isGreaterThan as Ethnicity)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .ethnicity(isGreaterThanOrEqualTo as Ethnicity)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.ethnicity(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.ethnicity(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereLookingFor({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<LookingFor>? whereIn,
    List<LookingFor>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['lookingFor']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.lookingFor(isEqualTo as LookingFor)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .lookingFor(isNotEqualTo as LookingFor)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson
                .lookingFor(isLessThan as LookingFor)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .lookingFor(isLessThanOrEqualTo as LookingFor)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson
                .lookingFor(isGreaterThan as LookingFor)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .lookingFor(isGreaterThanOrEqualTo as LookingFor)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.lookingFor(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$UserModelImplPerFieldToJson.lookingFor(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereWhereToMeet({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<WhereToMeet>? whereIn,
    List<WhereToMeet>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['whereToMeet']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .whereToMeet(isEqualTo as WhereToMeet)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .whereToMeet(isNotEqualTo as WhereToMeet)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson
                .whereToMeet(isLessThan as WhereToMeet)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .whereToMeet(isLessThanOrEqualTo as WhereToMeet)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson
                .whereToMeet(isGreaterThan as WhereToMeet)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .whereToMeet(isGreaterThanOrEqualTo as WhereToMeet)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.whereToMeet(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$UserModelImplPerFieldToJson.whereToMeet(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereIsOnline({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['isOnline']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.isOnline(isEqualTo as bool)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.isOnline(isNotEqualTo as bool)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.isOnline(isLessThan as bool)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .isOnline(isLessThanOrEqualTo as bool)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.isOnline(isGreaterThan as bool)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .isOnline(isGreaterThanOrEqualTo as bool)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.isOnline(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.isOnline(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereIsVerified({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['isVerified']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.isVerified(isEqualTo as bool)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.isVerified(isNotEqualTo as bool)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.isVerified(isLessThan as bool)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .isVerified(isLessThanOrEqualTo as bool)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.isVerified(isGreaterThan as bool)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .isVerified(isGreaterThanOrEqualTo as bool)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.isVerified(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$UserModelImplPerFieldToJson.isVerified(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereIsBlocked({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['isBlocked']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.isBlocked(isEqualTo as bool)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.isBlocked(isNotEqualTo as bool)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.isBlocked(isLessThan as bool)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .isBlocked(isLessThanOrEqualTo as bool)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.isBlocked(isGreaterThan as bool)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .isBlocked(isGreaterThanOrEqualTo as bool)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.isBlocked(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.isBlocked(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereBlockList({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['blockList']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .blockList(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson
                .blockList(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson
                .blockList(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .blockList(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson
                .blockList(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .blockList(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$UserModelImplPerFieldToJson
                    .blockList([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$UserModelImplPerFieldToJson.blockList(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['id']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.id(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.id(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.id(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson.id(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.id(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .id(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$$UserModelImplPerFieldToJson.id(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.id(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery whereFcmToken({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$UserModelImplFieldMap['fcmToken']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.fcmToken(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$UserModelImplPerFieldToJson.fcmToken(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$UserModelImplPerFieldToJson.fcmToken(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .fcmToken(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$UserModelImplPerFieldToJson.fcmToken(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$UserModelImplPerFieldToJson
                .fcmToken(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$$UserModelImplPerFieldToJson.fcmToken(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$UserModelImplPerFieldToJson.fcmToken(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserModelQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByUsername({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['username']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByBio({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['bio']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByAlbumUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['albumUrl']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByProfileUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$UserModelImplFieldMap['profileUrl']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByBirthday({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['birthday']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByAge({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['age']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByPosition({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['position']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByDob({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['dob']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByHeight({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['height']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByWeight({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['weight']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByLived({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['lived']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByRole({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['role']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByBodyType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['bodyType']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByRelationshipStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$UserModelImplFieldMap['relationshipStatus']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByEthnicity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$UserModelImplFieldMap['ethnicity']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByLookingFor({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$UserModelImplFieldMap['lookingFor']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByWhereToMeet({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$UserModelImplFieldMap['whereToMeet']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByIsOnline({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['isOnline']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByIsVerified({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$UserModelImplFieldMap['isVerified']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByIsBlocked({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$UserModelImplFieldMap['isBlocked']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByBlockList({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$UserModelImplFieldMap['blockList']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['id']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserModelQuery orderByFcmToken({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserModelDocumentSnapshot? startAtDocument,
    UserModelDocumentSnapshot? endAtDocument,
    UserModelDocumentSnapshot? endBeforeDocument,
    UserModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$UserModelImplFieldMap['fcmToken']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserModelDocumentSnapshot extends FirestoreDocumentSnapshot<UserModel> {
  UserModelDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserModel> snapshot;

  @override
  UserModelDocumentReference get reference {
    return UserModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserModel? data;
}

class UserModelQuerySnapshot
    extends FirestoreQuerySnapshot<UserModel, UserModelQueryDocumentSnapshot> {
  UserModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserModelQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserModel> snapshot,
  ) {
    final docs = snapshot.docs.map(UserModelQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserModelDocumentSnapshot._,
      );
    }).toList();

    return UserModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserModelDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserModelDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserModelDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserModel> snapshot;

  @override
  final List<UserModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserModelDocumentSnapshot>> docChanges;
}

class UserModelQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserModel>
    implements UserModelDocumentSnapshot {
  UserModelQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserModel> snapshot;

  @override
  final UserModel data;

  @override
  UserModelDocumentReference get reference {
    return UserModelDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      username: json['username'] as String,
      bio: json['bio'] as String?,
      albumUrl: (json['albumUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      profileUrl: json['profileUrl'] as String? ??
          "https://img.icons8.com/ios/500/null/user-male-circle--v1.png",
      birthday: json['birthday'] as String?,
      age: (json['age'] as num?)?.toInt(),
      position: json['position'] == null
          ? null
          : GeoPointData.fromJson(json['position'] as Map<String, dynamic>),
      dob: json['dob'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      lived: json['lived'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.doNotShow,
      bodyType: $enumDecodeNullable(_$BodyTypeEnumMap, json['bodyType']) ??
          BodyType.doNotShow,
      relationshipStatus: $enumDecodeNullable(
              _$RelationshipStatusEnumMap, json['relationshipStatus']) ??
          RelationshipStatus.doNotShow,
      ethnicity: $enumDecodeNullable(_$EthnicityEnumMap, json['ethnicity']) ??
          Ethnicity.doNotShow,
      lookingFor:
          $enumDecodeNullable(_$LookingForEnumMap, json['lookingFor']) ??
              LookingFor.doNotShow,
      whereToMeet:
          $enumDecodeNullable(_$WhereToMeetEnumMap, json['whereToMeet']) ??
              WhereToMeet.doNotShow,
      isOnline: json['isOnline'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
      isBlocked: json['isBlocked'] as bool? ?? false,
      blockList: (json['blockList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id: json['id'] as String,
      fcmToken: json['fcmToken'] as String,
    );

const _$$UserModelImplFieldMap = <String, String>{
  'username': 'username',
  'bio': 'bio',
  'albumUrl': 'albumUrl',
  'profileUrl': 'profileUrl',
  'birthday': 'birthday',
  'age': 'age',
  'position': 'position',
  'dob': 'dob',
  'height': 'height',
  'weight': 'weight',
  'lived': 'lived',
  'role': 'role',
  'bodyType': 'bodyType',
  'relationshipStatus': 'relationshipStatus',
  'ethnicity': 'ethnicity',
  'lookingFor': 'lookingFor',
  'whereToMeet': 'whereToMeet',
  'isOnline': 'isOnline',
  'isVerified': 'isVerified',
  'isBlocked': 'isBlocked',
  'blockList': 'blockList',
  'id': 'id',
  'fcmToken': 'fcmToken',
};

// ignore: unused_element
abstract class _$$UserModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? username(String instance) => instance;
  // ignore: unused_element
  static Object? bio(String? instance) => instance;
  // ignore: unused_element
  static Object? albumUrl(List<String>? instance) => instance;
  // ignore: unused_element
  static Object? profileUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? birthday(String? instance) => instance;
  // ignore: unused_element
  static Object? age(int? instance) => instance;
  // ignore: unused_element
  static Object? position(GeoPointData? instance) => instance?.toJson();
  // ignore: unused_element
  static Object? dob(String? instance) => instance;
  // ignore: unused_element
  static Object? height(String? instance) => instance;
  // ignore: unused_element
  static Object? weight(String? instance) => instance;
  // ignore: unused_element
  static Object? lived(String? instance) => instance;
  // ignore: unused_element
  static Object? role(Role instance) => _$RoleEnumMap[instance]!;
  // ignore: unused_element
  static Object? bodyType(BodyType instance) => _$BodyTypeEnumMap[instance]!;
  // ignore: unused_element
  static Object? relationshipStatus(RelationshipStatus instance) =>
      _$RelationshipStatusEnumMap[instance]!;
  // ignore: unused_element
  static Object? ethnicity(Ethnicity instance) => _$EthnicityEnumMap[instance]!;
  // ignore: unused_element
  static Object? lookingFor(LookingFor instance) =>
      _$LookingForEnumMap[instance]!;
  // ignore: unused_element
  static Object? whereToMeet(WhereToMeet instance) =>
      _$WhereToMeetEnumMap[instance]!;
  // ignore: unused_element
  static Object? isOnline(bool instance) => instance;
  // ignore: unused_element
  static Object? isVerified(bool instance) => instance;
  // ignore: unused_element
  static Object? isBlocked(bool instance) => instance;
  // ignore: unused_element
  static Object? blockList(List<String> instance) => instance;
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? fcmToken(String instance) => instance;
}

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'bio': instance.bio,
      'albumUrl': instance.albumUrl,
      'profileUrl': instance.profileUrl,
      'birthday': instance.birthday,
      'age': instance.age,
      'position': instance.position?.toJson(),
      'dob': instance.dob,
      'height': instance.height,
      'weight': instance.weight,
      'lived': instance.lived,
      'role': _$RoleEnumMap[instance.role]!,
      'bodyType': _$BodyTypeEnumMap[instance.bodyType]!,
      'relationshipStatus':
          _$RelationshipStatusEnumMap[instance.relationshipStatus]!,
      'ethnicity': _$EthnicityEnumMap[instance.ethnicity]!,
      'lookingFor': _$LookingForEnumMap[instance.lookingFor]!,
      'whereToMeet': _$WhereToMeetEnumMap[instance.whereToMeet]!,
      'isOnline': instance.isOnline,
      'isVerified': instance.isVerified,
      'isBlocked': instance.isBlocked,
      'blockList': instance.blockList,
      'id': instance.id,
      'fcmToken': instance.fcmToken,
    };

const _$RoleEnumMap = {
  Role.doNotShow: 'doNotShow',
  Role.top: 'top',
  Role.versTop: 'versTop',
  Role.versatile: 'versatile',
  Role.versBottom: 'versBottom',
  Role.bottom: 'bottom',
};

const _$BodyTypeEnumMap = {
  BodyType.doNotShow: 'doNotShow',
  BodyType.slim: 'slim',
  BodyType.average: 'average',
  BodyType.athletic: 'athletic',
  BodyType.muscular: 'muscular',
  BodyType.large: 'large',
  BodyType.fit: 'fit',
  BodyType.stocky: 'stocky',
  BodyType.heavy: 'heavy',
};

const _$RelationshipStatusEnumMap = {
  RelationshipStatus.doNotShow: 'doNotShow',
  RelationshipStatus.single: 'single',
  RelationshipStatus.dating: 'dating',
  RelationshipStatus.openRelationship: 'openRelationship',
  RelationshipStatus.married: 'married',
  RelationshipStatus.divorced: 'divorced',
  RelationshipStatus.widowed: 'widowed',
  RelationshipStatus.complicated: 'complicated',
  RelationshipStatus.inLove: 'inLove',
  RelationshipStatus.engaged: 'engaged',
  RelationshipStatus.partnered: 'partnered',
};

const _$EthnicityEnumMap = {
  Ethnicity.doNotShow: 'doNotShow',
  Ethnicity.asian: 'asian',
  Ethnicity.black: 'black',
  Ethnicity.caucasian: 'caucasian',
  Ethnicity.hispanic: 'hispanic',
  Ethnicity.indian: 'indian',
  Ethnicity.middleEastern: 'middleEastern',
  Ethnicity.nativeAmerican: 'nativeAmerican',
  Ethnicity.pacificIslander: 'pacificIslander',
  Ethnicity.mixed: 'mixed',
  Ethnicity.other: 'other',
  Ethnicity.partnered: 'partnered',
};

const _$LookingForEnumMap = {
  LookingFor.doNotShow: 'doNotShow',
  LookingFor.chat: 'chat',
  LookingFor.dates: 'dates',
  LookingFor.friends: 'friends',
  LookingFor.networking: 'networking',
  LookingFor.longTerm: 'longTerm',
  LookingFor.shortTerm: 'shortTerm',
  LookingFor.casual: 'casual',
  LookingFor.rightNow: 'rightNow',
};

const _$WhereToMeetEnumMap = {
  WhereToMeet.doNotShow: 'doNotShow',
  WhereToMeet.myPlace: 'myPlace',
  WhereToMeet.yourPlace: 'yourPlace',
  WhereToMeet.hotel: 'hotel',
  WhereToMeet.bar: 'bar',
  WhereToMeet.restaurant: 'restaurant',
  WhereToMeet.coffeeShop: 'coffeeShop',
};
