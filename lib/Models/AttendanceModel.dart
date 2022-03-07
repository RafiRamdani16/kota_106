import 'package:json_annotation/json_annotation.dart';

part 'AttendanceModel.g.dart';

@JsonSerializable()
class AttendanceModel {
  @JsonKey()
  late int id;
  @JsonKey()
  late String isLate;
  @JsonKey()
  late String checkinAt;
  @JsonKey()
  late String locationCheckin;
  @JsonKey()
  late String descriptionCheckin;
  @JsonKey()
  late String checkoutAt;
  @JsonKey()
  late String locationCheckout;
  @JsonKey()
  late String descriptionCheckout;
  @JsonKey()
  late String photoName;
  @JsonKey()
  late int scheduleId;
  @JsonKey()
  late int userId;

  AttendanceModel();

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);
}
