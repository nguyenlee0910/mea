// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_report_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepairReportItemsModelImpl _$$RepairReportItemsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RepairReportItemsModelImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      repairReportEquipmentModel: json['repairReportEquipmentModel'] == null
          ? null
          : RepairReportEquipmentModel.fromJson(
              json['repairReportEquipmentModel'] as Map<String, dynamic>),
      equipment: json['equipment'] == null
          ? null
          : EquipmentModel.fromJson(json['equipment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RepairReportItemsModelImplToJson(
        _$RepairReportItemsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'repairReportEquipmentModel': instance.repairReportEquipmentModel,
      'equipment': instance.equipment,
    };
