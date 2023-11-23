import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_report_updatedBy_model.freezed.dart';
part 'repair_report_updatedBy_model.g.dart';

@freezed
class RepairReportUpdatedByModel with _$RepairReportUpdatedByModel {
  factory RepairReportUpdatedByModel({
    required String id,
    required String name,
  }) = _RepairReportUpdatedByModel;

  factory RepairReportUpdatedByModel.fromJson(Map<String, dynamic> json) =>
      _$RepairReportUpdatedByModelFromJson(json);
}
