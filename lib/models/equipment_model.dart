import 'package:freezed_annotation/freezed_annotation.dart';
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
    EquipmentMaintainScheduleModel? equipmentMaintainSchedule,
  }) = _EquipmentModel;

  factory EquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentModelFromJson(json);
}
