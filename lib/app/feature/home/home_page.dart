import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_timer/app/feature/home/controllers/home_controller.dart';
import 'package:job_timer/app/feature/home/widgets/header_projects_menu.dart';
import 'package:job_timer/app/feature/home/widgets/project_tile.dart';
import 'package:job_timer/app/feature/splash/splash_router.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.controller, super.key});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          AsukaSnackbar.alert('Erro ao buscar projetos').show();
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: ListTile(
              title: const Text('Sair'),
              onTap: () async {
                final navigator = Navigator.pushNamedAndRemoveUntil(
                  context,
                  SplashRouter.router,
                  (route) => true,
                );

                await controller.signOut();

                context.goNamed(SplashRouter.router);

                await navigator;
              },
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Projetos'),
                expandedHeight: 100,
                toolbarHeight: 100,
                centerTitle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: HeaderProjectsMenu(controller: controller),
                pinned: true,
              ),
              BlocSelector<HomeController, HomeState, bool>(
                bloc: controller,
                selector: (state) => state.status == HomeStatus.loading,
                builder: (context, showLoading) {
                  return SliverVisibility(
                    visible: showLoading,
                    sliver: const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                },
              ),
              BlocSelector<HomeController, HomeState, List<ProjectViewModel>>(
                bloc: controller,
                selector: (state) => state.projects,
                builder: (context, projects) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      projects
                          .map(
                            (project) => ProjectTile(
                              projectViewModel: project,
                              onTap: () async {
                                // await Navigator.pushNamed(
                                //   context,
                                //   ProjectDetailRouter.router,
                                //   arguments: project,
                                // );
                                context.goNamed(
                                  'project_details',
                                  extra: project,
                                );

                                await controller.loadProjects();
                              },
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
