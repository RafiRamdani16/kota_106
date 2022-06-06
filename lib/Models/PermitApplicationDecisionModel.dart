import 'package:json_annotation/json_annotation.dart';

part 'PermitApplicationDecisionModel.g.dart';

@JsonSerializable()
class PermitApplicationDecisionModel {
  @JsonKey()
  late String employeeName;
  @JsonKey()
  late String employeePosition;
  @JsonKey()
  late String permitDateSubmitted;
  @JsonKey()
  late String permitTimeSubmitted;
  @JsonKey()
  late String permitDate;
  @JsonKey()
  late String permitStartTime;
  @JsonKey()
  late String permitEndTime;
  @JsonKey()
  late String permitDescription;
  @JsonKey()
  late String permitAttachment;
  @JsonKey()
  late String statusPermit;

  PermitApplicationDecisionModel();

  factory PermitApplicationDecisionModel.fromJson(Map<String, dynamic> json) =>
      _$PermitApplicationDecisionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermitApplicationDecisionModelToJson(this);
}
