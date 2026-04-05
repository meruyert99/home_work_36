import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_datasource.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  List<Task> getTasks() {
    return dataSource.getTasks();
  }

  @override
  void addTask(Task task) {
    dataSource.addTask(TaskModel.fromEntity(task));
  }
}
