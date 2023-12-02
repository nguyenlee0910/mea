// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_feedback_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipmentFeedbackStatusModelImpl _$$EquipmentFeedbackStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EquipmentFeedbackStatusModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      endOfWarrantyDate: json['endOfWarrantyDate'] as String?,
    );

Map<String, dynamic> _$$EquipmentFeedbackStatusModelImplToJson(
        _$EquipmentFeedbackStatusModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'endOfWarrantyDate': instance.endOfWarrantyDate,
    };
