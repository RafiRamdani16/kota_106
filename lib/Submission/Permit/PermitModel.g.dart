// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PermitModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermitModel _$PermitModelFromJson(Map<String, dynamic> json) => PermitModel()
  ..permitId = json['permitId'] as int
  ..userId = json['userId'] as int
  ..dateSubmit = json['dateSubmit'] as String
  ..datePermit = json['datePermit'] as String
  ..startTime = json['startTime'] as String
  ..endTime = json['endTime'] as String
  ..description = json['description'] as String
  ..attachment = json['attachment'] as String
  ..statusPermit = json['statusPermit'] as String;

Map<String, dynamic> _$PermitModelToJson(PermitModel instance) =>
    <String, dynamic>{
      'permitId': instance.permitId,
      'userId': instance.userId,
      'dateSubmit': instance.dateSubmit,
      'datePermit': instance.datePermit,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
      'attachment': instance.attachment,
      'statusPermit': instance.statusPermit,
    };
