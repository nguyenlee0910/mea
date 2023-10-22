import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/sender_model.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel({
    String? id,
    String? createdAt,
    bool? isDeleted,
    String? content,
    String? title,
    String? status,
    SenderModel? sender,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
