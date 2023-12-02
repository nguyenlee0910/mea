// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedbackStatusModel _$FeedbackStatusModelFromJson(Map<String, dynamic> json) {
  return _FeedbackStatusModel.fromJson(json);
}

/// @nodoc
mixin _$FeedbackStatusModel {
  String? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get feedbackStatus => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  EquipmentFeedbackStatusModel? get equipment =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackStatusModelCopyWith<FeedbackStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackStatusModelCopyWith<$Res> {
  factory $FeedbackStatusModelCopyWith(
          FeedbackStatusModel value, $Res Function(FeedbackStatusModel) then) =
      _$FeedbackStatusModelCopyWithImpl<$Res, FeedbackStatusModel>;
  @useResult
  $Res call(
      {String? id,
      String? status,
      String? feedbackStatus,
      String? createdAt,
      String? description,
      EquipmentFeedbackStatusModel? equipment});

  $EquipmentFeedbackStatusModelCopyWith<$Res>? get equipment;
}

/// @nodoc
class _$FeedbackStatusModelCopyWithImpl<$Res, $Val extends FeedbackStatusModel>
    implements $FeedbackStatusModelCopyWith<$Res> {
  _$FeedbackStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? feedbackStatus = freezed,
    Object? createdAt = freezed,
    Object? description = freezed,
    Object? equipment = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackStatus: freezed == feedbackStatus
          ? _value.feedbackStatus
          : feedbackStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentFeedbackStatusModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EquipmentFeedbackStatusModelCopyWith<$Res>? get equipment {
    if (_value.equipment == null) {
      return null;
    }

    return $EquipmentFeedbackStatusModelCopyWith<$Res>(_value.equipment!,
        (value) {
      return _then(_value.copyWith(equipment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedbackStatusModelImplCopyWith<$Res>
    implements $FeedbackStatusModelCopyWith<$Res> {
  factory _$$FeedbackStatusModelImplCopyWith(_$FeedbackStatusModelImpl value,
          $Res Function(_$FeedbackStatusModelImpl) then) =
      __$$FeedbackStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? status,
      String? feedbackStatus,
      String? createdAt,
      String? description,
      EquipmentFeedbackStatusModel? equipment});

  @override
  $EquipmentFeedbackStatusModelCopyWith<$Res>? get equipment;
}

/// @nodoc
class __$$FeedbackStatusModelImplCopyWithImpl<$Res>
    extends _$FeedbackStatusModelCopyWithImpl<$Res, _$FeedbackStatusModelImpl>
    implements _$$FeedbackStatusModelImplCopyWith<$Res> {
  __$$FeedbackStatusModelImplCopyWithImpl(_$FeedbackStatusModelImpl _value,
      $Res Function(_$FeedbackStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? feedbackStatus = freezed,
    Object? createdAt = freezed,
    Object? description = freezed,
    Object? equipment = freezed,
  }) {
    return _then(_$FeedbackStatusModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackStatus: freezed == feedbackStatus
          ? _value.feedbackStatus
          : feedbackStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as EquipmentFeedbackStatusModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackStatusModelImpl implements _FeedbackStatusModel {
  _$FeedbackStatusModelImpl(
      {required this.id,
      required this.status,
      required this.feedbackStatus,
      required this.createdAt,
      required this.description,
      this.equipment});

  factory _$FeedbackStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackStatusModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  final String? feedbackStatus;
  @override
  final String? createdAt;
  @override
  final String? description;
  @override
  final EquipmentFeedbackStatusModel? equipment;

  @override
  String toString() {
    return 'FeedbackStatusModel(id: $id, status: $status, feedbackStatus: $feedbackStatus, createdAt: $createdAt, description: $description, equipment: $equipment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackStatusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feedbackStatus, feedbackStatus) ||
                other.feedbackStatus == feedbackStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, feedbackStatus,
      createdAt, description, equipment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackStatusModelImplCopyWith<_$FeedbackStatusModelImpl> get copyWith =>
      __$$FeedbackStatusModelImplCopyWithImpl<_$FeedbackStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackStatusModelImplToJson(
      this,
    );
  }
}

abstract class _FeedbackStatusModel implements FeedbackStatusModel {
  factory _FeedbackStatusModel(
          {required final String? id,
          required final String? status,
          required final String? feedbackStatus,
          required final String? createdAt,
          required final String? description,
          final EquipmentFeedbackStatusModel? equipment}) =
      _$FeedbackStatusModelImpl;

  factory _FeedbackStatusModel.fromJson(Map<String, dynamic> json) =
      _$FeedbackStatusModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get status;
  @override
  String? get feedbackStatus;
  @override
  String? get createdAt;
  @override
  String? get description;
  @override
  EquipmentFeedbackStatusModel? get equipment;
  @override
  @JsonKey(ignore: true)
  _$$FeedbackStatusModelImplCopyWith<_$FeedbackStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
