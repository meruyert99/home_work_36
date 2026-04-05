import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';

class TaskPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: Column(
        children: [
          TextField(controller: controller),
          ElevatedButton(
            onPressed: () {
              vm.addNewTask(controller.text);
              controller.clear();
            },
            child: const Text("Add Task"),
          ),
          if (vm.error != null)
            Text(vm.error!, style: const TextStyle(color: Colors.red)),
          Expanded(
            child: ListView.builder(
              itemCount: vm.tasks.length,
              itemBuilder: (_, index) {
                final task = vm.tasks[index];
                return ListTile(title: Text(task.title));
              },
            ),
          )
        ],
      ),
    );
  }
}
