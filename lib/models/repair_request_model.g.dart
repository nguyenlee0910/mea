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
      name: json['name'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      note: json['note'] as String,
      equipmentModel: EquipmentModel.fromJson(
          json['equipmentModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RepairRequestModelImplToJson(
        _$RepairRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'note': instance.note,
      'equipmentModel': instance.equipmentModel,
    };