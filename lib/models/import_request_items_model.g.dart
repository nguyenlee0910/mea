// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_request_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImportRequestItemsModelImpl _$$ImportRequestItemsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImportRequestItemsModelImpl(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      supply: (json['supply'] as List<dynamic>)
          .map((e) => SupplyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImportRequestItemsModelImplToJson(
        _$ImportRequestItemsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'supply': instance.supply,
    };
