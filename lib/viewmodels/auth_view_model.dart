import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/models/user_model.dart';
import 'package:mea/services/login_service.dart';
import 'package:mea/widgets/scaffold_message.dart';
import 'package:stacked/stacked.dart';

import '../navigation_page.dart';

class AuthViewModel extends BaseViewModel {
  UserModel user = UserModel();

  Future<void> login({
    required String userName,
    required String password,
    required BuildContext context,
  }) async {
    await runBusyFuture<bool>(
      AuthService.login(userName: userName, password: password),
    ).then(
      (value) {
        if (value) {
          context.go('/${Navigation.routeName}');
        } else {
          showSnackBarErrorMessage(
              context: context,
              message: 'Sai tên đăng nhập hoặc mật khẩu không đúng! ');
        }
      },
    );
  }
}
