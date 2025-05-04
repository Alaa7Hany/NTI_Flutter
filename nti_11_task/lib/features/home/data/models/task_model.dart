class TaskModel {
  int id;
  String title;
  String description;
  TaskStatus taskState;
  TaskGroup taskType;
  DateTime? endTime;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.taskState,
    required this.taskType,
    this.endTime,
  });
}

enum TaskStatus { all, inProgress, done, missed }

enum TaskGroup { all, personal, work, home }
