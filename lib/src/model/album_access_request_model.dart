import 'package:freezed_annotation/freezed_annotation.dart';
import 'album_model.dart';
import 'user_models.dart';

part 'album_access_request_model.freezed.dart';
part 'album_access_request_model.g.dart';

// Note: Any nested model serialization is handled by their own fromJson/toJson.

enum AccessRequestStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('approved')
  approved,
  @JsonValue('rejected')
  rejected
}

@freezed
@JsonSerializable(
  explicitToJson: true,
)
abstract class AlbumAccessRequestModel with _$AlbumAccessRequestModel {
  const factory AlbumAccessRequestModel({
    String? id,
    required String albumId,
    required String requesterId,
    required String message,
    @Default(AccessRequestStatus.pending) AccessRequestStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? albumOwnerId,
    String? moderatorId,
    DateTime? respondedAt,
    String? rejectionReason,
    UserModel? requester,
    UserModel? albumOwner,
    UserAlbumModel? album,
  }) = _AlbumAccessRequestModel;

  factory AlbumAccessRequestModel.fromJson(Map<String, dynamic> json) => _$AlbumAccessRequestModelFromJson(json);
}

@freezed
@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
)
abstract class AlbumRequestStats with _$AlbumRequestStats {
  const factory AlbumRequestStats({
    required int totalRequests,
    required int pendingRequests,
    required int approvedRequests,
    required int rejectedRequests,
    required int requestsToday,
    required int requestsThisWeek,
    required int requestsThisMonth,
    required double averageResponseTime,
  }) = _AlbumRequestStats;

  factory AlbumRequestStats.fromJson(Map<String, dynamic> json) => _$AlbumRequestStatsFromJson(json);
}
