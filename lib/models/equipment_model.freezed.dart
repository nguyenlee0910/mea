// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipmentModel _$EquipmentModelFromJson(Map<String, dynamic> json) {
  return _EquipmentModel.fromJson(json);
}

/// @nodoc
mixin _$EquipmentModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentModelCopyWith<EquipmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentModelCopyWith<$Res> {
  factory $EquipmentModelCopyWith(
          EquipmentModel value, $Res Function(EquipmentModel) then) =
      _$EquipmentModelCopyWithImpl<$Res, EquipmentModel>;
  @useResult
  $Res call({String id, String name, String code});
}

/// @nodoc
class _$EquipmentModelCopyWithImpl<$Res, $Val extends EquipmentModel>
    implements $EquipmentModelCopyWith<$Res> {
  _$EquipmentModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_EquipmentModelCopyWith<$Res>
    implements $EquipmentModelCopyWith<$Res> {
  factory _$$_EquipmentModelCopyWith(
          _$_EquipmentModel value, $Res Function(_$_EquipmentModel) then) =
      __$$_EquipmentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String code});
}

/// @nodoc
class __$$_EquipmentModelCopyWithImpl<$Res>
    extends _$EquipmentModelCopyWithImpl<$Res, _$_EquipmentModel>
    implements _$$_EquipmentModelCopyWith<$Res> {
  __$$_EquipmentModelCopyWithImpl(
      _$_EquipmentModel _value, $Res Function(_$_EquipmentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_EquipmentModel(
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
class _$_EquipmentModel implements _EquipmentModel {
  _$_EquipmentModel({required this.id, required this.name, required this.code});

  factory _$_EquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_EquipmentModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'EquipmentModel(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EquipmentModel &&
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
  _$$_EquipmentModelCopyWith<_$_EquipmentModel> get copyWith =>
      __$$_EquipmentModelCopyWithImpl<_$_EquipmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EquipmentModelToJson(
      this,
    );
  }
}

abstract class _EquipmentModel implements EquipmentModel {
  factory _EquipmentModel(
      {required final String id,
      required final String name,
      required final String code}) = _$_EquipmentModel;

  factory _EquipmentModel.fromJson(Map<String, dynamic> json) =
      _$_EquipmentModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_EquipmentModelCopyWith<_$_EquipmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
