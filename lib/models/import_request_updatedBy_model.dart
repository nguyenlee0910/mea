import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_request_updatedBy_model.freezed.dart';
part 'import_request_updatedBy_model.g.dart';

@freezed
class ImportRequestUpdatedByModel with _$ImportRequestUpdatedByModel {
  factory ImportRequestUpdatedByModel({
    required String id,
    required String name,
  }) = _ImportRequestUpdatedByModel;

  factory ImportRequestUpdatedByModel.fromJson(Map<String, dynamic> json) =>
      _$ImportRequestUpdatedByModelFromJson(json);
}
