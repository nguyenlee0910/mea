import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/repair_report_createdBy_model.dart';
import 'package:mea/models/repair_report_items_model.dart';
import 'package:mea/models/repair_report_updatedBy_model.dart';

part 'repair_report_model.freezed.dart';
part 'repair_report_model.g.dart';

@freezed
class RepairReportModel extends BaseRequestModel with _$RepairReportModel {
  factory RepairReportModel({
    required String id,
    required String status,
    required String createdAt,
    required String description,
    required String note,
    required String startAt,
    required String endAt,
    RepairReportCreatedByModel? repairReportCreatedByModel,
    RepairReportUpdatedByModel? repairReportUpdatedByModel,
    RepairReportItemsModel? repairReportItemsModel,
  }) = _RepairReportModel;

  factory RepairReportModel.fromJson(Map<String, dynamic> json) =>
      _$RepairReportModelFromJson(json);
}
