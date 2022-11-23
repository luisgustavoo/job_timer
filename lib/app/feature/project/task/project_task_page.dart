import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/button_with_loader.dart';
import 'package:job_timer/app/feature/project/task/controller/project_task_controller.dart';

class ProjectTaskPage extends StatefulWidget {
  const ProjectTaskPage({required this.controller, super.key});

  final ProjectTaskController controller;

  @override
  State<ProjectTaskPage> createState() => _ProjectTaskPageState();
}

class _ProjectTaskPageState extends State<ProjectTaskPage> {
  final _taskNameController = TextEditingController();
  final _taskDurationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDurationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Criar nova task',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _taskNameController,
                decoration: const InputDecoration(
                  label: Text('Nome da task'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _taskDurationController,
                decoration: const InputDecoration(
                  label: Text('Duração da task'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonWithLoader<ProjectTaskController, ProjectTaskState>(
                onPressed: () async {
                  final formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    final taskName = _taskNameController.text;
                    final taskDuration = int.parse(
                      _taskDurationController.text,
                    );
                    // await widget.controller.save(projectName, estimatedHours);
                  }
                },
                label: 'Salvar',
                selector: (state) => state.status == ProjectTaskStatus.loading,
                bloc: widget.controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}
