import 'package:json_annotation/json_annotation.dart';
part 'ActivityRecordModel.g.dart';

@JsonSerializable()
class ActivityRecordModel {
  @JsonKey()
  late int id;
  @JsonKey()
  late int whatTimeIs;
  @JsonKey()
  late String date;
  @JsonKey()
  late String photoName;
  @JsonKey()
  late String description;
  @JsonKey()
  late String location;

  @JsonKey()
  late int scheduleId;
  @JsonKey()
  late int userId;

  ActivityRecordModel();

  factory ActivityRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityRecordModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$ActivityRecordModelToJson(this);
}
