import 'package:json_annotation/json_annotation.dart';

import '../../../Submission/SubmissionModel.dart';

part 'PermitHistoryModel.g.dart';

@JsonSerializable()
class SubmissionHistoryModel {
  @JsonKey()
  late int totalData;
  @JsonKey()
  late int totalPage;
  @JsonKey()
  late int pageSize;
  @JsonKey()
  late int currentPage;
  @JsonKey()
  late List<SubmissionModel> data;
  SubmissionHistoryModel();

  factory SubmissionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubmissionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionHistoryModelToJson(this);

}
