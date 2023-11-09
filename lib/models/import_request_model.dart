import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/base_request_model.dart';

part 'import_request_model.freezed.dart';
part 'import_request_model.g.dart';

@freezed
class ImportRequestModel extends BaseRequestModel with _$ImportRequestModel {
  factory ImportRequestModel({
    required String id,
    required String createdAt,
    required String name,
    required String description,
    required String status,
    required String note,
  }) = _ImportRequestModel;

  factory ImportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ImportRequestModelFromJson(json);
}
