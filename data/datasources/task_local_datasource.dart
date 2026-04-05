import '../models/task_model.dart';

class TaskLocalDataSource {
  final List<TaskModel> _tasks = [];

  List<TaskModel> getTasks() => _tasks;

  void addTask(TaskModel task) {
    _tasks.add(task);
  }
}
