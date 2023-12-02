import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mea/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireBaseService {
  final _fireBaseServiceInstance = FirebaseMessaging.instance;

  Future<void> initNotificaitonService({
    required Function(int) badgeCountListener,
  }) async {
    await _fireBaseServiceInstance.requestPermission();
    final prefs = await SharedPreferences.getInstance();
    await _fireBaseServiceInstance.getToken().then((value) async {
      debugPrint('[FCM]: $value');

      if (value != null) {
        await AuthService.updateToken(token: value);
        await prefs.setString('fcm', value);
      } else {
        debugPrint('[ERROR]: NO FCM TOKEN');
      }
    });

    //init notification channel
    const channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = message.notification?.android;
      final badgeCount = int.parse((message.data['badge'] ?? '0')
          as String); //change to '0' to get server
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/launcher_icon',
            ),
          ),
        );
      }
      badgeCountListener(badgeCount);
    });
  }
}
