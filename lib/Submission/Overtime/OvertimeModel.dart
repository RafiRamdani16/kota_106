import 'package:json_annotation/json_annotation.dart';

part 'OvertimeModel.g.dart';

@JsonSerializable()
class OvertimeModel {
  @JsonKey()
  late int overtimeId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String overtimeDateSubmitted;
  @JsonKey()
  late String overtimeDate;
  @JsonKey()
  late String overtimeStartTime;
  @JsonKey()
  late String overtimeEndTime;
  @JsonKey()
  late String overtimeDescription;
  @JsonKey()
  late String overtimeStatus;
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


  OvertimeModel();

  factory OvertimeModel.fromJson(Map<String, dynamic> json) =>
      _$OvertimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeModelToJson(this);
}
