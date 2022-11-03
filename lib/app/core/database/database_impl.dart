import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseImpl implements Database {
  Isar? _databseInstance;

  @override
  Future<Isar> openConnection() async {
    if (_databseInstance == null) {
      final dir = await getApplicationSupportDirectory();
      _databseInstance = await Isar.open(
        [ProjectSchema, ProjectTaskSchema],
        directory: dir.path,
      );
    }
    return _databseInstance!;
  }
}
