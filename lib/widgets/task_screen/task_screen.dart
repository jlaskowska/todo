import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/localizations.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/task_screen/animated_task_chart.dart';
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
        tasks.sort((b, a) => a.createdDate.compareTo(b.createdDate)); // sort by date, newest first
        final tasksCompletedPercentage = tasks.where((task) => task.isCompleted).length / tasks.length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).taskScreenGreeting,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        AppLocalizations.of(context).taskScreenTodaysTaskText,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  AnimatedTaskChart(
                    completedPercent: tasksCompletedPercentage,
                    size: 60.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (___, index) {
                  final task = tasks[index];

                  return TaskTile(
                    task: task,
                    onDimissed: () => _store.deleteTask(task),
                    onToggle: () => _store.toggleTaskIsCompleted(task),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
