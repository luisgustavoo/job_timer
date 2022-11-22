// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'project_detail_controller.dart';

enum ProjectDetailStatus { inital, loading, success, failure }

class ProjectDetailState extends Equatable {
  final ProjectViewModel projectViewModel;
  final ProjectDetailStatus status;

  const ProjectDetailState._({
    required this.status,
    required this.projectViewModel,
  });

  const ProjectDetailState.initial(ProjectViewModel projectViewModel)
      : this._(
          status: ProjectDetailStatus.inital,
          projectViewModel: projectViewModel,
        );

  ProjectDetailState copyWith({
    ProjectViewModel? projectViewModel,
    ProjectDetailStatus? status,
  }) {
    return ProjectDetailState._(
      projectViewModel: projectViewModel ?? this.projectViewModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, projectViewModel];
}
