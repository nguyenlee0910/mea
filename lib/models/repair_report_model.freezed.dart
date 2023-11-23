// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepairReportModel _$RepairReportModelFromJson(Map<String, dynamic> json) {
  return _RepairReportModel.fromJson(json);
}

/// @nodoc
mixin _$RepairReportModel {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String get startAt => throw _privateConstructorUsedError;
  String get endAt => throw _privateConstructorUsedError;
  RepairReportCreatedByModel? get repairReportCreatedByModel =>
      throw _privateConstructorUsedError;
  RepairReportUpdatedByModel? get repairReportUpdatedByModel =>
      throw _privateConstructorUsedError;
  RepairReportItemsModel? get repairReportItemsModel =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairReportModelCopyWith<RepairReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairReportModelCopyWith<$Res> {
  factory $RepairReportModelCopyWith(
          RepairReportModel value, $Res Function(RepairReportModel) then) =
      _$RepairReportModelCopyWithImpl<$Res, RepairReportModel>;
  @useResult
  $Res call(
      {String id,
      String status,
      String createdAt,
      String description,
      String note,
      String startAt,
      String endAt,
      RepairReportCreatedByModel? repairReportCreatedByModel,
      RepairReportUpdatedByModel? repairReportUpdatedByModel,
      RepairReportItemsModel? repairReportItemsModel});

  $RepairReportCreatedByModelCopyWith<$Res>? get repairReportCreatedByModel;
  $RepairReportUpdatedByModelCopyWith<$Res>? get repairReportUpdatedByModel;
  $RepairReportItemsModelCopyWith<$Res>? get repairReportItemsModel;
}

/// @nodoc
class _$RepairReportModelCopyWithImpl<$Res, $Val extends RepairReportModel>
    implements $RepairReportModelCopyWith<$Res> {
  _$RepairReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? createdAt = null,
    Object? description = null,
    Object? note = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? repairReportCreatedByModel = freezed,
    Object? repairReportUpdatedByModel = freezed,
    Object? repairReportItemsModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String,
      repairReportCreatedByModel: freezed == repairReportCreatedByModel
          ? _value.repairReportCreatedByModel
          : repairReportCreatedByModel // ignore: cast_nullable_to_non_nullable
              as RepairReportCreatedByModel?,
      repairReportUpdatedByModel: freezed == repairReportUpdatedByModel
          ? _value.repairReportUpdatedByModel
          : repairReportUpdatedByModel // ignore: cast_nullable_to_non_nullable
              as RepairReportUpdatedByModel?,
      repairReportItemsModel: freezed == repairReportItemsModel
          ? _value.repairReportItemsModel
          : repairReportItemsModel // ignore: cast_nullable_to_non_nullable
              as RepairReportItemsModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RepairReportCreatedByModelCopyWith<$Res>? get repairReportCreatedByModel {
    if (_value.repairReportCreatedByModel == null) {
      return null;
    }

    return $RepairReportCreatedByModelCopyWith<$Res>(
        _value.repairReportCreatedByModel!, (value) {
      return _then(_value.copyWith(repairReportCreatedByModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RepairReportUpdatedByModelCopyWith<$Res>? get repairReportUpdatedByModel {
    if (_value.repairReportUpdatedByModel == null) {
      return null;
    }

    return $RepairReportUpdatedByModelCopyWith<$Res>(
        _value.repairReportUpdatedByModel!, (value) {
      return _then(_value.copyWith(repairReportUpdatedByModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RepairReportItemsModelCopyWith<$Res>? get repairReportItemsModel {
    if (_value.repairReportItemsModel == null) {
      return null;
    }

    return $RepairReportItemsModelCopyWith<$Res>(_value.repairReportItemsModel!,
        (value) {
      return _then(_value.copyWith(repairReportItemsModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepairReportModelImplCopyWith<$Res>
    implements $RepairReportModelCopyWith<$Res> {
  factory _$$RepairReportModelImplCopyWith(_$RepairReportModelImpl value,
          $Res Function(_$RepairReportModelImpl) then) =
      __$$RepairReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      String createdAt,
      String description,
      String note,
      String startAt,
      String endAt,
      RepairReportCreatedByModel? repairReportCreatedByModel,
      RepairReportUpdatedByModel? repairReportUpdatedByModel,
      RepairReportItemsModel? repairReportItemsModel});

  @override
  $RepairReportCreatedByModelCopyWith<$Res>? get repairReportCreatedByModel;
  @override
  $RepairReportUpdatedByModelCopyWith<$Res>? get repairReportUpdatedByModel;
  @override
  $RepairReportItemsModelCopyWith<$Res>? get repairReportItemsModel;
}

/// @nodoc
class __$$RepairReportModelImplCopyWithImpl<$Res>
    extends _$RepairReportModelCopyWithImpl<$Res, _$RepairReportModelImpl>
    implements _$$RepairReportModelImplCopyWith<$Res> {
  __$$RepairReportModelImplCopyWithImpl(_$RepairReportModelImpl _value,
      $Res Function(_$RepairReportModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? createdAt = null,
    Object? description = null,
    Object? note = null,
    Object? startAt = null,
    Object? endAt = null,
    Object? repairReportCreatedByModel = freezed,
    Object? repairReportUpdatedByModel = freezed,
    Object? repairReportItemsModel = freezed,
  }) {
    return _then(_$RepairReportModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: null == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String,
      repairReportCreatedByModel: freezed == repairReportCreatedByModel
          ? _value.repairReportCreatedByModel
          : repairReportCreatedByModel // ignore: cast_nullable_to_non_nullable
              as RepairReportCreatedByModel?,
      repairReportUpdatedByModel: freezed == repairReportUpdatedByModel
          ? _value.repairReportUpdatedByModel
          : repairReportUpdatedByModel // ignore: cast_nullable_to_non_nullable
              as RepairReportUpdatedByModel?,
      repairReportItemsModel: freezed == repairReportItemsModel
          ? _value.repairReportItemsModel
          : repairReportItemsModel // ignore: cast_nullable_to_non_nullable
              as RepairReportItemsModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairReportModelImpl implements _RepairReportModel {
  _$RepairReportModelImpl(
      {required this.id,
      required this.status,
      required this.createdAt,
      required this.description,
      required this.note,
      required this.startAt,
      required this.endAt,
      this.repairReportCreatedByModel,
      this.repairReportUpdatedByModel,
      this.repairReportItemsModel});

  factory _$RepairReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairReportModelImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final String description;
  @override
  final String note;
  @override
  final String startAt;
  @override
  final String endAt;
  @override
  final RepairReportCreatedByModel? repairReportCreatedByModel;
  @override
  final RepairReportUpdatedByModel? repairReportUpdatedByModel;
  @override
  final RepairReportItemsModel? repairReportItemsModel;

  @override
  String toString() {
    return 'RepairReportModel(id: $id, status: $status, createdAt: $createdAt, description: $description, note: $note, startAt: $startAt, endAt: $endAt, repairReportCreatedByModel: $repairReportCreatedByModel, repairReportUpdatedByModel: $repairReportUpdatedByModel, repairReportItemsModel: $repairReportItemsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairReportModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.repairReportCreatedByModel,
                    repairReportCreatedByModel) ||
                other.repairReportCreatedByModel ==
                    repairReportCreatedByModel) &&
            (identical(other.repairReportUpdatedByModel,
                    repairReportUpdatedByModel) ||
                other.repairReportUpdatedByModel ==
                    repairReportUpdatedByModel) &&
            (identical(other.repairReportItemsModel, repairReportItemsModel) ||
                other.repairReportItemsModel == repairReportItemsModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      createdAt,
      description,
      note,
      startAt,
      endAt,
      repairReportCreatedByModel,
      repairReportUpdatedByModel,
      repairReportItemsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairReportModelImplCopyWith<_$RepairReportModelImpl> get copyWith =>
      __$$RepairReportModelImplCopyWithImpl<_$RepairReportModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairReportModelImplToJson(
      this,
    );
  }
}

abstract class _RepairReportModel implements RepairReportModel {
  factory _RepairReportModel(
          {required final String id,
          required final String status,
          required final String createdAt,
          required final String description,
          required final String note,
          required final String startAt,
          required final String endAt,
          final RepairReportCreatedByModel? repairReportCreatedByModel,
          final RepairReportUpdatedByModel? repairReportUpdatedByModel,
          final RepairReportItemsModel? repairReportItemsModel}) =
      _$RepairReportModelImpl;

  factory _RepairReportModel.fromJson(Map<String, dynamic> json) =
      _$RepairReportModelImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  String get description;
  @override
  String get note;
  @override
  String get startAt;
  @override
  String get endAt;
  @override
  RepairReportCreatedByModel? get repairReportCreatedByModel;
  @override
  RepairReportUpdatedByModel? get repairReportUpdatedByModel;
  @override
  RepairReportItemsModel? get repairReportItemsModel;
  @override
  @JsonKey(ignore: true)
  _$$RepairReportModelImplCopyWith<_$RepairReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
