import 'package:flutter/material.dart';
import 'package:todolist/model/task_model.dart';
import '../model/task_states.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];
  final TextEditingController titleController = TextEditingController();
  String? title = '';
  String? description = '';
  final TextEditingController descController = TextEditingController();
  final FocusNode titleFocus = FocusNode();
  final FocusNode descFocus = FocusNode();
  int selectedHour = 8;
  int selectedMinute = 20;
  String selectedPeriod = 'PM';
  int taskPrority = 0;
  int dateTime = 0;
  TaskStates task_state = TaskStates.task_title;

  void changeCurrentStateOfTask(TaskStates taskState) {
    task_state = taskState;
    notifyListeners();
  }

  void changeValueofTask(String value) {
    if (task_state == TaskStates.task_title) {
      title = value;
    } else if (task_state == TaskStates.task_description) {
      description = value;
    }
    notifyListeners();
  }

  void addToTask(int priority) {
    tasks.add(TaskModel(
      title: title ?? 'No Title',
      description: description ?? '',
      createdAt: DateTime.now(),
      endedDate: 1,
      priority: priority,
      category: 'category',
    ));
    
    // Reset fields for the next task
    title = '';
    description = '';
    task_state = TaskStates.task_title;
    notifyListeners();
  }
}
