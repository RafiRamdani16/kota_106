import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Approval/ApprovalModel.dart';

part 'ListApprovalModel.g.dart';

@JsonSerializable()
class ListApprovalModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<ApprovalModel> data;

  ListApprovalModel();

  factory ListApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$ListApprovalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListApprovalModelToJson(this);
}
