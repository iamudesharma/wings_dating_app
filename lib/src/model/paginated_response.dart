import 'package:json_annotation/json_annotation.dart';

part 'paginated_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponse<T> {
  final List<T> data;
  final int total;
  final int page;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  const PaginatedResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginatedResponseToJson(this, toJsonT);
}

@JsonSerializable()
class PaginatedUserResponse {
  final List<Map<String, dynamic>> data;
  final int total;
  final int page;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  const PaginatedUserResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory PaginatedUserResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedUserResponseToJson(this);
}
