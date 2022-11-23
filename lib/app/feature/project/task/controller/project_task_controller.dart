import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

part 'project_task_state.dart';

class ProjectTaskController extends Cubit<ProjectTaskState> {
  ProjectTaskController({required this.projectViewModel})
      : super(
          ProjectTaskState.initial(
            projectViewModel: projectViewModel,
          ),
        );

  ProjectViewModel projectViewModel;

  Future<void> save(String taskName, int duration) async {
    emit(state.copyWith(status: ProjectTaskStatus.loading));
  }
}
