import 'package:freezed_annotation/freezed_annotation.dart';

part 'sender_model.freezed.dart';
part 'sender_model.g.dart';

@freezed
class SenderModel with _$SenderModel {
  factory SenderModel({
    required String id,
    required String name,
  }) = _SenderModel;

  factory SenderModel.fromJson(Map<String, dynamic> json) =>
      _$SenderModelFromJson(json);
}
