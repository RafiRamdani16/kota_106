import 'package:json_annotation/json_annotation.dart';

part 'LeaveModel.g.dart';

@JsonSerializable()
class LeaveModel {
  @JsonKey()
  late int leaveId;
  @JsonKey()
  late int userId;
  @JsonKey()
  late String dateSubmit;
  @JsonKey()
  late String dateStart;
  @JsonKey()
  late String dateEnd;
  @JsonKey()
  late String type;
  @JsonKey()
  late String description;
  @JsonKey()
  late String attachment;
  @JsonKey()
  late String statusLeave;
 

  LeaveModel();

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveModelToJson(this);
}
