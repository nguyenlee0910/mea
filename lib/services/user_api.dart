import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:mea/env.dart';
import 'package:mea/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<void> updateInformation(String name, String email, String phone,
      String birthday, String address, String gender) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');

    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/user-me',
    );

    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth',
    };

    final body = {
      "name": name,
      "email": email,
      "phone": phone,
      "birthday": birthday,
      "address": address,
      "gender": gender,
    };

    final response = await http.put(
      uri,
      headers: header,
      body: body,
    );
  }
}
