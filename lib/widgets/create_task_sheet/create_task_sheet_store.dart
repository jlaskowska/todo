import 'package:mobx/mobx.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/task_service.dart';
import 'package:uuid/uuid.dart';

part 'create_task_sheet_store.g.dart';

class CreateTaskSheetStore = _CreateTaskSheetStore with _$CreateTaskSheetStore;

abstract class _CreateTaskSheetStore with Store {
  List<ReactionDisposer> _disposers;
  final taskService = TaskService();

  _CreateTaskSheetStore() {
    _disposers = [
      reaction((_) => title, _validateTitle),
    ];
  }

  void dispose() => _disposers.forEach((disposer) => disposer());

  @observable
  String title;

  @observable
  String description;

  @observable
  bool validTitle = false;

  @action
  void _validateTitle(String value) => validTitle = value.trim().length >= 1;

  void addTask() {
    final task = Task(
      id: Uuid().v4(),
      title: title,
      description: description,
      createdDate: DateTime.now(),
    );

    taskService.addTask(task);
  }
}
