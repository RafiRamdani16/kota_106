import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Models/AttendanceModel.dart';

part 'HistoryAttendanceModel.g.dart';

@JsonSerializable()
class HistoryAttendanceModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<AttendanceModel> data;

  HistoryAttendanceModel();

  factory HistoryAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryAttendanceModelToJson(this);
}
