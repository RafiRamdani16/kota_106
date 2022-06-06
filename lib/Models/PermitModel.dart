import 'package:json_annotation/json_annotation.dart';

part 'PermitModel.g.dart';

@JsonSerializable()
class PermitModel {
  @JsonKey()
  late String permitDateSubmitted;
  @JsonKey()
  late String permitTimeSubmitted;
  @JsonKey()
  late String permitDate;
  @JsonKey()
  late String permitStartTime;
  @JsonKey()
  late String permitEndTime;
  @JsonKey()
  late String permitDescription;
  @JsonKey()
  late String permitAttachment;
  @JsonKey()
  late String statusPermit;

  PermitModel();

  factory PermitModel.fromJson(Map<String, dynamic> json) =>
      _$PermitModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermitModelToJson(this);
}
