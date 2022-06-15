import 'package:json_annotation/json_annotation.dart';

part 'PermitModel.g.dart';

@JsonSerializable()
class PermitModel {
  @JsonKey()
  late int permitId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String dateSubmit;
  @JsonKey()
  late String datePermit;
  @JsonKey()
  late String startTime;
  @JsonKey()
  late String endTime;
  @JsonKey()
  late String description;
  @JsonKey()
  late String attachment;
  @JsonKey()
  late String statusPermit;
  
  PermitModel();

  factory PermitModel.fromJson(Map<String, dynamic> json) =>
      _$PermitModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermitModelToJson(this);
}
