import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/ui/calender/calender.dart';
import 'package:todolist/ui/focus/focus.dart';
import 'package:todolist/ui/home/home.dart';
import 'package:todolist/ui/welcome/profile_page.dart';

import 'bottom_nav_provider.dart';

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
    //Profile(),

  ];
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: screens[current_index],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (num){
            print("current index$num");
            current_index=num;
            setState(() {
            });
          },
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          selectedItemColor: Color.fromRGBO(15, 87, 0, 1),
          unselectedItemColor: Color.fromRGBO(149, 149, 149, 1),
          selectedLabelStyle: TextStyle(
            color: Color.fromRGBO(15, 87, 0, 1),
          ),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.messenger),label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
          //  BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          ],)
    );
  }
}
