import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/navigation_page.dart';
import 'package:mea/presentations/Authencation/create_new_password.dart';
import 'package:mea/presentations/Authencation/forgot_password.dart';
import 'package:mea/presentations/Authencation/home.dart';
import 'package:mea/presentations/Authencation/login.dart';
import 'package:mea/presentations/Equipment/equipiment_detail.dart';
import 'package:mea/presentations/Equipment/equipment.dart';
import 'package:mea/presentations/Request/create_request.dart';
import 'package:mea/presentations/Request/equipment_request.dart';
import 'package:mea/presentations/UserManagement/user_edit.dart';

GoRouter appRouter() => GoRouter(
      debugLogDiagnostics: kDebugMode,
      routes: <GoRoute>[
        ///TEMPORARY
        GoRoute(
          path: '/navigation_page',
          name: Navigation.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const Navigation(),
        ),
        GoRoute(
          path: '/',
          name: LoginPage.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: '/forgot_password',
          name: ForgotPassword.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const ForgotPassword(),
        ),
        GoRoute(
          path: '/create_new_password',
          name: CreateNewPassword.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const CreateNewPassword(),
        ),
        GoRoute(
          path: '/home_page',
          name: HomePage.routeName,
          builder: (BuildContext context, GoRouterState state) => HomePage(),
        ),
        GoRoute(
          path: '/edit_profile',
          name: UserEditProfilePage.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const UserEditProfilePage(),
        ),
        GoRoute(
          path: '/equipment_all',
          name: EquipmentPage.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const EquipmentPage(),
        ),
        GoRoute(
          path: '/create_request',
          name: CreateRequest.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              CreateRequest(),
        ),
        GoRoute(
          path: '/equipment_request',
          name: EquipmentRequestPage.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const EquipmentRequestPage(),
        ),
        GoRoute(
          path: '/equipment_detail',
          name: EquipmentDetail.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const EquipmentDetail(),
        ),
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
