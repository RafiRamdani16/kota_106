import 'package:json_annotation/json_annotation.dart';
part 'ScheduleModel.g.dart';


@JsonSerializable()
class ScheduleModel {
  @JsonKey()
  late int scheduleId;
  @JsonKey()
  late String name;
  @JsonKey()
  late String startCheckinAt;
  @JsonKey()
  late String endCheckinAt;
  @JsonKey()
  late String startCheckoutAt;
  @JsonKey()
  late String endCheckoutAt;

  ScheduleModel();

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}
