import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mea/constants.dart';
import 'package:mea/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/equipment_model.dart';

class DepartmentServices {
  static Future<List<EquipmentModel>> getEquipment({
    required String departmentId,
    int pageSize = 12,
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

    final listResult = <EquipmentModel>[];

    final equipmentJson = (jsonDecode(response.body)['data'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    for (final i in equipmentJson) {
      listResult.add(EquipmentModel.fromJson(i));
    }
    return listResult;
  }

  static Future<bool> requestEquipment({required String description}) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');
    try {
      final getId = await _sendRequest(description: description);
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

  static Future<String> _sendRequest({required String description}) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: Env.serverUrl,
        path: 'api/v1/import-request',
      );
      final prefs = await SharedPreferences.getInstance();
      final auth = prefs.getString('auth');
      final params = jsonEncode(
        {
          'name': 'Đơn yêu cầu thiết bị y tế',
          'description': description,
          "importRequestItems": <String>[],
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
    List<String>? urlImage,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');
    try {
      final header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $auth',
      };
      final uri = Uri(
        scheme: 'https',
        host: Env.serverUrl,
        path: 'api/v1/repair-request',
      );
      final body = {
        "description": description,
        "imageUrls": urlImage ?? [],
        "equipmentId": '08de2642-c733-41aa-b524-451d00305b52',
      };
      final response = await http.post(
        uri,
        headers: header,
        body: jsonEncode(body),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on HttpException {
      debugPrint('==ERROR==');
      return false;
    }
  }
}
