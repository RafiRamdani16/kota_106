// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityRecordModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRecordModel _$ActivityRecordModelFromJson(Map<String, dynamic> json) =>
    ActivityRecordModel()
      ..id = json['id'] as String
      ..whatTimeIs = json['whatTimeIs'] as String
      ..date = json['date'] as String
      ..location = json['location'] as String
      ..description = json['description'] as String
      ..photoName = json['photoName'] as String
      ..scheduleId = json['scheduleId'] as int
      ..userId = json['userId'] as int;

Map<String, dynamic> _$ActivityRecordModelToJson(
        ActivityRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'whatTimeIs': instance.whatTimeIs,
      'date': instance.date,
      'location': instance.location,
      'description': instance.description,
      'photoName': instance.photoName,
      'scheduleId': instance.scheduleId,
      'userId': instance.userId,
    };
