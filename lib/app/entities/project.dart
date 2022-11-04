import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';
part 'project.g.dart';

@Collection()
class Project {
  Id? id = Isar.autoIncrement;
  late String name;
  @enumerated
  late ProjectStatus status;
  final tasks = IsarLinks<ProjectTask>();
}
