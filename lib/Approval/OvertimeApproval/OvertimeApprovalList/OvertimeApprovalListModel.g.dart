// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OvertimeApprovalListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeApprovalListModel _$OvertimeApprovalListModelFromJson(
        Map<String, dynamic> json) =>
    OvertimeApprovalListModel()
      ..totalData = json['totalData'] as int
      ..totalPage = json['totalPage'] as int
      ..pageSize = json['pageSize'] as int
      ..currentPage = json['currentPage'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) => OvertimeApprovalModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$OvertimeApprovalListModelToJson(
        OvertimeApprovalListModel instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
