import 'dart:core';

abstract class BaseRequestModel {
  BaseRequestModel(
    this.id,
    this.createdAt,
    this.description,
    this.status,
    this.note,
  );

  final String id;
  final String createdAt;
  final String description;
  final String status;
  final String note;
}
