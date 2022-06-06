import 'package:json_annotation/json_annotation.dart';

part 'LeaveModel.g.dart';

@JsonSerializable()
class LeaveModel {
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

  LeaveModel();

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveModelToJson(this);
}
