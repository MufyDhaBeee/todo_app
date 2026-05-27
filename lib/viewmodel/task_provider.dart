
import 'package:flutter/material.dart';
import 'package:todolist/model/task_model.dart';

import '../model/task_states.dart';

class TaskProvider extends ChangeNotifier{
  List<TaskModel> tasks = [];
  final TextEditingController titleController = TextEditingController();
  String? title='';
  String? description;
  final TextEditingController descController = TextEditingController();
  final FocusNode titleFocus = FocusNode();
  final FocusNode descFocus = FocusNode();
  int selectedHour = 8;
  int selectedMinute = 20;
  String selectedPeriod = 'PM';
  int taskPrority=0;
   int dateTime=0;
  TaskStates task_state = TaskStates.task_title;
  changeCurrentStateOfTask(TaskStates taskState){
    task_state=taskState;
    notifyListeners();
  }
  changeValueofTask(String value){
    print("change value of task");
    print("current task state$task_state");
    switch(task_state){
      case TaskStates.task_title:
        title=value;
        print("from title adding function $title");
        print("changed task value ");
        break;
      case TaskStates.task_description:
        description=value;
        print("change value of description");
        break;
      default:
        Exception('saf');
    }
    notifyListeners();
  }

  addToTask(index){
    print("From Tasks Data");
    print("title $title");
    print("description $description");
    print('date time $dateTime');
    print('index $index',);
    tasks.add(TaskModel(title: 'title', description: 'description', createdAt: DateTime.now(), endedDate: 1 , priority: 0, category: 'category'));
    print("state is after task list adding${tasks.first.title}");

    notifyListeners();
  }


}