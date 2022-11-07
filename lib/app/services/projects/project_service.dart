import 'package:job_timer/app/view_models/project_view_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectViewModel projectViewModel);
}
