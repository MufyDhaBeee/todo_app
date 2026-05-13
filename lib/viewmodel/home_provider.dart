import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final FocusNode titleFocus = FocusNode();
  final FocusNode descFocus = FocusNode();

}