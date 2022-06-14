import 'package:json_annotation/json_annotation.dart';
part 'ApiResponse.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: "message")
  late String message;
  @JsonKey(name: "status")
  late int status;
  @JsonKey(name: "data")
  late T data;

  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson<T>(json,fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ApiResponseToJson(this,toJsonT);
}
