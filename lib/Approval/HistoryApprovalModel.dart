import 'package:json_annotation/json_annotation.dart';

part 'HistoryApprovalModel.g.dart';

@JsonSerializable()
class HistoryApprovalModel {
  @JsonKey()
  late int approvalId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String userName;
  @JsonKey()
  late String statusApproval;
  @JsonKey()
  late String dateApproval;

  HistoryApprovalModel();

  factory HistoryApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryApprovalModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryApprovalModelToJson(this);
}
