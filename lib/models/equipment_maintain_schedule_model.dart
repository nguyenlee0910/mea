import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipment_maintain_schedule_model.freezed.dart';
part 'equipment_maintain_schedule_model.g.dart';

@freezed
class EquipmentMaintainScheduleModel with _$EquipmentMaintainScheduleModel {
  factory EquipmentMaintainScheduleModel({
    required String id,
    required String lastMaintainDate,
  }) = _EquipmentMaintainScheduleModel;

  factory EquipmentMaintainScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentMaintainScheduleModelFromJson(json);
}
