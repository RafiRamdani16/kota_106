import 'package:json_annotation/json_annotation.dart';

import '../OvertimeApprovalDetail/OvertimeApprovalModel.dart';

part 'OvertimeApprovalListModel.g.dart';

@JsonSerializable()
class OvertimeApprovalListModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<OvertimeApprovalModel> data;

  OvertimeApprovalListModel();

  factory OvertimeApprovalListModel.fromJson(Map<String, dynamic> json) =>
      _$OvertimeApprovalListModelFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeApprovalListModelToJson(this);
}
