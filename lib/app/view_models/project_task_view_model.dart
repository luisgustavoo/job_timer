// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectTaskViewModel {
  ProjectTaskViewModel({
    required this.name,
    required this.duration,
    this.id,
  });
  final int? id;
  final String name;
  final int duration;
}
