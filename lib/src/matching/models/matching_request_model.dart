import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firestore_modeler/firestore_modeler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'matching_request_model.freezed.dart';
part 'matching_request_model.g.dart';

@Collection<MatchingRequestModel>('matching-request')
@freezed
abstract class MatchingRequestModel with _$MatchingRequestModel {
  @JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true,
  )
  factory MatchingRequestModel({
    required String userId,
    required RangeValue ageRange,
    required List<String> bodyTypes,
    required List<String> positionPreferences,
    required List<String> skills,
    required List<String> activities,
    @FirestoreDateTimeConverter() required DateTime createdAt,
    required String id,
  }) = _MatchingRequestModel;
  factory MatchingRequestModel.fromJson(Map<String, dynamic> json) => _$MatchingRequestModelFromJson(json);
}

// class RangeValues {
//   final double start;
//   final double end;

//   RangeValues(this.start, this.end);

// }

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'matching_request_model.freezed.dart';

@freezed
abstract class RangeValue with _$RangeValue {
  @JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true,
  )
  factory RangeValue({
    required double start,
    required double end,
  }) = _RangeValue;
  factory RangeValue.fromJson(Map<String, dynamic> json) => _$RangeValueFromJson(json);
}

final _matchingRequestCollection = MatchingRequestModelCollectionReference();

@riverpod
MatchingRequestModelCollectionReference matchingRequestCollection(Ref ref) {
  return _matchingRequestCollection;
}
