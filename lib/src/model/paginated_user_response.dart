import 'package:wings_dating_app/src/model/paginated_response.dart';

// Typedef for a paginated response of user data (Map<String, dynamic>)
typedef PaginatedUserResponse = PaginatedResponse<Map<String, dynamic>>;

// Helper class to provide easy construction
class PaginatedUserResponseHelper {
  static PaginatedUserResponse fromJson(Map<String, dynamic> json) {
    return PaginatedResponse.fromJson(
      json,
      (json) => json as Map<String, dynamic>,
    );
  }

  static Map<String, dynamic> toJson(PaginatedUserResponse response) {
    return response.toJson((value) => value);
  }
}
