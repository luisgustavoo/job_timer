import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_task_view_model.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

part 'project_task_state.dart';

class ProjectTaskController extends Cubit<ProjectTaskState> {
  ProjectTaskController({
    required this.projectViewModel,
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(
          ProjectTaskState.initial(
            projectViewModel: projectViewModel,
          ),
        );

  final ProjectViewModel projectViewModel;
  final ProjectService _projectService;

  Future<void> save(String taskName, int duration) async {
    try {
      emit(state.copyWith(status: ProjectTaskStatus.loading));
      final task = ProjectTaskViewModel(name: taskName, duration: duration);
      await _projectService.addTask(projectViewModel.id!, task);
      emit(state.copyWith(status: ProjectTaskStatus.success));
      // ignore: avoid_catching_errors
    } on Exception catch (e, s) {
      log('Erro ao cadastrar task', error: e, stackTrace: s);
      emit(state.copyWith(status: ProjectTaskStatus.failure));
    }
  }
}
