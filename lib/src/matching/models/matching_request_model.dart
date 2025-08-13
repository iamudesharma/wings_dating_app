import 'package:freezed_annotation/freezed_annotation.dart';

part 'matching_request_model.freezed.dart';
part 'matching_request_model.g.dart';

@freezed
@JsonSerializable(
  createToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
  explicitToJson: true,
)
abstract class MatchingRequestModel with _$MatchingRequestModel {
  factory MatchingRequestModel({
    required String userId,
    required RangeValue ageRange,
    required List<String> bodyTypes,
    required List<String> positionPreferences,
    required List<String> skills,
    required List<String> activities,
    required DateTime createdAt,
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
@JsonSerializable(
  createToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
  explicitToJson: true,
)
abstract class RangeValue with _$RangeValue {
  factory RangeValue({
    required double start,
    required double end,
  }) = _RangeValue;
  factory RangeValue.fromJson(Map<String, dynamic> json) => _$RangeValueFromJson(json);
}
