import 'package:json_annotation/json_annotation.dart';

part 'LeaveApplicationDecisionModel.g.dart';

@JsonSerializable()
class LeaveApplicationDecisionModel {
  @JsonKey()
  late String employeeName;
  @JsonKey()
  late String employeePosition;
  @JsonKey()
  late String leaveRemainingDays;
  @JsonKey()
  late String leaveType;
  @JsonKey()
  late String leaveTimeSubmitted;
  @JsonKey()
  late String leaveDateSubmitted;
  @JsonKey()
  late String leaveStartDate;
  @JsonKey()
  late String leaveEndDate;
  @JsonKey()
  late String leaveDescription;
  @JsonKey()
  late String leaveAttachment;
  @JsonKey()
  late String leaveStatus;

  LeaveApplicationDecisionModel();

  factory LeaveApplicationDecisionModel.fromJson(
          Map<String, dynamic> json) =>
      _$LeaveApplicationDecisionModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LeaveApplicationDecisionModelToJson(this);
}
