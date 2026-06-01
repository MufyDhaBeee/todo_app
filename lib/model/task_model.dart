class TaskModel {
  String? title;
  String? description;
  final DateTime createdAt;
  final int endedDate;
  final int selectedHour;
  final int selectedMinute;
  final String selectedPeriod;
  int? priority;
  dynamic category;

  TaskModel({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.endedDate,
    required this.selectedPeriod,
    required this.selectedMinute,
    required this.selectedHour,
    required this.priority,
    required this.category,
  });
}
