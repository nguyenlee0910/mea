// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupplyModelImpl _$$SupplyModelImplFromJson(Map<String, dynamic> json) =>
    _$SupplyModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      quantity: json['quantity'] as int?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SupplyModelImplToJson(_$SupplyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'imageUrls': instance.imageUrls,
      'status': instance.status,
      'code': instance.code,
      'description': instance.description,
    };
