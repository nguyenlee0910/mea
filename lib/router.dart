import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mea/models/base_request_model.dart';
import 'package:mea/models/equipment_model.dart';
import 'package:mea/models/notification_model.dart';
import 'package:mea/models/user_model.dart';
import 'package:mea/navigation_page.dart';
import 'package:mea/presentations/Authencation/create_new_password.dart';
import 'package:mea/presentations/Authencation/forgot_password.dart';
import 'package:mea/presentations/Authencation/home.dart';
import 'package:mea/presentations/Authencation/login.dart';
import 'package:mea/presentations/Equipment/equipiment_detail.dart';
import 'package:mea/presentations/Equipment/equipment.dart';
import 'package:mea/presentations/Notification/notification_detail.dart';
import 'package:mea/presentations/Request/equipment_request.dart';
import 'package:mea/presentations/Request/list_equipment_ticket.dart';
import 'package:mea/presentations/Request/list_repair_ticket.dart';
import 'package:mea/presentations/Request/repair_request.dart';
import 'package:mea/presentations/Request/repair_request_detail.dart';
import 'package:mea/presentations/Request/view_request.dart';
import 'package:mea/presentations/Request/view_request_detail.dart';
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
            final roleId = prefs.getString('roleId');

            if (auth.isNotEmpty && rememberMe) {
              return '/navigation_page';
            }
            return null;
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
          builder: (BuildContext context, GoRouterState state) {
            final userModel = state.extra! as UserModel;
            return UserEditProfilePage(userModel: userModel);
          },
        ),
        GoRoute(
          path: '/equipment_all',
          name: EquipmentPage.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const EquipmentPage(),
        ),
        GoRoute(
          path: '/list_request',
          name: ListEquipmentTicket.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const ListEquipmentTicket(),
        ),
        GoRoute(
          path: '/list_repair',
          name: ListRepairTicket.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const ListRepairTicket(),
        ),
        GoRoute(
          path: '/view_request',
          name: ViewRequest.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const ViewRequest(),
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
          builder: (BuildContext context, GoRouterState state) {
            final equipmentModel = state.extra! as EquipmentModel;
            return EquipmentDetail(
              equipmentModel: equipmentModel,
            );
          },
        ),
        GoRoute(
          path: '/notification_detail',
          name: NotificationDetail.routeName,
          builder: (BuildContext context, GoRouterState state) {
            final notificationModel = state.extra! as NotificationModel;
            return NotificationDetail(
              notificationModel: notificationModel,
            );
          },
        ),
        // GoRoute(
        //   path: '/repair_request_detail',
        //   name: RepairRequestDetail.routeName,
        //   builder: (BuildContext context, GoRouterState state) {
        //     final equipmentModel = state.extra! as EquipmentModel;
        //     return RepairRequestDetail(
        //       equipmentModel: equipmentModel,
        //     );
        //   },
        // ),

        GoRoute(
          path: '/repair_request',
          name: RepairRequest.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const RepairRequest(),
        ),
        GoRoute(
          path: '/view_request_detail',
          name: ViewRequestDetail.routeName,
          builder: (BuildContext context, GoRouterState state) {
            final baseRequestModel = state.extra! as BaseRequestModel;
            return ViewRequestDetail(
              baseRequestModel: baseRequestModel,
            );
          },
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
