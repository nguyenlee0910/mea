import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_request_createdBy_model.freezed.dart';
part 'import_request_createdBy_model.g.dart';

@freezed
class ImportRequestCreatedByModel with _$ImportRequestCreatedByModel {
  factory ImportRequestCreatedByModel({
    required String id,
    required String name,
  }) = _ImportRequestCreatedByModel;

  factory ImportRequestCreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$ImportRequestCreatedByModelFromJson(json);
}
