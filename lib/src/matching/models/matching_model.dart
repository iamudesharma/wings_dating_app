import 'package:firestore_modeler/firestore_modeler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'matching_model.freezed.dart';
part 'matching_model.g.dart';

@Collection<MatchingModel>('matching')
@freezed
// abstract class MatchingModel with _$MatchingModel {
//   @JsonSerializable(
//     createToJson: true,
//     createFieldMap: true,
//     createPerFieldToJson: true,
//     explicitToJson: true,
//   )
//   factory MatchingModel({
//     required String username,
//     String? bio,
//     List<String>? albumUrl,
//   }) = _MatchingModel;

//   factory MatchingModel.fromJson(Map<String, dynamic> json) => _$$MatchingFromJson(json);
// }

//
// @freezed
abstract class MatchingModel with _$MatchingModel {
  @JsonSerializable(
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
    explicitToJson: true,
  )
  factory MatchingModel({
    @Min(18) required int minAge,
    required int maxAge,
    required List<String> skills,
    required List<String> freeTimeActivities,
  }) = _MatchingModel;
  factory MatchingModel.fromJson(Map<String, dynamic> json) => _$MatchingModelFromJson(json);
}
