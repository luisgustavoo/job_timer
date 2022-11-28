import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/home/controllers/home_controller.dart';
import 'package:job_timer/app/feature/home/home_page.dart';

class HomeRouter extends FlutterGetItPageRoute {
  const HomeRouter({super.key});

  static const String router = '/home';

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<HomeController>(
          (i) => HomeController(
            projectService: i(),
            authService: i(),
          ),
        ),
      ];

  @override
  WidgetBuilder get page {
    return (conext) {
      return HomePage(
        controller: conext.get()..loadProjects(),
      );
    };
  }
}
