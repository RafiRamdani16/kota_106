// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PermitModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermitModel _$PermitModelFromJson(Map<String, dynamic> json) => PermitModel()
  ..permitDateSubmitted = json['permitDateSubmitted'] as String
  ..permitTimeSubmitted = json['permitTimeSubmitted'] as String
  ..permitDate = json['permitDate'] as String
  ..permitStartTime = json['permitStartTime'] as String
  ..permitEndTime = json['permitEndTime'] as String
  ..permitDescription = json['permitDescription'] as String
  ..permitAttachment = json['permitAttachment'] as String
  ..statusPermit = json['statusPermit'] as String;

Map<String, dynamic> _$PermitModelToJson(PermitModel instance) =>
    <String, dynamic>{
      'permitDateSubmitted': instance.permitDateSubmitted,
      'permitTimeSubmitted': instance.permitTimeSubmitted,
      'permitDate': instance.permitDate,
      'permitStartTime': instance.permitStartTime,
      'permitEndTime': instance.permitEndTime,
      'permitDescription': instance.permitDescription,
      'permitAttachment': instance.permitAttachment,
      'statusPermit': instance.statusPermit,
    };
