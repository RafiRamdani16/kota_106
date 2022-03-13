import 'package:json_annotation/json_annotation.dart';
part 'ActivityRecordModel.g.dart';

@JsonSerializable()
class ActivityRecordModel {
  @JsonKey()
  late String date;
  @JsonKey()
  late String time;
  @JsonKey()
  late String location;
  @JsonKey()
  late String description;
  @JsonKey()
  late String photoName;

  ActivityRecordModel();

  factory ActivityRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityRecordModelToJson(this);
}
