import 'package:json_annotation/json_annotation.dart';

part 'AfterOvertimeApprovalModel.g.dart';

@JsonSerializable()
class AfterOvertimeApprovalModel {
  @JsonKey()
  late int afterOvertimeid;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String userName;
  @JsonKey()
  late String position;
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

  AfterOvertimeApprovalModel();

  factory AfterOvertimeApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$AfterOvertimeApprovalModelFromJson(json);

  Map<String, dynamic> toJson() => _$AfterOvertimeApprovalModelToJson(this);
}
