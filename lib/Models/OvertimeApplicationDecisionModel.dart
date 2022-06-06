import 'package:json_annotation/json_annotation.dart';

part 'OvertimeApplicationDecisionModel.g.dart';

@JsonSerializable()
class OvertimeApplicationDecisionModel {
  @JsonKey()
  late String employeeName;
  @JsonKey()
  late String employeePosition;
  @JsonKey()
  late String overtimeDateSubmitted;
  @JsonKey()
  late String overtimeTimeSubmitted;
  @JsonKey()
  late String overtimeDate;
  @JsonKey()
  late String overtimeStartTime;
  @JsonKey()
  late String overtimeEndTime;
  @JsonKey()
  late String overtimeDescription;
  @JsonKey()
  late String overtimeAttachment;
  @JsonKey()
  late String overtimeStatus;

  OvertimeApplicationDecisionModel();

  factory OvertimeApplicationDecisionModel.fromJson(
          Map<String, dynamic> json) =>
      _$OvertimeApplicationDecisionModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OvertimeApplicationDecisionModelToJson(this);
}
