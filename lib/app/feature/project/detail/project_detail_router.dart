import 'package:flutter/cupertino.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/feature/project/detail/project_detail_page.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectDetailRouter extends FlutterGetItPageRoute {
  const ProjectDetailRouter({required this.projectViewModel});
  static const router = '/project/detail';
  final ProjectViewModel projectViewModel;

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => ProjectDetailController(
            projectViewModel: projectViewModel,
            projectService: i(),
          ),
        ),
      ];

  @override
  WidgetBuilder get page {
    return (context) {
      return ProjectDetailPage(
        controller: context.get(),
      );
    };
  }
}
