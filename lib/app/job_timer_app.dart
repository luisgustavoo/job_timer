import 'package:asuka/asuka.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_config_ui.dart';
import 'package:job_timer/app/feature/home/home_router.dart';
import 'package:job_timer/app/feature/login/login_router.dart';
import 'package:job_timer/app/feature/project/detail/project_detail_router.dart';
import 'package:job_timer/app/feature/project/register/project_register_router.dart';
import 'package:job_timer/app/feature/splash/splash_router.dart';

class JobTimerApp extends StatelessWidget {
  const JobTimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Builder(
          builder: (context) {
            final asuka = Asuka.builder(context, child);
            return DevicePreview.appBuilder(context, asuka);
          },
        );
      },
      // DevicePreview.appBuilder,
      //  Asuka.builder,
      navigatorObservers: [Asuka.asukaHeroController],
      locale: DevicePreview.locale(context),
      title: 'Job Timer',
      theme: AppConfigUi.theme,
      initialRoute: SplashRouter.router,
      routes: {
        SplashRouter.router: (context) => const SplashRouter(),
        LoginRouter.router: (context) => const LoginRouter(),
        HomeRouter.router: (context) => const HomeRouter(),
        ProjectRegisterRouter.router: (context) =>
            const ProjectRegisterRouter(),
        ProjectDetailRouter.router: (context) => ProjectDetailRouter(),
      },
    );
  }
}
