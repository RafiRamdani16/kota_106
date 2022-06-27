import 'package:json_annotation/json_annotation.dart';

import '../../Approval/HistoryApprovalModel.dart';

part 'AfterOvertimeModel.g.dart';

@JsonSerializable()
class AfterOvertimeModel {
  @JsonKey()
  late int afterOvertimeid;
  @JsonKey()
  late int overtimeId;
  @JsonKey()
  late String afterOvertimeDateSubmitted;
  @JsonKey()
  late String afterOvertimeDate;
  @JsonKey()
  late String afterOvertimeStartTime;
  @JsonKey()
  late String afterOvertimeEndTime;
  @JsonKey()
  late String afterOvertimeDescription;
  @JsonKey()
  late String afterOvertimeAttachment;
  @JsonKey()
  late String afterOvertimeStatus;
  @JsonKey()
  late List<HistoryApprovalModel> historyApprovals;

  AfterOvertimeModel();

  factory AfterOvertimeModel.fromJson(Map<String, dynamic> json) =>
      _$AfterOvertimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AfterOvertimeModelToJson(this);
}
