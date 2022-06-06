import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Models/LeaveModel.dart';


part 'LeaveHistoryModel.g.dart';

@JsonSerializable()
class LeaveHistoryModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<LeaveModel> data;

  LeaveHistoryModel();

  factory LeaveHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveHistoryModelToJson(this);
}
