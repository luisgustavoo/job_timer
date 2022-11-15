import 'package:flutter/material.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/feature/home/controllers/home_controller.dart';
import 'package:job_timer/app/feature/project/register/project_register_router.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  HeaderProjectsMenu({required this.controller});
  final HomeController controller;
  ProjectStatus projectStatus = ProjectStatus.emAndamento;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          height: constraints.maxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DropdownButtonFormField<ProjectStatus>(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),

                    enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    border: OutlineInputBorder(
                      // borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    // contentPadding: EdgeInsets.zero,
                  ),
                  value: projectStatus,
                  items: ProjectStatus.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.label),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      projectStatus = value;
                      controller.filter(projectStatus);
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Novo Projeto'),
                  onPressed: () async {
                    await Navigator.of(context)
                        .pushNamed(ProjectRegisterRouter.router);
                    await controller.loadProjects();
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) =>
      true;
}
