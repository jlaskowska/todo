import 'package:hive/hive.dart';
import 'package:todo/models/task.dart';

class TaskService {
  final _box = Hive.box<Task>('tasks');

  List<Task> get tasks => _box.values.toList();

  void addTask(Task task) => _box.put(task.id, task);

  void deleteTask(Task task) => _box.delete(task.id);

  void deleteAll() => _box.deleteAll(_box.keys);

  void toggleTaskIsCompleted(Task task) {
    task.isCompleted = !task.isCompleted;
    addTask(task);
  }
}
