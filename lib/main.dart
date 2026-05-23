import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/models/repositories/task_repository_impl.dart';
import '/domain/entities/repositories/usecases/get_tasks.dart';
import '/presentation/blocs/task_bloc.dart';
import '/presentation/blocs/screens/task_screen.dart';

void main() {
  final repository = TaskRepositoryImpl();
  final getTasks = GetTasks(repository);

  runApp(MyApp(getTasks: getTasks));
}

class MyApp extends StatelessWidget {
  final GetTasks getTasks;

  const MyApp({super.key, required this.getTasks});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture + Bloc',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => TaskBloc(getTasks),
        child: const TaskScreen(),
      ),
    );
  }
}
