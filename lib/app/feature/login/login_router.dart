import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/login/controllers/login_controller.dart';
import 'package:job_timer/app/feature/login/login_page.dart';

class LoginRouter extends FlutterGetItPageRoute {
  const LoginRouter({super.key});

  static const String router = '/login';

  @override
  List<Bind<Object>> get bindings {
    return [
      Bind.lazySingleton(
        (i) => LoginController(
          authService: i(),
        ),
      ),
    ];
  }

  @override
  WidgetBuilder get page {
    return (context) {
      return LoginPage(
        controller: context.get(),
      );
    };
  }
}
