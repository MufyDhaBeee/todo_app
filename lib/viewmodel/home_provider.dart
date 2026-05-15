import 'package:flutter/material.dart';
import 'package:todolist/model/task_states.dart';

class HomeProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final FocusNode titleFocus = FocusNode();
  final FocusNode descFocus = FocusNode();
  task_states task_state= task_states.task_title;


}