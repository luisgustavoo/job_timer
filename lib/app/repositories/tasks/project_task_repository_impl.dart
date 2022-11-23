import 'dart:developer';

import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/errors/failure.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/repositories/tasks/project_task_repository.dart';

class ProjectTaskRepositoryImpl implements ProjectTaskRepository {
  const ProjectTaskRepositoryImpl({required Database database})
      : _database = database;
  final Database _database;

  @override
  Future<void> register(ProjectTask task) async {
    try {
      final connection = await _database.openConnection();
      await connection.writeTxn<int>(() {
        return connection.projectTasks.put(task);
      });
    } on Exception catch (e, s) {
      log('Erro ao gravar task', error: e, stackTrace: s);
      throw Failure();
    }
  }
}
