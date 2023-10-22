import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mea/env.dart';
import 'package:mea/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static Future<List<NotificationModel>> getNotification({
    int page = 0,
    int pageSize = 12,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');

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
    return listResult;
  }
}
