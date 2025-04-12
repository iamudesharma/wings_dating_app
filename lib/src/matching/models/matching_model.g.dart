// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_model.dart';

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
abstract class MatchingModelCollectionReference
    implements
        MatchingModelQuery,
        FirestoreCollectionReference<MatchingModel,
            MatchingModelQuerySnapshot> {
  factory MatchingModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MatchingModelCollectionReference;

  static MatchingModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return MatchingModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    MatchingModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<MatchingModel> get reference;

  @override
  MatchingModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MatchingModelDocumentReference> add(MatchingModel value);
}

class _$MatchingModelCollectionReference extends _$MatchingModelQuery
    implements MatchingModelCollectionReference {
  factory _$MatchingModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MatchingModelCollectionReference._(
      firestore.collection('matching').withConverter(
            fromFirestore: MatchingModelCollectionReference.fromFirestore,
            toFirestore: MatchingModelCollectionReference.toFirestore,
          ),
    );
  }

  _$MatchingModelCollectionReference._(
    CollectionReference<MatchingModel> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<MatchingModel> get reference =>
      super.reference as CollectionReference<MatchingModel>;

  @override
  MatchingModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return MatchingModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MatchingModelDocumentReference> add(MatchingModel value) {
    return reference
        .add(value)
        .then((ref) => MatchingModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MatchingModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MatchingModelDocumentReference
    extends FirestoreDocumentReference<MatchingModel,
        MatchingModelDocumentSnapshot> {
  factory MatchingModelDocumentReference(
          DocumentReference<MatchingModel> reference) =
      _$MatchingModelDocumentReference;

  DocumentReference<MatchingModel> get reference;

  /// A reference to the [MatchingModelCollectionReference] containing this document.
  MatchingModelCollectionReference get parent {
    return _$MatchingModelCollectionReference(reference.firestore);
  }

  @override
  Stream<MatchingModelDocumentSnapshot> snapshots();

  @override
  Future<MatchingModelDocumentSnapshot> get([GetOptions? options]);

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
    MatchingModel model, {
    SetOptions? options,
    FieldValue minAgeFieldValue,
    FieldValue maxAgeFieldValue,
    FieldValue skillsFieldValue,
    FieldValue freeTimeActivitiesFieldValue,
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
    MatchingModel model, {
    SetOptions? options,
    FieldValue minAgeFieldValue,
    FieldValue maxAgeFieldValue,
    FieldValue skillsFieldValue,
    FieldValue freeTimeActivitiesFieldValue,
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
    MatchingModel model, {
    SetOptions? options,
    FieldValue minAgeFieldValue,
    FieldValue maxAgeFieldValue,
    FieldValue skillsFieldValue,
    FieldValue freeTimeActivitiesFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    int minAge,
    FieldValue minAgeFieldValue,
    int maxAge,
    FieldValue maxAgeFieldValue,
    List<String> skills,
    FieldValue skillsFieldValue,
    List<String> freeTimeActivities,
    FieldValue freeTimeActivitiesFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    int minAge,
    FieldValue minAgeFieldValue,
    int maxAge,
    FieldValue maxAgeFieldValue,
    List<String> skills,
    FieldValue skillsFieldValue,
    List<String> freeTimeActivities,
    FieldValue freeTimeActivitiesFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    int minAge,
    FieldValue minAgeFieldValue,
    int maxAge,
    FieldValue maxAgeFieldValue,
    List<String> skills,
    FieldValue skillsFieldValue,
    List<String> freeTimeActivities,
    FieldValue freeTimeActivitiesFieldValue,
  });
}

class _$MatchingModelDocumentReference extends FirestoreDocumentReference<
    MatchingModel,
    MatchingModelDocumentSnapshot> implements MatchingModelDocumentReference {
  _$MatchingModelDocumentReference(this.reference);

  @override
  final DocumentReference<MatchingModel> reference;

  /// A reference to the [MatchingModelCollectionReference] containing this document.
  MatchingModelCollectionReference get parent {
    return _$MatchingModelCollectionReference(reference.firestore);
  }

  @override
  Stream<MatchingModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map(MatchingModelDocumentSnapshot._);
  }

  @override
  Future<MatchingModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(MatchingModelDocumentSnapshot._);
  }

  @override
  Future<MatchingModelDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(MatchingModelDocumentSnapshot._);
  }

  Future<void> set(
    MatchingModel model, {
    SetOptions? options,
    FieldValue? minAgeFieldValue,
    FieldValue? maxAgeFieldValue,
    FieldValue? skillsFieldValue,
    FieldValue? freeTimeActivitiesFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (minAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['minAge']!: minAgeFieldValue,
      if (maxAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['maxAge']!: maxAgeFieldValue,
      if (skillsFieldValue != null)
        _$$MatchingModelImplFieldMap['skills']!: skillsFieldValue,
      if (freeTimeActivitiesFieldValue != null)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            freeTimeActivitiesFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    MatchingModel model, {
    SetOptions? options,
    FieldValue? minAgeFieldValue,
    FieldValue? maxAgeFieldValue,
    FieldValue? skillsFieldValue,
    FieldValue? freeTimeActivitiesFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (minAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['minAge']!: minAgeFieldValue,
      if (maxAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['maxAge']!: maxAgeFieldValue,
      if (skillsFieldValue != null)
        _$$MatchingModelImplFieldMap['skills']!: skillsFieldValue,
      if (freeTimeActivitiesFieldValue != null)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            freeTimeActivitiesFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    MatchingModel model, {
    SetOptions? options,
    FieldValue? minAgeFieldValue,
    FieldValue? maxAgeFieldValue,
    FieldValue? skillsFieldValue,
    FieldValue? freeTimeActivitiesFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (minAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['minAge']!: minAgeFieldValue,
      if (maxAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['maxAge']!: maxAgeFieldValue,
      if (skillsFieldValue != null)
        _$$MatchingModelImplFieldMap['skills']!: skillsFieldValue,
      if (freeTimeActivitiesFieldValue != null)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            freeTimeActivitiesFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? minAge = _sentinel,
    FieldValue? minAgeFieldValue,
    Object? maxAge = _sentinel,
    FieldValue? maxAgeFieldValue,
    Object? skills = _sentinel,
    FieldValue? skillsFieldValue,
    Object? freeTimeActivities = _sentinel,
    FieldValue? freeTimeActivitiesFieldValue,
  }) async {
    assert(
      minAge == _sentinel || minAgeFieldValue == null,
      "Cannot specify both minAge and minAgeFieldValue",
    );
    assert(
      maxAge == _sentinel || maxAgeFieldValue == null,
      "Cannot specify both maxAge and maxAgeFieldValue",
    );
    assert(
      skills == _sentinel || skillsFieldValue == null,
      "Cannot specify both skills and skillsFieldValue",
    );
    assert(
      freeTimeActivities == _sentinel || freeTimeActivitiesFieldValue == null,
      "Cannot specify both freeTimeActivities and freeTimeActivitiesFieldValue",
    );
    final json = {
      if (minAge != _sentinel)
        _$$MatchingModelImplFieldMap['minAge']!:
            _$$MatchingModelImplPerFieldToJson.minAge(minAge as int),
      if (minAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['minAge']!: minAgeFieldValue,
      if (maxAge != _sentinel)
        _$$MatchingModelImplFieldMap['maxAge']!:
            _$$MatchingModelImplPerFieldToJson.maxAge(maxAge as int),
      if (maxAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['maxAge']!: maxAgeFieldValue,
      if (skills != _sentinel)
        _$$MatchingModelImplFieldMap['skills']!:
            _$$MatchingModelImplPerFieldToJson.skills(skills as List<String>),
      if (skillsFieldValue != null)
        _$$MatchingModelImplFieldMap['skills']!: skillsFieldValue,
      if (freeTimeActivities != _sentinel)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(freeTimeActivities as List<String>),
      if (freeTimeActivitiesFieldValue != null)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            freeTimeActivitiesFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? minAge = _sentinel,
    FieldValue? minAgeFieldValue,
    Object? maxAge = _sentinel,
    FieldValue? maxAgeFieldValue,
    Object? skills = _sentinel,
    FieldValue? skillsFieldValue,
    Object? freeTimeActivities = _sentinel,
    FieldValue? freeTimeActivitiesFieldValue,
  }) {
    assert(
      minAge == _sentinel || minAgeFieldValue == null,
      "Cannot specify both minAge and minAgeFieldValue",
    );
    assert(
      maxAge == _sentinel || maxAgeFieldValue == null,
      "Cannot specify both maxAge and maxAgeFieldValue",
    );
    assert(
      skills == _sentinel || skillsFieldValue == null,
      "Cannot specify both skills and skillsFieldValue",
    );
    assert(
      freeTimeActivities == _sentinel || freeTimeActivitiesFieldValue == null,
      "Cannot specify both freeTimeActivities and freeTimeActivitiesFieldValue",
    );
    final json = {
      if (minAge != _sentinel)
        _$$MatchingModelImplFieldMap['minAge']!:
            _$$MatchingModelImplPerFieldToJson.minAge(minAge as int),
      if (minAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['minAge']!: minAgeFieldValue,
      if (maxAge != _sentinel)
        _$$MatchingModelImplFieldMap['maxAge']!:
            _$$MatchingModelImplPerFieldToJson.maxAge(maxAge as int),
      if (maxAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['maxAge']!: maxAgeFieldValue,
      if (skills != _sentinel)
        _$$MatchingModelImplFieldMap['skills']!:
            _$$MatchingModelImplPerFieldToJson.skills(skills as List<String>),
      if (skillsFieldValue != null)
        _$$MatchingModelImplFieldMap['skills']!: skillsFieldValue,
      if (freeTimeActivities != _sentinel)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(freeTimeActivities as List<String>),
      if (freeTimeActivitiesFieldValue != null)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            freeTimeActivitiesFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? minAge = _sentinel,
    FieldValue? minAgeFieldValue,
    Object? maxAge = _sentinel,
    FieldValue? maxAgeFieldValue,
    Object? skills = _sentinel,
    FieldValue? skillsFieldValue,
    Object? freeTimeActivities = _sentinel,
    FieldValue? freeTimeActivitiesFieldValue,
  }) {
    assert(
      minAge == _sentinel || minAgeFieldValue == null,
      "Cannot specify both minAge and minAgeFieldValue",
    );
    assert(
      maxAge == _sentinel || maxAgeFieldValue == null,
      "Cannot specify both maxAge and maxAgeFieldValue",
    );
    assert(
      skills == _sentinel || skillsFieldValue == null,
      "Cannot specify both skills and skillsFieldValue",
    );
    assert(
      freeTimeActivities == _sentinel || freeTimeActivitiesFieldValue == null,
      "Cannot specify both freeTimeActivities and freeTimeActivitiesFieldValue",
    );
    final json = {
      if (minAge != _sentinel)
        _$$MatchingModelImplFieldMap['minAge']!:
            _$$MatchingModelImplPerFieldToJson.minAge(minAge as int),
      if (minAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['minAge']!: minAgeFieldValue,
      if (maxAge != _sentinel)
        _$$MatchingModelImplFieldMap['maxAge']!:
            _$$MatchingModelImplPerFieldToJson.maxAge(maxAge as int),
      if (maxAgeFieldValue != null)
        _$$MatchingModelImplFieldMap['maxAge']!: maxAgeFieldValue,
      if (skills != _sentinel)
        _$$MatchingModelImplFieldMap['skills']!:
            _$$MatchingModelImplPerFieldToJson.skills(skills as List<String>),
      if (skillsFieldValue != null)
        _$$MatchingModelImplFieldMap['skills']!: skillsFieldValue,
      if (freeTimeActivities != _sentinel)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(freeTimeActivities as List<String>),
      if (freeTimeActivitiesFieldValue != null)
        _$$MatchingModelImplFieldMap['freeTimeActivities']!:
            freeTimeActivitiesFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchingModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class MatchingModelQuery
    implements QueryReference<MatchingModel, MatchingModelQuerySnapshot> {
  @override
  MatchingModelQuery limit(int limit);

  @override
  MatchingModelQuery limitToLast(int limit);

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
  MatchingModelQuery whereFieldPath(
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

  MatchingModelQuery whereDocumentId({
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

  MatchingModelQuery whereMinAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  MatchingModelQuery whereMaxAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  MatchingModelQuery whereSkills({
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

  MatchingModelQuery whereFreeTimeActivities({
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
  MatchingModelQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  });

  MatchingModelQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  });

  MatchingModelQuery orderByMinAge({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  });

  MatchingModelQuery orderByMaxAge({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  });

  MatchingModelQuery orderBySkills({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  });

  MatchingModelQuery orderByFreeTimeActivities({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  });
}

class _$MatchingModelQuery
    extends QueryReference<MatchingModel, MatchingModelQuerySnapshot>
    implements MatchingModelQuery {
  _$MatchingModelQuery(
    this._collection, {
    required Query<MatchingModel> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<MatchingModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(MatchingModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<MatchingModelQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(MatchingModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  MatchingModelQuery limit(int limit) {
    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingModelQuery limitToLast(int limit) {
    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingModelQuery whereFieldPath(
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
    return _$MatchingModelQuery(
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
  MatchingModelQuery whereDocumentId({
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
    return _$MatchingModelQuery(
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
  MatchingModelQuery whereMinAge({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingModelImplFieldMap['minAge']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingModelImplPerFieldToJson.minAge(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingModelImplPerFieldToJson.minAge(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingModelImplPerFieldToJson.minAge(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingModelImplPerFieldToJson
                .minAge(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingModelImplPerFieldToJson.minAge(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingModelImplPerFieldToJson
                .minAge(isGreaterThanOrEqualTo as int)
            : null,
        whereIn:
            whereIn?.map((e) => _$$MatchingModelImplPerFieldToJson.minAge(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$MatchingModelImplPerFieldToJson.minAge(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingModelQuery whereMaxAge({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingModelImplFieldMap['maxAge']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingModelImplPerFieldToJson.maxAge(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingModelImplPerFieldToJson.maxAge(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingModelImplPerFieldToJson.maxAge(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingModelImplPerFieldToJson
                .maxAge(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingModelImplPerFieldToJson.maxAge(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingModelImplPerFieldToJson
                .maxAge(isGreaterThanOrEqualTo as int)
            : null,
        whereIn:
            whereIn?.map((e) => _$$MatchingModelImplPerFieldToJson.maxAge(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$MatchingModelImplPerFieldToJson.maxAge(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingModelQuery whereSkills({
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
    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingModelImplFieldMap['skills']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingModelImplPerFieldToJson
                .skills(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingModelImplPerFieldToJson
                .skills(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingModelImplPerFieldToJson
                .skills(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingModelImplPerFieldToJson
                .skills(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingModelImplPerFieldToJson
                .skills(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingModelImplPerFieldToJson
                .skills(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$MatchingModelImplPerFieldToJson
                    .skills([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$MatchingModelImplPerFieldToJson.skills(arrayContainsAny)
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
  MatchingModelQuery whereFreeTimeActivities({
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
    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$MatchingModelImplFieldMap['freeTimeActivities']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$MatchingModelImplPerFieldToJson
                    .freeTimeActivities([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$MatchingModelImplPerFieldToJson
                .freeTimeActivities(arrayContainsAny) as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MatchingModelQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
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

    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingModelQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
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

    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingModelQuery orderByMinAge({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingModelImplFieldMap['minAge']!,
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

    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingModelQuery orderByMaxAge({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingModelImplFieldMap['maxAge']!,
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

    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingModelQuery orderBySkills({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingModelImplFieldMap['skills']!,
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

    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  MatchingModelQuery orderByFreeTimeActivities({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MatchingModelDocumentSnapshot? startAtDocument,
    MatchingModelDocumentSnapshot? endAtDocument,
    MatchingModelDocumentSnapshot? endBeforeDocument,
    MatchingModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$MatchingModelImplFieldMap['freeTimeActivities']!,
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

    return _$MatchingModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$MatchingModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MatchingModelDocumentSnapshot
    extends FirestoreDocumentSnapshot<MatchingModel> {
  MatchingModelDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<MatchingModel> snapshot;

  @override
  MatchingModelDocumentReference get reference {
    return MatchingModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final MatchingModel? data;
}

class MatchingModelQuerySnapshot extends FirestoreQuerySnapshot<MatchingModel,
    MatchingModelQueryDocumentSnapshot> {
  MatchingModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory MatchingModelQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<MatchingModel> snapshot,
  ) {
    final docs =
        snapshot.docs.map(MatchingModelQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        MatchingModelDocumentSnapshot._,
      );
    }).toList();

    return MatchingModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<MatchingModelDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    MatchingModelDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<MatchingModelDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<MatchingModel> snapshot;

  @override
  final List<MatchingModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MatchingModelDocumentSnapshot>> docChanges;
}

class MatchingModelQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<MatchingModel>
    implements MatchingModelDocumentSnapshot {
  MatchingModelQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<MatchingModel> snapshot;

  @override
  final MatchingModel data;

  @override
  MatchingModelDocumentReference get reference {
    return MatchingModelDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

void _$assert_$MatchingModelImpl(_$MatchingModelImpl instance) {
  const Min(18).validate(instance.minAge, 'minAge');
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchingModelImpl _$$MatchingModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchingModelImpl(
      minAge: (json['minAge'] as num).toInt(),
      maxAge: (json['maxAge'] as num).toInt(),
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      freeTimeActivities: (json['freeTimeActivities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

const _$$MatchingModelImplFieldMap = <String, String>{
  'minAge': 'minAge',
  'maxAge': 'maxAge',
  'skills': 'skills',
  'freeTimeActivities': 'freeTimeActivities',
};

// ignore: unused_element
abstract class _$$MatchingModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? minAge(int instance) => instance;
  // ignore: unused_element
  static Object? maxAge(int instance) => instance;
  // ignore: unused_element
  static Object? skills(List<String> instance) => instance;
  // ignore: unused_element
  static Object? freeTimeActivities(List<String> instance) => instance;
}

Map<String, dynamic> _$$MatchingModelImplToJson(_$MatchingModelImpl instance) =>
    <String, dynamic>{
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'skills': instance.skills,
      'freeTimeActivities': instance.freeTimeActivities,
    };
