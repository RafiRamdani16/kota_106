import 'package:json_annotation/json_annotation.dart';

part 'LeaveApprovalModel.g.dart';

@JsonSerializable()
class LeaveApprovalModel {
  @JsonKey()
  late int leaveId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String userName;
  @JsonKey()
  late String position;
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
  @JsonKey()
  late int idApprovalAdmin;
  @JsonKey()
  late int idApprovalHR;
  @JsonKey()
  late int idApprovalAtasan;
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

  LeaveApprovalModel();

  factory LeaveApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveApprovalModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveApprovalModelToJson(this);
}
