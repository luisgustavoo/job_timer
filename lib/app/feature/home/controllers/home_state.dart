// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState._({
    required this.projects,
    required this.status,
    required this.projectFilter,
  });

  HomeState.initial()
      : this._(
          projects: [],
          status: HomeStatus.initial,
          projectFilter: ProjectStatus.emAndamento,
        );

  final List<ProjectViewModel> projects;
  final HomeStatus status;
  final ProjectStatus projectFilter;

  HomeState copyWith({
    List<ProjectViewModel>? projects,
    HomeStatus? status,
    ProjectStatus? projectFilter,
  }) {
    return HomeState._(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      projectFilter: projectFilter ?? this.projectFilter,
    );
  }

  @override
  List<Object?> get props => [projects, status, projectFilter];
}
