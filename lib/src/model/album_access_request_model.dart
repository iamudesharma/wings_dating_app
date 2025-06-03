import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_access_request_model.freezed.dart';
part 'album_access_request_model.g.dart';

enum AccessRequestStatus { pending, approved, rejected }

@freezed
abstract class AlbumAccessRequestModel with _$AlbumAccessRequestModel {
  @JsonSerializable(
    explicitToJson: true,
    createToJson: true,
    createFieldMap: true,
    createPerFieldToJson: true,
  )
  const factory AlbumAccessRequestModel({
    required String albumId,
    required String requesterId,
    required String message,
    @Default(AccessRequestStatus.pending) AccessRequestStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AlbumAccessRequestModel;

  factory AlbumAccessRequestModel.fromJson(Map<String, dynamic> json) => _$AlbumAccessRequestModelFromJson(json);
}
