import 'package:flutter/cupertino.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/project/register/controllers/project_register_controller.dart';
import 'package:job_timer/app/feature/project/register/project_register_page.dart';

class ProjectRegisterRouter extends FlutterGetItPageRoute {
  const ProjectRegisterRouter({super.key});
  static const String router = 'project/register';

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ProjectRegisterController>(
          (i) => ProjectRegisterController(
            projectService: i(),
          ),
        ),
      ];

  @override
  WidgetBuilder get page {
    return (context) {
      return ProjectRegisterPage(
        controller: context.get(),
      );
    };
  }
}
