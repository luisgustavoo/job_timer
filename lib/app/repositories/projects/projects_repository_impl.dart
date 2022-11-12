// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/errors/failure.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
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
}
