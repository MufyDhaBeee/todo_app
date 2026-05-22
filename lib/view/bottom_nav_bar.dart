import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task_states.dart';
import 'package:todolist/view/calender.dart';
import 'package:todolist/view/focus.dart';
import 'package:todolist/view/home.dart';
import 'package:todolist/view/profile_page.dart';
import 'package:todolist/viewmodel/task_provider.dart';

import '../viewmodel/bottom_nav_provider.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  List<Widget>screens=[
    HomeScreen(),
    Calender(),
    FocusPage(),
    ProfilePage(),

  ];
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        current_index = index;
      });
    }

    return  Consumer<TaskProvider>(
      builder: (context,taskProvider,child) {
        return Scaffold(
            body: screens[current_index],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              // onTap: (num){
              //   print("current index$num");
              //   current_index=num;
              //   setState(() {
              //   });
              // },
             onTap:  onItemTapped,
              currentIndex: current_index,
              backgroundColor: Color.fromRGBO(54, 54, 54, 1),
              selectedItemColor: Color.fromRGBO(134, 135, 231, 1),
              unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.87),

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'Calender'),
                BottomNavigationBarItem(icon: Icon(Icons.access_time_filled),label: 'Focus'),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),

              ],),

            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                backgroundColor: Color.fromRGBO(134, 135, 231, 1),
                foregroundColor: Color.fromRGBO(255, 255, 255, 1),
              shape: const CircleBorder(),
                onPressed: () {
              showAddTaskDialog(context);
             //      ShowTasks();
                },
                child: Icon(Icons.add),
            ),

                  );
      }
    );
  }
}
