// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackStatusModelImpl _$$FeedbackStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedbackStatusModelImpl(
      id: json['id'] as String?,
      status: json['status'] as String?,
      feedbackStatus: json['feedbackStatus'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      equipment: json['equipment'] == null
          ? null
          : EquipmentFeedbackStatusModel.fromJson(
              json['equipment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedbackStatusModelImplToJson(
        _$FeedbackStatusModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'feedbackStatus': instance.feedbackStatus,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'equipment': instance.equipment,
    };
