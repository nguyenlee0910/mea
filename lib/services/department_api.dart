import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mea/constants.dart';
import 'package:mea/env.dart';
import 'package:mea/models/feedback_status_model.dart';
import 'package:mea/models/supply_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/equipment_model.dart';

class DepartmentServices {
  static Future<List<EquipmentModel>> getEquipment({
    int pageSize = 100,
    int page = 0,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final departmentId = prefs.getString('departmentId');
    final auth = prefs.getString('auth');

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/equipment/department/$departmentId',
      queryParameters: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      },
    );

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    final equipmentJson = (jsonDecode(response.body) as List).map((e) {
      return e as Map<String, dynamic>;
    }).toList();

    // Lọc danh sách để chỉ giữ lại những mục có trạng thái là 'FIXING' hoặc 'ACTIVE'
    final filteredList = equipmentJson
        .where((equipment) =>
            equipment['currentStatus'] == 'FIXING' ||
            equipment['currentStatus'] == 'ACTIVE')
        .toList();

    // Chuyển đổi danh sách đã lọc thành danh sách các đối tượng EquipmentModel
    final listResult = filteredList
        .map((equipment) => EquipmentModel.fromJson(equipment))
        .toList();

    return listResult;
  }

  Future<List<FeedbackStatusModel>> getFeedbackStatus({
    required String departmentId,
    int pageSize = 100,
    int page = 0,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final storedDepartmentId = prefs.getString('departmentId');
    final auth = prefs.getString('auth');

    final departmentIdToUse = storedDepartmentId ?? 'defaultDepartmentId';
    final authToUse = auth ?? 'defaultAuth';

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/repair-report-item/department/$departmentIdToUse',
      queryParameters: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      },
    );

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToUse',
      },
    );

    print('Response body: ${response.body}');

    final dynamic responseData = jsonDecode(response.body);

    if (responseData is Map<String, dynamic>) {
      final count = responseData['count'] ?? 0;
      final data = responseData['data'];

      if (data is List) {
        final feedbackStatusJson = data.cast<Map<String, dynamic>>();

        final listResult = feedbackStatusJson
            .map((feedback) => FeedbackStatusModel.fromJson(feedback))
            .toList();

        // Sort the list by createdAt in descending order
        listResult.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

        return listResult;
      } else {
        throw Exception("Invalid 'data' type");
      }
    } else {
      throw Exception("Invalid response type");
    }
  }

  static Future<List<SupplyModel>> getSupply() async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/supply/all',
    );

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    final supplyJson = (jsonDecode(response.body) as List).map((e) {
      return e as Map<String, dynamic>;
    }).toList();

    // Lọc danh sách để chỉ giữ lại những mục có trạng thái là 'FIXING' hoặc 'ACTIVE'
    final filteredList =
        supplyJson.where((supply) => supply['status'] == 'ACTIVE').toList();

    // Chuyển đổi danh sách đã lọc thành danh sách các đối tượng EquipmentModel
    final listResult =
        filteredList.map((supply) => SupplyModel.fromJson(supply)).toList();

    return listResult;
  }

  static Future<bool> requestEquipment({
    required String description,
    required String expected,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');
    try {
      final getId = await _sendRequest(
        description: description,
        name: 'Đơn yêu cầu thiết bị y tế',
        expected: expected,
      );
      if (getId != kErrorString) {
        final id = getId;
        final uri = Uri(
          scheme: 'https',
          host: Env.serverUrl,
          path: 'api/v1/import-request/$id/submit',
        );
        unawaited(
          http.put(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $auth',
            },
          ),
        );
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

  static Future<String> _sendRequest({
    required String description,
    required String name,
    required String expected,
  }) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: Env.serverUrl,
        path: 'api/v1/import-request',
      );
      final prefs = await SharedPreferences.getInstance();
      final auth = prefs.getString('auth');
      final departmentId = prefs.getString('departmentId');
      final params = jsonEncode(
        {
          'name': name,
          'description': description,
          'expected': expected,
          'departmentId': departmentId,
          'importRequestItems': <String>[],
        },
      );
      final response = await http.post(
        uri,
        body: params,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      );

      if (response.statusCode == 201) {
        final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
        return responseJson['id'] as String;
      } else {
        return kErrorString;
      }
    } on HttpException {
      debugPrint('=== ERROR ===');
      return kErrorString;
    } on Exception {
      debugPrint('=== ERROR READING SHARE PREFS ===');
      return kErrorString;
    }
  }

  static Future<bool> requestRepairEquipment({
    required String id,
    required String description,
    required String endAt,
    required String note,
    required NumberFormat price,
    required String startAt,
    required String brokenDate,
    List<String>? urlImage,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');
    final priceFormat = NumberFormat.decimalPattern();
    final priceString = priceFormat.format(0);
    try {
      final header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $auth',
      };

      final uri = Uri(
        scheme: 'https',
        host: Env.serverUrl,
        path: 'api/v1/repair-report',
      );

      final body = {
        'description': description,
        'repairReportItems': [
          {
            'equipmentId': id,
            'type': 'FIXING',
            'description': 'test',
            'imageUrls': urlImage ?? [],
            'repairProviderIds': [],
            'replaceItems': [],
          },
        ],
        'endAt': endAt,
        'note': note,
        'price': priceString,
        'startAt': startAt,
        'brokenDate': brokenDate,
      };
      final response = await http.post(
        uri,
        headers: header,
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        debugPrint('==ERROR==');
        debugPrint('Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return false;
      }
    } on HttpException {
      debugPrint('==HTTP ERROR==');
      return false;
    } catch (error) {
      debugPrint('==GENERAL ERROR==');
      debugPrint('Error: $error');
      return false;
    }
  }
}
