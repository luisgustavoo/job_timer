import 'package:job_timer/app/entities/project.dart';

abstract class ProjectsRepository {
  Future<void> register(Project project);
}
