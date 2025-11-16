// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchingRequestModel _$MatchingRequestModelFromJson(
  Map<String, dynamic> json,
) => MatchingRequestModel(
  userId: json['userId'] as String,
  ageRange: RangeValue.fromJson(json['ageRange'] as Map<String, dynamic>),
  bodyTypes: (json['bodyTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  positionPreferences: (json['positionPreferences'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
  activities: (json['activities'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  id: json['id'] as String,
);

Map<String, dynamic> _$MatchingRequestModelToJson(
  MatchingRequestModel instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'ageRange': instance.ageRange.toJson(),
  'bodyTypes': instance.bodyTypes,
  'positionPreferences': instance.positionPreferences,
  'skills': instance.skills,
  'activities': instance.activities,
  'createdAt': instance.createdAt.toIso8601String(),
  'id': instance.id,
};

RangeValue _$RangeValueFromJson(Map<String, dynamic> json) => RangeValue(
  start: (json['start'] as num).toDouble(),
  end: (json['end'] as num).toDouble(),
);

Map<String, dynamic> _$RangeValueToJson(RangeValue instance) =>
    <String, dynamic>{'start': instance.start, 'end': instance.end};
