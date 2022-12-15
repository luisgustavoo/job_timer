import 'package:asuka/asuka.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_config_ui.dart';
import 'package:job_timer/app/routers/job_timer_routers.dart';

class JobTimerApp extends StatelessWidget {
  const JobTimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return Builder(
          builder: (context) {
            final asuka = Asuka.builder(context, child);
            return DevicePreview.appBuilder(context, asuka);
          },
        );
      },
      routerConfig: JobTimerRouters.router,
      locale: DevicePreview.locale(context),
      title: 'Job Timer',
      theme: AppConfigUi.theme,
    );
  }
}
