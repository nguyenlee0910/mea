import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mea/models/supply_model.dart';

part 'import_request_items_model.freezed.dart';
part 'import_request_items_model.g.dart';

@freezed
class ImportRequestItemsModel with _$ImportRequestItemsModel {
  factory ImportRequestItemsModel({
    required String? id,
    required String? createdAt,
    required String? updatedAt,
    SupplyModel? supply,
    required int? quantity,
  }) = _ImportRequestItemsModel;

  factory ImportRequestItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ImportRequestItemsModelFromJson(json);
}
