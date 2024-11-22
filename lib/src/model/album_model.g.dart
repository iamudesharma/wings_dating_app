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
    FieldValue albumsFieldValue,
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
    FieldValue albumsFieldValue,
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
    FieldValue albumsFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    List<AlbumModel> albums,
    FieldValue albumsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    List<AlbumModel> albums,
    FieldValue albumsFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    List<AlbumModel> albums,
    FieldValue albumsFieldValue,
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
    FieldValue? albumsFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (albumsFieldValue != null)
        _$$AlbumListModelImplFieldMap['albums']!: albumsFieldValue,
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
    FieldValue? albumsFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (albumsFieldValue != null)
        _$$AlbumListModelImplFieldMap['albums']!: albumsFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    AlbumListModel model, {
    SetOptions? options,
    FieldValue? albumsFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (albumsFieldValue != null)
        _$$AlbumListModelImplFieldMap['albums']!: albumsFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? albums = _sentinel,
    FieldValue? albumsFieldValue,
  }) async {
    assert(
      albums == _sentinel || albumsFieldValue == null,
      "Cannot specify both albums and albumsFieldValue",
    );
    final json = {
      if (albums != _sentinel)
        _$$AlbumListModelImplFieldMap['albums']!:
            _$$AlbumListModelImplPerFieldToJson
                .albums(albums as List<AlbumModel>),
      if (albumsFieldValue != null)
        _$$AlbumListModelImplFieldMap['albums']!: albumsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? albums = _sentinel,
    FieldValue? albumsFieldValue,
  }) {
    assert(
      albums == _sentinel || albumsFieldValue == null,
      "Cannot specify both albums and albumsFieldValue",
    );
    final json = {
      if (albums != _sentinel)
        _$$AlbumListModelImplFieldMap['albums']!:
            _$$AlbumListModelImplPerFieldToJson
                .albums(albums as List<AlbumModel>),
      if (albumsFieldValue != null)
        _$$AlbumListModelImplFieldMap['albums']!: albumsFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? albums = _sentinel,
    FieldValue? albumsFieldValue,
  }) {
    assert(
      albums == _sentinel || albumsFieldValue == null,
      "Cannot specify both albums and albumsFieldValue",
    );
    final json = {
      if (albums != _sentinel)
        _$$AlbumListModelImplFieldMap['albums']!:
            _$$AlbumListModelImplPerFieldToJson
                .albums(albums as List<AlbumModel>),
      if (albumsFieldValue != null)
        _$$AlbumListModelImplFieldMap['albums']!: albumsFieldValue,
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

  AlbumListModelQuery whereAlbums({
    List<AlbumModel>? isEqualTo,
    List<AlbumModel>? isNotEqualTo,
    List<AlbumModel>? isLessThan,
    List<AlbumModel>? isLessThanOrEqualTo,
    List<AlbumModel>? isGreaterThan,
    List<AlbumModel>? isGreaterThanOrEqualTo,
    AlbumModel? arrayContains,
    List<AlbumModel>? arrayContainsAny,
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

  AlbumListModelQuery orderByAlbums({
    bool descending = false,
    List<AlbumModel> startAt,
    List<AlbumModel> startAfter,
    List<AlbumModel> endAt,
    List<AlbumModel> endBefore,
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
  AlbumListModelQuery whereAlbums({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<AlbumModel>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$AlbumListModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$AlbumListModelImplFieldMap['albums']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$AlbumListModelImplPerFieldToJson
                .albums(isEqualTo as List<AlbumModel>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$AlbumListModelImplPerFieldToJson
                .albums(isNotEqualTo as List<AlbumModel>)
            : null,
        isLessThan: isLessThan != null
            ? _$$AlbumListModelImplPerFieldToJson
                .albums(isLessThan as List<AlbumModel>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$AlbumListModelImplPerFieldToJson
                .albums(isLessThanOrEqualTo as List<AlbumModel>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$AlbumListModelImplPerFieldToJson
                .albums(isGreaterThan as List<AlbumModel>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$AlbumListModelImplPerFieldToJson
                .albums(isGreaterThanOrEqualTo as List<AlbumModel>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$AlbumListModelImplPerFieldToJson
                    .albums([arrayContains as AlbumModel]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$AlbumListModelImplPerFieldToJson.albums(arrayContainsAny)
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
  AlbumListModelQuery orderByAlbums({
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
        _$$AlbumListModelImplFieldMap['albums']!,
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

_$AlbumListModelImpl _$$AlbumListModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumListModelImpl(
      albums: (json['albums'] as List<dynamic>)
          .map((e) => AlbumModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$$AlbumListModelImplFieldMap = <String, String>{
  'albums': 'albums',
};

// ignore: unused_element
abstract class _$$AlbumListModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? albums(List<AlbumModel> instance) =>
      instance.map((e) => e.toJson()).toList();
}

Map<String, dynamic> _$$AlbumListModelImplToJson(
        _$AlbumListModelImpl instance) =>
    <String, dynamic>{
      'albums': instance.albums.map((e) => e.toJson()).toList(),
    };

_$AlbumModelImpl _$$AlbumModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumModelImpl(
      id: json['id'] as String,
      path: json['path'] as String,
    );

const _$$AlbumModelImplFieldMap = <String, String>{
  'id': 'id',
  'path': 'path',
};

// ignore: unused_element
abstract class _$$AlbumModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? path(String instance) => instance;
}

Map<String, dynamic> _$$AlbumModelImplToJson(_$AlbumModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };
