import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_timer/app/core/ui/button_with_loader.dart';
import 'package:job_timer/app/feature/project/task/controller/project_task_controller.dart';
import 'package:validatorless/validatorless.dart';

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
    return BlocListener<ProjectTaskController, ProjectTaskState>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state.status == ProjectTaskStatus.failure) {
          AsukaSnackbar.alert('Erro ao cadastrar task').show();
        } else if (state.status == ProjectTaskStatus.success) {
          context.pop();
        }
      },
      child: Scaffold(
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
                  validator: Validatorless.required('Informe o nome da task'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _taskDurationController,
                  decoration: const InputDecoration(
                    label: Text('Duração da task'),
                  ),
                  keyboardType: TextInputType.number,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe a duração da task'),
                  ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonWithLoader<ProjectTaskController, ProjectTaskState>(
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      final taskName = _taskNameController.text;
                      final taskDuration = int.parse(
                        _taskDurationController.text,
                      );
                      await widget.controller.save(taskName, taskDuration);
                    }
                  },
                  label: 'Salvar',
                  selector: (state) =>
                      state.status == ProjectTaskStatus.loading,
                  bloc: widget.controller,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
