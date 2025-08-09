import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_privacy.freezed.dart';
part 'user_privacy.g.dart';

enum ProfileVisibility {
  @JsonValue('public')
  public,
  @JsonValue('friends')
  friends,
  @JsonValue('private')
  private,
}

enum LocationPrivacy {
  @JsonValue('exact')
  exact,
  @JsonValue('approximate')
  approximate,
  @JsonValue('hidden')
  hidden,
}

@freezed
abstract class UserPrivacy with _$UserPrivacy {
  const factory UserPrivacy({
    required String id,
    required String userId,
    required ProfileVisibility profileVisibility,
    required LocationPrivacy locationPrivacy,
    required bool showOnlineStatus,
    required bool showLastSeen,
    required bool showProfileViews,
    required bool showDistance,
    required bool showAge,
    required bool showInterests,
    required ProfileVisibility allowMessagesFrom,
    required ProfileVisibility allowLikesFrom,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserPrivacy;

  factory UserPrivacy.fromJson(Map<String, dynamic> json) => _$UserPrivacyFromJson(json);
}

@freezed
abstract class PrivacyUpdateRequest with _$PrivacyUpdateRequest {
  const factory PrivacyUpdateRequest({
    ProfileVisibility? profileVisibility,
    LocationPrivacy? locationPrivacy,
    bool? showOnlineStatus,
    bool? showLastSeen,
    bool? showProfileViews,
    bool? showDistance,
    bool? showAge,
    bool? showInterests,
    ProfileVisibility? allowMessagesFrom,
    ProfileVisibility? allowLikesFrom,
  }) = _PrivacyUpdateRequest;

  factory PrivacyUpdateRequest.fromJson(Map<String, dynamic> json) => _$PrivacyUpdateRequestFromJson(json);
}
