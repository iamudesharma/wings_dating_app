import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'album_model.dart';
import 'user_models.dart';
part 'album_access_request_model.g.dart';
part 'album_access_request_model.freezed.dart';
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
@JsonSerializable(explicitToJson: true)
class AlbumAccessRequestModel with _$AlbumAccessRequestModel {
  const AlbumAccessRequestModel({
    this.id,
    required this.albumId,
    required this.requesterId,
    required this.message,
    this.status = AccessRequestStatus.pending,
    required this.createdAt,
    required this.updatedAt,
    this.albumOwnerId,
    this.moderatorId,
    this.respondedAt,
    this.rejectionReason,
    this.requester,
    this.albumOwner,
    this.album,
  });

  @override
  final String? id;
  @override
  final String albumId;
  @override
  final String requesterId;
  @override
  final String message;
  @override
  final AccessRequestStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? albumOwnerId;
  @override
  final String? moderatorId;
  @override
  final DateTime? respondedAt;
  @override
  final String? rejectionReason;
  @override
  final UserModel? requester;
  @override
  final UserModel? albumOwner;
  @override
  final UserAlbumModel? album;

  factory AlbumAccessRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumAccessRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumAccessRequestModelToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class AlbumRequestStats with _$AlbumRequestStats {
  const AlbumRequestStats({
    required this.totalRequests,
    required this.pendingRequests,
    required this.approvedRequests,
    required this.rejectedRequests,
    required this.requestsToday,
    required this.requestsThisWeek,
    required this.requestsThisMonth,
    required this.averageResponseTime,
  });

  @override
  final int totalRequests;
  @override
  final int pendingRequests;
  @override
  final int approvedRequests;
  @override
  final int rejectedRequests;
  @override
  final int requestsToday;
  @override
  final int requestsThisWeek;
  @override
  final int requestsThisMonth;
  @override
  final double averageResponseTime;

  factory AlbumRequestStats.fromJson(Map<String, dynamic> json) =>
      _$AlbumRequestStatsFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumRequestStatsToJson(this);
}
