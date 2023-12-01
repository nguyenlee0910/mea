import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mea/models/user_model.dart';
import 'package:mea/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class AuthViewModel extends BaseViewModel {
  final authKey = GetIt.I.get<SharedPreferences>().getString('auth');
  final _authService = AuthService;
  UserModel user = UserModel();

  Future<void> login(
      {required String userName, required String password}) async {
    final result = await runBusyFuture<bool>(
        AuthService.login(userName: userName, password: password));
  }


}
