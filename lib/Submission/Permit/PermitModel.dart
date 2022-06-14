import 'package:json_annotation/json_annotation.dart';

part 'PermitModel.g.dart';

@JsonSerializable()
class PermitModel {
  @JsonKey()
  late int permitId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String permitDateSubmitted;
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

  PermitModel();

  factory PermitModel.fromJson(Map<String, dynamic> json) =>
      _$PermitModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermitModelToJson(this);
}
