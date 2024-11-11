class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;

  const TaskModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });
}
