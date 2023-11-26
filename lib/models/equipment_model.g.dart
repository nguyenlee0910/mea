// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipmentModelImpl _$$EquipmentModelImplFromJson(Map<String, dynamic> json) =>
    _$EquipmentModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      endOfWarrantyDate: json['endOfWarrantyDate'] as String?,
      currentStatus: json['currentStatus'] as String?,
      equipmentCategory: json['equipmentCategory'] == null
          ? null
          : EquipmentCategoryModel.fromJson(
              json['equipmentCategory'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      equipmentMaintainSchedule: json['equipmentMaintainSchedule'] == null
          ? null
          : EquipmentMaintainScheduleModel.fromJson(
              json['equipmentMaintainSchedule'] as Map<String, dynamic>),
      importRequestItemsModel: json['importRequestItemsModel'] == null
          ? null
          : ImportRequestItemsModel.fromJson(
              json['importRequestItemsModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EquipmentModelImplToJson(
        _$EquipmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'endOfWarrantyDate': instance.endOfWarrantyDate,
      'currentStatus': instance.currentStatus,
      'equipmentCategory': instance.equipmentCategory,
      'brand': instance.brand,
      'equipmentMaintainSchedule': instance.equipmentMaintainSchedule,
      'importRequestItemsModel': instance.importRequestItemsModel,
    };
