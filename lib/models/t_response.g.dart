// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TResponse<T> _$TResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TResponse<T>(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$TResponseToJson<T>(
  TResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': toJsonT(instance.data),
    };

TSearchResponse<T> _$TSearchResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TSearchResponse<T>(
      total: json['total'] as int?,
      start: json['start'] as int?,
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
    )..lastPage = json['lastPage'] as bool?;

Map<String, dynamic> _$TSearchResponseToJson<T>(
  TSearchResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'total': instance.total,
      'start': instance.start,
      'lastPage': instance.lastPage,
      'results': instance.results.map(toJsonT).toList(),
    };
