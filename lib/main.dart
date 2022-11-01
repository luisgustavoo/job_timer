import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/job_timer_app.dart';
import 'package:job_timer/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const JobTimerApp());
}
