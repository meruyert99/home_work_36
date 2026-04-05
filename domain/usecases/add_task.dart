import '../entities/task.dart';
import '../repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  void call(String title) {
    if (title.isEmpty) {
      throw Exception("Title cannot be empty");
    }

    final task = Task(
      id: DateTime.now().toString(),
      title: title,
    );

    repository.addTask(task);
  }
}
