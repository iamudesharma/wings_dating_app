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
    FieldValue favoriteListFieldValue,
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
    FieldValue favoriteListFieldValue,
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
    FieldValue favoriteListFieldValue,
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
    List<String> favoriteList,
    FieldValue favoriteListFieldValue,
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
    List<String> favoriteList,
    FieldValue favoriteListFieldValue,
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
    List<String> favoriteList,
    FieldValue favoriteListFieldValue,
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
    FieldValue? favoriteListFieldValue,
    FieldValue? idFieldValue,
    FieldValue? fcmTokenFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (usernameFieldValue != null)
        _$UserModelFieldMap['username']!: usernameFieldValue,
      if (bioFieldValue != null) _$UserModelFieldMap['bio']!: bioFieldValue,
      if (albumUrlFieldValue != null)
        _$UserModelFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrlFieldValue != null)
        _$UserModelFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthdayFieldValue != null)
        _$UserModelFieldMap['birthday']!: birthdayFieldValue,
      if (ageFieldValue != null) _$UserModelFieldMap['age']!: ageFieldValue,
      if (positionFieldValue != null)
        _$UserModelFieldMap['position']!: positionFieldValue,
      if (dobFieldValue != null) _$UserModelFieldMap['dob']!: dobFieldValue,
      if (heightFieldValue != null)
        _$UserModelFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null)
        _$UserModelFieldMap['weight']!: weightFieldValue,
      if (livedFieldValue != null)
        _$UserModelFieldMap['lived']!: livedFieldValue,
      if (roleFieldValue != null) _$UserModelFieldMap['role']!: roleFieldValue,
      if (bodyTypeFieldValue != null)
        _$UserModelFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatusFieldValue != null)
        _$UserModelFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicityFieldValue != null)
        _$UserModelFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingForFieldValue != null)
        _$UserModelFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeetFieldValue != null)
        _$UserModelFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnlineFieldValue != null)
        _$UserModelFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerifiedFieldValue != null)
        _$UserModelFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlockedFieldValue != null)
        _$UserModelFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockListFieldValue != null)
        _$UserModelFieldMap['blockList']!: blockListFieldValue,
      if (favoriteListFieldValue != null)
        _$UserModelFieldMap['favoriteList']!: favoriteListFieldValue,
      if (idFieldValue != null) _$UserModelFieldMap['id']!: idFieldValue,
      if (fcmTokenFieldValue != null)
        _$UserModelFieldMap['fcmToken']!: fcmTokenFieldValue,
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
    FieldValue? favoriteListFieldValue,
    FieldValue? idFieldValue,
    FieldValue? fcmTokenFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (usernameFieldValue != null)
        _$UserModelFieldMap['username']!: usernameFieldValue,
      if (bioFieldValue != null) _$UserModelFieldMap['bio']!: bioFieldValue,
      if (albumUrlFieldValue != null)
        _$UserModelFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrlFieldValue != null)
        _$UserModelFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthdayFieldValue != null)
        _$UserModelFieldMap['birthday']!: birthdayFieldValue,
      if (ageFieldValue != null) _$UserModelFieldMap['age']!: ageFieldValue,
      if (positionFieldValue != null)
        _$UserModelFieldMap['position']!: positionFieldValue,
      if (dobFieldValue != null) _$UserModelFieldMap['dob']!: dobFieldValue,
      if (heightFieldValue != null)
        _$UserModelFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null)
        _$UserModelFieldMap['weight']!: weightFieldValue,
      if (livedFieldValue != null)
        _$UserModelFieldMap['lived']!: livedFieldValue,
      if (roleFieldValue != null) _$UserModelFieldMap['role']!: roleFieldValue,
      if (bodyTypeFieldValue != null)
        _$UserModelFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatusFieldValue != null)
        _$UserModelFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicityFieldValue != null)
        _$UserModelFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingForFieldValue != null)
        _$UserModelFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeetFieldValue != null)
        _$UserModelFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnlineFieldValue != null)
        _$UserModelFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerifiedFieldValue != null)
        _$UserModelFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlockedFieldValue != null)
        _$UserModelFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockListFieldValue != null)
        _$UserModelFieldMap['blockList']!: blockListFieldValue,
      if (favoriteListFieldValue != null)
        _$UserModelFieldMap['favoriteList']!: favoriteListFieldValue,
      if (idFieldValue != null) _$UserModelFieldMap['id']!: idFieldValue,
      if (fcmTokenFieldValue != null)
        _$UserModelFieldMap['fcmToken']!: fcmTokenFieldValue,
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
    FieldValue? favoriteListFieldValue,
    FieldValue? idFieldValue,
    FieldValue? fcmTokenFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (usernameFieldValue != null)
        _$UserModelFieldMap['username']!: usernameFieldValue,
      if (bioFieldValue != null) _$UserModelFieldMap['bio']!: bioFieldValue,
      if (albumUrlFieldValue != null)
        _$UserModelFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrlFieldValue != null)
        _$UserModelFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthdayFieldValue != null)
        _$UserModelFieldMap['birthday']!: birthdayFieldValue,
      if (ageFieldValue != null) _$UserModelFieldMap['age']!: ageFieldValue,
      if (positionFieldValue != null)
        _$UserModelFieldMap['position']!: positionFieldValue,
      if (dobFieldValue != null) _$UserModelFieldMap['dob']!: dobFieldValue,
      if (heightFieldValue != null)
        _$UserModelFieldMap['height']!: heightFieldValue,
      if (weightFieldValue != null)
        _$UserModelFieldMap['weight']!: weightFieldValue,
      if (livedFieldValue != null)
        _$UserModelFieldMap['lived']!: livedFieldValue,
      if (roleFieldValue != null) _$UserModelFieldMap['role']!: roleFieldValue,
      if (bodyTypeFieldValue != null)
        _$UserModelFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatusFieldValue != null)
        _$UserModelFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicityFieldValue != null)
        _$UserModelFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingForFieldValue != null)
        _$UserModelFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeetFieldValue != null)
        _$UserModelFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnlineFieldValue != null)
        _$UserModelFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerifiedFieldValue != null)
        _$UserModelFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlockedFieldValue != null)
        _$UserModelFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockListFieldValue != null)
        _$UserModelFieldMap['blockList']!: blockListFieldValue,
      if (favoriteListFieldValue != null)
        _$UserModelFieldMap['favoriteList']!: favoriteListFieldValue,
      if (idFieldValue != null) _$UserModelFieldMap['id']!: idFieldValue,
      if (fcmTokenFieldValue != null)
        _$UserModelFieldMap['fcmToken']!: fcmTokenFieldValue,
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
    Object? favoriteList = _sentinel,
    FieldValue? favoriteListFieldValue,
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
      favoriteList == _sentinel || favoriteListFieldValue == null,
      "Cannot specify both favoriteList and favoriteListFieldValue",
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
        _$UserModelFieldMap['username']!:
            _$UserModelPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserModelFieldMap['username']!: usernameFieldValue,
      if (bio != _sentinel)
        _$UserModelFieldMap['bio']!:
            _$UserModelPerFieldToJson.bio(bio as String?),
      if (bioFieldValue != null) _$UserModelFieldMap['bio']!: bioFieldValue,
      if (albumUrl != _sentinel)
        _$UserModelFieldMap['albumUrl']!:
            _$UserModelPerFieldToJson.albumUrl(albumUrl as List<String>?),
      if (albumUrlFieldValue != null)
        _$UserModelFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrl != _sentinel)
        _$UserModelFieldMap['profileUrl']!:
            _$UserModelPerFieldToJson.profileUrl(profileUrl as String?),
      if (profileUrlFieldValue != null)
        _$UserModelFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthday != _sentinel)
        _$UserModelFieldMap['birthday']!:
            _$UserModelPerFieldToJson.birthday(birthday as String?),
      if (birthdayFieldValue != null)
        _$UserModelFieldMap['birthday']!: birthdayFieldValue,
      if (age != _sentinel)
        _$UserModelFieldMap['age']!: _$UserModelPerFieldToJson.age(age as int?),
      if (ageFieldValue != null) _$UserModelFieldMap['age']!: ageFieldValue,
      if (position != _sentinel)
        _$UserModelFieldMap['position']!:
            _$UserModelPerFieldToJson.position(position as GeoPointData?),
      if (positionFieldValue != null)
        _$UserModelFieldMap['position']!: positionFieldValue,
      if (dob != _sentinel)
        _$UserModelFieldMap['dob']!:
            _$UserModelPerFieldToJson.dob(dob as String?),
      if (dobFieldValue != null) _$UserModelFieldMap['dob']!: dobFieldValue,
      if (height != _sentinel)
        _$UserModelFieldMap['height']!:
            _$UserModelPerFieldToJson.height(height as String?),
      if (heightFieldValue != null)
        _$UserModelFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$UserModelFieldMap['weight']!:
            _$UserModelPerFieldToJson.weight(weight as String?),
      if (weightFieldValue != null)
        _$UserModelFieldMap['weight']!: weightFieldValue,
      if (lived != _sentinel)
        _$UserModelFieldMap['lived']!:
            _$UserModelPerFieldToJson.lived(lived as String?),
      if (livedFieldValue != null)
        _$UserModelFieldMap['lived']!: livedFieldValue,
      if (role != _sentinel)
        _$UserModelFieldMap['role']!:
            _$UserModelPerFieldToJson.role(role as Role),
      if (roleFieldValue != null) _$UserModelFieldMap['role']!: roleFieldValue,
      if (bodyType != _sentinel)
        _$UserModelFieldMap['bodyType']!:
            _$UserModelPerFieldToJson.bodyType(bodyType as BodyType),
      if (bodyTypeFieldValue != null)
        _$UserModelFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatus != _sentinel)
        _$UserModelFieldMap['relationshipStatus']!: _$UserModelPerFieldToJson
            .relationshipStatus(relationshipStatus as RelationshipStatus),
      if (relationshipStatusFieldValue != null)
        _$UserModelFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicity != _sentinel)
        _$UserModelFieldMap['ethnicity']!:
            _$UserModelPerFieldToJson.ethnicity(ethnicity as Ethnicity),
      if (ethnicityFieldValue != null)
        _$UserModelFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingFor != _sentinel)
        _$UserModelFieldMap['lookingFor']!:
            _$UserModelPerFieldToJson.lookingFor(lookingFor as LookingFor),
      if (lookingForFieldValue != null)
        _$UserModelFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeet != _sentinel)
        _$UserModelFieldMap['whereToMeet']!:
            _$UserModelPerFieldToJson.whereToMeet(whereToMeet as WhereToMeet),
      if (whereToMeetFieldValue != null)
        _$UserModelFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnline != _sentinel)
        _$UserModelFieldMap['isOnline']!:
            _$UserModelPerFieldToJson.isOnline(isOnline as bool),
      if (isOnlineFieldValue != null)
        _$UserModelFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerified != _sentinel)
        _$UserModelFieldMap['isVerified']!:
            _$UserModelPerFieldToJson.isVerified(isVerified as bool),
      if (isVerifiedFieldValue != null)
        _$UserModelFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlocked != _sentinel)
        _$UserModelFieldMap['isBlocked']!:
            _$UserModelPerFieldToJson.isBlocked(isBlocked as bool),
      if (isBlockedFieldValue != null)
        _$UserModelFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockList != _sentinel)
        _$UserModelFieldMap['blockList']!:
            _$UserModelPerFieldToJson.blockList(blockList as List<String>),
      if (blockListFieldValue != null)
        _$UserModelFieldMap['blockList']!: blockListFieldValue,
      if (favoriteList != _sentinel)
        _$UserModelFieldMap['favoriteList']!: _$UserModelPerFieldToJson
            .favoriteList(favoriteList as List<String>),
      if (favoriteListFieldValue != null)
        _$UserModelFieldMap['favoriteList']!: favoriteListFieldValue,
      if (id != _sentinel)
        _$UserModelFieldMap['id']!: _$UserModelPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$UserModelFieldMap['id']!: idFieldValue,
      if (fcmToken != _sentinel)
        _$UserModelFieldMap['fcmToken']!:
            _$UserModelPerFieldToJson.fcmToken(fcmToken as String),
      if (fcmTokenFieldValue != null)
        _$UserModelFieldMap['fcmToken']!: fcmTokenFieldValue,
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
    Object? favoriteList = _sentinel,
    FieldValue? favoriteListFieldValue,
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
      favoriteList == _sentinel || favoriteListFieldValue == null,
      "Cannot specify both favoriteList and favoriteListFieldValue",
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
        _$UserModelFieldMap['username']!:
            _$UserModelPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserModelFieldMap['username']!: usernameFieldValue,
      if (bio != _sentinel)
        _$UserModelFieldMap['bio']!:
            _$UserModelPerFieldToJson.bio(bio as String?),
      if (bioFieldValue != null) _$UserModelFieldMap['bio']!: bioFieldValue,
      if (albumUrl != _sentinel)
        _$UserModelFieldMap['albumUrl']!:
            _$UserModelPerFieldToJson.albumUrl(albumUrl as List<String>?),
      if (albumUrlFieldValue != null)
        _$UserModelFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrl != _sentinel)
        _$UserModelFieldMap['profileUrl']!:
            _$UserModelPerFieldToJson.profileUrl(profileUrl as String?),
      if (profileUrlFieldValue != null)
        _$UserModelFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthday != _sentinel)
        _$UserModelFieldMap['birthday']!:
            _$UserModelPerFieldToJson.birthday(birthday as String?),
      if (birthdayFieldValue != null)
        _$UserModelFieldMap['birthday']!: birthdayFieldValue,
      if (age != _sentinel)
        _$UserModelFieldMap['age']!: _$UserModelPerFieldToJson.age(age as int?),
      if (ageFieldValue != null) _$UserModelFieldMap['age']!: ageFieldValue,
      if (position != _sentinel)
        _$UserModelFieldMap['position']!:
            _$UserModelPerFieldToJson.position(position as GeoPointData?),
      if (positionFieldValue != null)
        _$UserModelFieldMap['position']!: positionFieldValue,
      if (dob != _sentinel)
        _$UserModelFieldMap['dob']!:
            _$UserModelPerFieldToJson.dob(dob as String?),
      if (dobFieldValue != null) _$UserModelFieldMap['dob']!: dobFieldValue,
      if (height != _sentinel)
        _$UserModelFieldMap['height']!:
            _$UserModelPerFieldToJson.height(height as String?),
      if (heightFieldValue != null)
        _$UserModelFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$UserModelFieldMap['weight']!:
            _$UserModelPerFieldToJson.weight(weight as String?),
      if (weightFieldValue != null)
        _$UserModelFieldMap['weight']!: weightFieldValue,
      if (lived != _sentinel)
        _$UserModelFieldMap['lived']!:
            _$UserModelPerFieldToJson.lived(lived as String?),
      if (livedFieldValue != null)
        _$UserModelFieldMap['lived']!: livedFieldValue,
      if (role != _sentinel)
        _$UserModelFieldMap['role']!:
            _$UserModelPerFieldToJson.role(role as Role),
      if (roleFieldValue != null) _$UserModelFieldMap['role']!: roleFieldValue,
      if (bodyType != _sentinel)
        _$UserModelFieldMap['bodyType']!:
            _$UserModelPerFieldToJson.bodyType(bodyType as BodyType),
      if (bodyTypeFieldValue != null)
        _$UserModelFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatus != _sentinel)
        _$UserModelFieldMap['relationshipStatus']!: _$UserModelPerFieldToJson
            .relationshipStatus(relationshipStatus as RelationshipStatus),
      if (relationshipStatusFieldValue != null)
        _$UserModelFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicity != _sentinel)
        _$UserModelFieldMap['ethnicity']!:
            _$UserModelPerFieldToJson.ethnicity(ethnicity as Ethnicity),
      if (ethnicityFieldValue != null)
        _$UserModelFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingFor != _sentinel)
        _$UserModelFieldMap['lookingFor']!:
            _$UserModelPerFieldToJson.lookingFor(lookingFor as LookingFor),
      if (lookingForFieldValue != null)
        _$UserModelFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeet != _sentinel)
        _$UserModelFieldMap['whereToMeet']!:
            _$UserModelPerFieldToJson.whereToMeet(whereToMeet as WhereToMeet),
      if (whereToMeetFieldValue != null)
        _$UserModelFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnline != _sentinel)
        _$UserModelFieldMap['isOnline']!:
            _$UserModelPerFieldToJson.isOnline(isOnline as bool),
      if (isOnlineFieldValue != null)
        _$UserModelFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerified != _sentinel)
        _$UserModelFieldMap['isVerified']!:
            _$UserModelPerFieldToJson.isVerified(isVerified as bool),
      if (isVerifiedFieldValue != null)
        _$UserModelFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlocked != _sentinel)
        _$UserModelFieldMap['isBlocked']!:
            _$UserModelPerFieldToJson.isBlocked(isBlocked as bool),
      if (isBlockedFieldValue != null)
        _$UserModelFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockList != _sentinel)
        _$UserModelFieldMap['blockList']!:
            _$UserModelPerFieldToJson.blockList(blockList as List<String>),
      if (blockListFieldValue != null)
        _$UserModelFieldMap['blockList']!: blockListFieldValue,
      if (favoriteList != _sentinel)
        _$UserModelFieldMap['favoriteList']!: _$UserModelPerFieldToJson
            .favoriteList(favoriteList as List<String>),
      if (favoriteListFieldValue != null)
        _$UserModelFieldMap['favoriteList']!: favoriteListFieldValue,
      if (id != _sentinel)
        _$UserModelFieldMap['id']!: _$UserModelPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$UserModelFieldMap['id']!: idFieldValue,
      if (fcmToken != _sentinel)
        _$UserModelFieldMap['fcmToken']!:
            _$UserModelPerFieldToJson.fcmToken(fcmToken as String),
      if (fcmTokenFieldValue != null)
        _$UserModelFieldMap['fcmToken']!: fcmTokenFieldValue,
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
    Object? favoriteList = _sentinel,
    FieldValue? favoriteListFieldValue,
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
      favoriteList == _sentinel || favoriteListFieldValue == null,
      "Cannot specify both favoriteList and favoriteListFieldValue",
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
        _$UserModelFieldMap['username']!:
            _$UserModelPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserModelFieldMap['username']!: usernameFieldValue,
      if (bio != _sentinel)
        _$UserModelFieldMap['bio']!:
            _$UserModelPerFieldToJson.bio(bio as String?),
      if (bioFieldValue != null) _$UserModelFieldMap['bio']!: bioFieldValue,
      if (albumUrl != _sentinel)
        _$UserModelFieldMap['albumUrl']!:
            _$UserModelPerFieldToJson.albumUrl(albumUrl as List<String>?),
      if (albumUrlFieldValue != null)
        _$UserModelFieldMap['albumUrl']!: albumUrlFieldValue,
      if (profileUrl != _sentinel)
        _$UserModelFieldMap['profileUrl']!:
            _$UserModelPerFieldToJson.profileUrl(profileUrl as String?),
      if (profileUrlFieldValue != null)
        _$UserModelFieldMap['profileUrl']!: profileUrlFieldValue,
      if (birthday != _sentinel)
        _$UserModelFieldMap['birthday']!:
            _$UserModelPerFieldToJson.birthday(birthday as String?),
      if (birthdayFieldValue != null)
        _$UserModelFieldMap['birthday']!: birthdayFieldValue,
      if (age != _sentinel)
        _$UserModelFieldMap['age']!: _$UserModelPerFieldToJson.age(age as int?),
      if (ageFieldValue != null) _$UserModelFieldMap['age']!: ageFieldValue,
      if (position != _sentinel)
        _$UserModelFieldMap['position']!:
            _$UserModelPerFieldToJson.position(position as GeoPointData?),
      if (positionFieldValue != null)
        _$UserModelFieldMap['position']!: positionFieldValue,
      if (dob != _sentinel)
        _$UserModelFieldMap['dob']!:
            _$UserModelPerFieldToJson.dob(dob as String?),
      if (dobFieldValue != null) _$UserModelFieldMap['dob']!: dobFieldValue,
      if (height != _sentinel)
        _$UserModelFieldMap['height']!:
            _$UserModelPerFieldToJson.height(height as String?),
      if (heightFieldValue != null)
        _$UserModelFieldMap['height']!: heightFieldValue,
      if (weight != _sentinel)
        _$UserModelFieldMap['weight']!:
            _$UserModelPerFieldToJson.weight(weight as String?),
      if (weightFieldValue != null)
        _$UserModelFieldMap['weight']!: weightFieldValue,
      if (lived != _sentinel)
        _$UserModelFieldMap['lived']!:
            _$UserModelPerFieldToJson.lived(lived as String?),
      if (livedFieldValue != null)
        _$UserModelFieldMap['lived']!: livedFieldValue,
      if (role != _sentinel)
        _$UserModelFieldMap['role']!:
            _$UserModelPerFieldToJson.role(role as Role),
      if (roleFieldValue != null) _$UserModelFieldMap['role']!: roleFieldValue,
      if (bodyType != _sentinel)
        _$UserModelFieldMap['bodyType']!:
            _$UserModelPerFieldToJson.bodyType(bodyType as BodyType),
      if (bodyTypeFieldValue != null)
        _$UserModelFieldMap['bodyType']!: bodyTypeFieldValue,
      if (relationshipStatus != _sentinel)
        _$UserModelFieldMap['relationshipStatus']!: _$UserModelPerFieldToJson
            .relationshipStatus(relationshipStatus as RelationshipStatus),
      if (relationshipStatusFieldValue != null)
        _$UserModelFieldMap['relationshipStatus']!:
            relationshipStatusFieldValue,
      if (ethnicity != _sentinel)
        _$UserModelFieldMap['ethnicity']!:
            _$UserModelPerFieldToJson.ethnicity(ethnicity as Ethnicity),
      if (ethnicityFieldValue != null)
        _$UserModelFieldMap['ethnicity']!: ethnicityFieldValue,
      if (lookingFor != _sentinel)
        _$UserModelFieldMap['lookingFor']!:
            _$UserModelPerFieldToJson.lookingFor(lookingFor as LookingFor),
      if (lookingForFieldValue != null)
        _$UserModelFieldMap['lookingFor']!: lookingForFieldValue,
      if (whereToMeet != _sentinel)
        _$UserModelFieldMap['whereToMeet']!:
            _$UserModelPerFieldToJson.whereToMeet(whereToMeet as WhereToMeet),
      if (whereToMeetFieldValue != null)
        _$UserModelFieldMap['whereToMeet']!: whereToMeetFieldValue,
      if (isOnline != _sentinel)
        _$UserModelFieldMap['isOnline']!:
            _$UserModelPerFieldToJson.isOnline(isOnline as bool),
      if (isOnlineFieldValue != null)
        _$UserModelFieldMap['isOnline']!: isOnlineFieldValue,
      if (isVerified != _sentinel)
        _$UserModelFieldMap['isVerified']!:
            _$UserModelPerFieldToJson.isVerified(isVerified as bool),
      if (isVerifiedFieldValue != null)
        _$UserModelFieldMap['isVerified']!: isVerifiedFieldValue,
      if (isBlocked != _sentinel)
        _$UserModelFieldMap['isBlocked']!:
            _$UserModelPerFieldToJson.isBlocked(isBlocked as bool),
      if (isBlockedFieldValue != null)
        _$UserModelFieldMap['isBlocked']!: isBlockedFieldValue,
      if (blockList != _sentinel)
        _$UserModelFieldMap['blockList']!:
            _$UserModelPerFieldToJson.blockList(blockList as List<String>),
      if (blockListFieldValue != null)
        _$UserModelFieldMap['blockList']!: blockListFieldValue,
      if (favoriteList != _sentinel)
        _$UserModelFieldMap['favoriteList']!: _$UserModelPerFieldToJson
            .favoriteList(favoriteList as List<String>),
      if (favoriteListFieldValue != null)
        _$UserModelFieldMap['favoriteList']!: favoriteListFieldValue,
      if (id != _sentinel)
        _$UserModelFieldMap['id']!: _$UserModelPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$UserModelFieldMap['id']!: idFieldValue,
      if (fcmToken != _sentinel)
        _$UserModelFieldMap['fcmToken']!:
            _$UserModelPerFieldToJson.fcmToken(fcmToken as String),
      if (fcmTokenFieldValue != null)
        _$UserModelFieldMap['fcmToken']!: fcmTokenFieldValue,
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

  UserModelQuery whereFavoriteList({
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

  UserModelQuery orderByFavoriteList({
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
        _$UserModelFieldMap['username']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.username(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.username(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.username(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.username(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.username(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .username(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.username(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.username(e)),
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
        _$UserModelFieldMap['bio']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.bio(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.bio(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.bio(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.bio(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.bio(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.bio(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.bio(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserModelPerFieldToJson.bio(e)),
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
        _$UserModelFieldMap['albumUrl']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.albumUrl(isEqualTo as List<String>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.albumUrl(isNotEqualTo as List<String>?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.albumUrl(isLessThan as List<String>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .albumUrl(isLessThanOrEqualTo as List<String>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.albumUrl(isGreaterThan as List<String>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .albumUrl(isGreaterThanOrEqualTo as List<String>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$UserModelPerFieldToJson.albumUrl([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$UserModelPerFieldToJson.albumUrl(arrayContainsAny)
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
        _$UserModelFieldMap['profileUrl']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.profileUrl(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.profileUrl(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.profileUrl(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .profileUrl(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.profileUrl(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .profileUrl(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.profileUrl(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.profileUrl(e)),
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
        _$UserModelFieldMap['birthday']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.birthday(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.birthday(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.birthday(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.birthday(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.birthday(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .birthday(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.birthday(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.birthday(e)),
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
        _$UserModelFieldMap['age']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.age(isEqualTo as int?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.age(isNotEqualTo as int?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.age(isLessThan as int?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.age(isLessThanOrEqualTo as int?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.age(isGreaterThan as int?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.age(isGreaterThanOrEqualTo as int?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.age(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserModelPerFieldToJson.age(e)),
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
        _$UserModelFieldMap['position']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.position(isEqualTo as GeoPointData?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.position(isNotEqualTo as GeoPointData?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.position(isLessThan as GeoPointData?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .position(isLessThanOrEqualTo as GeoPointData?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.position(isGreaterThan as GeoPointData?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .position(isGreaterThanOrEqualTo as GeoPointData?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.position(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.position(e)),
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
        _$UserModelFieldMap['dob']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.dob(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.dob(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.dob(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.dob(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.dob(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.dob(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.dob(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserModelPerFieldToJson.dob(e)),
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
        _$UserModelFieldMap['height']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.height(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.height(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.height(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.height(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.height(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .height(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.height(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserModelPerFieldToJson.height(e)),
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
        _$UserModelFieldMap['weight']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.weight(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.weight(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.weight(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.weight(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.weight(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .weight(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.weight(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserModelPerFieldToJson.weight(e)),
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
        _$UserModelFieldMap['lived']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.lived(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.lived(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.lived(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.lived(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.lived(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.lived(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.lived(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserModelPerFieldToJson.lived(e)),
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
        _$UserModelFieldMap['role']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.role(isEqualTo as Role)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.role(isNotEqualTo as Role)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.role(isLessThan as Role)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.role(isLessThanOrEqualTo as Role)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.role(isGreaterThan as Role)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.role(isGreaterThanOrEqualTo as Role)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.role(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserModelPerFieldToJson.role(e)),
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
        _$UserModelFieldMap['bodyType']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.bodyType(isEqualTo as BodyType)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.bodyType(isNotEqualTo as BodyType)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.bodyType(isLessThan as BodyType)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .bodyType(isLessThanOrEqualTo as BodyType)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.bodyType(isGreaterThan as BodyType)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .bodyType(isGreaterThanOrEqualTo as BodyType)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.bodyType(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.bodyType(e)),
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
        _$UserModelFieldMap['relationshipStatus']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson
                .relationshipStatus(isEqualTo as RelationshipStatus)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson
                .relationshipStatus(isNotEqualTo as RelationshipStatus)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson
                .relationshipStatus(isLessThan as RelationshipStatus)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .relationshipStatus(isLessThanOrEqualTo as RelationshipStatus)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson
                .relationshipStatus(isGreaterThan as RelationshipStatus)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.relationshipStatus(
                isGreaterThanOrEqualTo as RelationshipStatus)
            : null,
        whereIn: whereIn
            ?.map((e) => _$UserModelPerFieldToJson.relationshipStatus(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$UserModelPerFieldToJson.relationshipStatus(e)),
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
        _$UserModelFieldMap['ethnicity']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.ethnicity(isEqualTo as Ethnicity)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.ethnicity(isNotEqualTo as Ethnicity)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.ethnicity(isLessThan as Ethnicity)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .ethnicity(isLessThanOrEqualTo as Ethnicity)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.ethnicity(isGreaterThan as Ethnicity)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .ethnicity(isGreaterThanOrEqualTo as Ethnicity)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.ethnicity(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.ethnicity(e)),
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
        _$UserModelFieldMap['lookingFor']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.lookingFor(isEqualTo as LookingFor)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.lookingFor(isNotEqualTo as LookingFor)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.lookingFor(isLessThan as LookingFor)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .lookingFor(isLessThanOrEqualTo as LookingFor)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.lookingFor(isGreaterThan as LookingFor)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .lookingFor(isGreaterThanOrEqualTo as LookingFor)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.lookingFor(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.lookingFor(e)),
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
        _$UserModelFieldMap['whereToMeet']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.whereToMeet(isEqualTo as WhereToMeet)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.whereToMeet(isNotEqualTo as WhereToMeet)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.whereToMeet(isLessThan as WhereToMeet)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .whereToMeet(isLessThanOrEqualTo as WhereToMeet)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson
                .whereToMeet(isGreaterThan as WhereToMeet)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .whereToMeet(isGreaterThanOrEqualTo as WhereToMeet)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.whereToMeet(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.whereToMeet(e)),
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
        _$UserModelFieldMap['isOnline']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.isOnline(isEqualTo as bool)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.isOnline(isNotEqualTo as bool)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.isOnline(isLessThan as bool)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.isOnline(isLessThanOrEqualTo as bool)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.isOnline(isGreaterThan as bool)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.isOnline(isGreaterThanOrEqualTo as bool)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.isOnline(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.isOnline(e)),
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
        _$UserModelFieldMap['isVerified']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.isVerified(isEqualTo as bool)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.isVerified(isNotEqualTo as bool)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.isVerified(isLessThan as bool)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.isVerified(isLessThanOrEqualTo as bool)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.isVerified(isGreaterThan as bool)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .isVerified(isGreaterThanOrEqualTo as bool)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.isVerified(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.isVerified(e)),
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
        _$UserModelFieldMap['isBlocked']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.isBlocked(isEqualTo as bool)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.isBlocked(isNotEqualTo as bool)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.isBlocked(isLessThan as bool)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.isBlocked(isLessThanOrEqualTo as bool)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.isBlocked(isGreaterThan as bool)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .isBlocked(isGreaterThanOrEqualTo as bool)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.isBlocked(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.isBlocked(e)),
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
        _$UserModelFieldMap['blockList']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.blockList(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.blockList(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.blockList(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .blockList(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.blockList(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .blockList(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$UserModelPerFieldToJson.blockList([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$UserModelPerFieldToJson.blockList(arrayContainsAny)
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
  UserModelQuery whereFavoriteList({
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
        _$UserModelFieldMap['favoriteList']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.favoriteList(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson
                .favoriteList(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.favoriteList(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .favoriteList(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson
                .favoriteList(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .favoriteList(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$UserModelPerFieldToJson.favoriteList([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$UserModelPerFieldToJson.favoriteList(arrayContainsAny)
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
        _$UserModelFieldMap['id']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.id(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.id(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.id(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.id(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.id(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.id(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.id(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserModelPerFieldToJson.id(e)),
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
        _$UserModelFieldMap['fcmToken']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.fcmToken(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserModelPerFieldToJson.fcmToken(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserModelPerFieldToJson.fcmToken(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserModelPerFieldToJson.fcmToken(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserModelPerFieldToJson.fcmToken(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserModelPerFieldToJson
                .fcmToken(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserModelPerFieldToJson.fcmToken(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserModelPerFieldToJson.fcmToken(e)),
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
        .orderBy(_$UserModelFieldMap['username']!, descending: descending);
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
    final query = $referenceWithoutCursor.orderBy(_$UserModelFieldMap['bio']!,
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
        .orderBy(_$UserModelFieldMap['albumUrl']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserModelFieldMap['profileUrl']!, descending: descending);
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
        .orderBy(_$UserModelFieldMap['birthday']!, descending: descending);
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
    final query = $referenceWithoutCursor.orderBy(_$UserModelFieldMap['age']!,
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
        .orderBy(_$UserModelFieldMap['position']!, descending: descending);
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
    final query = $referenceWithoutCursor.orderBy(_$UserModelFieldMap['dob']!,
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
        .orderBy(_$UserModelFieldMap['height']!, descending: descending);
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
        .orderBy(_$UserModelFieldMap['weight']!, descending: descending);
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
    final query = $referenceWithoutCursor.orderBy(_$UserModelFieldMap['lived']!,
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
    final query = $referenceWithoutCursor.orderBy(_$UserModelFieldMap['role']!,
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
        .orderBy(_$UserModelFieldMap['bodyType']!, descending: descending);
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
        _$UserModelFieldMap['relationshipStatus']!,
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserModelFieldMap['ethnicity']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserModelFieldMap['lookingFor']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserModelFieldMap['whereToMeet']!, descending: descending);
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
        .orderBy(_$UserModelFieldMap['isOnline']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserModelFieldMap['isVerified']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserModelFieldMap['isBlocked']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$UserModelFieldMap['blockList']!, descending: descending);
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
  UserModelQuery orderByFavoriteList({
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
        .orderBy(_$UserModelFieldMap['favoriteList']!, descending: descending);
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
    final query = $referenceWithoutCursor.orderBy(_$UserModelFieldMap['id']!,
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
        .orderBy(_$UserModelFieldMap['fcmToken']!, descending: descending);
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

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
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
      favoriteList: (json['favoriteList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id: json['id'] as String,
      fcmToken: json['fcmToken'] as String,
    );

const _$UserModelFieldMap = <String, String>{
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
  'favoriteList': 'favoriteList',
  'id': 'id',
  'fcmToken': 'fcmToken',
};

// ignore: unused_element
abstract class _$UserModelPerFieldToJson {
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
  static Object? favoriteList(List<String> instance) => instance;
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? fcmToken(String instance) => instance;
}

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
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
      'favoriteList': instance.favoriteList,
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
