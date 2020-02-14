import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  bool isCompleted;

  Task({
    @required this.id,
    @required this.title,
    @required this.description,
  }) : isCompleted = false;

  @override
  String toString() => 'id: $id, title: $title, description: $description, isCompleted: $isCompleted';
}
