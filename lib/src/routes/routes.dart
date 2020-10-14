import 'package:flutter/material.dart';
import 'package:push_notifications_flutter/src/pages/home_page.dart';
import 'package:push_notifications_flutter/src/pages/message_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => HomePage(),
  '/message': (context) => MessagePage(),
};
