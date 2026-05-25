
import 'package:flutter/material.dart';
import 'package:todolist/model/task_model.dart';

import '../model/task_states.dart';

class TaskProvider extends ChangeNotifier{
  List<TaskModel> tasks = [];
  final TextEditingController titleController = TextEditingController();
  String? title;
  String? description;
  final TextEditingController descController = TextEditingController();
  final FocusNode titleFocus = FocusNode();
  final FocusNode descFocus = FocusNode();
  int selectedHour = 8;
  int selectedMinute = 20;
  String selectedPeriod = 'PM';
  int taskPrority=0;
   int dateTime=0;
  TaskStates task_state= TaskStates.task_title;
  changeCurrentStateOfTask(TaskStates taskState){
    task_state=taskState;
    notifyListeners();
  }

  addToTask(TaskModel taskModel){
    print("state is add to task ${taskModel.title}");
    tasks.add(taskModel);
    print("state is after task list adding${tasks.first}");

    notifyListeners();
  }


}