import 'package:mobx/mobx.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/task_service.dart';

part 'task_screen_store.g.dart';

class TaskScreenStore = _TaskScreenStore with _$TaskScreenStore;

abstract class _TaskScreenStore with Store {
  final _taskService = TaskService();

  void deleteTask(Task task) => _taskService.deleteTask(task);
}
