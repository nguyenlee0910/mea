import 'package:freezed_annotation/freezed_annotation.dart';

part 'supply_model.freezed.dart';
part 'supply_model.g.dart';

@freezed
class SupplyModel with _$SupplyModel {
  factory SupplyModel({
    required String? id,
    required String? name,
    required String? unit,
    required int? quantity,
    required List<String>? imageUrls,
    String? status,
    String? code,
    String? description,
  }) = _SupplyModel;

  factory SupplyModel.fromJson(Map<String, dynamic> json) =>
      _$SupplyModelFromJson(json);
}
