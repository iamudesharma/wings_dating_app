// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchingRequestModel _$MatchingRequestModelFromJson(
        Map<String, dynamic> json) =>
    _MatchingRequestModel(
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
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String,
    );

const _$MatchingRequestModelFieldMap = <String, String>{
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
abstract class _$MatchingRequestModelPerFieldToJson {
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
  static Object? createdAt(DateTime instance) => instance.toIso8601String();
  // ignore: unused_element
  static Object? id(String instance) => instance;
}

Map<String, dynamic> _$MatchingRequestModelToJson(
        _MatchingRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'ageRange': instance.ageRange.toJson(),
      'bodyTypes': instance.bodyTypes,
      'positionPreferences': instance.positionPreferences,
      'skills': instance.skills,
      'activities': instance.activities,
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };

_RangeValue _$RangeValueFromJson(Map<String, dynamic> json) => _RangeValue(
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
    );

const _$RangeValueFieldMap = <String, String>{
  'start': 'start',
  'end': 'end',
};

// ignore: unused_element
abstract class _$RangeValuePerFieldToJson {
  // ignore: unused_element
  static Object? start(double instance) => instance;
  // ignore: unused_element
  static Object? end(double instance) => instance;
}

Map<String, dynamic> _$RangeValueToJson(_RangeValue instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
