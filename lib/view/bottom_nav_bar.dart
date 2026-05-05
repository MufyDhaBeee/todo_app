import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view/calender.dart';
import 'package:todolist/view/focus.dart';
import 'package:todolist/view/home.dart';
import 'package:todolist/view/profile_page.dart';

import '../viewmodel/bottom_nav_provider.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  List<Widget>screens=[
    HomeScreen(),
    FocusPage(),
    Calender(),
    ProfilePage(),

  ];
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: screens[current_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (num){
            print("current index$num");
            current_index=num;
            setState(() {
            });
          },
          backgroundColor: Color.fromRGBO(54, 54, 54, 1),
          selectedItemColor: Color.fromRGBO(255, 255,255,1),
          unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.87),
          selectedLabelStyle: TextStyle(
            color: Color.fromRGBO(15, 87, 0, 1),
          ),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'Calender'),
            BottomNavigationBarItem(icon: Icon(Icons.access_time_filled),label: 'Focus'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),

          ],)
    );
  }
}
