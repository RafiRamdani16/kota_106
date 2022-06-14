import 'package:json_annotation/json_annotation.dart';

part 'LeaveModel.g.dart';

@JsonSerializable()
class LeaveModel {
  @JsonKey()
  late int leaveId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String leaveDateSubmitted;
  @JsonKey()
  late String leaveStartDate;
  @JsonKey()
  late String leaveEndDate;
  @JsonKey()
  late String leaveType;
  @JsonKey()
  late String leaveDescription;
  @JsonKey()
  late String leaveAttachment;
  @JsonKey()
  late String leaveStatus;
  @JsonKey()
  late String nameApprovalAdmin;
  @JsonKey()
  late String nameApprovalHR;
  @JsonKey()
  late String nameApprovalAtasan;
  @JsonKey()
  late String statusApprovalAdmin;
  @JsonKey()
  late String statusApprovalHR;
  @JsonKey()
  late String statusApprovalAtasan;
  @JsonKey()
  late String dateApprovalAdmin;
  @JsonKey()
  late String dateApprovalHR;
  @JsonKey()
  late String dateApprovalAtasan;

  LeaveModel();

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveModelToJson(this);
}
