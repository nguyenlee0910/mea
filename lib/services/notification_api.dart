import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mea/env.dart';
import 'package:mea/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static Future<List<NotificationModel>> getNotification({
    int page = 0,
    int pageSize = 1000,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');

    await NotificationService.makeAsReadAll();

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/user-me-notification',
      queryParameters: {
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      },
    );

    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth',
    };

    final response = await http.get(
      uri,
      headers: header,
    );

    final listResult = <NotificationModel>[];

    final equipmentJson = (jsonDecode(response.body)['data'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    for (final i in equipmentJson) {
      listResult.add(NotificationModel.fromJson(i));
    }

    // Sắp xếp danh sách theo ngày giảm dần
    listResult.sort((a, b) => (b.createdAt ?? "").compareTo(a.createdAt ?? ""));

    return listResult;
  }

  static Future<void> makeAsReadDetail(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/user-me-notification/mark-as-read-detail/$id',
    );

    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth',
    };

    final response = await http.put(
      uri,
      headers: header,
    );
  }

  static Future<void> makeAsReadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/user-me-notification/mark-as-read',
    );

    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth',
    };

    final response = await http.put(
      uri,
      headers: header,
    );
  }
}
