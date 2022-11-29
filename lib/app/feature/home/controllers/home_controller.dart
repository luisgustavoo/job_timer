import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_timer/app/core/errors/failure.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({
    required ProjectService projectService,
    required AuthService authService,
  })  : _projectService = projectService,
        _authService = authService,
        super(HomeState.initial());

  final ProjectService _projectService;
  final AuthService _authService;

  Future<void> loadProjects() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final projects = await _projectService.findByStatus(state.projectFilter);
      emit(state.copyWith(status: HomeStatus.success, projects: projects));
    } on Exception catch (e, s) {
      log('Erro ao buscar os projetos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
      throw Failure();
    }
  }

  Future<void> filter(ProjectStatus projectStatus) async {
    try {
      emit(
        state.copyWith(
          status: HomeStatus.loading,
        ),
      );
      final projects = await _projectService.findByStatus(projectStatus);
      emit(
        state.copyWith(
          status: HomeStatus.success,
          projects: projects,
          projectFilter: projectStatus,
        ),
      );
    } on Exception catch (e, s) {
      log('Erro ao buscar os projetos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
      throw Failure();
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
