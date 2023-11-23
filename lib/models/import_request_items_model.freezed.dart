// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_request_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImportRequestItemsModel _$ImportRequestItemsModelFromJson(
    Map<String, dynamic> json) {
  return _ImportRequestItemsModel.fromJson(json);
}

/// @nodoc
mixin _$ImportRequestItemsModel {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<SupplyModel> get supply => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportRequestItemsModelCopyWith<ImportRequestItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportRequestItemsModelCopyWith<$Res> {
  factory $ImportRequestItemsModelCopyWith(ImportRequestItemsModel value,
          $Res Function(ImportRequestItemsModel) then) =
      _$ImportRequestItemsModelCopyWithImpl<$Res, ImportRequestItemsModel>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updatedAt,
      List<SupplyModel> supply,
      String quantity});
}

/// @nodoc
class _$ImportRequestItemsModelCopyWithImpl<$Res,
        $Val extends ImportRequestItemsModel>
    implements $ImportRequestItemsModelCopyWith<$Res> {
  _$ImportRequestItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? supply = null,
    Object? quantity = null,
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as List<SupplyModel>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImportRequestItemsModelImplCopyWith<$Res>
    implements $ImportRequestItemsModelCopyWith<$Res> {
  factory _$$ImportRequestItemsModelImplCopyWith(
          _$ImportRequestItemsModelImpl value,
          $Res Function(_$ImportRequestItemsModelImpl) then) =
      __$$ImportRequestItemsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updatedAt,
      List<SupplyModel> supply,
      String quantity});
}

/// @nodoc
class __$$ImportRequestItemsModelImplCopyWithImpl<$Res>
    extends _$ImportRequestItemsModelCopyWithImpl<$Res,
        _$ImportRequestItemsModelImpl>
    implements _$$ImportRequestItemsModelImplCopyWith<$Res> {
  __$$ImportRequestItemsModelImplCopyWithImpl(
      _$ImportRequestItemsModelImpl _value,
      $Res Function(_$ImportRequestItemsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? supply = null,
    Object? quantity = null,
  }) {
    return _then(_$ImportRequestItemsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      supply: null == supply
          ? _value._supply
          : supply // ignore: cast_nullable_to_non_nullable
              as List<SupplyModel>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImportRequestItemsModelImpl implements _ImportRequestItemsModel {
  _$ImportRequestItemsModelImpl(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required final List<SupplyModel> supply,
      required this.quantity})
      : _supply = supply;

  factory _$ImportRequestItemsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImportRequestItemsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  final List<SupplyModel> _supply;
  @override
  List<SupplyModel> get supply {
    if (_supply is EqualUnmodifiableListView) return _supply;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supply);
  }

  @override
  final String quantity;

  @override
  String toString() {
    return 'ImportRequestItemsModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, supply: $supply, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportRequestItemsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._supply, _supply) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt,
      const DeepCollectionEquality().hash(_supply), quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportRequestItemsModelImplCopyWith<_$ImportRequestItemsModelImpl>
      get copyWith => __$$ImportRequestItemsModelImplCopyWithImpl<
          _$ImportRequestItemsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImportRequestItemsModelImplToJson(
      this,
    );
  }
}

abstract class _ImportRequestItemsModel implements ImportRequestItemsModel {
  factory _ImportRequestItemsModel(
      {required final String id,
      required final String createdAt,
      required final String updatedAt,
      required final List<SupplyModel> supply,
      required final String quantity}) = _$ImportRequestItemsModelImpl;

  factory _ImportRequestItemsModel.fromJson(Map<String, dynamic> json) =
      _$ImportRequestItemsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  List<SupplyModel> get supply;
  @override
  String get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ImportRequestItemsModelImplCopyWith<_$ImportRequestItemsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
