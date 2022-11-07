// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_models/project_task_view_model.dart';

class ProjectViewModel {
  ProjectViewModel({
    required this.name,
    required this.estimatedHours,
    required this.status,
    required this.tasks,
    this.id,
  });
  final int? id;
  final String name;
  final int estimatedHours;
  final ProjectStatus status;
  final List<ProjectTaskViewModel> tasks;
}
