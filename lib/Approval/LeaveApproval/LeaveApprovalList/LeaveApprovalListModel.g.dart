// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveApprovalListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveApprovalListModel _$LeaveApprovalListModelFromJson(
        Map<String, dynamic> json) =>
    LeaveApprovalListModel()
      ..totalData = json['totalData'] as int
      ..totalPage = json['totalPage'] as int
      ..pageSize = json['pageSize'] as int
      ..currentPage = json['currentPage'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) => LeaveApprovalModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LeaveApprovalListModelToJson(
        LeaveApprovalListModel instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
