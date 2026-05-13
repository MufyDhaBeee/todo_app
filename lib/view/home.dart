import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view/common_widget.dart';
import 'package:todolist/view/welcome_todo.dart';
import 'package:todolist/viewmodel/bottom_nav_provider.dart';

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
        print("dsgkldfj");
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
///-------------Add Task---------------------------------------------------------->>>

void showAddTaskDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return
        Material(
          color: Colors.transparent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(54, 54, 54, 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    // ── Header ─────────────────────────────────────────────────────
                    const Text(
                      'Add Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ── Step 1: Title field  /  Step 2: Title as label ─────────────



                    /////-------Password----------------------------------------------------------->>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 48,
                          width: 287,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Color.fromRGBO(151, 151, 151, 1),
                              )
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: ' Do math homework',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Description', style: TextStyle(
                          color: Color.fromRGBO(175, 175, 175, 1)
                        ),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.timer, color: Color.fromRGBO(255, 255, 255, 0.87),),
                            SizedBox(width: 20,),
                            Icon(Icons.shopping_basket, color: Color.fromRGBO(255, 255, 255, 0.87),),
                            SizedBox(width: 20,),
                            Icon(Icons.flag, color: Color.fromRGBO(255, 255, 255, 0.87)),
                            Spacer(),
                            Icon(Icons.send, color: Color.fromRGBO(255, 255, 255, 0.87),),


                          ],
                        )




                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    },
  );
}

