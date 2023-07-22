import 'package:json_annotation/json_annotation.dart';

part 't_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TResponse<T> {
  String? status;
  String? message;
  T data;

  TResponse({this.status, this.message, required this.data});

  factory TResponse.fromJson(
          Map<String, dynamic> data, T Function(Object? json) fromJsonT) =>
      _$TResponseFromJson(data, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$TResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class TSearchResponse<T> {
  int? total;
  int? start;
  bool? lastPage;
  List<T> results;

  TSearchResponse({this.total, this.start, required this.results});

  factory TSearchResponse.fromJson(
          Map<String, dynamic> data, T Function(Object? json) fromJsonT) =>
      _$TSearchResponseFromJson(data, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$TSearchResponseToJson(this, toJsonT);
}
