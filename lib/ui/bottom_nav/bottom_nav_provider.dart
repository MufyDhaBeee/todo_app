import 'package:flutter/material.dart';
import 'package:todolist/ui/home/home.dart';
import 'package:todolist/ui/welcome/profile_page.dart';

class BottomNavProvider extends ChangeNotifier{
 int current_index=0;
 List<Widget> screens=[HomeScreen(),ProfilePage()];

  void change_navigation(int index){
    current_index=index;
    notifyListeners();
  }

}