import '../models/task_model.dart';

class TasksRepo {
  final List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;
  void addTask(TaskModel task) {
    _tasks.add(task);
  }
}
