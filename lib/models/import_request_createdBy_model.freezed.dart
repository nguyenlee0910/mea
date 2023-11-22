// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_request_createdBy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImportRequestCreatedByModel _$ImportRequestCreatedByModelFromJson(
    Map<String, dynamic> json) {
  return _ImportRequestCreatedByModel.fromJson(json);
}

/// @nodoc
mixin _$ImportRequestCreatedByModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportRequestCreatedByModelCopyWith<ImportRequestCreatedByModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportRequestCreatedByModelCopyWith<$Res> {
  factory $ImportRequestCreatedByModelCopyWith(
          ImportRequestCreatedByModel value,
          $Res Function(ImportRequestCreatedByModel) then) =
      _$ImportRequestCreatedByModelCopyWithImpl<$Res,
          ImportRequestCreatedByModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$ImportRequestCreatedByModelCopyWithImpl<$Res,
        $Val extends ImportRequestCreatedByModel>
    implements $ImportRequestCreatedByModelCopyWith<$Res> {
  _$ImportRequestCreatedByModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ImportRequestCreatedByModelImplCopyWith<$Res>
    implements $ImportRequestCreatedByModelCopyWith<$Res> {
  factory _$$ImportRequestCreatedByModelImplCopyWith(
          _$ImportRequestCreatedByModelImpl value,
          $Res Function(_$ImportRequestCreatedByModelImpl) then) =
      __$$ImportRequestCreatedByModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$ImportRequestCreatedByModelImplCopyWithImpl<$Res>
    extends _$ImportRequestCreatedByModelCopyWithImpl<$Res,
        _$ImportRequestCreatedByModelImpl>
    implements _$$ImportRequestCreatedByModelImplCopyWith<$Res> {
  __$$ImportRequestCreatedByModelImplCopyWithImpl(
      _$ImportRequestCreatedByModelImpl _value,
      $Res Function(_$ImportRequestCreatedByModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ImportRequestCreatedByModelImpl(
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
class _$ImportRequestCreatedByModelImpl
    implements _ImportRequestCreatedByModel {
  _$ImportRequestCreatedByModelImpl({required this.id, required this.name});

  factory _$ImportRequestCreatedByModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ImportRequestCreatedByModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'ImportRequestCreatedByModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportRequestCreatedByModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportRequestCreatedByModelImplCopyWith<_$ImportRequestCreatedByModelImpl>
      get copyWith => __$$ImportRequestCreatedByModelImplCopyWithImpl<
          _$ImportRequestCreatedByModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportRequestCreatedByModelImplToJson(
      this,
    );
  }
}

abstract class _ImportRequestCreatedByModel
    implements ImportRequestCreatedByModel {
  factory _ImportRequestCreatedByModel(
      {required final String id,
      required final String name}) = _$ImportRequestCreatedByModelImpl;

  factory _ImportRequestCreatedByModel.fromJson(Map<String, dynamic> json) =
      _$ImportRequestCreatedByModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ImportRequestCreatedByModelImplCopyWith<_$ImportRequestCreatedByModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
