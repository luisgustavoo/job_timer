import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_timer/app/core/errors/failure.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  ProjectRegisterController({required ProjectService projectService})
      : _projectService = projectService,
        super(ProjectRegisterStatus.intial);

  final ProjectService _projectService;

  Future<void> save(String projecName, int estimatedHours) async {
    try {
      emit(ProjectRegisterStatus.loading);
      final projectViewModel = ProjectViewModel(
        name: projecName,
        estimatedHours: estimatedHours,
        status: ProjectStatus.emAndamento,
        tasks: [],
      );
      await _projectService.register(projectViewModel);
      emit(ProjectRegisterStatus.success);
    } on Exception catch (e, s) {
      log('Erro ao salvar projeto', error: e, stackTrace: s);
      emit(ProjectRegisterStatus.failure);
      throw Failure();
    }
  }
}
