import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/job_timer_router.dart';
import 'package:job_timer/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // await FirebaseAuth.instance.signOut();
  // await GoogleSignIn().disconnect();

  runApp(JobTimerRouter());
}
