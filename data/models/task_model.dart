import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({required super.id, required super.title});

  factory TaskModel.fromEntity(Task task) {
    return TaskModel(id: task.id, title: task.title);
  }
}
