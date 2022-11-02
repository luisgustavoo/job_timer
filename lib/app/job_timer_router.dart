import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_timer/app/job_timer_app.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
import 'package:job_timer/app/services/auth/auth_service_impl.dart';

class JobTimerRouter extends FlutterGetItPageRoute {
  @override
  List<Bind<Object>> get bindings => [
        Bind.singleton<GoogleSignIn>((i) => GoogleSignIn()),
        Bind.singleton<FirebaseAuth>((i) => FirebaseAuth.instance),
        Bind.singleton<AuthService>(
          (i) => AuthServiceImpl(
            googleSigIn: i(),
            firebaseAuth: i(),
          ),
        )
      ];

  @override
  WidgetBuilder get page {
    return (constext) {
      return const JobTimerApp();
    };
  }
}
