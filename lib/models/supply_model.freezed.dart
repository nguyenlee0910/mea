// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupplyModel _$SupplyModelFromJson(Map<String, dynamic> json) {
  return _SupplyModel.fromJson(json);
}

/// @nodoc
mixin _$SupplyModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupplyModelCopyWith<SupplyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplyModelCopyWith<$Res> {
  factory $SupplyModelCopyWith(
          SupplyModel value, $Res Function(SupplyModel) then) =
      _$SupplyModelCopyWithImpl<$Res, SupplyModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String unit,
      String quantity,
      List<String> imageUrls});
}

/// @nodoc
class _$SupplyModelCopyWithImpl<$Res, $Val extends SupplyModel>
    implements $SupplyModelCopyWith<$Res> {
  _$SupplyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? unit = null,
    Object? quantity = null,
    Object? imageUrls = null,
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
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupplyModelImplCopyWith<$Res>
    implements $SupplyModelCopyWith<$Res> {
  factory _$$SupplyModelImplCopyWith(
          _$SupplyModelImpl value, $Res Function(_$SupplyModelImpl) then) =
      __$$SupplyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String unit,
      String quantity,
      List<String> imageUrls});
}

/// @nodoc
class __$$SupplyModelImplCopyWithImpl<$Res>
    extends _$SupplyModelCopyWithImpl<$Res, _$SupplyModelImpl>
    implements _$$SupplyModelImplCopyWith<$Res> {
  __$$SupplyModelImplCopyWithImpl(
      _$SupplyModelImpl _value, $Res Function(_$SupplyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? unit = null,
    Object? quantity = null,
    Object? imageUrls = null,
  }) {
    return _then(_$SupplyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupplyModelImpl implements _SupplyModel {
  _$SupplyModelImpl(
      {required this.id,
      required this.name,
      required this.unit,
      required this.quantity,
      required final List<String> imageUrls})
      : _imageUrls = imageUrls;

  factory _$SupplyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplyModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String unit;
  @override
  final String quantity;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  String toString() {
    return 'SupplyModel(id: $id, name: $name, unit: $unit, quantity: $quantity, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, unit, quantity,
      const DeepCollectionEquality().hash(_imageUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplyModelImplCopyWith<_$SupplyModelImpl> get copyWith =>
      __$$SupplyModelImplCopyWithImpl<_$SupplyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplyModelImplToJson(
      this,
    );
  }
}

abstract class _SupplyModel implements SupplyModel {
  factory _SupplyModel(
      {required final String id,
      required final String name,
      required final String unit,
      required final String quantity,
      required final List<String> imageUrls}) = _$SupplyModelImpl;

  factory _SupplyModel.fromJson(Map<String, dynamic> json) =
      _$SupplyModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get unit;
  @override
  String get quantity;
  @override
  List<String> get imageUrls;
  @override
  @JsonKey(ignore: true)
  _$$SupplyModelImplCopyWith<_$SupplyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
