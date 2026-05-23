import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/presentation/blocs/task_bloc.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TaskBloc>().add(LoadTasks());

    return Scaffold(
      appBar: AppBar(title: const Text('Задачки')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoaded) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Icon(
                    task.completed ? Icons.check_circle : Icons.cancel,
                    color: task.completed ? const Color.fromARGB(255, 121, 203, 123) : const Color.fromARGB(255, 197, 93, 81),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Ошибка загрузки задач'));
          }
        },
      ),
    );
  }
}
