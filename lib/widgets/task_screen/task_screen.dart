import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/localizations.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/task_screen/task_screen_store.dart';

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

            return Dismissible(
              key: Key('tile${task.id}'),
              background: Container(
                color: Theme.of(context).accentColor,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onDismissed: (_) {
                _store.deleteTask(task);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).bottomAppBarColor,
                    content: Text(
                      AppLocalizations.of(context).taskScreenSnackbarTaskDeleted,
                      style: Theme.of(context).textTheme.body1,
                    ),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              direction: DismissDirection.endToStart,
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(task.description ?? ''),
              ),
            );
          },
        );
      },
    );
  }
}
