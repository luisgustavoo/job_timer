import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/home/home_page.dart';

class HomeRouter extends FlutterGetItPageRoute {
  const HomeRouter({super.key});

  static const String router = '/home';

  @override
  List<Bind<Object>> get bindings => [];

  @override
  WidgetBuilder get page {
    return (conext) {
      return const HomePage();
    };
  }
}
