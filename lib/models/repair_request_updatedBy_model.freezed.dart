// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_request_updatedBy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepairRequestUpdatedByModel _$RepairRequestUpdatedByModelFromJson(
    Map<String, dynamic> json) {
  return _RepairRequestUpdatedByModel.fromJson(json);
}

/// @nodoc
mixin _$RepairRequestUpdatedByModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairRequestUpdatedByModelCopyWith<RepairRequestUpdatedByModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairRequestUpdatedByModelCopyWith<$Res> {
  factory $RepairRequestUpdatedByModelCopyWith(
          RepairRequestUpdatedByModel value,
          $Res Function(RepairRequestUpdatedByModel) then) =
      _$RepairRequestUpdatedByModelCopyWithImpl<$Res,
          RepairRequestUpdatedByModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$RepairRequestUpdatedByModelCopyWithImpl<$Res,
        $Val extends RepairRequestUpdatedByModel>
    implements $RepairRequestUpdatedByModelCopyWith<$Res> {
  _$RepairRequestUpdatedByModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RepairRequestUpdatedByModelImplCopyWith<$Res>
    implements $RepairRequestUpdatedByModelCopyWith<$Res> {
  factory _$$RepairRequestUpdatedByModelImplCopyWith(
          _$RepairRequestUpdatedByModelImpl value,
          $Res Function(_$RepairRequestUpdatedByModelImpl) then) =
      __$$RepairRequestUpdatedByModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$RepairRequestUpdatedByModelImplCopyWithImpl<$Res>
    extends _$RepairRequestUpdatedByModelCopyWithImpl<$Res,
        _$RepairRequestUpdatedByModelImpl>
    implements _$$RepairRequestUpdatedByModelImplCopyWith<$Res> {
  __$$RepairRequestUpdatedByModelImplCopyWithImpl(
      _$RepairRequestUpdatedByModelImpl _value,
      $Res Function(_$RepairRequestUpdatedByModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RepairRequestUpdatedByModelImpl(
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
class _$RepairRequestUpdatedByModelImpl
    implements _RepairRequestUpdatedByModel {
  _$RepairRequestUpdatedByModelImpl({required this.id, required this.name});

  factory _$RepairRequestUpdatedByModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RepairRequestUpdatedByModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'RepairRequestUpdatedByModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairRequestUpdatedByModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairRequestUpdatedByModelImplCopyWith<_$RepairRequestUpdatedByModelImpl>
      get copyWith => __$$RepairRequestUpdatedByModelImplCopyWithImpl<
          _$RepairRequestUpdatedByModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairRequestUpdatedByModelImplToJson(
      this,
    );
  }
}

abstract class _RepairRequestUpdatedByModel
    implements RepairRequestUpdatedByModel {
  factory _RepairRequestUpdatedByModel(
      {required final String id,
      required final String name}) = _$RepairRequestUpdatedByModelImpl;

  factory _RepairRequestUpdatedByModel.fromJson(Map<String, dynamic> json) =
      _$RepairRequestUpdatedByModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RepairRequestUpdatedByModelImplCopyWith<_$RepairRequestUpdatedByModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
