// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sender_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SenderModel _$SenderModelFromJson(Map<String, dynamic> json) {
  return _SenderModel.fromJson(json);
}

/// @nodoc
mixin _$SenderModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SenderModelCopyWith<SenderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SenderModelCopyWith<$Res> {
  factory $SenderModelCopyWith(
          SenderModel value, $Res Function(SenderModel) then) =
      _$SenderModelCopyWithImpl<$Res, SenderModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$SenderModelCopyWithImpl<$Res, $Val extends SenderModel>
    implements $SenderModelCopyWith<$Res> {
  _$SenderModelCopyWithImpl(this._value, this._then);

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
abstract class _$$SenderModelImplCopyWith<$Res>
    implements $SenderModelCopyWith<$Res> {
  factory _$$SenderModelImplCopyWith(
          _$SenderModelImpl value, $Res Function(_$SenderModelImpl) then) =
      __$$SenderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$SenderModelImplCopyWithImpl<$Res>
    extends _$SenderModelCopyWithImpl<$Res, _$SenderModelImpl>
    implements _$$SenderModelImplCopyWith<$Res> {
  __$$SenderModelImplCopyWithImpl(
      _$SenderModelImpl _value, $Res Function(_$SenderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$SenderModelImpl(
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
class _$SenderModelImpl implements _SenderModel {
  _$SenderModelImpl({required this.id, required this.name});

  factory _$SenderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SenderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'SenderModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SenderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SenderModelImplCopyWith<_$SenderModelImpl> get copyWith =>
      __$$SenderModelImplCopyWithImpl<_$SenderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SenderModelImplToJson(
      this,
    );
  }
}

abstract class _SenderModel implements SenderModel {
  factory _SenderModel({required final String id, required final String name}) =
      _$SenderModelImpl;

  factory _SenderModel.fromJson(Map<String, dynamic> json) =
      _$SenderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SenderModelImplCopyWith<_$SenderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
