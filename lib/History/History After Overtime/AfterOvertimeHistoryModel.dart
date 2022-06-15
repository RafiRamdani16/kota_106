import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Submission/AfterOvertime/AfterOvertimeModel.dart';


part 'AfterOvertimeHistoryModel.g.dart';

@JsonSerializable()
class AfterOvertimeHistoryModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<AfterOvertimeModel> data;

  AfterOvertimeHistoryModel();

  factory AfterOvertimeHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$AfterOvertimeHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$AfterOvertimeHistoryModelToJson(this);
}
