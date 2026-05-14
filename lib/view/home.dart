import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view/common_widget.dart';
import 'package:todolist/view/welcome_todo.dart';
import 'package:todolist/viewmodel/bottom_nav_provider.dart';
import 'package:todolist/viewmodel/home_provider.dart';

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

                  SvgPicture.asset('assets/icons/timer.svg'),
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
        Provider<HomeProvider>(
          create: (_)=>HomeProvider(),
          builder: (context,child) {
            return Material(
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(54, 54, 54, 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            //---- Header-------------------------------------------------------------->>
                            const Text(
                              ' Add Task',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.87),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            //---- Step 1: Title field  /  Step 2: Title as label -----------------------------------------------
                            TaskTextField(
                              controller: context.watch<HomeProvider>().titleController,
                              focusNode:context.watch<HomeProvider>().titleFocus,
                              hintText: 'Do math homework',
                              onSubmitted: (String value) {  },
                            ),
                            SizedBox(height: 20),
                            Text(' Description', style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Color.fromRGBO(175, 175, 175, 1),
                            ),),
                            SizedBox(height: 35,),
                            //---------ToolBar Icon---------------------------------------------------------------------------->
                            ToolbarRow(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        );
    },
  );
}

///---------------------Add Task(Desciption)---------------------------------------------------------->>>
///
void showAddTaskDescriptionDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return
        Provider<HomeProvider>(
            create: (_)=>HomeProvider(),
            builder: (context,child) {
              return Material(
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 280,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(54, 54, 54, 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            textDirection: TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              //---- Header-------------------------------------------------------------->>
                              const Text(
                                ' Add Task',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              //---- Step 1: Title field  /  Step 2: Title as label -----------------------------------------------
                              const SizedBox(height: 16),
                              Text(' Do math homework', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),),
                              SizedBox(height: 20),
                              TaskTextField(
                                controller: context.watch<HomeProvider>().titleController,
                                focusNode:context.watch<HomeProvider>().titleFocus,
                                hintText: 'Do chapter 2 to 5 for next week',
                                onSubmitted: (String value) {  },
                              ),

                              SizedBox(height: 35,),
                              //---------ToolBar Icon---------------------------------------------------------------------------->
                              ToolbarRow(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        );
    },
  );
}
