import 'package:json_annotation/json_annotation.dart';

part 'OvertimeApprovalModel.g.dart';

@JsonSerializable()
class OvertimeApprovalModel {
  @JsonKey()
  late int overtimeId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late int afterOvertimeId;
  @JsonKey()
  late String userName;
  @JsonKey()
  late String position;
  @JsonKey()
  late String overtimeDateSubmitted;
  @JsonKey()
  late String overtimeTimeSubmitted;
  @JsonKey()
  late String overtimeDate;
  @JsonKey()
  late String overtimeStartTime;
  @JsonKey()
  late String overtimeEndTime;
  @JsonKey()
  late String overtimeDescription;
  @JsonKey()
  late String overtimeAttachment;
  @JsonKey()
  late String overtimeStatus;
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

  OvertimeApprovalModel();

  factory OvertimeApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$OvertimeApprovalModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OvertimeApprovalModelToJson(this);
}
