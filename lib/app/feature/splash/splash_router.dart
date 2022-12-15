import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/splash/controllers/splash_controller.dart';
import 'package:job_timer/app/feature/splash/splash_page.dart';

class SplashRouter extends FlutterGetItPageRoute {
  const SplashRouter({super.key});
  static const String router = '/';

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => SplashController(
            firebaseAuth: i(),
          )..isLogged(),
        ),
      ];

  @override
  WidgetBuilder get page {
    return (context) {
      return SplashPage(
        controller: context.get(),
      );
    };
  }
}
