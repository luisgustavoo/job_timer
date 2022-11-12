// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/repositories/projects/projects_repository.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectsRepository _projectsRepository;
  ProjectServiceImpl({
    required ProjectsRepository projectsRepository,
  }) : _projectsRepository = projectsRepository;

  @override
  Future<void> register(ProjectViewModel projectViewModel) async {
    final project = Project()
      ..id = projectViewModel.id
      ..name = projectViewModel.name
      ..status = projectViewModel.status
      ..estimatedHours = projectViewModel.estimatedHours;

    await _projectsRepository.register(project);
  }

  @override
  Future<List<ProjectViewModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectsRepository.findByStatus(status);
    return projects.map(ProjectViewModel.fromEntity).toList();
  }
}
