import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_timer/app/feature/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/feature/project/detail/widget/projec_pie_chart.dart';
import 'package:job_timer/app/feature/project/detail/widget/project_detail_appbar.dart';
import 'package:job_timer/app/feature/project/detail/widget/project_task_tile.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({required this.controller, super.key});
  final ProjectDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Erro interno');
          }
        },
        builder: (context, state) {
          final projectViewModel = state.projectViewModel;

          switch (state.status) {
            case ProjectDetailStatus.inital:
            // return _builInitialProject();
            case ProjectDetailStatus.success:
              return _buildProjectDetail(context, projectViewModel);
            case ProjectDetailStatus.loading:
              return _builProgress();
            case ProjectDetailStatus.failure:
              return _builErrorProject();
            // return AsukaSnackbar.alert('Erro interno');
          }
        },
      ),
    );
  }

  // Center _builInitialProject() {
  //   return const Center(
  //     child: Text('Carregando projeto'),
  //   );
  // }

  Center _builProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _builErrorProject() {
    return const Center(
      child: Text('Erro ao carregar o projeto'),
    );
  }

  CustomScrollView _buildProjectDetail(
    BuildContext context,
    ProjectViewModel projectViewModel,
  ) {
    return CustomScrollView(
      slivers: [
        ProjectDetailAppbar(
          context: context,
          projectViewModel: projectViewModel,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(bottom: 50, top: 50),
                child: const ProjecPieChart(),
              ),
              ProjectTaskTile(),
              ProjectTaskTile(),
              // ProjectTaskTile(),
              // ProjectTaskTile(),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset('assets/images/ic_finish_project.svg'),
                label: const Text('Finalizar projeto'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
