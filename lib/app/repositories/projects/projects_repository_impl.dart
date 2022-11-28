// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/errors/failure.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/repositories/projects/projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl({
    required Database database,
  }) : _database = database;

  final Database _database;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConnection();
      await connection.writeTxn<int>(
        () {
          return connection.projects.put(project);
        },
      );
      AsukaSnackbar.success('Projeto cadastro com sucesso!!!');
      // ignore: avoid_catching_errors
    } on IsarError catch (e, s) {
      log('Erro ao cadastrar projeto', error: e, stackTrace: s);
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    try {
      final connection = await _database.openConnection();
      return connection.projects.filter().statusEqualTo(status).findAll();
      // ignore: avoid_catching_errors
    } on IsarError catch (e, s) {
      log('Erro ao buscar projeto status $status', error: e, stackTrace: s);
      throw Failure();
    }
  }

  @override
  Future<Project> addTask(int projectId, ProjectTask task) async {
    try {
      final connection = await _database.openConnection();

      final project = await findById(projectId);

      final taskId = await connection.writeTxn<int>(
        () {
          return connection.projectTasks.put(task);
        },
      );

      final projectTask = ProjectTask()
        ..id = taskId
        ..name = task.name
        ..duration = task.duration
        ..created = task.created;

      project.tasks.add(projectTask);

      await connection.writeTxn<void>(
        () async {
          await project.tasks.save();
        },
      );

      return project;
      // ignore: avoid_catching_errors
    } on IsarError catch (e, s) {
      log('Erro ao gravar task', error: e, stackTrace: s);
      throw Failure();
    }
  }

  @override
  Future<Project> findById(int id) async {
    final connection = await _database.openConnection();
    final project = await connection.projects.get(id);

    if (project == null) {
      throw Failure(message: 'Projecto não existe');
    }
    return project;
  }

  Future<ProjectTask> findTaskById(int id) async {
    final connection = await _database.openConnection();
    final task = await connection.projectTasks.get(id);

    if (task == null) {
      throw Failure(message: 'Projecto não existe');
    }
    return task;
  }

  @override
  Future<void> finishProject(Project project) async {
    try {
      final connection = await _database.openConnection();

      await connection.writeTxn<int>(
        () {
          return connection.projects.put(project);
        },
      );
      // ignore: avoid_catching_errors
    } on IsarError catch (e, s) {
      log('Erro ao finalizar projeto', error: e, stackTrace: s);
      throw Failure();
    }
  }
}
