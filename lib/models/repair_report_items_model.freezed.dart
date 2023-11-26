// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_report_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepairReportItemsModel _$RepairReportItemsModelFromJson(
    Map<String, dynamic> json) {
  return _RepairReportItemsModel.fromJson(json);
}

/// @nodoc
mixin _$RepairReportItemsModel {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  RepairReportEquipmentModel? get repairReportEquipmentModel =>
      throw _privateConstructorUsedError;
  EquipmentModel? get equipment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairReportItemsModelCopyWith<RepairReportItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairReportItemsModelCopyWith<$Res> {
  factory $RepairReportItemsModelCopyWith(RepairReportItemsModel value,
          $Res Function(RepairReportItemsModel) then) =
      _$RepairReportItemsModelCopyWithImpl<$Res, RepairReportItemsModel>;
  @useResult
  $Res call(
      {String id,
      String description,
      RepairReportEquipmentModel? repairReportEquipmentModel,
      EquipmentModel? equipment});

  $RepairReportEquipmentModelCopyWith<$Res>? get repairReportEquipmentModel;
  $EquipmentModelCopyWith<$Res>? get equipment;
}

/// @nodoc
class _$RepairReportItemsModelCopyWithImpl<$Res,
        $Val extends RepairReportItemsModel>
    implements $RepairReportItemsModelCopyWith<$Res> {
  _$RepairReportItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? repairReportEquipmentModel = freezed,
    Object? equipment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      repairReportEquipmentModel: freezed == repairReportEquipmentModel
          ? _value.repairReportEquipmentModel
          : repairReportEquipmentModel // ignore: cast_nullable_to_non_nullable
              as RepairReportEquipmentModel?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RepairReportEquipmentModelCopyWith<$Res>? get repairReportEquipmentModel {
    if (_value.repairReportEquipmentModel == null) {
      return null;
    }

    return $RepairReportEquipmentModelCopyWith<$Res>(
        _value.repairReportEquipmentModel!, (value) {
      return _then(_value.copyWith(repairReportEquipmentModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentModelCopyWith<$Res>? get equipment {
    if (_value.equipment == null) {
      return null;
    }

    return $EquipmentModelCopyWith<$Res>(_value.equipment!, (value) {
      return _then(_value.copyWith(equipment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepairReportItemsModelImplCopyWith<$Res>
    implements $RepairReportItemsModelCopyWith<$Res> {
  factory _$$RepairReportItemsModelImplCopyWith(
          _$RepairReportItemsModelImpl value,
          $Res Function(_$RepairReportItemsModelImpl) then) =
      __$$RepairReportItemsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      RepairReportEquipmentModel? repairReportEquipmentModel,
      EquipmentModel? equipment});

  @override
  $RepairReportEquipmentModelCopyWith<$Res>? get repairReportEquipmentModel;
  @override
  $EquipmentModelCopyWith<$Res>? get equipment;
}

/// @nodoc
class __$$RepairReportItemsModelImplCopyWithImpl<$Res>
    extends _$RepairReportItemsModelCopyWithImpl<$Res,
        _$RepairReportItemsModelImpl>
    implements _$$RepairReportItemsModelImplCopyWith<$Res> {
  __$$RepairReportItemsModelImplCopyWithImpl(
      _$RepairReportItemsModelImpl _value,
      $Res Function(_$RepairReportItemsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? repairReportEquipmentModel = freezed,
    Object? equipment = freezed,
  }) {
    return _then(_$RepairReportItemsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      repairReportEquipmentModel: freezed == repairReportEquipmentModel
          ? _value.repairReportEquipmentModel
          : repairReportEquipmentModel // ignore: cast_nullable_to_non_nullable
              as RepairReportEquipmentModel?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairReportItemsModelImpl implements _RepairReportItemsModel {
  _$RepairReportItemsModelImpl(
      {required this.id,
      required this.description,
      this.repairReportEquipmentModel,
      this.equipment});

  factory _$RepairReportItemsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairReportItemsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final RepairReportEquipmentModel? repairReportEquipmentModel;
  @override
  final EquipmentModel? equipment;

  @override
  String toString() {
    return 'RepairReportItemsModel(id: $id, description: $description, repairReportEquipmentModel: $repairReportEquipmentModel, equipment: $equipment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairReportItemsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.repairReportEquipmentModel,
                    repairReportEquipmentModel) ||
                other.repairReportEquipmentModel ==
                    repairReportEquipmentModel) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, description, repairReportEquipmentModel, equipment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairReportItemsModelImplCopyWith<_$RepairReportItemsModelImpl>
      get copyWith => __$$RepairReportItemsModelImplCopyWithImpl<
          _$RepairReportItemsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairReportItemsModelImplToJson(
      this,
    );
  }
}

abstract class _RepairReportItemsModel implements RepairReportItemsModel {
  factory _RepairReportItemsModel(
      {required final String id,
      required final String description,
      final RepairReportEquipmentModel? repairReportEquipmentModel,
      final EquipmentModel? equipment}) = _$RepairReportItemsModelImpl;

  factory _RepairReportItemsModel.fromJson(Map<String, dynamic> json) =
      _$RepairReportItemsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  RepairReportEquipmentModel? get repairReportEquipmentModel;
  @override
  EquipmentModel? get equipment;
  @override
  @JsonKey(ignore: true)
  _$$RepairReportItemsModelImplCopyWith<_$RepairReportItemsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
