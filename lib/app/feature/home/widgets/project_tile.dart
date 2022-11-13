import 'package:flutter/material.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({required this.projectViewModel, super.key});
  final ProjectViewModel projectViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
