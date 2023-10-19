import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mea/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/equipment_model.dart';

class DepartmentServices {
  //get
  Future<List<EquipmentModel>> getEquipment({
    required page,
    required String departmentId,
    required auth,
    int pageSize = 12,
  }) async {
    final url =
        '${Env.serverUrl}/api/v1/equipment/department/$departmentId?page=$page&pageSize=$pageSize';

    debugPrint(url);
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    final listResult = <EquipmentModel>[];

    final equipmentJson = (jsonDecode(response.body)['data'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    for (final i in equipmentJson) {
      listResult.add(EquipmentModel.fromJson(i));
    }
    return listResult;
  }

  Future<bool> requestEquipment({required String description}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final auth = prefs.getString('auth');
      final url = '${Env.serverUrl}/api/v1/import-request';
      final params = jsonEncode(
        {'name': 'Đơn yêu cầu thiết bị y tế', 'description': description},
      );
      final response = await http.post(
        Uri.parse(url),
        body: params,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } on HttpException {
      debugPrint('=== ERROR ===');
      return false;
    } on Exception {
      debugPrint('=== ERROR READING SHARE PREFS ===');
      return false;
    }
  }
}
