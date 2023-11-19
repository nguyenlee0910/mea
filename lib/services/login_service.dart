import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mea/constants.dart';
import 'package:mea/env.dart';
import 'package:mea/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<void> login({
    required String userName,
    required String password,
    required Function onSucess,
    required Function onFail,
  }) async {
    final uri =
        Uri(scheme: 'https', host: Env.serverUrl, path: 'api/v1/auth/login');
    final response = await http.post(
      uri,
      body: jsonEncode({
        'password': password,
        'username': userName,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 201) {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      final userData =
          UserModel.fromJson(responseJson['user'] as Map<String, dynamic>);
      //authencation: ///
      String roleId = responseJson['user']['role']['id'] as String;
      if (roleId != kAuthencatedRoleId) {
        onFail();
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      unawaited(
        prefs.setString('auth', responseJson['token'].toString()),
      );

      final fcmToken = await FirebaseMessaging.instance.getToken();

      unawaited(
        prefs.setString(
          'departmentId',
          // ignore: avoid_dynamic_calls
          responseJson['user']['department']['id'] as String,
        ),
      );
      unawaited(
        prefs.setString('userData', jsonEncode(userData.toJson())),
      );

      unawaited(
        prefs.setString(
          'departmentName',
          responseJson['user']['department']['name'].toString(),
        ),
      );

      unawaited(
        prefs.setString(
          'userId',
          responseJson['user']['id'].toString(),
        ),
      );
      // ignore: avoid_dynamic_calls
      onSucess();
    }
  }

  static Future<void> logout({required Function callBack}) async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString('auth');
    final uri = Uri(
      scheme: 'https',
      host: Env.serverUrl,
      path: 'api/v1/user-me/logout',
    );
    unawaited(
      http.post(
        uri,
        body: jsonEncode({}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $auth',
        },
      ),
    );

    await prefs.clear().then((value) {
      if (value == true) {
        callBack();
      }
    });
  }
}
