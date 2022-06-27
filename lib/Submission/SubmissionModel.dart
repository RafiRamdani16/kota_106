import 'package:json_annotation/json_annotation.dart';

import '../Approval/HistoryApprovalModel.dart';

part 'SubmissionModel.g.dart';

@JsonSerializable()
class SubmissionModel {
  @JsonKey()
  late int submissionId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String dateSubmit;
  @JsonKey()
  late String datePerform;
  @JsonKey()
  late String startTime;
  @JsonKey()
  late String endTime;
  @JsonKey()
  late String submissionType;
  @JsonKey()
  late String description;
  @JsonKey()
  late String attachment;
  @JsonKey()
  late String statusSubmission;
  @JsonKey()
  late List<HistoryApprovalModel> historyApprovals;

  SubmissionModel();

  factory SubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionModelToJson(this);
}
