import 'package:json_annotation/json_annotation.dart';

part 'LeaveApprovalModel.g.dart';

@JsonSerializable()
class LeaveApprovalModel {
  @JsonKey()
  late int submissionLeaveId;
  @JsonKey()
  late int submissionAttributeId;
  @JsonKey()
  late int approvalId;
  @JsonKey()
  late String userName;
  @JsonKey()
  late String position;
  @JsonKey()
  late String dateSubmit;
  @JsonKey()
  late String dateStart;
  @JsonKey()
  late String dateEnd;
  @JsonKey()
  late String type;
  @JsonKey()
  late String description;
  @JsonKey()
  late String attachment;
  @JsonKey()
  late String statusLeave;
  @JsonKey()
  late int userIdApproval;
  @JsonKey()
  late String statusApproval;
  @JsonKey()
  late String dateApproval;
  
  LeaveApprovalModel();

  factory LeaveApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveApprovalModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveApprovalModelToJson(this);
}
