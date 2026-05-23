import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/entities/task.dart';
import '/domain/entities/repositories/usecases/get_tasks.dart';

// События
abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

// Состояния
abstract class TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  TaskLoaded(this.tasks);
}

class TaskError extends TaskState {}

// Bloc
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasks getTasks;

  TaskBloc(this.getTasks) : super(TaskLoading()) {
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await getTasks();
        emit(TaskLoaded(tasks));
      } catch (_) {
        emit(TaskError());
      }
    });
  }
}
