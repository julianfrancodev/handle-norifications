import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _messageStreamController = StreamController<String>.broadcast();

  Stream<String> get messageStream => _messageStreamController.stream;

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotifications() async {
    await _firebaseMessaging.requestNotificationPermissions();

    final token = await _firebaseMessaging.getToken();

    print("token firebase");

    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print(message);
    final argument = message['data']['food'] ?? 'no-data';
    print(argument);
    _messageStreamController.sink.add(argument);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print(message);
    final argument = message['data']['food'] ?? 'no-data';
    print(argument);
    _messageStreamController.sink.add(argument);
    // Or do other work.
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print(message);
    final argument = message['data']['food'] ?? 'no-data';
    print(argument);
    _messageStreamController.sink.add(argument);
    // Or do other work.
  }

  dispose() {
    _messageStreamController?.close();
  }
}
