import 'package:json_annotation/json_annotation.dart';
part 'ReligionModel.g.dart';

@JsonSerializable()
class ReligionModel {
  @JsonKey()
  late int religionId;
  @JsonKey()
  late String religionName;

  ReligionModel();

  factory ReligionModel.fromJson(Map<String, dynamic> json) =>
      _$ReligionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReligionModelToJson(this);
}
