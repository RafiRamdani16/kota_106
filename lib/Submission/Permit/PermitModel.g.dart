// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PermitModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermitModel _$PermitModelFromJson(Map<String, dynamic> json) => PermitModel()
  ..permitId = json['permitId'] as int
  ..userId = json['userId'] as int
  ..permitDateSubmitted = json['permitDateSubmitted'] as String
  ..permitDate = json['permitDate'] as String
  ..permitStartTime = json['permitStartTime'] as String
  ..permitEndTime = json['permitEndTime'] as String
  ..permitDescription = json['permitDescription'] as String
  ..permitAttachment = json['permitAttachment'] as String
  ..statusPermit = json['statusPermit'] as String
  ..nameApprovalAdmin = json['nameApprovalAdmin'] as String
  ..nameApprovalHR = json['nameApprovalHR'] as String
  ..nameApprovalAtasan = json['nameApprovalAtasan'] as String
  ..statusApprovalAdmin = json['statusApprovalAdmin'] as String
  ..statusApprovalHR = json['statusApprovalHR'] as String
  ..statusApprovalAtasan = json['statusApprovalAtasan'] as String
  ..dateApprovalAdmin = json['dateApprovalAdmin'] as String
  ..dateApprovalHR = json['dateApprovalHR'] as String
  ..dateApprovalAtasan = json['dateApprovalAtasan'] as String;

Map<String, dynamic> _$PermitModelToJson(PermitModel instance) =>
    <String, dynamic>{
      'permitId': instance.permitId,
      'userId': instance.userId,
      'permitDateSubmitted': instance.permitDateSubmitted,
      'permitDate': instance.permitDate,
      'permitStartTime': instance.permitStartTime,
      'permitEndTime': instance.permitEndTime,
      'permitDescription': instance.permitDescription,
      'permitAttachment': instance.permitAttachment,
      'statusPermit': instance.statusPermit,
      'nameApprovalAdmin': instance.nameApprovalAdmin,
      'nameApprovalHR': instance.nameApprovalHR,
      'nameApprovalAtasan': instance.nameApprovalAtasan,
      'statusApprovalAdmin': instance.statusApprovalAdmin,
      'statusApprovalHR': instance.statusApprovalHR,
      'statusApprovalAtasan': instance.statusApprovalAtasan,
      'dateApprovalAdmin': instance.dateApprovalAdmin,
      'dateApprovalHR': instance.dateApprovalHR,
      'dateApprovalAtasan': instance.dateApprovalAtasan,
    };
