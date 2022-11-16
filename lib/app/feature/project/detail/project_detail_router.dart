import 'package:flutter/cupertino.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:job_timer/app/feature/project/detail/project_detail_page.dart';

class ProjectDetailRouter extends FlutterGetItPageRoute {
  static const router = '/project/detail';

  @override
  WidgetBuilder get page {
    return (context) {
      return const ProjectDetailPage();
    };
  }
}
