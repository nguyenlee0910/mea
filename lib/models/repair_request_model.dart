import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/equipment_model.dart';

part 'repair_request_model.freezed.dart';
part 'repair_request_model.g.dart';

@freezed
class RepairRequestModel with _$RepairRequestModel {
  factory RepairRequestModel({
    required String id,
    required String createdAt,
    required String name,
    required String description,
    required String status,
    required String note,
    required EquipmentModel equipmentModel,
  }) = _RepairRequestModel;

  factory RepairRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RepairRequestModelFromJson(json);
}
