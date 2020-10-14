import 'package:flutter/material.dart';
import 'package:push_notifications_flutter/src/providers/push_notifications_provider.dart';
import 'package:push_notifications_flutter/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    final pushProvier = new PushNotificationsProvider();
    pushProvier.initNotifications();
    pushProvier.messageStream.listen((argument) {
      print("Argument from main");
      print(argument);
      // Navigator.pushNamed(context, '/message');

      navigatorKey.currentState.pushNamed('/message', arguments: argument);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notifications App',
      initialRoute: '/',
      routes: routes,
      navigatorKey: navigatorKey,
    );
  }
}

