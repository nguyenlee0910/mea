// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairReportModelImpl _$$RepairReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairReportModelImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      description: json['description'] as String,
      note: json['note'] as String,
      startAt: json['startAt'] as String,
      endAt: json['endAt'] as String,
      repairReportCreatedByModel: json['repairReportCreatedByModel'] == null
          ? null
          : RepairReportCreatedByModel.fromJson(
              json['repairReportCreatedByModel'] as Map<String, dynamic>),
      repairReportUpdatedByModel: json['repairReportUpdatedByModel'] == null
          ? null
          : RepairReportUpdatedByModel.fromJson(
              json['repairReportUpdatedByModel'] as Map<String, dynamic>),
      repairReportItemsModel: json['repairReportItemsModel'] == null
          ? null
          : RepairReportItemsModel.fromJson(
              json['repairReportItemsModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RepairReportModelImplToJson(
        _$RepairReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'note': instance.note,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'repairReportCreatedByModel': instance.repairReportCreatedByModel,
      'repairReportUpdatedByModel': instance.repairReportUpdatedByModel,
      'repairReportItemsModel': instance.repairReportItemsModel,
    };
