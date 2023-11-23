// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_report_createdBy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepairReportCreatedByModel _$RepairReportCreatedByModelFromJson(
    Map<String, dynamic> json) {
  return _RepairReportCreatedByModel.fromJson(json);
}

/// @nodoc
mixin _$RepairReportCreatedByModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairReportCreatedByModelCopyWith<RepairReportCreatedByModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairReportCreatedByModelCopyWith<$Res> {
  factory $RepairReportCreatedByModelCopyWith(RepairReportCreatedByModel value,
          $Res Function(RepairReportCreatedByModel) then) =
      _$RepairReportCreatedByModelCopyWithImpl<$Res,
          RepairReportCreatedByModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$RepairReportCreatedByModelCopyWithImpl<$Res,
        $Val extends RepairReportCreatedByModel>
    implements $RepairReportCreatedByModelCopyWith<$Res> {
  _$RepairReportCreatedByModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RepairReportCreatedByModelImplCopyWith<$Res>
    implements $RepairReportCreatedByModelCopyWith<$Res> {
  factory _$$RepairReportCreatedByModelImplCopyWith(
          _$RepairReportCreatedByModelImpl value,
          $Res Function(_$RepairReportCreatedByModelImpl) then) =
      __$$RepairReportCreatedByModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$RepairReportCreatedByModelImplCopyWithImpl<$Res>
    extends _$RepairReportCreatedByModelCopyWithImpl<$Res,
        _$RepairReportCreatedByModelImpl>
    implements _$$RepairReportCreatedByModelImplCopyWith<$Res> {
  __$$RepairReportCreatedByModelImplCopyWithImpl(
      _$RepairReportCreatedByModelImpl _value,
      $Res Function(_$RepairReportCreatedByModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RepairReportCreatedByModelImpl(
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
class _$RepairReportCreatedByModelImpl implements _RepairReportCreatedByModel {
  _$RepairReportCreatedByModelImpl({required this.id, required this.name});

  factory _$RepairReportCreatedByModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RepairReportCreatedByModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'RepairReportCreatedByModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairReportCreatedByModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairReportCreatedByModelImplCopyWith<_$RepairReportCreatedByModelImpl>
      get copyWith => __$$RepairReportCreatedByModelImplCopyWithImpl<
          _$RepairReportCreatedByModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairReportCreatedByModelImplToJson(
      this,
    );
  }
}

abstract class _RepairReportCreatedByModel
    implements RepairReportCreatedByModel {
  factory _RepairReportCreatedByModel(
      {required final String id,
      required final String name}) = _$RepairReportCreatedByModelImpl;

  factory _RepairReportCreatedByModel.fromJson(Map<String, dynamic> json) =
      _$RepairReportCreatedByModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RepairReportCreatedByModelImplCopyWith<_$RepairReportCreatedByModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
