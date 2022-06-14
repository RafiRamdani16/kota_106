// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AfterOvertimeApprovalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfterOvertimeApprovalModel _$AfterOvertimeApprovalModelFromJson(
        Map<String, dynamic> json) =>
    AfterOvertimeApprovalModel()
      ..afterOvertimeid = json['afterOvertimeid'] as int
      ..userId = json['userId'] as int
      ..userName = json['userName'] as String
      ..position = json['position'] as String
      ..overtimeId = json['overtimeId'] as int
      ..afterOvertimeDateSubmitted =
          json['afterOvertimeDateSubmitted'] as String
      ..afterOvertimeDate = json['afterOvertimeDate'] as String
      ..afterOvertimeStartTime = json['afterOvertimeStartTime'] as String
      ..afterOvertimeEndTime = json['afterOvertimeEndTime'] as String
      ..afterOvertimeDescription = json['afterOvertimeDescription'] as String
      ..afterOvertimeAttachment = json['afterOvertimeAttachment'] as String
      ..afterOvertimeStatus = json['afterOvertimeStatus'] as String
      ..idApprovalAdmin = json['idApprovalAdmin'] as int
      ..idApprovalHR = json['idApprovalHR'] as int
      ..idApprovalAtasan = json['idApprovalAtasan'] as int
      ..statusApprovalAdmin = json['statusApprovalAdmin'] as String
      ..statusApprovalHR = json['statusApprovalHR'] as String
      ..statusApprovalAtasan = json['statusApprovalAtasan'] as String
      ..dateApprovalAdmin = json['dateApprovalAdmin'] as String
      ..dateApprovalHR = json['dateApprovalHR'] as String
      ..dateApprovalAtasan = json['dateApprovalAtasan'] as String;

Map<String, dynamic> _$AfterOvertimeApprovalModelToJson(
        AfterOvertimeApprovalModel instance) =>
    <String, dynamic>{
      'afterOvertimeid': instance.afterOvertimeid,
      'userId': instance.userId,
      'userName': instance.userName,
      'position': instance.position,
      'overtimeId': instance.overtimeId,
      'afterOvertimeDateSubmitted': instance.afterOvertimeDateSubmitted,
      'afterOvertimeDate': instance.afterOvertimeDate,
      'afterOvertimeStartTime': instance.afterOvertimeStartTime,
      'afterOvertimeEndTime': instance.afterOvertimeEndTime,
      'afterOvertimeDescription': instance.afterOvertimeDescription,
      'afterOvertimeAttachment': instance.afterOvertimeAttachment,
      'afterOvertimeStatus': instance.afterOvertimeStatus,
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
