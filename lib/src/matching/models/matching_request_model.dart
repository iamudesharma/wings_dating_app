import 'package:json_annotation/json_annotation.dart';

part 'matching_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchingRequestModel {
  const MatchingRequestModel({
    required this.userId,
    required this.ageRange,
    required this.bodyTypes,
    required this.positionPreferences,
    required this.skills,
    required this.activities,
    required this.createdAt,
    required this.id,
  });

  final String userId;
  final RangeValue ageRange;
  final List<String> bodyTypes;
  final List<String> positionPreferences;
  final List<String> skills;
  final List<String> activities;
  final DateTime createdAt;
  final String id;

  factory MatchingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MatchingRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingRequestModelToJson(this);

  MatchingRequestModel copyWith({
    String? userId,
    RangeValue? ageRange,
    List<String>? bodyTypes,
    List<String>? positionPreferences,
    List<String>? skills,
    List<String>? activities,
    DateTime? createdAt,
    String? id,
  }) =>
      MatchingRequestModel(
        userId: userId ?? this.userId,
        ageRange: ageRange ?? this.ageRange,
        bodyTypes: bodyTypes ?? this.bodyTypes,
        positionPreferences: positionPreferences ?? this.positionPreferences,
        skills: skills ?? this.skills,
        activities: activities ?? this.activities,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );
}

// class RangeValues {
//   final double start;
//   final double end;

//   RangeValues(this.start, this.end);

// }

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'matching_request_model.freezed.dart';

@JsonSerializable()
class RangeValue {
  const RangeValue({
    required this.start,
    required this.end,
  });

  final double start;
  final double end;

  factory RangeValue.fromJson(Map<String, dynamic> json) =>
      _$RangeValueFromJson(json);

  Map<String, dynamic> toJson() => _$RangeValueToJson(this);

  RangeValue copyWith({
    double? start,
    double? end,
  }) =>
      RangeValue(
        start: start ?? this.start,
        end: end ?? this.end,
      );
}
