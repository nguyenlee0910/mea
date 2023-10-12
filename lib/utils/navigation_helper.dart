import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/presentations/Authencation/login.dart';

class CustomNavigationHelper {
  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    final routes = [
      StatefulShellBranch(navigatorKey: homeTabNavigatorKey, routes: [
        GoRoute(
            path: '/',
            pageBuilder: (context, GoRouterState state) {
              return getPage(child: LoginPage(), state: state);
            }),
      ])
    ];
  }
  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
