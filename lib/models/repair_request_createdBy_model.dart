import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_request_createdBy_model.freezed.dart';
part 'repair_request_createdBy_model.g.dart';

@freezed
class RepairRequestCreatedByModel with _$RepairRequestCreatedByModel {
  factory RepairRequestCreatedByModel({
    required String id,
    required String name,
  }) = _RepairRequestCreatedByModel;

  factory RepairRequestCreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$RepairRequestCreatedByModelFromJson(json);
}
