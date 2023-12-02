// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_feedback_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipmentFeedbackStatusModel _$EquipmentFeedbackStatusModelFromJson(
    Map<String, dynamic> json) {
  return _EquipmentFeedbackStatusModel.fromJson(json);
}

/// @nodoc
mixin _$EquipmentFeedbackStatusModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get imageUrls => throw _privateConstructorUsedError;
  String? get endOfWarrantyDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentFeedbackStatusModelCopyWith<EquipmentFeedbackStatusModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentFeedbackStatusModelCopyWith<$Res> {
  factory $EquipmentFeedbackStatusModelCopyWith(
          EquipmentFeedbackStatusModel value,
          $Res Function(EquipmentFeedbackStatusModel) then) =
      _$EquipmentFeedbackStatusModelCopyWithImpl<$Res,
          EquipmentFeedbackStatusModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? code,
      String? description,
      List<String>? imageUrls,
      String? endOfWarrantyDate});
}

/// @nodoc
class _$EquipmentFeedbackStatusModelCopyWithImpl<$Res,
        $Val extends EquipmentFeedbackStatusModel>
    implements $EquipmentFeedbackStatusModelCopyWith<$Res> {
  _$EquipmentFeedbackStatusModelCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipmentFeedbackStatusModelImplCopyWith<$Res>
    implements $EquipmentFeedbackStatusModelCopyWith<$Res> {
  factory _$$EquipmentFeedbackStatusModelImplCopyWith(
          _$EquipmentFeedbackStatusModelImpl value,
          $Res Function(_$EquipmentFeedbackStatusModelImpl) then) =
      __$$EquipmentFeedbackStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? code,
      String? description,
      List<String>? imageUrls,
      String? endOfWarrantyDate});
}

/// @nodoc
class __$$EquipmentFeedbackStatusModelImplCopyWithImpl<$Res>
    extends _$EquipmentFeedbackStatusModelCopyWithImpl<$Res,
        _$EquipmentFeedbackStatusModelImpl>
    implements _$$EquipmentFeedbackStatusModelImplCopyWith<$Res> {
  __$$EquipmentFeedbackStatusModelImplCopyWithImpl(
      _$EquipmentFeedbackStatusModelImpl _value,
      $Res Function(_$EquipmentFeedbackStatusModelImpl) _then)
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
  }) {
    return _then(_$EquipmentFeedbackStatusModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipmentFeedbackStatusModelImpl
    implements _EquipmentFeedbackStatusModel {
  _$EquipmentFeedbackStatusModelImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.description,
      required final List<String>? imageUrls,
      required this.endOfWarrantyDate})
      : _imageUrls = imageUrls;

  factory _$EquipmentFeedbackStatusModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipmentFeedbackStatusModelImplFromJson(json);

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
  String toString() {
    return 'EquipmentFeedbackStatusModel(id: $id, name: $name, code: $code, description: $description, imageUrls: $imageUrls, endOfWarrantyDate: $endOfWarrantyDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EquipmentFeedbackStatusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.endOfWarrantyDate, endOfWarrantyDate) ||
                other.endOfWarrantyDate == endOfWarrantyDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, description,
      const DeepCollectionEquality().hash(_imageUrls), endOfWarrantyDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentFeedbackStatusModelImplCopyWith<
          _$EquipmentFeedbackStatusModelImpl>
      get copyWith => __$$EquipmentFeedbackStatusModelImplCopyWithImpl<
          _$EquipmentFeedbackStatusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentFeedbackStatusModelImplToJson(
      this,
    );
  }
}

abstract class _EquipmentFeedbackStatusModel
    implements EquipmentFeedbackStatusModel {
  factory _EquipmentFeedbackStatusModel(
          {required final String? id,
          required final String? name,
          required final String? code,
          required final String? description,
          required final List<String>? imageUrls,
          required final String? endOfWarrantyDate}) =
      _$EquipmentFeedbackStatusModelImpl;

  factory _EquipmentFeedbackStatusModel.fromJson(Map<String, dynamic> json) =
      _$EquipmentFeedbackStatusModelImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$EquipmentFeedbackStatusModelImplCopyWith<
          _$EquipmentFeedbackStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
