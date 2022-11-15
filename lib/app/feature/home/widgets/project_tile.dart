import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({required this.projectViewModel, super.key});
  final ProjectViewModel projectViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 90,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 4,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ProjectName(
            projectViewModel: projectViewModel,
            key: key,
          ),
          _ProjectProgress(
            projectViewModel: projectViewModel,
            key: key,
          ),
        ],
      ),
    );
  }
}

class _ProjectName extends StatelessWidget {
  const _ProjectName({required this.projectViewModel, super.key});

  final ProjectViewModel projectViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(projectViewModel.name),
          SvgPicture.asset(
            'assets/images/ic_arrow_right.svg',
            width: 12,
            height: 12,
          ),
        ],
      ),
    );
  }
}

class _ProjectProgress extends StatelessWidget {
  const _ProjectProgress({required this.projectViewModel, super.key});

  final ProjectViewModel projectViewModel;

  @override
  Widget build(BuildContext context) {
    var percent = 0.0;

    final totalTasks = projectViewModel.tasks.fold<int>(
      0,
      (previousValue, task) => previousValue += task.duration,
    );

    if (totalTasks > 0) {
      percent = totalTasks / projectViewModel.estimatedHours;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[400],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text('${projectViewModel.estimatedHours}h'),
        ],
      ),
    );
  }
}
