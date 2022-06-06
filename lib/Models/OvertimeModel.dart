import 'package:json_annotation/json_annotation.dart';

part 'OvertimeModel.g.dart';

@JsonSerializable()
class OvertimeModel {
  @JsonKey()
  late int idOvertime;
  @JsonKey()
  late String overtimeDateSubmitted;
  @JsonKey()
  late String overtimeTimeSubmitted;
  @JsonKey()
  late String overtimeDate;
  @JsonKey()
  late String overtimeStartTime;
  @JsonKey()
  late String overtimeEndTime;
  @JsonKey()
  late String overtimeDescription;
  @JsonKey()
  late String overtimeStatus;

  OvertimeModel();

  factory OvertimeModel.fromJson(Map<String, dynamic> json) =>
      _$OvertimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeModelToJson(this);
}
