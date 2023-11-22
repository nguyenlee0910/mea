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
      equipment:
          EquipmentModel.fromJson(json['equipment'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String,
      createdBy: RepairRequestCreatedByModel.fromJson(
          json['createdBy'] as Map<String, dynamic>),
      updatedBy: RepairRequestUpdatedByModel.fromJson(
          json['updatedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RepairRequestModelImplToJson(
        _$RepairRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'status': instance.status,
      'note': instance.note,
      'equipment': instance.equipment,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
    };
