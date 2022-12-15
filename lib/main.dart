import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/job_timer_router.dart';
import 'package:job_timer/firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  log('Message data: ${message.data}');
  log('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // log(fcmToken ?? '');
  // final availability = await GoogleApiAvailability.instance
  //     .checkGooglePlayServicesAvailability(true);
  // log('$availability');

  await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.onMessage.listen((message) {
    log('Got a message whilst in the foreground!');
    log('Message data: ${message.data}');

    if (message.notification != null) {
      log('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // FirebaseMessaging.onMessageOpenedApp.listen((message) {
  //   log('Got a message whilst in the foreground!');
  //   log('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     log('Message also contained a notification: ${message.messageId}');
  //   }
  // });

  runApp(
    DevicePreview(
      builder: (context) => JobTimerRouter(),
      // ignore: avoid_redundant_argument_values
      enabled: false,
    ),
  );
}
