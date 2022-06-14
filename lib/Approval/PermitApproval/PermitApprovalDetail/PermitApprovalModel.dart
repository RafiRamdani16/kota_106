import 'package:json_annotation/json_annotation.dart';

part 'PermitApprovalModel.g.dart';

@JsonSerializable()
class PermitApprovalModel {
  @JsonKey()
  late int permitId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String userName;
  @JsonKey()
  late String position;
  @JsonKey()
  late String permitDateSubmitted;
  @JsonKey()
  late String permitTimeSubmitted;
  @JsonKey()
  late String permitDate;
  @JsonKey()
  late String permitStartTime;
  @JsonKey()
  late String permitEndTime;
  @JsonKey()
  late String permitDescription;
  @JsonKey()
  late String permitAttachment;
  @JsonKey()
  late String statusPermit;
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

  PermitApprovalModel();

  factory PermitApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$PermitApprovalModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermitApprovalModelToJson(this);
}
