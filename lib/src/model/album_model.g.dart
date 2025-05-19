// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

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
abstract class AlbumListModelCollectionReference
    implements
        AlbumListModelQuery,
        FirestoreCollectionReference<AlbumListModel,
            AlbumListModelQuerySnapshot> {
  factory AlbumListModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AlbumListModelCollectionReference;

  static AlbumListModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return AlbumListModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    AlbumListModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<AlbumListModel> get reference;

  @override
  AlbumListModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AlbumListModelDocumentReference> add(AlbumListModel value);
}

class _$AlbumListModelCollectionReference extends _$AlbumListModelQuery
    implements AlbumListModelCollectionReference {
  factory _$AlbumListModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AlbumListModelCollectionReference._(
      firestore.collection('allbums').withConverter(
            fromFirestore: AlbumListModelCollectionReference.fromFirestore,
            toFirestore: AlbumListModelCollectionReference.toFirestore,
          ),
    );
  }

  _$AlbumListModelCollectionReference._(
    CollectionReference<AlbumListModel> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<AlbumListModel> get reference =>
      super.reference as CollectionReference<AlbumListModel>;

  @override
  AlbumListModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return AlbumListModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AlbumListModelDocumentReference> add(AlbumListModel value) {
    return reference
        .add(value)
        .then((ref) => AlbumListModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AlbumListModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AlbumListModelDocumentReference
    extends FirestoreDocumentReference<AlbumListModel,
        AlbumListModelDocumentSnapshot> {
  factory AlbumListModelDocumentReference(
          DocumentReference<AlbumListModel> reference) =
      _$AlbumListModelDocumentReference;

  DocumentReference<AlbumListModel> get reference;

  /// A reference to the [AlbumListModelCollectionReference] containing this document.
  AlbumListModelCollectionReference get parent {
    return _$AlbumListModelCollectionReference(reference.firestore);
  }

  @override
  Stream<AlbumListModelDocumentSnapshot> snapshots();

  @override
  Future<AlbumListModelDocumentSnapshot> get([GetOptions? options]);

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
    AlbumListModel model, {
    SetOptions? options,
    FieldValue imageUrlsFieldValue,
    FieldValue nameFieldValue,
    FieldValue userIdFieldValue,
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
    AlbumListModel model, {
    SetOptions? options,
    FieldValue imageUrlsFieldValue,
    FieldValue nameFieldValue,
    FieldValue userIdFieldValue,
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
    AlbumListModel model, {
    SetOptions? options,
    FieldValue imageUrlsFieldValue,
    FieldValue nameFieldValue,
    FieldValue userIdFieldValue,
    FieldValue idFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    List<String> imageUrls,
    FieldValue imageUrlsFieldValue,
    String name,
    FieldValue nameFieldValue,
    String userId,
    FieldValue userIdFieldValue,
    String id,
    FieldValue idFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    List<String> imageUrls,
    FieldValue imageUrlsFieldValue,
    String name,
    FieldValue nameFieldValue,
    String userId,
    FieldValue userIdFieldValue,
    String id,
    FieldValue idFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    List<String> imageUrls,
    FieldValue imageUrlsFieldValue,
    String name,
    FieldValue nameFieldValue,
    String userId,
    FieldValue userIdFieldValue,
    String id,
    FieldValue idFieldValue,
  });
}

class _$AlbumListModelDocumentReference extends FirestoreDocumentReference<
    AlbumListModel,
    AlbumListModelDocumentSnapshot> implements AlbumListModelDocumentReference {
  _$AlbumListModelDocumentReference(this.reference);

  @override
  final DocumentReference<AlbumListModel> reference;

  /// A reference to the [AlbumListModelCollectionReference] containing this document.
  AlbumListModelCollectionReference get parent {
    return _$AlbumListModelCollectionReference(reference.firestore);
  }

  @override
  Stream<AlbumListModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map(AlbumListModelDocumentSnapshot._);
  }

  @override
  Future<AlbumListModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(AlbumListModelDocumentSnapshot._);
  }

  @override
  Future<AlbumListModelDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(AlbumListModelDocumentSnapshot._);
  }

  Future<void> set(
    AlbumListModel model, {
    SetOptions? options,
    FieldValue? imageUrlsFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? userIdFieldValue,
    FieldValue? idFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (imageUrlsFieldValue != null)
        _$AlbumListModelFieldMap['imageUrls']!: imageUrlsFieldValue,
      if (nameFieldValue != null)
        _$AlbumListModelFieldMap['name']!: nameFieldValue,
      if (userIdFieldValue != null)
        _$AlbumListModelFieldMap['userId']!: userIdFieldValue,
      if (idFieldValue != null) _$AlbumListModelFieldMap['id']!: idFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    AlbumListModel model, {
    SetOptions? options,
    FieldValue? imageUrlsFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? userIdFieldValue,
    FieldValue? idFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (imageUrlsFieldValue != null)
        _$AlbumListModelFieldMap['imageUrls']!: imageUrlsFieldValue,
      if (nameFieldValue != null)
        _$AlbumListModelFieldMap['name']!: nameFieldValue,
      if (userIdFieldValue != null)
        _$AlbumListModelFieldMap['userId']!: userIdFieldValue,
      if (idFieldValue != null) _$AlbumListModelFieldMap['id']!: idFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    AlbumListModel model, {
    SetOptions? options,
    FieldValue? imageUrlsFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? userIdFieldValue,
    FieldValue? idFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (imageUrlsFieldValue != null)
        _$AlbumListModelFieldMap['imageUrls']!: imageUrlsFieldValue,
      if (nameFieldValue != null)
        _$AlbumListModelFieldMap['name']!: nameFieldValue,
      if (userIdFieldValue != null)
        _$AlbumListModelFieldMap['userId']!: userIdFieldValue,
      if (idFieldValue != null) _$AlbumListModelFieldMap['id']!: idFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? imageUrls = _sentinel,
    FieldValue? imageUrlsFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
  }) async {
    assert(
      imageUrls == _sentinel || imageUrlsFieldValue == null,
      "Cannot specify both imageUrls and imageUrlsFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    final json = {
      if (imageUrls != _sentinel)
        _$AlbumListModelFieldMap['imageUrls']!:
            _$AlbumListModelPerFieldToJson.imageUrls(imageUrls as List<String>),
      if (imageUrlsFieldValue != null)
        _$AlbumListModelFieldMap['imageUrls']!: imageUrlsFieldValue,
      if (name != _sentinel)
        _$AlbumListModelFieldMap['name']!:
            _$AlbumListModelPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$AlbumListModelFieldMap['name']!: nameFieldValue,
      if (userId != _sentinel)
        _$AlbumListModelFieldMap['userId']!:
            _$AlbumListModelPerFieldToJson.userId(userId as String),
      if (userIdFieldValue != null)
        _$AlbumListModelFieldMap['userId']!: userIdFieldValue,
      if (id != _sentinel)
        _$AlbumListModelFieldMap['id']!:
            _$AlbumListModelPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$AlbumListModelFieldMap['id']!: idFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? imageUrls = _sentinel,
    FieldValue? imageUrlsFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
  }) {
    assert(
      imageUrls == _sentinel || imageUrlsFieldValue == null,
      "Cannot specify both imageUrls and imageUrlsFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    final json = {
      if (imageUrls != _sentinel)
        _$AlbumListModelFieldMap['imageUrls']!:
            _$AlbumListModelPerFieldToJson.imageUrls(imageUrls as List<String>),
      if (imageUrlsFieldValue != null)
        _$AlbumListModelFieldMap['imageUrls']!: imageUrlsFieldValue,
      if (name != _sentinel)
        _$AlbumListModelFieldMap['name']!:
            _$AlbumListModelPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$AlbumListModelFieldMap['name']!: nameFieldValue,
      if (userId != _sentinel)
        _$AlbumListModelFieldMap['userId']!:
            _$AlbumListModelPerFieldToJson.userId(userId as String),
      if (userIdFieldValue != null)
        _$AlbumListModelFieldMap['userId']!: userIdFieldValue,
      if (id != _sentinel)
        _$AlbumListModelFieldMap['id']!:
            _$AlbumListModelPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$AlbumListModelFieldMap['id']!: idFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? imageUrls = _sentinel,
    FieldValue? imageUrlsFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
  }) {
    assert(
      imageUrls == _sentinel || imageUrlsFieldValue == null,
      "Cannot specify both imageUrls and imageUrlsFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    final json = {
      if (imageUrls != _sentinel)
        _$AlbumListModelFieldMap['imageUrls']!:
            _$AlbumListModelPerFieldToJson.imageUrls(imageUrls as List<String>),
      if (imageUrlsFieldValue != null)
        _$AlbumListModelFieldMap['imageUrls']!: imageUrlsFieldValue,
      if (name != _sentinel)
        _$AlbumListModelFieldMap['name']!:
            _$AlbumListModelPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$AlbumListModelFieldMap['name']!: nameFieldValue,
      if (userId != _sentinel)
        _$AlbumListModelFieldMap['userId']!:
            _$AlbumListModelPerFieldToJson.userId(userId as String),
      if (userIdFieldValue != null)
        _$AlbumListModelFieldMap['userId']!: userIdFieldValue,
      if (id != _sentinel)
        _$AlbumListModelFieldMap['id']!:
            _$AlbumListModelPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$AlbumListModelFieldMap['id']!: idFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumListModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class AlbumListModelQuery
    implements QueryReference<AlbumListModel, AlbumListModelQuerySnapshot> {
  @override
  AlbumListModelQuery limit(int limit);

  @override
  AlbumListModelQuery limitToLast(int limit);

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
  AlbumListModelQuery whereFieldPath(
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

  AlbumListModelQuery whereDocumentId({
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

  AlbumListModelQuery whereImageUrls({
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

  AlbumListModelQuery whereName({
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

  AlbumListModelQuery whereUserId({
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

  AlbumListModelQuery whereId({
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
  AlbumListModelQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  });

  AlbumListModelQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  });

  AlbumListModelQuery orderByImageUrls({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  });

  AlbumListModelQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  });

  AlbumListModelQuery orderByUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  });

  AlbumListModelQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  });
}

class _$AlbumListModelQuery
    extends QueryReference<AlbumListModel, AlbumListModelQuerySnapshot>
    implements AlbumListModelQuery {
  _$AlbumListModelQuery(
    this._collection, {
    required Query<AlbumListModel> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<AlbumListModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(AlbumListModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<AlbumListModelQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(AlbumListModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  AlbumListModelQuery limit(int limit) {
    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AlbumListModelQuery limitToLast(int limit) {
    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AlbumListModelQuery whereFieldPath(
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
    return _$AlbumListModelQuery(
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
  AlbumListModelQuery whereDocumentId({
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
    return _$AlbumListModelQuery(
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
  AlbumListModelQuery whereImageUrls({
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
    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AlbumListModelFieldMap['imageUrls']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$AlbumListModelPerFieldToJson
                .imageUrls(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$AlbumListModelPerFieldToJson
                .imageUrls(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$AlbumListModelPerFieldToJson
                .imageUrls(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AlbumListModelPerFieldToJson
                .imageUrls(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AlbumListModelPerFieldToJson
                .imageUrls(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AlbumListModelPerFieldToJson
                .imageUrls(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$AlbumListModelPerFieldToJson
                    .imageUrls([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$AlbumListModelPerFieldToJson.imageUrls(arrayContainsAny)
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
  AlbumListModelQuery whereName({
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
    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AlbumListModelFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$AlbumListModelPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$AlbumListModelPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$AlbumListModelPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AlbumListModelPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AlbumListModelPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AlbumListModelPerFieldToJson
                .name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$AlbumListModelPerFieldToJson.name(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$AlbumListModelPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AlbumListModelQuery whereUserId({
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
    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AlbumListModelFieldMap['userId']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$AlbumListModelPerFieldToJson.userId(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$AlbumListModelPerFieldToJson.userId(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$AlbumListModelPerFieldToJson.userId(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AlbumListModelPerFieldToJson
                .userId(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AlbumListModelPerFieldToJson.userId(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AlbumListModelPerFieldToJson
                .userId(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$AlbumListModelPerFieldToJson.userId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$AlbumListModelPerFieldToJson.userId(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AlbumListModelQuery whereId({
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
    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AlbumListModelFieldMap['id']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$AlbumListModelPerFieldToJson.id(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$AlbumListModelPerFieldToJson.id(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$AlbumListModelPerFieldToJson.id(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AlbumListModelPerFieldToJson.id(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AlbumListModelPerFieldToJson.id(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AlbumListModelPerFieldToJson
                .id(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$AlbumListModelPerFieldToJson.id(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$AlbumListModelPerFieldToJson.id(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AlbumListModelQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
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

    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AlbumListModelQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
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

    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AlbumListModelQuery orderByImageUrls({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$AlbumListModelFieldMap['imageUrls']!,
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

    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AlbumListModelQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AlbumListModelFieldMap['name']!, descending: descending);
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

    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AlbumListModelQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AlbumListModelFieldMap['userId']!, descending: descending);
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

    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AlbumListModelQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AlbumListModelDocumentSnapshot? startAtDocument,
    AlbumListModelDocumentSnapshot? endAtDocument,
    AlbumListModelDocumentSnapshot? endBeforeDocument,
    AlbumListModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AlbumListModelFieldMap['id']!, descending: descending);
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

    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$AlbumListModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AlbumListModelDocumentSnapshot
    extends FirestoreDocumentSnapshot<AlbumListModel> {
  AlbumListModelDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<AlbumListModel> snapshot;

  @override
  AlbumListModelDocumentReference get reference {
    return AlbumListModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AlbumListModel? data;
}

class AlbumListModelQuerySnapshot extends FirestoreQuerySnapshot<AlbumListModel,
    AlbumListModelQueryDocumentSnapshot> {
  AlbumListModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory AlbumListModelQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<AlbumListModel> snapshot,
  ) {
    final docs =
        snapshot.docs.map(AlbumListModelQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        AlbumListModelDocumentSnapshot._,
      );
    }).toList();

    return AlbumListModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<AlbumListModelDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    AlbumListModelDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<AlbumListModelDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<AlbumListModel> snapshot;

  @override
  final List<AlbumListModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AlbumListModelDocumentSnapshot>>
      docChanges;
}

class AlbumListModelQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<AlbumListModel>
    implements AlbumListModelDocumentSnapshot {
  AlbumListModelQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<AlbumListModel> snapshot;

  @override
  final AlbumListModel data;

  @override
  AlbumListModelDocumentReference get reference {
    return AlbumListModelDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlbumListModel _$AlbumListModelFromJson(Map<String, dynamic> json) =>
    _AlbumListModel(
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      userId: json['userId'] as String,
      id: json['id'] as String,
    );

const _$AlbumListModelFieldMap = <String, String>{
  'imageUrls': 'imageUrls',
  'name': 'name',
  'userId': 'userId',
  'id': 'id',
};

// ignore: unused_element
abstract class _$AlbumListModelPerFieldToJson {
  // ignore: unused_element
  static Object? imageUrls(List<String> instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? userId(String instance) => instance;
  // ignore: unused_element
  static Object? id(String instance) => instance;
}

Map<String, dynamic> _$AlbumListModelToJson(_AlbumListModel instance) =>
    <String, dynamic>{
      'imageUrls': instance.imageUrls,
      'name': instance.name,
      'userId': instance.userId,
      'id': instance.id,
    };
