import 'package:json_annotation/json_annotation.dart';

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

@JsonSerializable()
class UserPrivacy {
  const UserPrivacy({
    required this.id,
    required this.userId,
    required this.profileVisibility,
    required this.locationPrivacy,
    required this.showOnlineStatus,
    required this.showLastSeen,
    required this.showProfileViews,
    required this.showDistance,
    required this.showAge,
    required this.showInterests,
    required this.allowMessagesFrom,
    required this.allowLikesFrom,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final ProfileVisibility profileVisibility;
  final LocationPrivacy locationPrivacy;
  final bool showOnlineStatus;
  final bool showLastSeen;
  final bool showProfileViews;
  final bool showDistance;
  final bool showAge;
  final bool showInterests;
  final ProfileVisibility allowMessagesFrom;
  final ProfileVisibility allowLikesFrom;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory UserPrivacy.fromJson(Map<String, dynamic> json) =>
      _$UserPrivacyFromJson(json);
  Map<String, dynamic> toJson() => _$UserPrivacyToJson(this);

  UserPrivacy copyWith({
    String? id,
    String? userId,
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
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserPrivacy(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        profileVisibility: profileVisibility ?? this.profileVisibility,
        locationPrivacy: locationPrivacy ?? this.locationPrivacy,
        showOnlineStatus: showOnlineStatus ?? this.showOnlineStatus,
        showLastSeen: showLastSeen ?? this.showLastSeen,
        showProfileViews: showProfileViews ?? this.showProfileViews,
        showDistance: showDistance ?? this.showDistance,
        showAge: showAge ?? this.showAge,
        showInterests: showInterests ?? this.showInterests,
        allowMessagesFrom: allowMessagesFrom ?? this.allowMessagesFrom,
        allowLikesFrom: allowLikesFrom ?? this.allowLikesFrom,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}

@JsonSerializable(includeIfNull: false)
class PrivacyUpdateRequest {
  const PrivacyUpdateRequest({
    this.profileVisibility,
    this.locationPrivacy,
    this.showOnlineStatus,
    this.showLastSeen,
    this.showProfileViews,
    this.showDistance,
    this.showAge,
    this.showInterests,
    this.allowMessagesFrom,
    this.allowLikesFrom,
  });

  final ProfileVisibility? profileVisibility;
  final LocationPrivacy? locationPrivacy;
  final bool? showOnlineStatus;
  final bool? showLastSeen;
  final bool? showProfileViews;
  final bool? showDistance;
  final bool? showAge;
  final bool? showInterests;
  final ProfileVisibility? allowMessagesFrom;
  final ProfileVisibility? allowLikesFrom;

  factory PrivacyUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$PrivacyUpdateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PrivacyUpdateRequestToJson(this);

  PrivacyUpdateRequest copyWith({
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
  }) =>
      PrivacyUpdateRequest(
        profileVisibility: profileVisibility ?? this.profileVisibility,
        locationPrivacy: locationPrivacy ?? this.locationPrivacy,
        showOnlineStatus: showOnlineStatus ?? this.showOnlineStatus,
        showLastSeen: showLastSeen ?? this.showLastSeen,
        showProfileViews: showProfileViews ?? this.showProfileViews,
        showDistance: showDistance ?? this.showDistance,
        showAge: showAge ?? this.showAge,
        showInterests: showInterests ?? this.showInterests,
        allowMessagesFrom: allowMessagesFrom ?? this.allowMessagesFrom,
        allowLikesFrom: allowLikesFrom ?? this.allowLikesFrom,
      );
}
