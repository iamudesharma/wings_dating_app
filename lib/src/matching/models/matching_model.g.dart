// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchingModel _$MatchingModelFromJson(Map<String, dynamic> json) =>
    MatchingModel(
      minAge: (json['minAge'] as num).toInt(),
      maxAge: (json['maxAge'] as num).toInt(),
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      freeTimeActivities: (json['freeTimeActivities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

const _$MatchingModelFieldMap = <String, String>{
  'minAge': 'minAge',
  'maxAge': 'maxAge',
  'skills': 'skills',
  'freeTimeActivities': 'freeTimeActivities',
};

// ignore: unused_element
abstract class _$MatchingModelPerFieldToJson {
  // ignore: unused_element
  static Object? minAge(int instance) => instance;
  // ignore: unused_element
  static Object? maxAge(int instance) => instance;
  // ignore: unused_element
  static Object? skills(List<String> instance) => instance;
  // ignore: unused_element
  static Object? freeTimeActivities(List<String> instance) => instance;
}

Map<String, dynamic> _$MatchingModelToJson(MatchingModel instance) =>
    <String, dynamic>{
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'skills': instance.skills,
      'freeTimeActivities': instance.freeTimeActivities,
    };
