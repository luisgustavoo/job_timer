// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:job_timer/app/entities/project_task.dart';

class ProjectTaskViewModel {
  ProjectTaskViewModel({
    required this.name,
    required this.duration,
    this.id,
  });

  factory ProjectTaskViewModel.fromEntity(ProjectTask projectTask) {
    return ProjectTaskViewModel(
      name: projectTask.name,
      duration: projectTask.duration,
    );
  }

  final int? id;
  final String name;
  final int duration;
}
