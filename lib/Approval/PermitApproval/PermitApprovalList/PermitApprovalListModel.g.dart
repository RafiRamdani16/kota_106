// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PermitApprovalListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermitApprovalListModel _$PermitApprovalListModelFromJson(
        Map<String, dynamic> json) =>
    PermitApprovalListModel()
      ..totalData = json['totalData'] as int
      ..totalPage = json['totalPage'] as int
      ..pageSize = json['pageSize'] as int
      ..currentPage = json['currentPage'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) => PermitApprovalModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PermitApprovalListModelToJson(
        PermitApprovalListModel instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
