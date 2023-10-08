import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/presentations/Authencation/forgot_password.dart';
import 'package:mea/presentations/Authencation/login.dart';

import '../home_page.dart';

GoRouter appRouter() => GoRouter(
      debugLogDiagnostics: kDebugMode,
      routes: <GoRoute>[
        GoRoute(
            path: '/',
            name: LoginPage.routeName,
            builder: (BuildContext context, GoRouterState state) =>
                LoginPage()),
        GoRoute(
          path: '/forgot_password',
          name: ForgotPassword.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              ForgotPassword(),
        )
      ],
      observers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
      /*refreshListenable: GoRouterRefreshStream(),
      redirect: (state) {
        String? redirectRoute;
        return state.subloc == redirectRoute ? null : redirectRoute;
      },*/
    );
