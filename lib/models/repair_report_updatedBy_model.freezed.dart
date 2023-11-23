// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_report_updatedBy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepairReportUpdatedByModel _$RepairReportUpdatedByModelFromJson(
    Map<String, dynamic> json) {
  return _RepairReportUpdatedByModel.fromJson(json);
}

/// @nodoc
mixin _$RepairReportUpdatedByModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairReportUpdatedByModelCopyWith<RepairReportUpdatedByModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairReportUpdatedByModelCopyWith<$Res> {
  factory $RepairReportUpdatedByModelCopyWith(RepairReportUpdatedByModel value,
          $Res Function(RepairReportUpdatedByModel) then) =
      _$RepairReportUpdatedByModelCopyWithImpl<$Res,
          RepairReportUpdatedByModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$RepairReportUpdatedByModelCopyWithImpl<$Res,
        $Val extends RepairReportUpdatedByModel>
    implements $RepairReportUpdatedByModelCopyWith<$Res> {
  _$RepairReportUpdatedByModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairReportUpdatedByModelImplCopyWith<$Res>
    implements $RepairReportUpdatedByModelCopyWith<$Res> {
  factory _$$RepairReportUpdatedByModelImplCopyWith(
          _$RepairReportUpdatedByModelImpl value,
          $Res Function(_$RepairReportUpdatedByModelImpl) then) =
      __$$RepairReportUpdatedByModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$RepairReportUpdatedByModelImplCopyWithImpl<$Res>
    extends _$RepairReportUpdatedByModelCopyWithImpl<$Res,
        _$RepairReportUpdatedByModelImpl>
    implements _$$RepairReportUpdatedByModelImplCopyWith<$Res> {
  __$$RepairReportUpdatedByModelImplCopyWithImpl(
      _$RepairReportUpdatedByModelImpl _value,
      $Res Function(_$RepairReportUpdatedByModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RepairReportUpdatedByModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairReportUpdatedByModelImpl implements _RepairReportUpdatedByModel {
  _$RepairReportUpdatedByModelImpl({required this.id, required this.name});

  factory _$RepairReportUpdatedByModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RepairReportUpdatedByModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'RepairReportUpdatedByModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairReportUpdatedByModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairReportUpdatedByModelImplCopyWith<_$RepairReportUpdatedByModelImpl>
      get copyWith => __$$RepairReportUpdatedByModelImplCopyWithImpl<
          _$RepairReportUpdatedByModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairReportUpdatedByModelImplToJson(
      this,
    );
  }
}

abstract class _RepairReportUpdatedByModel
    implements RepairReportUpdatedByModel {
  factory _RepairReportUpdatedByModel(
      {required final String id,
      required final String name}) = _$RepairReportUpdatedByModelImpl;

  factory _RepairReportUpdatedByModel.fromJson(Map<String, dynamic> json) =
      _$RepairReportUpdatedByModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RepairReportUpdatedByModelImplCopyWith<_$RepairReportUpdatedByModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
