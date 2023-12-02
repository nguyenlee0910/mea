import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/equipment_feedback_status_model.dart';

part 'feedback_status_model.freezed.dart';
part 'feedback_status_model.g.dart';

@freezed
class FeedbackStatusModel with _$FeedbackStatusModel {
  factory FeedbackStatusModel({
    required String? id,
    required String? status,
    required String? feedbackStatus,
    required String? createdAt,
    required String? description,
    EquipmentFeedbackStatusModel? equipment,
  }) = _FeedbackStatusModel;

  factory FeedbackStatusModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackStatusModelFromJson(json);
}
