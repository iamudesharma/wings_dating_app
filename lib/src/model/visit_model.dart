import 'package:wings_dating_app/src/model/user_models.dart';

class VisitModel {
  final String id;
  final String userId;
  final String targetUserId;
  final UserModel? user;
  final DateTime visitedAt;
  final int visitCount;

  VisitModel({
    required this.id,
    required this.userId,
    required this.targetUserId,
    this.user,
    required this.visitedAt,
    required this.visitCount,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return VisitModel(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      targetUserId: json['targetUserId'] ?? '',
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      visitedAt: DateTime.parse(json['visitedAt'] ?? json['createdAt'] ?? DateTime.now().toIso8601String()),
      visitCount: json['visitCount'] ?? 1,
    );
  }

  /// Format visit count for display
  /// Shows exact count for 1-10, then "10+" for more than 10
  String get formattedVisitCount {
    if (visitCount <= 10) {
      return visitCount.toString();
    } else {
      return '10+';
    }
  }

  /// Get visit count display text
  String get visitCountText {
    if (visitCount == 1) {
      return 'Visited once';
    } else if (visitCount <= 10) {
      return 'Visited $visitCount times';
    } else {
      return 'Visited 10+ times';
    }
  }
}
