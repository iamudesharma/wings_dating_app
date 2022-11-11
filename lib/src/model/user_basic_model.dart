import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_basic_model.g.dart';

part 'user_basic_model.freezed.dart';

@freezed
class UserBasicModel with _$UserBasicModel {
  factory UserBasicModel({
    String? dob,
    String? height,
    String? weight,
    String? lived,
  }) = _UserBasicModel;

  factory UserBasicModel.fromJson(Map<String, Object?> json) =>
      _$UserBasicModelFromJson(json);
}
