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
  String get description => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  EquipmentMaintainScheduleModel? get equipmentMaintainSchedule =>
      throw _privateConstructorUsedError;
  String get endOfWarrantyDate => throw _privateConstructorUsedError;

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
      {String id,
      String name,
      String code,
      String description,
      List<String> imageUrls,
      EquipmentMaintainScheduleModel? equipmentMaintainSchedule,
      String endOfWarrantyDate});

  $EquipmentMaintainScheduleModelCopyWith<$Res>? get equipmentMaintainSchedule;
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
    Object? description = null,
    Object? imageUrls = null,
    Object? equipmentMaintainSchedule = freezed,
    Object? endOfWarrantyDate = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      equipmentMaintainSchedule: freezed == equipmentMaintainSchedule
          ? _value.equipmentMaintainSchedule
          : equipmentMaintainSchedule // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintainScheduleModel?,
      endOfWarrantyDate: null == endOfWarrantyDate
          ? _value.endOfWarrantyDate
          : endOfWarrantyDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      {String id,
      String name,
      String code,
      String description,
      List<String> imageUrls,
      EquipmentMaintainScheduleModel? equipmentMaintainSchedule,
      String endOfWarrantyDate});

  @override
  $EquipmentMaintainScheduleModelCopyWith<$Res>? get equipmentMaintainSchedule;
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
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? description = null,
    Object? imageUrls = null,
    Object? equipmentMaintainSchedule = freezed,
    Object? endOfWarrantyDate = null,
  }) {
    return _then(_$EquipmentModelImpl(
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      equipmentMaintainSchedule: freezed == equipmentMaintainSchedule
          ? _value.equipmentMaintainSchedule
          : equipmentMaintainSchedule // ignore: cast_nullable_to_non_nullable
              as EquipmentMaintainScheduleModel?,
      endOfWarrantyDate: null == endOfWarrantyDate
          ? _value.endOfWarrantyDate
          : endOfWarrantyDate // ignore: cast_nullable_to_non_nullable
              as String,
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
      required final List<String> imageUrls,
      this.equipmentMaintainSchedule,
      required this.endOfWarrantyDate})
      : _imageUrls = imageUrls;

  factory _$EquipmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EquipmentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;
  @override
  final String description;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final EquipmentMaintainScheduleModel? equipmentMaintainSchedule;
  @override
  final String endOfWarrantyDate;

  @override
  String toString() {
    return 'EquipmentModel(id: $id, name: $name, code: $code, description: $description, imageUrls: $imageUrls, equipmentMaintainSchedule: $equipmentMaintainSchedule, endOfWarrantyDate: $endOfWarrantyDate)';
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
            (identical(other.equipmentMaintainSchedule,
                    equipmentMaintainSchedule) ||
                other.equipmentMaintainSchedule == equipmentMaintainSchedule) &&
            (identical(other.endOfWarrantyDate, endOfWarrantyDate) ||
                other.endOfWarrantyDate == endOfWarrantyDate));
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
      equipmentMaintainSchedule,
      endOfWarrantyDate);

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
      {required final String id,
      required final String name,
      required final String code,
      required final String description,
      required final List<String> imageUrls,
      final EquipmentMaintainScheduleModel? equipmentMaintainSchedule,
      required final String endOfWarrantyDate}) = _$EquipmentModelImpl;

  factory _EquipmentModel.fromJson(Map<String, dynamic> json) =
      _$EquipmentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;
  @override
  String get description;
  @override
  List<String> get imageUrls;
  @override
  EquipmentMaintainScheduleModel? get equipmentMaintainSchedule;
  @override
  String get endOfWarrantyDate;
  @override
  @JsonKey(ignore: true)
  _$$EquipmentModelImplCopyWith<_$EquipmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
