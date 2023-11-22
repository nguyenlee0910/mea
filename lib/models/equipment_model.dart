import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/brand_model.dart';
import 'package:mea/models/equipment_category_model.dart';
import 'package:mea/models/equipment_maintain_schedule_model.dart';

part 'equipment_model.freezed.dart';
part 'equipment_model.g.dart';

@freezed
class EquipmentModel with _$EquipmentModel {
  factory EquipmentModel({
    required String id,
    required String name,
    required String code,
    required String description,
    required List<String> imageUrls,
    required String endOfWarrantyDate,
    EquipmentMaintainScheduleModel? equipmentMaintainSchedule,
    required String currentStatus,
    required EquipmentCategoryModel equipmentCategory,
    required BrandModel brand,
  }) = _EquipmentModel;

  factory EquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentModelFromJson(json);
}
