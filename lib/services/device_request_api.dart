import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mea/env.dart';
import 'package:mea/models/import_request_model.dart';
import 'package:mea/models/repair_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceRequestService {
  static Future<List<ImportRequestModel>> getImportRequests() async {
    final prefs = await SharedPreferences.getInstance();

    final userId = prefs.getString('userId');
    final auth = prefs.getString('auth');

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/import-request/all',
    );

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    final listResult = <ImportRequestModel>[];

    final requestJson = (jsonDecode(response.body) as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final filterRequestJson = requestJson
        .where(
          (element) {
            return element['createdBy']['id'] as String == userId;
          },
        )
        .map((e) => e)
        .toList();

    for (final i in filterRequestJson) {
      listResult.add(ImportRequestModel.fromJson(i));
    }

    // Sort the list based on the creation date in descending order
    listResult.sort((a, b) {
      DateTime dateTimeA = DateTime.parse(a.createdAt);
      DateTime dateTimeB = DateTime.parse(b.createdAt);
      return dateTimeB.compareTo(dateTimeA);
    });

    return listResult;
  }

  static Future<List<RepairRequestModel>> getRepairRequests() async {
    final prefs = await SharedPreferences.getInstance();

    final userId = prefs.getString('userId');
    final auth = prefs.getString('auth');

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/repair-request/all',
    );

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $auth',
      },
    );

    final listResult = <RepairRequestModel>[];

    final requestJson = (jsonDecode(response.body) as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final filterRequestJson = requestJson.where(
      (element) {
        return (element['createdBy']['id'] as String).contains(userId!);
      },
    );

    for (final i in filterRequestJson) {
      listResult.add(RepairRequestModel.fromJson(i));
    }

    // Sort the list based on the creation date in descending order
    listResult.sort((a, b) {
      DateTime dateTimeA = DateTime.parse(a.createdAt);
      DateTime dateTimeB = DateTime.parse(b.createdAt);
      return dateTimeB.compareTo(dateTimeA);
    });

    return listResult;
  }
}
