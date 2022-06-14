import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalDetail/LeaveApprovalModel.dart';

part 'LeaveApprovalListModel.g.dart';

@JsonSerializable()
class LeaveApprovalListModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<LeaveApprovalModel> data;

  LeaveApprovalListModel();

  factory LeaveApprovalListModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveApprovalListModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveApprovalListModelToJson(this);
}
