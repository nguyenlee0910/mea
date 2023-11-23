import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/repair_report_equipment_model.dart';

part 'repair_report_items_model.freezed.dart';
part 'repair_report_items_model.g.dart';

@freezed
class RepairReportItemsModel with _$RepairReportItemsModel {
  factory RepairReportItemsModel({
    required String id,
    required String description,
    RepairReportEquipmentModel? repairReportEquipmentModel,
  }) = _RepairReportItemsModel;

  factory RepairReportItemsModel.fromJson(Map<String, dynamic> json) =>
      _$RepairReportItemsModelFromJson(json);
}
