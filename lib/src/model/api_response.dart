import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Generic API response wrapper that handles the standard response format
/// {status: string, code: number, data: T}
@Freezed(genericArgumentFactories: true)
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required String status,
    required int code,
    required T data,
    String? message,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

/// Response wrapper for paginated data
@freezed
abstract class PaginatedResponse with _$PaginatedResponse {
  const factory PaginatedResponse({
    required List<dynamic> items,
    required int total,
    required int page,
    required int limit,
    required bool hasNext,
    required bool hasPrev,
  }) = _PaginatedResponse;

  factory PaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedResponseFromJson(json);
}

/// Simple success response for operations that don't return data
@freezed
abstract class SuccessResponse with _$SuccessResponse {
  const factory SuccessResponse({
    required String status,
    required int code,
    required String message,
  }) = _SuccessResponse;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);
}

/// Error response wrapper
@freezed
abstract class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    required String status,
    required int code,
    required String message,
    String? error,
    Map<String, dynamic>? details,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
