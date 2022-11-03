import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/database/database_impl.dart';
import 'package:job_timer/app/job_timer_app.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
import 'package:job_timer/app/services/auth/auth_service_impl.dart';

class JobTimerRouter extends FlutterGetItPageRoute {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<GoogleSignIn>((i) => GoogleSignIn()),
        Bind.lazySingleton<FirebaseAuth>((i) => FirebaseAuth.instance),
        Bind.lazySingleton<AuthService>(
          (i) => AuthServiceImpl(
            googleSigIn: i(),
            firebaseAuth: i(),
          ),
        ),
        Bind.lazySingleton<Database>((i) => DatabaseImpl()),
      ];

  @override
  WidgetBuilder get page {
    return (context) {
      return const JobTimerApp();
    };
  }
}
