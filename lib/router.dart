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
import 'package:mea/presentations/Request/equipment_request.dart';
import 'package:mea/presentations/Request/repair_request.dart';
import 'package:mea/presentations/Request/repair_request_detail.dart';
import 'package:mea/presentations/Request/view_request.dart';
import 'package:mea/presentations/UserManagement/user_edit.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          redirect: (context, state) async {
            final prefs = await SharedPreferences.getInstance();
            final rememberMe = prefs.getBool('rememberMe') ?? false;
            final auth = prefs.getString('auth') ?? '';

            if (auth.isNotEmpty && rememberMe) {
              return '/navigation_page';
            }
          },
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
          path: '/view_request',
          name: ViewRequest.routeName,
          builder: (BuildContext context, GoRouterState state) => ViewRequest(),
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
        GoRoute(
          path: '/repair_request',
          name: RepairRequest.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const RepairRequest(),
        ),
        GoRoute(
          path: '/repair_request_detail/:id/:nameEquipment/:codeEquipment',
          name: RepairRequestDetail.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              RepairRequestDetail(
            id: state.pathParameters['id']!,
            nameEquipment: state.pathParameters['nameEquipment']!,
            codeEquipment: state.pathParameters['codeEquipment']!,
          ),
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
