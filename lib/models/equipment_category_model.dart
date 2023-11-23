import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipment_category_model.freezed.dart';
part 'equipment_category_model.g.dart';

@freezed
class EquipmentCategoryModel with _$EquipmentCategoryModel {
  factory EquipmentCategoryModel({
    required String? id,
    required String? name,
  }) = _EquipmentCategoryModel;

  factory EquipmentCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentCategoryModelFromJson(json);
}
