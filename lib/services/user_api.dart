import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mea/env.dart';
import 'package:mea/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<bool> updateInformation(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');

    final deviceId = prefs.getString('fcm');

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

    final body = jsonEncode({
      'name': userModel.name,
      'email': userModel.email,
      'phone': userModel.phone,
      'birthday': userModel.birthday,
      'address': userModel.address,
      'gender': userModel.gender,
      'deviceId': deviceId
    });

    final response = await http.put(
      uri,
      headers: header,
      body: body,
    );
    if (response.statusCode == 200) {
      print(response.toString());
      await prefs.setString('userData', jsonEncode(userModel.toJson()));
      return true;
    } else {
      print(response.toString());
      return false;
    }
  }
}
