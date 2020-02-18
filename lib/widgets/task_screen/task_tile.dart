import 'package:flutter/material.dart';
import 'package:todo/localizations.dart';
import 'package:todo/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function() onDimissed;
  final Function() onToggle;

  const TaskTile({
    @required this.task,
    @required this.onDimissed,
    @required this.onToggle,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        onDimissed();

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
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListTile(
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) => onToggle(),
            activeColor: Theme.of(context).accentColor,
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          subtitle: Text(
            task.description ?? '',
            style: TextStyle(
              decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
