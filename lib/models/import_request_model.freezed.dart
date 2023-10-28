// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImportRequestModel _$ImportRequestModelFromJson(Map<String, dynamic> json) {
  return _ImportRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ImportRequestModel {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportRequestModelCopyWith<ImportRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportRequestModelCopyWith<$Res> {
  factory $ImportRequestModelCopyWith(
          ImportRequestModel value, $Res Function(ImportRequestModel) then) =
      _$ImportRequestModelCopyWithImpl<$Res, ImportRequestModel>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String name,
      String description,
      String status,
      String note});
}

/// @nodoc
class _$ImportRequestModelCopyWithImpl<$Res, $Val extends ImportRequestModel>
    implements $ImportRequestModelCopyWith<$Res> {
  _$ImportRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImportRequestModelImplCopyWith<$Res>
    implements $ImportRequestModelCopyWith<$Res> {
  factory _$$ImportRequestModelImplCopyWith(_$ImportRequestModelImpl value,
          $Res Function(_$ImportRequestModelImpl) then) =
      __$$ImportRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String name,
      String description,
      String status,
      String note});
}

/// @nodoc
class __$$ImportRequestModelImplCopyWithImpl<$Res>
    extends _$ImportRequestModelCopyWithImpl<$Res, _$ImportRequestModelImpl>
    implements _$$ImportRequestModelImplCopyWith<$Res> {
  __$$ImportRequestModelImplCopyWithImpl(_$ImportRequestModelImpl _value,
      $Res Function(_$ImportRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? note = null,
  }) {
    return _then(_$ImportRequestModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImportRequestModelImpl implements _ImportRequestModel {
  _$ImportRequestModelImpl(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.description,
      required this.status,
      required this.note});

  factory _$ImportRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImportRequestModelImplFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String name;
  @override
  final String description;
  @override
  final String status;
  @override
  final String note;

  @override
  String toString() {
    return 'ImportRequestModel(id: $id, createdAt: $createdAt, name: $name, description: $description, status: $status, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, name, description, status, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportRequestModelImplCopyWith<_$ImportRequestModelImpl> get copyWith =>
      __$$ImportRequestModelImplCopyWithImpl<_$ImportRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ImportRequestModel implements ImportRequestModel {
  factory _ImportRequestModel(
      {required final String id,
      required final String createdAt,
      required final String name,
      required final String description,
      required final String status,
      required final String note}) = _$ImportRequestModelImpl;

  factory _ImportRequestModel.fromJson(Map<String, dynamic> json) =
      _$ImportRequestModelImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get name;
  @override
  String get description;
  @override
  String get status;
  @override
  String get note;
  @override
  @JsonKey(ignore: true)
  _$$ImportRequestModelImplCopyWith<_$ImportRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
