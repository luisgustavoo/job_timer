import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/splash/splash_page.dart';

class SplashRouter extends FlutterGetItPageRoute {
  const SplashRouter({super.key});
  static const String router = '/splash';

  @override
  WidgetBuilder get page {
    return (context) {
      return SplashPage(firebaseAuth: context.get());
    };
  }
}
