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
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  EquipmentModel get equipmentModel => throw _privateConstructorUsedError;

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
      String name,
      String description,
      String status,
      String note,
      EquipmentModel equipmentModel});

  $EquipmentModelCopyWith<$Res> get equipmentModel;
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
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? note = null,
    Object? equipmentModel = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      equipmentModel: null == equipmentModel
          ? _value.equipmentModel
          : equipmentModel // ignore: cast_nullable_to_non_nullable
              as EquipmentModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentModelCopyWith<$Res> get equipmentModel {
    return $EquipmentModelCopyWith<$Res>(_value.equipmentModel, (value) {
      return _then(_value.copyWith(equipmentModel: value) as $Val);
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
      String name,
      String description,
      String status,
      String note,
      EquipmentModel equipmentModel});

  @override
  $EquipmentModelCopyWith<$Res> get equipmentModel;
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
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? note = null,
    Object? equipmentModel = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      equipmentModel: null == equipmentModel
          ? _value.equipmentModel
          : equipmentModel // ignore: cast_nullable_to_non_nullable
              as EquipmentModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairRequestModelImpl implements _RepairRequestModel {
  _$RepairRequestModelImpl(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.description,
      required this.status,
      required this.note,
      required this.equipmentModel});

  factory _$RepairRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairRequestModelImplFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String name;
  @override
  final String description;
  @override
  final String status;
  @override
  final String note;
  @override
  final EquipmentModel equipmentModel;

  @override
  String toString() {
    return 'RepairRequestModel(id: $id, createdAt: $createdAt, name: $name, description: $description, status: $status, note: $note, equipmentModel: $equipmentModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.equipmentModel, equipmentModel) ||
                other.equipmentModel == equipmentModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, name, description,
      status, note, equipmentModel);

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
      required final String name,
      required final String description,
      required final String status,
      required final String note,
      required final EquipmentModel equipmentModel}) = _$RepairRequestModelImpl;

  factory _RepairRequestModel.fromJson(Map<String, dynamic> json) =
      _$RepairRequestModelImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get name;
  @override
  String get description;
  @override
  String get status;
  @override
  String get note;
  @override
  EquipmentModel get equipmentModel;
  @override
  @JsonKey(ignore: true)
  _$$RepairRequestModelImplCopyWith<_$RepairRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
