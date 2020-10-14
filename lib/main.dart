import 'package:flutter/material.dart';
import 'package:push_notifications_flutter/src/routes/routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Notifications App',
    initialRoute: '/',
    routes: routes,
  ));
}
