import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_report_createdBy_model.freezed.dart';
part 'repair_report_createdBy_model.g.dart';

@freezed
class RepairReportCreatedByModel with _$RepairReportCreatedByModel {
  factory RepairReportCreatedByModel({
    required String id,
    required String name,
  }) = _RepairReportCreatedByModel;

  factory RepairReportCreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$RepairReportCreatedByModelFromJson(json);
}
