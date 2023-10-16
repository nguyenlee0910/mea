import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mea/env.dart';
import 'package:http/http.dart' as http;

import '../models/equipment_model.dart';

class DepartmentServices {
  //get
  Future<List<EquipmentModel>> getEquipment(
      {required page,
      int pageSize = 12,
      required String departmentId,
      required auth}) async {
    final url = Env.serverUrl +
        '/api/v1/equipment/department/$departmentId?page=${page}&pageSize=${pageSize}';

    debugPrint(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth',
    });

    List<EquipmentModel> listResult = [];

    final equipmentJson = (jsonDecode(response.body)["data"] as List)
        .map((e) => e as Map<String, dynamic>)
        ?.toList();

    for (final i in equipmentJson!) {
      listResult.add(EquipmentModel.fromJson(i));
    }
    return listResult;
  }
}
