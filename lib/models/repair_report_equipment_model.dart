import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_report_equipment_model.freezed.dart';
part 'repair_report_equipment_model.g.dart';

@freezed
class RepairReportEquipmentModel with _$RepairReportEquipmentModel {
  factory RepairReportEquipmentModel({
    required String id,
    required String name,
    required String code,
  }) = _RepairReportEquipmentModel;

  factory RepairReportEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$RepairReportEquipmentModelFromJson(json);
}
