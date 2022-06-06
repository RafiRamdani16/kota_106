// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveHistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveHistoryModel _$LeaveHistoryModelFromJson(Map<String, dynamic> json) =>
    LeaveHistoryModel()
      ..totalData = json['totalData'] as int
      ..totalPage = json['totalPage'] as int
      ..pageSize = json['pageSize'] as int
      ..currentPage = json['currentPage'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) => LeaveModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LeaveHistoryModelToJson(LeaveHistoryModel instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
