import 'package:json_annotation/json_annotation.dart';

part 'HistoryAttendanceModel.g.dart';

@JsonSerializable()
class HistoryAttendanceModel {
  @JsonKey()
  late String checkInTime;
  @JsonKey()
  late String checkOutTime;
  @JsonKey()
  late String checkInLocation;
  @JsonKey()
  late String checkOutLocation;
  @JsonKey()
  late String checkInPhotoName;
  @JsonKey()
  late String checkInDate;
  @JsonKey()
  late String checkOutDate;
  @JsonKey()
  late String doneList;

  HistoryAttendanceModel();

  factory HistoryAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryAttendanceModelToJson(this);
}
