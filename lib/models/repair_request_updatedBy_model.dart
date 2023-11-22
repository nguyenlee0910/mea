import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_request_updatedBy_model.freezed.dart';
part 'repair_request_updatedBy_model.g.dart';

@freezed
class RepairRequestUpdatedByModel with _$RepairRequestUpdatedByModel {
  factory RepairRequestUpdatedByModel({
    required String id,
    required String name,
  }) = _RepairRequestUpdatedByModel;

  factory RepairRequestUpdatedByModel.fromJson(Map<String, dynamic> json) =>
      _$RepairRequestUpdatedByModelFromJson(json);
}
