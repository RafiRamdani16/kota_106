import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Approval/PermitApproval/PermitApprovalDetail/PermitApprovalModel.dart';


part 'PermitApprovalListModel.g.dart';

@JsonSerializable()
class PermitApprovalListModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<PermitApprovalModel> data;

  PermitApprovalListModel();

  factory PermitApprovalListModel.fromJson(Map<String, dynamic> json) =>
      _$PermitApprovalListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermitApprovalListModelToJson(this);
}
