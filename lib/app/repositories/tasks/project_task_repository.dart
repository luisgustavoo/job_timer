import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_task.dart';

abstract class ProjectTaskRepository {
  Future<void> register(ProjectTask task);
}
