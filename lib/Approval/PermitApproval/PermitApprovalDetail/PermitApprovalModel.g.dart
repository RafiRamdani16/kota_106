// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PermitApprovalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermitApprovalModel _$PermitApprovalModelFromJson(Map<String, dynamic> json) =>
    PermitApprovalModel()
      ..permitId = json['permitId'] as int
      ..userId = json['userId'] as int
      ..userName = json['userName'] as String
      ..position = json['position'] as String
      ..permitDateSubmitted = json['permitDateSubmitted'] as String
      ..permitTimeSubmitted = json['permitTimeSubmitted'] as String
      ..permitDate = json['permitDate'] as String
      ..permitStartTime = json['permitStartTime'] as String
      ..permitEndTime = json['permitEndTime'] as String
      ..permitDescription = json['permitDescription'] as String
      ..permitAttachment = json['permitAttachment'] as String
      ..statusPermit = json['statusPermit'] as String
      ..idApprovalAdmin = json['idApprovalAdmin'] as int
      ..idApprovalHR = json['idApprovalHR'] as int
      ..idApprovalAtasan = json['idApprovalAtasan'] as int
      ..statusApprovalAdmin = json['statusApprovalAdmin'] as String
      ..statusApprovalHR = json['statusApprovalHR'] as String
      ..statusApprovalAtasan = json['statusApprovalAtasan'] as String
      ..dateApprovalAdmin = json['dateApprovalAdmin'] as String
      ..dateApprovalHR = json['dateApprovalHR'] as String
      ..dateApprovalAtasan = json['dateApprovalAtasan'] as String;

Map<String, dynamic> _$PermitApprovalModelToJson(
        PermitApprovalModel instance) =>
    <String, dynamic>{
      'permitId': instance.permitId,
      'userId': instance.userId,
      'userName': instance.userName,
      'position': instance.position,
      'permitDateSubmitted': instance.permitDateSubmitted,
      'permitTimeSubmitted': instance.permitTimeSubmitted,
      'permitDate': instance.permitDate,
      'permitStartTime': instance.permitStartTime,
      'permitEndTime': instance.permitEndTime,
      'permitDescription': instance.permitDescription,
      'permitAttachment': instance.permitAttachment,
      'statusPermit': instance.statusPermit,
      'idApprovalAdmin': instance.idApprovalAdmin,
      'idApprovalHR': instance.idApprovalHR,
      'idApprovalAtasan': instance.idApprovalAtasan,
      'statusApprovalAdmin': instance.statusApprovalAdmin,
      'statusApprovalHR': instance.statusApprovalHR,
      'statusApprovalAtasan': instance.statusApprovalAtasan,
      'dateApprovalAdmin': instance.dateApprovalAdmin,
      'dateApprovalHR': instance.dateApprovalHR,
      'dateApprovalAtasan': instance.dateApprovalAtasan,
    };
