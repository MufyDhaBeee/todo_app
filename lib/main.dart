import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/ui/bottom_nav/bottom_nav_bar.dart';
import 'package:todolist/ui/bottom_nav/bottom_nav_provider.dart';
import 'package:todolist/ui/welcome/profile_page.dart';
import 'package:todolist/ui/welcome/welcome_todo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>BottomNavProvider(),)
      ],child: BottomScreen(),),
    );

  }
}





