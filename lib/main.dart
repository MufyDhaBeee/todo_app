import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view/bottom_nav_bar.dart';
import 'package:todolist/viewmodel/bottom_nav_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>BottomNavProvider(),)
      ],
        child: BottomScreen(),),
    );

  }
}





