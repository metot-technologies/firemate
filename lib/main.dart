import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firemate/api/firebase_api.dart';
import 'package:firemate/firebase_options.dart';
import 'package:firemate/screens/bottom_nav_bar.dart';
import 'package:firemate/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/date_symbol_data_local.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAPI().initNotification();

  // await AwesomeNotifications().initialize(null, [
  //   NotificationChannel(
  //     channelGroupKey: "basic_channel_group",
  //     channelKey: "basic_channel",
  //     channelName: "Basic Notification",
  //     channelDescription: "Basic notifications channel",
  //   )
  // ], channelGroups: [
  //   NotificationChannelGroup(
  //     channelGroupKey: "basic_channel_group",
  //     channelGroupName: "Basic Group",
  //   )
  // ]);
  // bool isAllowedToSendNotification =
  //     await AwesomeNotifications().isNotificationAllowed();
  // if (!isAllowedToSendNotification) {
  //   AwesomeNotifications().requestPermissionToSendNotifications();
  // }

  initializeDateFormatting();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
        navigatorKey: navigatorKey,
        routes: {
          '/home_screen': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
