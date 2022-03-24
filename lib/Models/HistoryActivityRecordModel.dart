import 'package:json_annotation/json_annotation.dart';
import 'package:kota_106/Models/ActivityRecordModel.dart';
part 'HistoryActivityRecordModel.g.dart';

@JsonSerializable()
class HistoryActivityRecordModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<ActivityRecordModel> data;

  HistoryActivityRecordModel();

  factory HistoryActivityRecordModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryActivityRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryActivityRecordModelToJson(this);
}
