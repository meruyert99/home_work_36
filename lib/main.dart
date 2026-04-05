import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/datasources/task_local_datasource.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/usecases/get_tasks.dart';
import 'domain/usecases/add_task.dart';
import 'presentation/viewmodels/task_viewmodel.dart';
import 'presentation/views/task_page.dart';

void main() {
  final dataSource = TaskLocalDataSource();
  final repository = TaskRepositoryImpl(dataSource);

  runApp(MyApp(repository));
}

class MyApp extends StatelessWidget {
  final TaskRepositoryImpl repository;

  const MyApp(this.repository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskViewModel(
            getTasks: GetTasks(repository),
            addTask: AddTask(repository),
          )..loadTasks(),
        ),
      ],
      child: MaterialApp(
        home: TaskPage(),
      ),
    );
  }
}
