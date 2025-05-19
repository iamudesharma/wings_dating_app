// import 'package:firestore_modeler/firestore_modeler.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

// part 'matching_model.freezed.dart';
// part 'matching_model.g.dart';

// @Collection<MatchingModel>('matching')
// @freezed

// abstract class MatchingModel with _$MatchingModel {
//   @JsonSerializable(
//     createToJson: true,
//     createFieldMap: true,
//     createPerFieldToJson: true,
//     explicitToJson: true,
//   )
//   factory MatchingModel({
//     @Min(18) required int minAge,
//     required int maxAge,
//     required List<String> skills,
//     required List<String> freeTimeActivities,
//   }) = _MatchingModel;
//   factory MatchingModel.fromJson(Map<String, dynamic> json) => _$MatchingModelFromJson(json);
// }

// import 'package:firestore_modeler/firestore_modeler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'matching_model.g.dart';

@Collection<MatchingModel>('matching')
@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
  // explicitToJson: true,
)
class MatchingModel {
  @Min(18)
  final int minAge;
  final int maxAge;
  final List<String> skills;
  final List<String> freeTimeActivities;

  MatchingModel({
    required this.minAge,
    required this.maxAge,
    required this.skills,
    required this.freeTimeActivities,
  });

  factory MatchingModel.fromJson(Map<String, dynamic> json) => _$MatchingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingModelToJson(this);
}
