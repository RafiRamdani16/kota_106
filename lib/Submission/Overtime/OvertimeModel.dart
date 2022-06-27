import 'package:json_annotation/json_annotation.dart';

import '../../Approval/HistoryApprovalModel.dart';

part 'OvertimeModel.g.dart';

@JsonSerializable()
class OvertimeModel {
  @JsonKey()
  late int overtimeId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late int afterOvertimeId;
  @JsonKey()
  late String dateSubmit;
  @JsonKey()
  late String dateOvertime;
  @JsonKey()
  late String startTime;
  @JsonKey()
  late String endTime;
  @JsonKey()
  late String description;
  @JsonKey()
  late String statusOvertime;
  @JsonKey()
  late List<HistoryApprovalModel> historyApprovals;
  


  OvertimeModel();

  factory OvertimeModel.fromJson(Map<String, dynamic> json) =>
      _$OvertimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeModelToJson(this);
}
