class TaskModel {
  int id;
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
  });
}
