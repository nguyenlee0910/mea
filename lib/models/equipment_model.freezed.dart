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
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get imageUrls => throw _privateConstructorUsedError;
  String? get endOfWarrantyDate => throw _privateConstructorUsedError;
  String? get currentStatus => throw _privateConstructorUsedError;
  EquipmentCategoryModel? get equipmentCategory =>
      throw _privateConstructorUsedError;
  BrandModel? get brand => throw _privateConstructorUsedError;
  EquipmentMaintainScheduleModel? get equipmentMaintainSchedule =>
      throw _privateConstructorUsedError;
  ImportRequestItemsModel? get importRequestItemsModel =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {String? id,
      String? name,
      String? code,
      String? description,
      List<String>? imageUrls,
      String? endOfWarrantyDate,
      String? currentStatus,
      EquipmentCategoryModel? equipmentCategory,
      BrandModel? brand,
      EquipmentMaintainScheduleModel? equipmentMaintainSchedule,
      ImportRequestItemsModel? importRequestItemsModel});

  $EquipmentCategoryModelCopyWith<$Res>? get equipmentCategory;
  $BrandModelCopyWith<$Res>? get brand;
  $EquipmentMaintainScheduleModelCopyWith<$Res>? get equipmentMaintainSchedule;
  $ImportRequestItemsModelCopyWith<$Res>? get importRequestItemsModel;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? imageUrls = freezed,
    Object? endOfWarrantyDate = freezed,
    Object? currentStatus = freezed,
    Object? equipmentCategory = freezed,
    Object? brand = freezed,
    Object? equipmentMaintainSchedule = freezed,
    Object? importRequestItemsModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      endOfWarrantyDate: freezed == endOfWarrantyDate
          ? _value.endOfWarrantyDate
          : endOfWarrantyDate // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStatus: freezed == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      equipmentCategory: freezed == equipmentCategory
          ? _value.equipmentCategory
          : equipmentCategory // ignore: cast_nullable_to_non_nullable
              as EquipmentCategoryModel?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandModel?,
      equipmentMaintainSchedule: freezed == equipmentMaintainSchedule
          ? _value.equipmentMaintainSchedule
          : equipmentMaintainSchedule // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintainScheduleModel?,
      importRequestItemsModel: freezed == importRequestItemsModel
          ? _value.importRequestItemsModel
          : importRequestItemsModel // ignore: cast_nullable_to_non_nullable
              as ImportRequestItemsModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentCategoryModelCopyWith<$Res>? get equipmentCategory {
    if (_value.equipmentCategory == null) {
      return null;
    }

    return $EquipmentCategoryModelCopyWith<$Res>(_value.equipmentCategory!,
        (value) {
      return _then(_value.copyWith(equipmentCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BrandModelCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandModelCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentMaintainScheduleModelCopyWith<$Res>? get equipmentMaintainSchedule {
    if (_value.equipmentMaintainSchedule == null) {
      return null;
    }

    return $EquipmentMaintainScheduleModelCopyWith<$Res>(
        _value.equipmentMaintainSchedule!, (value) {
      return _then(_value.copyWith(equipmentMaintainSchedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImportRequestItemsModelCopyWith<$Res>? get importRequestItemsModel {
    if (_value.importRequestItemsModel == null) {
      return null;
    }

    return $ImportRequestItemsModelCopyWith<$Res>(
        _value.importRequestItemsModel!, (value) {
      return _then(_value.copyWith(importRequestItemsModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EquipmentModelImplCopyWith<$Res>
    implements $EquipmentModelCopyWith<$Res> {
  factory _$$EquipmentModelImplCopyWith(_$EquipmentModelImpl value,
          $Res Function(_$EquipmentModelImpl) then) =
      __$$EquipmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? code,
      String? description,
      List<String>? imageUrls,
      String? endOfWarrantyDate,
      String? currentStatus,
      EquipmentCategoryModel? equipmentCategory,
      BrandModel? brand,
      EquipmentMaintainScheduleModel? equipmentMaintainSchedule,
      ImportRequestItemsModel? importRequestItemsModel});

  @override
  $EquipmentCategoryModelCopyWith<$Res>? get equipmentCategory;
  @override
  $BrandModelCopyWith<$Res>? get brand;
  @override
  $EquipmentMaintainScheduleModelCopyWith<$Res>? get equipmentMaintainSchedule;
  @override
  $ImportRequestItemsModelCopyWith<$Res>? get importRequestItemsModel;
}

/// @nodoc
class __$$EquipmentModelImplCopyWithImpl<$Res>
    extends _$EquipmentModelCopyWithImpl<$Res, _$EquipmentModelImpl>
    implements _$$EquipmentModelImplCopyWith<$Res> {
  __$$EquipmentModelImplCopyWithImpl(
      _$EquipmentModelImpl _value, $Res Function(_$EquipmentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? imageUrls = freezed,
    Object? endOfWarrantyDate = freezed,
    Object? currentStatus = freezed,
    Object? equipmentCategory = freezed,
    Object? brand = freezed,
    Object? equipmentMaintainSchedule = freezed,
    Object? importRequestItemsModel = freezed,
  }) {
    return _then(_$EquipmentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      endOfWarrantyDate: freezed == endOfWarrantyDate
          ? _value.endOfWarrantyDate
          : endOfWarrantyDate // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStatus: freezed == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      equipmentCategory: freezed == equipmentCategory
          ? _value.equipmentCategory
          : equipmentCategory // ignore: cast_nullable_to_non_nullable
              as EquipmentCategoryModel?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandModel?,
      equipmentMaintainSchedule: freezed == equipmentMaintainSchedule
          ? _value.equipmentMaintainSchedule
          : equipmentMaintainSchedule // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintainScheduleModel?,
      importRequestItemsModel: freezed == importRequestItemsModel
          ? _value.importRequestItemsModel
          : importRequestItemsModel // ignore: cast_nullable_to_non_nullable
              as ImportRequestItemsModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipmentModelImpl implements _EquipmentModel {
  _$EquipmentModelImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.description,
      required final List<String>? imageUrls,
      required this.endOfWarrantyDate,
      required this.currentStatus,
      required this.equipmentCategory,
      required this.brand,
      this.equipmentMaintainSchedule,
      this.importRequestItemsModel})
      : _imageUrls = imageUrls;

  factory _$EquipmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EquipmentModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? description;
  final List<String>? _imageUrls;
  @override
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? endOfWarrantyDate;
  @override
  final String? currentStatus;
  @override
  final EquipmentCategoryModel? equipmentCategory;
  @override
  final BrandModel? brand;
  @override
  final EquipmentMaintainScheduleModel? equipmentMaintainSchedule;
  @override
  final ImportRequestItemsModel? importRequestItemsModel;

  @override
  String toString() {
    return 'EquipmentModel(id: $id, name: $name, code: $code, description: $description, imageUrls: $imageUrls, endOfWarrantyDate: $endOfWarrantyDate, currentStatus: $currentStatus, equipmentCategory: $equipmentCategory, brand: $brand, equipmentMaintainSchedule: $equipmentMaintainSchedule, importRequestItemsModel: $importRequestItemsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EquipmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.endOfWarrantyDate, endOfWarrantyDate) ||
                other.endOfWarrantyDate == endOfWarrantyDate) &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            (identical(other.equipmentCategory, equipmentCategory) ||
                other.equipmentCategory == equipmentCategory) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.equipmentMaintainSchedule,
                    equipmentMaintainSchedule) ||
                other.equipmentMaintainSchedule == equipmentMaintainSchedule) &&
            (identical(
                    other.importRequestItemsModel, importRequestItemsModel) ||
                other.importRequestItemsModel == importRequestItemsModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      code,
      description,
      const DeepCollectionEquality().hash(_imageUrls),
      endOfWarrantyDate,
      currentStatus,
      equipmentCategory,
      brand,
      equipmentMaintainSchedule,
      importRequestItemsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentModelImplCopyWith<_$EquipmentModelImpl> get copyWith =>
      __$$EquipmentModelImplCopyWithImpl<_$EquipmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentModelImplToJson(
      this,
    );
  }
}

abstract class _EquipmentModel implements EquipmentModel {
  factory _EquipmentModel(
          {required final String? id,
          required final String? name,
          required final String? code,
          required final String? description,
          required final List<String>? imageUrls,
          required final String? endOfWarrantyDate,
          required final String? currentStatus,
          required final EquipmentCategoryModel? equipmentCategory,
          required final BrandModel? brand,
          final EquipmentMaintainScheduleModel? equipmentMaintainSchedule,
          final ImportRequestItemsModel? importRequestItemsModel}) =
      _$EquipmentModelImpl;

  factory _EquipmentModel.fromJson(Map<String, dynamic> json) =
      _$EquipmentModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get code;
  @override
  String? get description;
  @override
  List<String>? get imageUrls;
  @override
  String? get endOfWarrantyDate;
  @override
  String? get currentStatus;
  @override
  EquipmentCategoryModel? get equipmentCategory;
  @override
  BrandModel? get brand;
  @override
  EquipmentMaintainScheduleModel? get equipmentMaintainSchedule;
  @override
  ImportRequestItemsModel? get importRequestItemsModel;
  @override
  @JsonKey(ignore: true)
  _$$EquipmentModelImplCopyWith<_$EquipmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
