import 'package:flutter/material.dart';
import 'package:todolist/view/home.dart';
import 'package:todolist/view/profile_page.dart';

class BottomNavProvider extends ChangeNotifier{
 int current_index=0;
 List<Widget> screens=[
   HomeScreen(),
   ProfilePage(),
   ProfilePage(),
 ];

  void change_navigation(int index){
    current_index=index;
    notifyListeners();
  }

}