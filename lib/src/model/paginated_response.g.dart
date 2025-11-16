// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedResponse<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  hasNext: json['hasNext'] as bool,
  hasPrev: json['hasPrev'] as bool,
);

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'total': instance.total,
  'page': instance.page,
  'totalPages': instance.totalPages,
  'hasNext': instance.hasNext,
  'hasPrev': instance.hasPrev,
};

PaginatedUserResponse _$PaginatedUserResponseFromJson(
  Map<String, dynamic> json,
) => PaginatedUserResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  hasNext: json['hasNext'] as bool,
  hasPrev: json['hasPrev'] as bool,
);

Map<String, dynamic> _$PaginatedUserResponseToJson(
  PaginatedUserResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'totalPages': instance.totalPages,
  'hasNext': instance.hasNext,
  'hasPrev': instance.hasPrev,
};
