// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairRequestModelImpl _$$RepairRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairRequestModelImpl(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      note: json['note'] as String,
      updatedAt: json['updatedAt'] as String,
      createdBy: RepairRequestCreatedByModel.fromJson(
          json['createdBy'] as Map<String, dynamic>),
      updatedBy: RepairRequestUpdatedByModel.fromJson(
          json['updatedBy'] as Map<String, dynamic>),
      repairReportItems: (json['repairReportItems'] as List<dynamic>?)
          ?.map(
              (e) => RepairReportItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RepairRequestModelImplToJson(
        _$RepairRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'status': instance.status,
      'note': instance.note,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'repairReportItems': instance.repairReportItems,
    };
