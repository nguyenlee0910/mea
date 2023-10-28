// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_maintain_schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipmentMaintainScheduleModel _$EquipmentMaintainScheduleModelFromJson(
    Map<String, dynamic> json) {
  return _EquipmentMaintainScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$EquipmentMaintainScheduleModel {
  String get id => throw _privateConstructorUsedError;
  String get lastMaintainDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentMaintainScheduleModelCopyWith<EquipmentMaintainScheduleModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentMaintainScheduleModelCopyWith<$Res> {
  factory $EquipmentMaintainScheduleModelCopyWith(
          EquipmentMaintainScheduleModel value,
          $Res Function(EquipmentMaintainScheduleModel) then) =
      _$EquipmentMaintainScheduleModelCopyWithImpl<$Res,
          EquipmentMaintainScheduleModel>;
  @useResult
  $Res call({String id, String lastMaintainDate});
}

/// @nodoc
class _$EquipmentMaintainScheduleModelCopyWithImpl<$Res,
        $Val extends EquipmentMaintainScheduleModel>
    implements $EquipmentMaintainScheduleModelCopyWith<$Res> {
  _$EquipmentMaintainScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastMaintainDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastMaintainDate: null == lastMaintainDate
          ? _value.lastMaintainDate
          : lastMaintainDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipmentMaintainScheduleModelImplCopyWith<$Res>
    implements $EquipmentMaintainScheduleModelCopyWith<$Res> {
  factory _$$EquipmentMaintainScheduleModelImplCopyWith(
          _$EquipmentMaintainScheduleModelImpl value,
          $Res Function(_$EquipmentMaintainScheduleModelImpl) then) =
      __$$EquipmentMaintainScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String lastMaintainDate});
}

/// @nodoc
class __$$EquipmentMaintainScheduleModelImplCopyWithImpl<$Res>
    extends _$EquipmentMaintainScheduleModelCopyWithImpl<$Res,
        _$EquipmentMaintainScheduleModelImpl>
    implements _$$EquipmentMaintainScheduleModelImplCopyWith<$Res> {
  __$$EquipmentMaintainScheduleModelImplCopyWithImpl(
      _$EquipmentMaintainScheduleModelImpl _value,
      $Res Function(_$EquipmentMaintainScheduleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastMaintainDate = null,
  }) {
    return _then(_$EquipmentMaintainScheduleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastMaintainDate: null == lastMaintainDate
          ? _value.lastMaintainDate
          : lastMaintainDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipmentMaintainScheduleModelImpl
    implements _EquipmentMaintainScheduleModel {
  _$EquipmentMaintainScheduleModelImpl(
      {required this.id, required this.lastMaintainDate});

  factory _$EquipmentMaintainScheduleModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipmentMaintainScheduleModelImplFromJson(json);

  @override
  final String id;
  @override
  final String lastMaintainDate;

  @override
  String toString() {
    return 'EquipmentMaintainScheduleModel(id: $id, lastMaintainDate: $lastMaintainDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EquipmentMaintainScheduleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastMaintainDate, lastMaintainDate) ||
                other.lastMaintainDate == lastMaintainDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, lastMaintainDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentMaintainScheduleModelImplCopyWith<
          _$EquipmentMaintainScheduleModelImpl>
      get copyWith => __$$EquipmentMaintainScheduleModelImplCopyWithImpl<
          _$EquipmentMaintainScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentMaintainScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _EquipmentMaintainScheduleModel
    implements EquipmentMaintainScheduleModel {
  factory _EquipmentMaintainScheduleModel(
          {required final String id, required final String lastMaintainDate}) =
      _$EquipmentMaintainScheduleModelImpl;

  factory _EquipmentMaintainScheduleModel.fromJson(Map<String, dynamic> json) =
      _$EquipmentMaintainScheduleModelImpl.fromJson;

  @override
  String get id;
  @override
  String get lastMaintainDate;
  @override
  @JsonKey(ignore: true)
  _$$EquipmentMaintainScheduleModelImplCopyWith<
          _$EquipmentMaintainScheduleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
