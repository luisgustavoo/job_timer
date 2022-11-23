import 'package:flutter/material.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/feature/project/task/project_task_router.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectDetailAppbar extends SliverAppBar {
  ProjectDetailAppbar({
    required ProjectViewModel projectViewModel,
    required BuildContext context,
    super.key,
  }) : super(
          expandedHeight: 100,
          pinned: true,
          toolbarHeight: 100,
          title: Text(projectViewModel.name),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Align(
                alignment: const Alignment(0, 1.6),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${projectViewModel.tasks.length} tasks'),
                          Visibility(
                            visible: projectViewModel.status ==
                                ProjectStatus.emAndamento,
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  ProjectTaskRouter.router,
                                  arguments: projectViewModel,
                                );
                              },
                              icon: const Icon(
                                Icons.add_circle_rounded,
                                size: 30,
                              ),
                              label: const Text(
                                'Adicionar tasks',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.zero,
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
}
