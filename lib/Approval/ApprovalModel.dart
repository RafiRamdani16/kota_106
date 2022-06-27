import 'package:json_annotation/json_annotation.dart';

part 'ApprovalModel.g.dart';

@JsonSerializable()
class ApprovalModel {
  @JsonKey()
  late int submissionId;
  @JsonKey()
  late int submissionAttributeId;
  @JsonKey()
  late int approvalId;
  @JsonKey()
  late int overtimeId;
  @JsonKey()
  late String userName;
  @JsonKey()
  late String position;
  @JsonKey()
  late String dateSubmit;
  @JsonKey()
  late String datePerform;
  @JsonKey()
  late String endTime;
  @JsonKey()
  late String startTime;
  @JsonKey()
  late String submissionType;
  @JsonKey()
  late String description;
  @JsonKey()
  late String attachment;
  @JsonKey()
  late String statusSubmission;
  @JsonKey()
  late int userIdApproval;
  @JsonKey()
  late String statusApproval;
  @JsonKey()
  late String dateApproval;

  ApprovalModel();

  factory ApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalModelToJson(this);
}
