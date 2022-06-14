import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Submission/Permit/PermitModel.dart';

part 'PermitHistoryModel.g.dart';

@JsonSerializable()
class PermitHistoryModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<PermitModel> data;
  PermitHistoryModel();

  factory PermitHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PermitHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermitHistoryModelToJson(this);

}
