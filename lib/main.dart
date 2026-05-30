import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view/bottom_nav_bar.dart';
import 'package:todolist/viewmodel/bottom_nav_provider.dart';
import 'package:todolist/viewmodel/focus_provider.dart';
import 'package:todolist/viewmodel/home_provider.dart';
import 'package:todolist/viewmodel/profile_provider.dart';
import 'package:todolist/viewmodel/task_provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => FocusProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BottomScreen(),
      ),
    );
  }
}
