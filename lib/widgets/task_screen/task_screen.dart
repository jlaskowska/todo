import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/task_screen/task_screen_store.dart';
import 'package:todo/widgets/task_screen/task_tile.dart';

class TaskScreen extends StatelessWidget {
  final _store = TaskScreenStore();

  TaskScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Task>('tasks').listenable(),
      builder: (_, Box<Task> box, __) {
        final tasks = box.values.toList();
        tasks.sort((b, a) => a.createdDate.compareTo(b.createdDate));

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (___, index) {
            final task = tasks[index];

            return TaskTile(
              task: task,
              onDimissed: () => _store.deleteTask(task),
              onToggle: () => _store.toggleTaskIsCompleted(task),
            );
          },
        );
      },
    );
  }
}
