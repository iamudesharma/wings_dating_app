
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'matching_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
  // explicitToJson: true,
)
class MatchingModel {
 
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
