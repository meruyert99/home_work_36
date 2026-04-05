import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/add_task.dart';

class TaskViewModel extends ChangeNotifier {
  final GetTasks getTasks;
  final AddTask addTask;

  List<Task> tasks = [];
  String? error;

  TaskViewModel({
    required this.getTasks,
    required this.addTask,
  });

  void loadTasks() {
    try {
      tasks = getTasks();
      error = null;
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }

  void addNewTask(String title) {
    try {
      addTask(title);
      loadTasks();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
