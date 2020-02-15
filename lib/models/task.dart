import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

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
  DateTime createdDate;

  @HiveField(4)
  bool isCompleted;

  Task({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.createdDate,
  }) : isCompleted = false;

  @override
  String toString() =>
      'id: $id, title: $title, description: $description, createdDate: $createdDate, isCompleted: $isCompleted';
}
