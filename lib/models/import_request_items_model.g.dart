// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_request_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImportRequestItemsModelImpl _$$ImportRequestItemsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImportRequestItemsModelImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      supply: json['supply'] == null
          ? null
          : SupplyModel.fromJson(json['supply'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      approveQuantity: json['approveQuantity'] as int?,
    );

Map<String, dynamic> _$$ImportRequestItemsModelImplToJson(
        _$ImportRequestItemsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'supply': instance.supply,
      'quantity': instance.quantity,
      'approveQuantity': instance.approveQuantity,
    };
