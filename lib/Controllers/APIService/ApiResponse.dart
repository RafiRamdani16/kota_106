import 'package:json_annotation/json_annotation.dart';
part 'ApiResponse.g.dart';

@JsonSerializable()
class ApiResponse {
  @JsonKey(name: "message")
  late String message;
  @JsonKey(name: "status")
  late int status;
  @JsonKey(name: "data")
  late Map<String, dynamic> data;

  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
