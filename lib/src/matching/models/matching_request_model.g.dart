// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_request_model.dart';

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
abstract class MatchingRequestModelCollectionReference
    implements
        MatchingRequestModelQuery,
        FirestoreCollectionReference<MatchingRequestModel,
            MatchingRequestModelQuerySnapshot> {
  factory MatchingRequestModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MatchingRequestModelCollectionReference;

  static MatchingRequestModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return MatchingRequestModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    MatchingRequestModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<MatchingRequestModel> get reference;

  @override
  MatchingRequestModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MatchingRequestModelDocumentReference> add(MatchingRequestModel value);
}

class _$MatchingRequestModelCollectionReference
    extends _$MatchingRequestModelQuery
    implements MatchingRequestModelCollectionReference {
  factory _$MatchingRequestModelCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MatchingRequestModelCollectionReference._(
      firestore.collection('matching-request').withConverter(
            fromFirestore:
                MatchingRequestModelCollectionReference.fromFirestore,
            toFirestore: MatchingRequestModelCollectionReference.toFirestore,
          ),
    );
  }

  _$MatchingRequestModelCollectionReference._(
    CollectionReference<MatchingRequestModel> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<MatchingRequestModel> get reference =>
      super.reference as CollectionReference<MatchingRequestModel>;

  @override
  MatchingRequestModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return MatchingRequestModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MatchingRequestModelDocumentReference> add(
      MatchingRequestModel value) {
    return reference
        .add(value)
        .then((ref) => MatchingRequestModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MatchingRequestModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MatchingRequestModelDocumentReference
    extends FirestoreDocumentReference<MatchingRequestModel,
        MatchingRequestModelDocumentSnapshot> {
  factory MatchingRequestModelDocumentReference(
          DocumentReference<MatchingRequestModel> reference) =
      _$MatchingRequestModelDocumentReference;

  DocumentReference<MatchingRequestModel> get reference;

  /// A reference to the [MatchingRequestModelCollectionReference] containing this document.
  MatchingRequestModelCollectionReference get parent {
    return _$MatchingRequestModelCollectionReference(reference.firestore);
  }

  @override
  Stream<MatchingRequestModelDocumentSnapshot> snapshots();

  @override
  Future<MatchingRequestModelDocumentSnapshot> get([GetOptions? options]);

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
    MatchingRequestModel model, {
    SetOptions? options,
    FieldValue userIdFieldValue,
    FieldValue ageRangeFieldValue,
    FieldValue bodyTypesFieldValue,
    FieldValue positionPreferencesFieldValue,
    FieldValue skillsFieldValue,
    FieldValue activitiesFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue idFieldValue,
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
    MatchingRequestModel model, {
    SetOptions? options,
    FieldValue userIdFieldValue,
    FieldValue ageRangeFieldValue,
    FieldValue bodyTypesFieldValue,
    FieldValue positionPreferencesFieldValue,
    FieldValue skillsFieldValue,
    FieldValue activitiesFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue idFieldValue,
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
    MatchingRequestModel model, {
    SetOptions? options,
    FieldValue userIdFieldValue,
    FieldValue ageRangeFieldValue,
    FieldValue bodyTypesFieldValue,
    FieldValue positionPreferencesFieldValue,
    FieldValue skillsFieldValue,
    FieldValue activitiesFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue idFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String userId,
    FieldValue userIdFieldValue,
    RangeValue ageRange,
    FieldValue ageRangeFieldValue,
    List<String> bodyTypes,
    FieldValue bodyTypesFieldValue,
    List<String> positionPreferences,
    FieldValue positionPreferencesFieldValue,
    List<String> skills,
    FieldValue skillsFieldValue,
    List<String> activities,
    FieldValue activitiesFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    String id,
    FieldValue idFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String userId,
    FieldValue userIdFieldValue,
    RangeValue ageRange,
    FieldValue ageRangeFieldValue,
    List<String> bodyTypes,
    FieldValue bodyTypesFieldValue,
    List<String> positionPreferences,
    FieldValue positionPreferencesFieldValue,
    List<String> skills,
    FieldValue skillsFieldValue,
    List<String> activities,
    FieldValue activitiesFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    String id,
    FieldValue idFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String userId,
    FieldValue userIdFieldValue,
    RangeValue ageRange,
    FieldValue ageRangeFieldValue,
    List<String> bodyTypes,
    FieldValue bodyTypesFieldValue,
    List<String> positionPreferences,
    FieldValue positionPreferencesFieldValue,
    List<String> skills,
    FieldValue skillsFieldValue,
    List<String> activities,
    FieldValue activitiesFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    String id,
    FieldValue idFieldValue,
  });
}

class _$MatchingRequestModelDocumentReference
    extends FirestoreDocumentReference<MatchingRequestModel,
        MatchingRequestModelDocumentSnapshot>
    implements MatchingRequestModelDocumentReference {
  _$MatchingRequestModelDocumentReference(this.reference);

  @override
  final DocumentReference<MatchingRequestModel> reference;

  /// A reference to the [MatchingRequestModelCollectionReference] containing this document.
  MatchingRequestModelCollectionReference get parent {
    return _$MatchingRequestModelCollectionReference(reference.firestore);
  }

  @override
  Stream<MatchingRequestModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map(MatchingRequestModelDocumentSnapshot._);
  }

  @override
  Future<MatchingRequestModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(MatchingRequestModelDocumentSnapshot._);
  }

  @override
  Future<MatchingRequestModelDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction
        .get(reference)
        .then(MatchingRequestModelDocumentSnapshot._);
  }

  Future<void> set(
    MatchingRequestModel model, {
    SetOptions? options,
    FieldValue? userIdFieldValue,
    FieldValue? ageRangeFieldValue,
    FieldValue? bodyTypesFieldValue,
    FieldValue? positionPreferencesFieldValue,
    FieldValue? skillsFieldValue,
    FieldValue? activitiesFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? idFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (userIdFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['userId']!: userIdFieldValue,
      if (ageRangeFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['ageRange']!: ageRangeFieldValue,
      if (bodyTypesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!: bodyTypesFieldValue,
      if (positionPreferencesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            positionPreferencesFieldValue,
      if (skillsFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['skills']!: skillsFieldValue,
      if (activitiesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            activitiesFieldValue,
      if (createdAtFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['createdAt']!: createdAtFieldValue,
      if (idFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['id']!: idFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    MatchingRequestModel model, {
    SetOptions? options,
    FieldValue? userIdFieldValue,
    FieldValue? ageRangeFieldValue,
    FieldValue? bodyTypesFieldValue,
    FieldValue? positionPreferencesFieldValue,
    FieldValue? skillsFieldValue,
    FieldValue? activitiesFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? idFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (userIdFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['userId']!: userIdFieldValue,
      if (ageRangeFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['ageRange']!: ageRangeFieldValue,
      if (bodyTypesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!: bodyTypesFieldValue,
      if (positionPreferencesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            positionPreferencesFieldValue,
      if (skillsFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['skills']!: skillsFieldValue,
      if (activitiesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            activitiesFieldValue,
      if (createdAtFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['createdAt']!: createdAtFieldValue,
      if (idFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['id']!: idFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    MatchingRequestModel model, {
    SetOptions? options,
    FieldValue? userIdFieldValue,
    FieldValue? ageRangeFieldValue,
    FieldValue? bodyTypesFieldValue,
    FieldValue? positionPreferencesFieldValue,
    FieldValue? skillsFieldValue,
    FieldValue? activitiesFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? idFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (userIdFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['userId']!: userIdFieldValue,
      if (ageRangeFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['ageRange']!: ageRangeFieldValue,
      if (bodyTypesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!: bodyTypesFieldValue,
      if (positionPreferencesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            positionPreferencesFieldValue,
      if (skillsFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['skills']!: skillsFieldValue,
      if (activitiesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            activitiesFieldValue,
      if (createdAtFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['createdAt']!: createdAtFieldValue,
      if (idFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['id']!: idFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? ageRange = _sentinel,
    FieldValue? ageRangeFieldValue,
    Object? bodyTypes = _sentinel,
    FieldValue? bodyTypesFieldValue,
    Object? positionPreferences = _sentinel,
    FieldValue? positionPreferencesFieldValue,
    Object? skills = _sentinel,
    FieldValue? skillsFieldValue,
    Object? activities = _sentinel,
    FieldValue? activitiesFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
  }) async {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      ageRange == _sentinel || ageRangeFieldValue == null,
      "Cannot specify both ageRange and ageRangeFieldValue",
    );
    assert(
      bodyTypes == _sentinel || bodyTypesFieldValue == null,
      "Cannot specify both bodyTypes and bodyTypesFieldValue",
    );
    assert(
      positionPreferences == _sentinel || positionPreferencesFieldValue == null,
      "Cannot specify both positionPreferences and positionPreferencesFieldValue",
    );
    assert(
      skills == _sentinel || skillsFieldValue == null,
      "Cannot specify both skills and skillsFieldValue",
    );
    assert(
      activities == _sentinel || activitiesFieldValue == null,
      "Cannot specify both activities and activitiesFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$$MatchingRequestModelImplFieldMap['userId']!:
            _$$MatchingRequestModelImplPerFieldToJson.userId(userId as String),
      if (userIdFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['userId']!: userIdFieldValue,
      if (ageRange != _sentinel)
        _$$MatchingRequestModelImplFieldMap['ageRange']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(ageRange as RangeValue),
      if (ageRangeFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['ageRange']!: ageRangeFieldValue,
      if (bodyTypes != _sentinel)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(bodyTypes as List<String>),
      if (bodyTypesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!: bodyTypesFieldValue,
      if (positionPreferences != _sentinel)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(positionPreferences as List<String>),
      if (positionPreferencesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            positionPreferencesFieldValue,
      if (skills != _sentinel)
        _$$MatchingRequestModelImplFieldMap['skills']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .skills(skills as List<String>),
      if (skillsFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['skills']!: skillsFieldValue,
      if (activities != _sentinel)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .activities(activities as List<String>),
      if (activitiesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            activitiesFieldValue,
      if (createdAt != _sentinel)
        _$$MatchingRequestModelImplFieldMap['createdAt']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['createdAt']!: createdAtFieldValue,
      if (id != _sentinel)
        _$$MatchingRequestModelImplFieldMap['id']!:
            _$$MatchingRequestModelImplPerFieldToJson.id(id as String),
      if (idFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['id']!: idFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? ageRange = _sentinel,
    FieldValue? ageRangeFieldValue,
    Object? bodyTypes = _sentinel,
    FieldValue? bodyTypesFieldValue,
    Object? positionPreferences = _sentinel,
    FieldValue? positionPreferencesFieldValue,
    Object? skills = _sentinel,
    FieldValue? skillsFieldValue,
    Object? activities = _sentinel,
    FieldValue? activitiesFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
  }) {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      ageRange == _sentinel || ageRangeFieldValue == null,
      "Cannot specify both ageRange and ageRangeFieldValue",
    );
    assert(
      bodyTypes == _sentinel || bodyTypesFieldValue == null,
      "Cannot specify both bodyTypes and bodyTypesFieldValue",
    );
    assert(
      positionPreferences == _sentinel || positionPreferencesFieldValue == null,
      "Cannot specify both positionPreferences and positionPreferencesFieldValue",
    );
    assert(
      skills == _sentinel || skillsFieldValue == null,
      "Cannot specify both skills and skillsFieldValue",
    );
    assert(
      activities == _sentinel || activitiesFieldValue == null,
      "Cannot specify both activities and activitiesFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$$MatchingRequestModelImplFieldMap['userId']!:
            _$$MatchingRequestModelImplPerFieldToJson.userId(userId as String),
      if (userIdFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['userId']!: userIdFieldValue,
      if (ageRange != _sentinel)
        _$$MatchingRequestModelImplFieldMap['ageRange']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(ageRange as RangeValue),
      if (ageRangeFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['ageRange']!: ageRangeFieldValue,
      if (bodyTypes != _sentinel)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(bodyTypes as List<String>),
      if (bodyTypesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!: bodyTypesFieldValue,
      if (positionPreferences != _sentinel)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(positionPreferences as List<String>),
      if (positionPreferencesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            positionPreferencesFieldValue,
      if (skills != _sentinel)
        _$$MatchingRequestModelImplFieldMap['skills']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .skills(skills as List<String>),
      if (skillsFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['skills']!: skillsFieldValue,
      if (activities != _sentinel)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .activities(activities as List<String>),
      if (activitiesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            activitiesFieldValue,
      if (createdAt != _sentinel)
        _$$MatchingRequestModelImplFieldMap['createdAt']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['createdAt']!: createdAtFieldValue,
      if (id != _sentinel)
        _$$MatchingRequestModelImplFieldMap['id']!:
            _$$MatchingRequestModelImplPerFieldToJson.id(id as String),
      if (idFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['id']!: idFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? ageRange = _sentinel,
    FieldValue? ageRangeFieldValue,
    Object? bodyTypes = _sentinel,
    FieldValue? bodyTypesFieldValue,
    Object? positionPreferences = _sentinel,
    FieldValue? positionPreferencesFieldValue,
    Object? skills = _sentinel,
    FieldValue? skillsFieldValue,
    Object? activities = _sentinel,
    FieldValue? activitiesFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
  }) {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      ageRange == _sentinel || ageRangeFieldValue == null,
      "Cannot specify both ageRange and ageRangeFieldValue",
    );
    assert(
      bodyTypes == _sentinel || bodyTypesFieldValue == null,
      "Cannot specify both bodyTypes and bodyTypesFieldValue",
    );
    assert(
      positionPreferences == _sentinel || positionPreferencesFieldValue == null,
      "Cannot specify both positionPreferences and positionPreferencesFieldValue",
    );
    assert(
      skills == _sentinel || skillsFieldValue == null,
      "Cannot specify both skills and skillsFieldValue",
    );
    assert(
      activities == _sentinel || activitiesFieldValue == null,
      "Cannot specify both activities and activitiesFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$$MatchingRequestModelImplFieldMap['userId']!:
            _$$MatchingRequestModelImplPerFieldToJson.userId(userId as String),
      if (userIdFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['userId']!: userIdFieldValue,
      if (ageRange != _sentinel)
        _$$MatchingRequestModelImplFieldMap['ageRange']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(ageRange as RangeValue),
      if (ageRangeFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['ageRange']!: ageRangeFieldValue,
      if (bodyTypes != _sentinel)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(bodyTypes as List<String>),
      if (bodyTypesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!: bodyTypesFieldValue,
      if (positionPreferences != _sentinel)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(positionPreferences as List<String>),
      if (positionPreferencesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!:
            positionPreferencesFieldValue,
      if (skills != _sentinel)
        _$$MatchingRequestModelImplFieldMap['skills']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .skills(skills as List<String>),
      if (skillsFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['skills']!: skillsFieldValue,
      if (activities != _sentinel)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .activities(activities as List<String>),
      if (activitiesFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['activities']!:
            activitiesFieldValue,
      if (createdAt != _sentinel)
        _$$MatchingRequestModelImplFieldMap['createdAt']!:
            _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['createdAt']!: createdAtFieldValue,
      if (id != _sentinel)
        _$$MatchingRequestModelImplFieldMap['id']!:
            _$$MatchingRequestModelImplPerFieldToJson.id(id as String),
      if (idFieldValue != null)
        _$$MatchingRequestModelImplFieldMap['id']!: idFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchingRequestModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class MatchingRequestModelQuery
    implements
        QueryReference<MatchingRequestModel,
            MatchingRequestModelQuerySnapshot> {
  @override
  MatchingRequestModelQuery limit(int limit);

  @override
  MatchingRequestModelQuery limitToLast(int limit);

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
  MatchingRequestModelQuery whereFieldPath(
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

  MatchingRequestModelQuery whereDocumentId({
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

  MatchingRequestModelQuery whereUserId({
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

  MatchingRequestModelQuery whereAgeRange({
    RangeValue? isEqualTo,
    RangeValue? isNotEqualTo,
    RangeValue? isLessThan,
    RangeValue? isLessThanOrEqualTo,
    RangeValue? isGreaterThan,
    RangeValue? isGreaterThanOrEqualTo,
    List<RangeValue>? whereIn,
    List<RangeValue>? whereNotIn,
    bool? isNull,
  });

  MatchingRequestModelQuery whereBodyTypes({
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

  MatchingRequestModelQuery wherePositionPreferences({
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

  MatchingRequestModelQuery whereSkills({
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

  MatchingRequestModelQuery whereActivities({
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

  MatchingRequestModelQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  MatchingRequestModelQuery whereId({
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
  MatchingRequestModelQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderByUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderByAgeRange({
    bool descending = false,
    RangeValue startAt,
    RangeValue startAfter,
    RangeValue endAt,
    RangeValue endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderByBodyTypes({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderByPositionPreferences({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderBySkills({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderByActivities({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderByCreatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });

  MatchingRequestModelQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  });
}

class _$MatchingRequestModelQuery extends QueryReference<MatchingRequestModel,
    MatchingRequestModelQuerySnapshot> implements MatchingRequestModelQuery {
  _$MatchingRequestModelQuery(
    this._collection, {
    required Query<MatchingRequestModel> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<MatchingRequestModelQuerySnapshot> snapshots(
      [SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(MatchingRequestModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<MatchingRequestModelQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(MatchingRequestModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  MatchingRequestModelQuery limit(int limit) {
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery limitToLast(int limit) {
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery whereFieldPath(
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
    return _$MatchingRequestModelQuery(
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
  MatchingRequestModelQuery whereDocumentId({
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
    return _$MatchingRequestModelQuery(
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
  MatchingRequestModelQuery whereUserId({
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
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingRequestModelImplFieldMap['userId']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .userId(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .userId(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .userId(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .userId(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .userId(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .userId(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn
            ?.map((e) => _$$MatchingRequestModelImplPerFieldToJson.userId(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$MatchingRequestModelImplPerFieldToJson.userId(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery whereAgeRange({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<RangeValue>? whereIn,
    List<RangeValue>? whereNotIn,
    bool? isNull,
  }) {
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingRequestModelImplFieldMap['ageRange']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(isEqualTo as RangeValue)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(isNotEqualTo as RangeValue)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(isLessThan as RangeValue)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(isLessThanOrEqualTo as RangeValue)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(isGreaterThan as RangeValue)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .ageRange(isGreaterThanOrEqualTo as RangeValue)
            : null,
        whereIn: whereIn
            ?.map((e) => _$$MatchingRequestModelImplPerFieldToJson.ageRange(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$MatchingRequestModelImplPerFieldToJson.ageRange(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery whereBodyTypes({
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
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$MatchingRequestModelImplPerFieldToJson
                    .bodyTypes([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .bodyTypes(arrayContainsAny) as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery wherePositionPreferences({
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
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$MatchingRequestModelImplPerFieldToJson
                    .positionPreferences([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .positionPreferences(arrayContainsAny) as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery whereSkills({
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
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingRequestModelImplFieldMap['skills']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .skills(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .skills(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .skills(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .skills(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .skills(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .skills(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$MatchingRequestModelImplPerFieldToJson
                    .skills([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$MatchingRequestModelImplPerFieldToJson.skills(arrayContainsAny)
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
  MatchingRequestModelQuery whereActivities({
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
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingRequestModelImplFieldMap['activities']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .activities(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .activities(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .activities(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .activities(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .activities(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .activities(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$MatchingRequestModelImplPerFieldToJson
                    .activities([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .activities(arrayContainsAny) as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery whereCreatedAt({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingRequestModelImplFieldMap['createdAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map(
            (e) => _$$MatchingRequestModelImplPerFieldToJson.createdAt(e)),
        whereNotIn: whereNotIn?.map(
            (e) => _$$MatchingRequestModelImplPerFieldToJson.createdAt(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery whereId({
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
    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingRequestModelImplFieldMap['id']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson.id(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingRequestModelImplPerFieldToJson
                .id(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson.id(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .id(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .id(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingRequestModelImplPerFieldToJson
                .id(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn
            ?.map((e) => _$$MatchingRequestModelImplPerFieldToJson.id(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$MatchingRequestModelImplPerFieldToJson.id(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingRequestModelImplFieldMap['userId']!,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderByAgeRange({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingRequestModelImplFieldMap['ageRange']!,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderByBodyTypes({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingRequestModelImplFieldMap['bodyTypes']!,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderByPositionPreferences({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingRequestModelImplFieldMap['positionPreferences']!,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderBySkills({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingRequestModelImplFieldMap['skills']!,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderByActivities({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingRequestModelImplFieldMap['activities']!,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingRequestModelImplFieldMap['createdAt']!,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingRequestModelQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingRequestModelDocumentSnapshot? startAtDocument,
    MatchingRequestModelDocumentSnapshot? endAtDocument,
    MatchingRequestModelDocumentSnapshot? endBeforeDocument,
    MatchingRequestModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingRequestModelImplFieldMap['id']!,
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

    return _$MatchingRequestModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$MatchingRequestModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MatchingRequestModelDocumentSnapshot
    extends FirestoreDocumentSnapshot<MatchingRequestModel> {
  MatchingRequestModelDocumentSnapshot._(this.snapshot)
      : data = snapshot.data();

  @override
  final DocumentSnapshot<MatchingRequestModel> snapshot;

  @override
  MatchingRequestModelDocumentReference get reference {
    return MatchingRequestModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final MatchingRequestModel? data;
}

class MatchingRequestModelQuerySnapshot extends FirestoreQuerySnapshot<
    MatchingRequestModel, MatchingRequestModelQueryDocumentSnapshot> {
  MatchingRequestModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory MatchingRequestModelQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<MatchingRequestModel> snapshot,
  ) {
    final docs =
        snapshot.docs.map(MatchingRequestModelQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        MatchingRequestModelDocumentSnapshot._,
      );
    }).toList();

    return MatchingRequestModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<MatchingRequestModelDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    MatchingRequestModelDocumentSnapshot Function(DocumentSnapshot<T> doc)
        decodeDoc,
  ) {
    return FirestoreDocumentChange<MatchingRequestModelDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<MatchingRequestModel> snapshot;

  @override
  final List<MatchingRequestModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MatchingRequestModelDocumentSnapshot>>
      docChanges;
}

class MatchingRequestModelQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<MatchingRequestModel>
    implements MatchingRequestModelDocumentSnapshot {
  MatchingRequestModelQueryDocumentSnapshot._(this.snapshot)
      : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<MatchingRequestModel> snapshot;

  @override
  final MatchingRequestModel data;

  @override
  MatchingRequestModelDocumentReference get reference {
    return MatchingRequestModelDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchingRequestModelImpl _$$MatchingRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchingRequestModelImpl(
      userId: json['userId'] as String,
      ageRange: RangeValue.fromJson(json['ageRange'] as Map<String, dynamic>),
      bodyTypes:
          (json['bodyTypes'] as List<dynamic>).map((e) => e as String).toList(),
      positionPreferences: (json['positionPreferences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      activities: (json['activities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: const FirestoreDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp),
      id: json['id'] as String,
    );

const _$$MatchingRequestModelImplFieldMap = <String, String>{
  'userId': 'userId',
  'ageRange': 'ageRange',
  'bodyTypes': 'bodyTypes',
  'positionPreferences': 'positionPreferences',
  'skills': 'skills',
  'activities': 'activities',
  'createdAt': 'createdAt',
  'id': 'id',
};

// ignore: unused_element
abstract class _$$MatchingRequestModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? userId(String instance) => instance;
  // ignore: unused_element
  static Object? ageRange(RangeValue instance) => instance.toJson();
  // ignore: unused_element
  static Object? bodyTypes(List<String> instance) => instance;
  // ignore: unused_element
  static Object? positionPreferences(List<String> instance) => instance;
  // ignore: unused_element
  static Object? skills(List<String> instance) => instance;
  // ignore: unused_element
  static Object? activities(List<String> instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? id(String instance) => instance;
}

Map<String, dynamic> _$$MatchingRequestModelImplToJson(
        _$MatchingRequestModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'ageRange': instance.ageRange.toJson(),
      'bodyTypes': instance.bodyTypes,
      'positionPreferences': instance.positionPreferences,
      'skills': instance.skills,
      'activities': instance.activities,
      'createdAt':
          const FirestoreDateTimeConverter().toJson(instance.createdAt),
      'id': instance.id,
    };

_$RangeValueImpl _$$RangeValueImplFromJson(Map<String, dynamic> json) =>
    _$RangeValueImpl(
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
    );

const _$$RangeValueImplFieldMap = <String, String>{
  'start': 'start',
  'end': 'end',
};

// ignore: unused_element
abstract class _$$RangeValueImplPerFieldToJson {
  // ignore: unused_element
  static Object? start(double instance) => instance;
  // ignore: unused_element
  static Object? end(double instance) => instance;
}

Map<String, dynamic> _$$RangeValueImplToJson(_$RangeValueImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchingRequestCollectionHash() =>
    r'c710f154f5c9a52b4faced1e2cfcb49146c9eff2';

/// See also [matchingRequestCollection].
@ProviderFor(matchingRequestCollection)
final matchingRequestCollectionProvider =
    AutoDisposeProvider<MatchingRequestModelCollectionReference>.internal(
  matchingRequestCollection,
  name: r'matchingRequestCollectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$matchingRequestCollectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MatchingRequestCollectionRef
    = AutoDisposeProviderRef<MatchingRequestModelCollectionReference>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
