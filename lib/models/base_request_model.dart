import 'dart:core';

abstract class BaseRequestModel {
  BaseRequestModel(
    this.id,
    this.createdAt,
    this.description,
    this.status,
  );

  final String id;
  final String createdAt;
  final String description;
  final String status;
}
