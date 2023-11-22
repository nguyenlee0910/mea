// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_request_updatedBy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImportRequestUpdatedByModel _$ImportRequestUpdatedByModelFromJson(
    Map<String, dynamic> json) {
  return _ImportRequestUpdatedByModel.fromJson(json);
}

/// @nodoc
mixin _$ImportRequestUpdatedByModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportRequestUpdatedByModelCopyWith<ImportRequestUpdatedByModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportRequestUpdatedByModelCopyWith<$Res> {
  factory $ImportRequestUpdatedByModelCopyWith(
          ImportRequestUpdatedByModel value,
          $Res Function(ImportRequestUpdatedByModel) then) =
      _$ImportRequestUpdatedByModelCopyWithImpl<$Res,
          ImportRequestUpdatedByModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$ImportRequestUpdatedByModelCopyWithImpl<$Res,
        $Val extends ImportRequestUpdatedByModel>
    implements $ImportRequestUpdatedByModelCopyWith<$Res> {
  _$ImportRequestUpdatedByModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ImportRequestUpdatedByModelImplCopyWith<$Res>
    implements $ImportRequestUpdatedByModelCopyWith<$Res> {
  factory _$$ImportRequestUpdatedByModelImplCopyWith(
          _$ImportRequestUpdatedByModelImpl value,
          $Res Function(_$ImportRequestUpdatedByModelImpl) then) =
      __$$ImportRequestUpdatedByModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$ImportRequestUpdatedByModelImplCopyWithImpl<$Res>
    extends _$ImportRequestUpdatedByModelCopyWithImpl<$Res,
        _$ImportRequestUpdatedByModelImpl>
    implements _$$ImportRequestUpdatedByModelImplCopyWith<$Res> {
  __$$ImportRequestUpdatedByModelImplCopyWithImpl(
      _$ImportRequestUpdatedByModelImpl _value,
      $Res Function(_$ImportRequestUpdatedByModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ImportRequestUpdatedByModelImpl(
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
class _$ImportRequestUpdatedByModelImpl
    implements _ImportRequestUpdatedByModel {
  _$ImportRequestUpdatedByModelImpl({required this.id, required this.name});

  factory _$ImportRequestUpdatedByModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ImportRequestUpdatedByModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'ImportRequestUpdatedByModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportRequestUpdatedByModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportRequestUpdatedByModelImplCopyWith<_$ImportRequestUpdatedByModelImpl>
      get copyWith => __$$ImportRequestUpdatedByModelImplCopyWithImpl<
          _$ImportRequestUpdatedByModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportRequestUpdatedByModelImplToJson(
      this,
    );
  }
}

abstract class _ImportRequestUpdatedByModel
    implements ImportRequestUpdatedByModel {
  factory _ImportRequestUpdatedByModel(
      {required final String id,
      required final String name}) = _$ImportRequestUpdatedByModelImpl;

  factory _ImportRequestUpdatedByModel.fromJson(Map<String, dynamic> json) =
      _$ImportRequestUpdatedByModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ImportRequestUpdatedByModelImplCopyWith<_$ImportRequestUpdatedByModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
