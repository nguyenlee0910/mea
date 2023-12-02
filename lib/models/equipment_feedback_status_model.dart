import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipment_feedback_status_model.freezed.dart';
part 'equipment_feedback_status_model.g.dart';

@freezed
class EquipmentFeedbackStatusModel with _$EquipmentFeedbackStatusModel {
  factory EquipmentFeedbackStatusModel({
    required String? id,
    required String? name,
    required String? code,
    required String? description,
    required List<String>? imageUrls,
    required String? endOfWarrantyDate,
  }) = _EquipmentFeedbackStatusModel;

  factory EquipmentFeedbackStatusModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFeedbackStatusModelFromJson(json);
}
