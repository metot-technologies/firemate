import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firemate/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
          android: AndroidInitializationSettings('mipmap/ic_launcher'),
          iOS: null),
    );

    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    initPushNotification();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    print('Notification Title: ${message.notification?.title}');
    print('Notification Body: ${message.notification?.body}');
  }

  Future<void> initPushNotification() async {
    FirebaseMessaging.onMessage.listen(_displayNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(_displayNotification);

    FirebaseMessaging.onBackgroundMessage(_displayNotification);
  }
}

Future<void> _displayNotification(RemoteMessage message) async {
  if (message != null) {
    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.max,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      notificationDetails,
    );
  }
}
