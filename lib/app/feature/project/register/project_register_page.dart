import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/feature/project/register/controllers/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({required this.controller, super.key});
  final ProjectRegisterController controller;

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _projectNameController = TextEditingController();
  final _estimatedHoursController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _projectNameController.dispose();
    _estimatedHoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterStatus.success:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.failure:
            AsukaSnackbar.alert('Erro ao salvar projeto');
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Criar novo projeto',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  controller: _projectNameController,
                  decoration: const InputDecoration(
                    label: Text('Nome do Projeto'),
                  ),
                  validator: Validatorless.required('Campo obrigatório'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _estimatedHoursController,
                  decoration: const InputDecoration(
                    label: Text('Estimativa de Horas'),
                  ),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.number('Permitido apenas números')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocSelector<ProjectRegisterController, ProjectRegisterStatus,
                    bool>(
                  bloc: widget.controller,
                  selector: (state) => state == ProjectRegisterStatus.loading,
                  builder: (context, showLoading) {
                    return Visibility(
                      visible: showLoading,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      final projectName = _projectNameController.text;
                      final estimatedHours =
                          int.parse(_estimatedHoursController.text);
                      await widget.controller.save(projectName, estimatedHours);
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                  ),
                  child: const Text('Salvar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
