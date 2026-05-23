import '/domain/entities/task.dart';
import '/domain/entities/repositories/task_repositories.dart';
import '/data/models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      TaskModel(id: 1, title: 'Покормить кошку ', completed: false),
      TaskModel(id: 2, title: 'Сделать ктшку', completed: true),
      TaskModel(id: 3, title: 'Покодить на python', completed: false),
    ];
  }
}
