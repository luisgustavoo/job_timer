// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/repositories/projects/projects_repository.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_task_view_model.dart';
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

  @override
  Future<ProjectViewModel> addTask(
    int projectId,
    ProjectTaskViewModel projectTaskViewModel,
  ) async {
    final task = ProjectTask()
      ..name = projectTaskViewModel.name
      ..duration = projectTaskViewModel.duration;
    final project = await _projectsRepository.addTask(projectId, task);
    return ProjectViewModel.fromEntity(project);
  }

  @override
  Future<ProjectViewModel> findById(int id) async {
    final project = await _projectsRepository.findById(id);
    return ProjectViewModel.fromEntity(project);
  }
}
