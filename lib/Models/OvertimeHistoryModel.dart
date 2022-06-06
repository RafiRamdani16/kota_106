import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Models/OvertimeModel.dart';
import 'package:kota_106/Models/PermitModel.dart';

part 'OvertimeHistoryModel.g.dart';

@JsonSerializable()
class OvertimeHistoryModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<OvertimeModel> data;

  OvertimeHistoryModel();

  factory OvertimeHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OvertimeHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeHistoryModelToJson(this);
}
