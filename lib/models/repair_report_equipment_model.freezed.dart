// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_report_equipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepairReportEquipmentModel _$RepairReportEquipmentModelFromJson(
    Map<String, dynamic> json) {
  return _RepairReportEquipmentModel.fromJson(json);
}

/// @nodoc
mixin _$RepairReportEquipmentModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairReportEquipmentModelCopyWith<RepairReportEquipmentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairReportEquipmentModelCopyWith<$Res> {
  factory $RepairReportEquipmentModelCopyWith(RepairReportEquipmentModel value,
          $Res Function(RepairReportEquipmentModel) then) =
      _$RepairReportEquipmentModelCopyWithImpl<$Res,
          RepairReportEquipmentModel>;
  @useResult
  $Res call({String id, String name, String code});
}

/// @nodoc
class _$RepairReportEquipmentModelCopyWithImpl<$Res,
        $Val extends RepairReportEquipmentModel>
    implements $RepairReportEquipmentModelCopyWith<$Res> {
  _$RepairReportEquipmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairReportEquipmentModelImplCopyWith<$Res>
    implements $RepairReportEquipmentModelCopyWith<$Res> {
  factory _$$RepairReportEquipmentModelImplCopyWith(
          _$RepairReportEquipmentModelImpl value,
          $Res Function(_$RepairReportEquipmentModelImpl) then) =
      __$$RepairReportEquipmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String code});
}

/// @nodoc
class __$$RepairReportEquipmentModelImplCopyWithImpl<$Res>
    extends _$RepairReportEquipmentModelCopyWithImpl<$Res,
        _$RepairReportEquipmentModelImpl>
    implements _$$RepairReportEquipmentModelImplCopyWith<$Res> {
  __$$RepairReportEquipmentModelImplCopyWithImpl(
      _$RepairReportEquipmentModelImpl _value,
      $Res Function(_$RepairReportEquipmentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$RepairReportEquipmentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairReportEquipmentModelImpl implements _RepairReportEquipmentModel {
  _$RepairReportEquipmentModelImpl(
      {required this.id, required this.name, required this.code});

  factory _$RepairReportEquipmentModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RepairReportEquipmentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'RepairReportEquipmentModel(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairReportEquipmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairReportEquipmentModelImplCopyWith<_$RepairReportEquipmentModelImpl>
      get copyWith => __$$RepairReportEquipmentModelImplCopyWithImpl<
          _$RepairReportEquipmentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairReportEquipmentModelImplToJson(
      this,
    );
  }
}

abstract class _RepairReportEquipmentModel
    implements RepairReportEquipmentModel {
  factory _RepairReportEquipmentModel(
      {required final String id,
      required final String name,
      required final String code}) = _$RepairReportEquipmentModelImpl;

  factory _RepairReportEquipmentModel.fromJson(Map<String, dynamic> json) =
      _$RepairReportEquipmentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$RepairReportEquipmentModelImplCopyWith<_$RepairReportEquipmentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
