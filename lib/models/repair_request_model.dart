import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:mea/models/repair_request_createdBy_model.dart';
import 'package:mea/models/repair_request_updatedBy_model.dart';

part 'repair_request_model.freezed.dart';
part 'repair_request_model.g.dart';

@freezed
class RepairRequestModel extends BaseRequestModel with _$RepairRequestModel {
  factory RepairRequestModel({
    required String id,
    required String createdAt,
    required String description,
    required String status,
    required String note,
    required EquipmentModel equipment,
    required String updatedAt,
    required RepairRequestCreatedByModel createdBy,
    required RepairRequestUpdatedByModel updatedBy,
  }) = _RepairRequestModel;

  factory RepairRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RepairRequestModelFromJson(json);
}
