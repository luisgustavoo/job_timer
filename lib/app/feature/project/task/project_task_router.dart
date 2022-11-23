import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/project/task/controller/project_task_controller.dart';
import 'package:job_timer/app/feature/project/task/project_task_page.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectTaskRouter extends FlutterGetItPageRoute {
  const ProjectTaskRouter({required this.projectViewModel});

  static const router = '/project/task';
  final ProjectViewModel projectViewModel;

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => ProjectTaskController(projectViewModel: projectViewModel),
        ),
      ];

  @override
  WidgetBuilder get page {
    return (context) {
      return ProjectTaskPage(
        controller: context.get(),
      );
    };
  }
}
