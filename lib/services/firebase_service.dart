import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mea/services/login_service.dart';

class FireBaseService {
  final _fireBaseServiceInstance = FirebaseMessaging.instance;

  Future<void> initNotificaitonService() async {
    await _fireBaseServiceInstance.requestPermission();
    await _fireBaseServiceInstance.getToken().then((value) async {
      debugPrint('[FCM]: $value');
      if (value != null) {
        await AuthService.updateToken(token: value);
      } else {
        debugPrint('[ERROR]: NO FCM TOKEN');
      }
    });

    //init notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}
