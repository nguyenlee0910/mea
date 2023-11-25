import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FireBaseService {
  final _fireBaseServiceInstance = FirebaseMessaging.instance;

  Future<void> initNotificaitonService() async {
    await _fireBaseServiceInstance.requestPermission();
    final fcmToken = await _fireBaseServiceInstance.getToken();
    debugPrint('[FCM]: $fcmToken');

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
