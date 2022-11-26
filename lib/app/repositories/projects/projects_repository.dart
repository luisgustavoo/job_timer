import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';

abstract class ProjectsRepository {
  Future<void> register(Project project);

  Future<List<Project>> findByStatus(ProjectStatus status);

  Future<Project> addTask(int projectId, ProjectTask task);

  Future<Project> findById(int id);
}
