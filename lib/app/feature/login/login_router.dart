import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/login/login_page.dart';

class LoginRouter extends FlutterGetItPageRoute {
  const LoginRouter({super.key});

  static const String router = '/login';

  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.singleton((i) => FirebaseAuth.instance),
    ];
  }

  @override
  WidgetBuilder get page {
    return (context) {
      return const LoginPage();
    };
  }
}
