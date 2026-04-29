import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/ui/bottom_nav/bottom_nav_provider.dart';
import 'package:todolist/ui/welcome/welcome_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context,bottom,child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                'Index',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.87),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  child: Image.asset('assets/images/user_image.png'),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    child: Image.asset(
                      'assets/images/empty_home.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'What do you want to do today?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 0.87),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tap + to add your tasks',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 0.87),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
