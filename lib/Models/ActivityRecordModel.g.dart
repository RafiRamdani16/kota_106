// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityRecordModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRecordModel _$ActivityRecordModelFromJson(Map<String, dynamic> json) =>
    ActivityRecordModel()
      ..id = json['id'] as int
      ..whatTimeIs = json['whatTimeIs'] as int
      ..date = json['date'] as String
      ..photoName = json['photoName'] as String
      ..description = json['description'] as String
      ..location = json['location'] as String
      ..scheduleId = json['scheduleId'] as int
      ..userId = json['userId'] as int;

Map<String, dynamic> _$ActivityRecordModelToJson(
        ActivityRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'whatTimeIs': instance.whatTimeIs,
      'date': instance.date,
      'photoName': instance.photoName,
      'description': instance.description,
      'location': instance.location,
      'scheduleId': instance.scheduleId,
      'userId': instance.userId,
    };
