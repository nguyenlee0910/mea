// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_request_createdBy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepairRequestCreatedByModel _$RepairRequestCreatedByModelFromJson(
    Map<String, dynamic> json) {
  return _RepairRequestCreatedByModel.fromJson(json);
}

/// @nodoc
mixin _$RepairRequestCreatedByModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairRequestCreatedByModelCopyWith<RepairRequestCreatedByModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairRequestCreatedByModelCopyWith<$Res> {
  factory $RepairRequestCreatedByModelCopyWith(
          RepairRequestCreatedByModel value,
          $Res Function(RepairRequestCreatedByModel) then) =
      _$RepairRequestCreatedByModelCopyWithImpl<$Res,
          RepairRequestCreatedByModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$RepairRequestCreatedByModelCopyWithImpl<$Res,
        $Val extends RepairRequestCreatedByModel>
    implements $RepairRequestCreatedByModelCopyWith<$Res> {
  _$RepairRequestCreatedByModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RepairRequestCreatedByModelImplCopyWith<$Res>
    implements $RepairRequestCreatedByModelCopyWith<$Res> {
  factory _$$RepairRequestCreatedByModelImplCopyWith(
          _$RepairRequestCreatedByModelImpl value,
          $Res Function(_$RepairRequestCreatedByModelImpl) then) =
      __$$RepairRequestCreatedByModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$RepairRequestCreatedByModelImplCopyWithImpl<$Res>
    extends _$RepairRequestCreatedByModelCopyWithImpl<$Res,
        _$RepairRequestCreatedByModelImpl>
    implements _$$RepairRequestCreatedByModelImplCopyWith<$Res> {
  __$$RepairRequestCreatedByModelImplCopyWithImpl(
      _$RepairRequestCreatedByModelImpl _value,
      $Res Function(_$RepairRequestCreatedByModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RepairRequestCreatedByModelImpl(
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
class _$RepairRequestCreatedByModelImpl
    implements _RepairRequestCreatedByModel {
  _$RepairRequestCreatedByModelImpl({required this.id, required this.name});

  factory _$RepairRequestCreatedByModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RepairRequestCreatedByModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'RepairRequestCreatedByModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairRequestCreatedByModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairRequestCreatedByModelImplCopyWith<_$RepairRequestCreatedByModelImpl>
      get copyWith => __$$RepairRequestCreatedByModelImplCopyWithImpl<
          _$RepairRequestCreatedByModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairRequestCreatedByModelImplToJson(
      this,
    );
  }
}

abstract class _RepairRequestCreatedByModel
    implements RepairRequestCreatedByModel {
  factory _RepairRequestCreatedByModel(
      {required final String id,
      required final String name}) = _$RepairRequestCreatedByModelImpl;

  factory _RepairRequestCreatedByModel.fromJson(Map<String, dynamic> json) =
      _$RepairRequestCreatedByModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RepairRequestCreatedByModelImplCopyWith<_$RepairRequestCreatedByModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
