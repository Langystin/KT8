import '/domain/entities/task.dart';
import '/domain/entities/repositories/task_repositories.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<Task>> call() {
    return repository.getTasks();
  }
}
