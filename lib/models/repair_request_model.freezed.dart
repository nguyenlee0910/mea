// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepairRequestModel _$RepairRequestModelFromJson(Map<String, dynamic> json) {
  return _RepairRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RepairRequestModel {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  EquipmentModel get equipment => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  RepairRequestCreatedByModel get createdBy =>
      throw _privateConstructorUsedError;
  RepairRequestUpdatedByModel get updatedBy =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairRequestModelCopyWith<RepairRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairRequestModelCopyWith<$Res> {
  factory $RepairRequestModelCopyWith(
          RepairRequestModel value, $Res Function(RepairRequestModel) then) =
      _$RepairRequestModelCopyWithImpl<$Res, RepairRequestModel>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String description,
      String status,
      String note,
      EquipmentModel equipment,
      String updatedAt,
      RepairRequestCreatedByModel createdBy,
      RepairRequestUpdatedByModel updatedBy});

  $EquipmentModelCopyWith<$Res> get equipment;
  $RepairRequestCreatedByModelCopyWith<$Res> get createdBy;
  $RepairRequestUpdatedByModelCopyWith<$Res> get updatedBy;
}

/// @nodoc
class _$RepairRequestModelCopyWithImpl<$Res, $Val extends RepairRequestModel>
    implements $RepairRequestModelCopyWith<$Res> {
  _$RepairRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? description = null,
    Object? status = null,
    Object? note = null,
    Object? equipment = null,
    Object? updatedAt = null,
    Object? createdBy = null,
    Object? updatedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentModel,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as RepairRequestCreatedByModel,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as RepairRequestUpdatedByModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentModelCopyWith<$Res> get equipment {
    return $EquipmentModelCopyWith<$Res>(_value.equipment, (value) {
      return _then(_value.copyWith(equipment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RepairRequestCreatedByModelCopyWith<$Res> get createdBy {
    return $RepairRequestCreatedByModelCopyWith<$Res>(_value.createdBy,
        (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RepairRequestUpdatedByModelCopyWith<$Res> get updatedBy {
    return $RepairRequestUpdatedByModelCopyWith<$Res>(_value.updatedBy,
        (value) {
      return _then(_value.copyWith(updatedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepairRequestModelImplCopyWith<$Res>
    implements $RepairRequestModelCopyWith<$Res> {
  factory _$$RepairRequestModelImplCopyWith(_$RepairRequestModelImpl value,
          $Res Function(_$RepairRequestModelImpl) then) =
      __$$RepairRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String description,
      String status,
      String note,
      EquipmentModel equipment,
      String updatedAt,
      RepairRequestCreatedByModel createdBy,
      RepairRequestUpdatedByModel updatedBy});

  @override
  $EquipmentModelCopyWith<$Res> get equipment;
  @override
  $RepairRequestCreatedByModelCopyWith<$Res> get createdBy;
  @override
  $RepairRequestUpdatedByModelCopyWith<$Res> get updatedBy;
}

/// @nodoc
class __$$RepairRequestModelImplCopyWithImpl<$Res>
    extends _$RepairRequestModelCopyWithImpl<$Res, _$RepairRequestModelImpl>
    implements _$$RepairRequestModelImplCopyWith<$Res> {
  __$$RepairRequestModelImplCopyWithImpl(_$RepairRequestModelImpl _value,
      $Res Function(_$RepairRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? description = null,
    Object? status = null,
    Object? note = null,
    Object? equipment = null,
    Object? updatedAt = null,
    Object? createdBy = null,
    Object? updatedBy = null,
  }) {
    return _then(_$RepairRequestModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentModel,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as RepairRequestCreatedByModel,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as RepairRequestUpdatedByModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairRequestModelImpl implements _RepairRequestModel {
  _$RepairRequestModelImpl(
      {required this.id,
      required this.createdAt,
      required this.description,
      required this.status,
      required this.note,
      required this.equipment,
      required this.updatedAt,
      required this.createdBy,
      required this.updatedBy});

  factory _$RepairRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairRequestModelImplFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String description;
  @override
  final String status;
  @override
  final String note;
  @override
  final EquipmentModel equipment;
  @override
  final String updatedAt;
  @override
  final RepairRequestCreatedByModel createdBy;
  @override
  final RepairRequestUpdatedByModel updatedBy;

  @override
  String toString() {
    return 'RepairRequestModel(id: $id, createdAt: $createdAt, description: $description, status: $status, note: $note, equipment: $equipment, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, description,
      status, note, equipment, updatedAt, createdBy, updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairRequestModelImplCopyWith<_$RepairRequestModelImpl> get copyWith =>
      __$$RepairRequestModelImplCopyWithImpl<_$RepairRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairRequestModelImplToJson(
      this,
    );
  }
}

abstract class _RepairRequestModel implements RepairRequestModel {
  factory _RepairRequestModel(
          {required final String id,
          required final String createdAt,
          required final String description,
          required final String status,
          required final String note,
          required final EquipmentModel equipment,
          required final String updatedAt,
          required final RepairRequestCreatedByModel createdBy,
          required final RepairRequestUpdatedByModel updatedBy}) =
      _$RepairRequestModelImpl;

  factory _RepairRequestModel.fromJson(Map<String, dynamic> json) =
      _$RepairRequestModelImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get description;
  @override
  String get status;
  @override
  String get note;
  @override
  EquipmentModel get equipment;
  @override
  String get updatedAt;
  @override
  RepairRequestCreatedByModel get createdBy;
  @override
  RepairRequestUpdatedByModel get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$RepairRequestModelImplCopyWith<_$RepairRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
