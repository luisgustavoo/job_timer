import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({Key? key}) : super(key: key);

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
    return Scaffold(
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
              ElevatedButton(
                onPressed: () {
                  final formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {}
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
    );
  }
}
