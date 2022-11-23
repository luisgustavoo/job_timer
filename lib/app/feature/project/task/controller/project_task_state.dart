part of 'project_task_controller.dart';

enum ProjectTaskStatus { intial, loading, success, failure }

class ProjectTaskState extends Equatable {
  const ProjectTaskState._(
      {required this.projectViewModel, required this.status});

  const ProjectTaskState.initial({required ProjectViewModel projectViewModel})
      : this._(
          status: ProjectTaskStatus.intial,
          projectViewModel: projectViewModel,
        );

  final ProjectViewModel projectViewModel;
  final ProjectTaskStatus status;

  ProjectTaskState copyWith({
    ProjectViewModel? projectViewModel,
    ProjectTaskStatus? status,
  }) {
    return ProjectTaskState._(
      projectViewModel: projectViewModel ?? this.projectViewModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [projectViewModel, status];
}
