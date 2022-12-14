import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  ProjectDetailController({
    required this.projectViewModel,
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(ProjectDetailState.initial(projectViewModel));

  final ProjectViewModel projectViewModel;
  final ProjectService _projectService;

  Future<void> updateProject() async {
    final project =
        await _projectService.findById(state.projectViewModel.id ?? 0);
    emit(
      state.copyWith(
        projectViewModel: project,
        status: ProjectDetailStatus.success,
      ),
    );
  }

  Future<void> finishProject() async {
    try {
      emit(state.copyWith(status: ProjectDetailStatus.loading));
      await _projectService.finishProject(state.projectViewModel);
      await updateProject();
    } on Exception catch (e, s) {
      log('Erro ao finalizar projecto', error: e, stackTrace: s);
      emit(state.copyWith(status: ProjectDetailStatus.failure));
    }
  }
}
