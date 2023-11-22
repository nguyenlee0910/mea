// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipmentCategoryModel _$EquipmentCategoryModelFromJson(
    Map<String, dynamic> json) {
  return _EquipmentCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$EquipmentCategoryModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentCategoryModelCopyWith<EquipmentCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentCategoryModelCopyWith<$Res> {
  factory $EquipmentCategoryModelCopyWith(EquipmentCategoryModel value,
          $Res Function(EquipmentCategoryModel) then) =
      _$EquipmentCategoryModelCopyWithImpl<$Res, EquipmentCategoryModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$EquipmentCategoryModelCopyWithImpl<$Res,
        $Val extends EquipmentCategoryModel>
    implements $EquipmentCategoryModelCopyWith<$Res> {
  _$EquipmentCategoryModelCopyWithImpl(this._value, this._then);

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
abstract class _$$EquipmentCategoryModelImplCopyWith<$Res>
    implements $EquipmentCategoryModelCopyWith<$Res> {
  factory _$$EquipmentCategoryModelImplCopyWith(
          _$EquipmentCategoryModelImpl value,
          $Res Function(_$EquipmentCategoryModelImpl) then) =
      __$$EquipmentCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$EquipmentCategoryModelImplCopyWithImpl<$Res>
    extends _$EquipmentCategoryModelCopyWithImpl<$Res,
        _$EquipmentCategoryModelImpl>
    implements _$$EquipmentCategoryModelImplCopyWith<$Res> {
  __$$EquipmentCategoryModelImplCopyWithImpl(
      _$EquipmentCategoryModelImpl _value,
      $Res Function(_$EquipmentCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$EquipmentCategoryModelImpl(
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
class _$EquipmentCategoryModelImpl implements _EquipmentCategoryModel {
  _$EquipmentCategoryModelImpl({required this.id, required this.name});

  factory _$EquipmentCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EquipmentCategoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'EquipmentCategoryModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EquipmentCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentCategoryModelImplCopyWith<_$EquipmentCategoryModelImpl>
      get copyWith => __$$EquipmentCategoryModelImplCopyWithImpl<
          _$EquipmentCategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _EquipmentCategoryModel implements EquipmentCategoryModel {
  factory _EquipmentCategoryModel(
      {required final String id,
      required final String name}) = _$EquipmentCategoryModelImpl;

  factory _EquipmentCategoryModel.fromJson(Map<String, dynamic> json) =
      _$EquipmentCategoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$EquipmentCategoryModelImplCopyWith<_$EquipmentCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
