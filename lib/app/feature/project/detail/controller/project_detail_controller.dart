import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  ProjectDetailController({required this.projectViewModel})
      : super(ProjectDetailState.initial(projectViewModel));

  final ProjectViewModel projectViewModel;
}
