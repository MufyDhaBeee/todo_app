import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task_states.dart';
import 'package:todolist/view/category.dart';
import 'package:todolist/view/common_widget.dart';
import 'package:todolist/view/welcome_todo.dart';
import 'package:todolist/viewmodel/bottom_nav_provider.dart';

import '../viewmodel/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottom, child) {
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
      },
    );
  }
}

///-------------Add Task---------------------------------------------------------->>>

void showAddTaskDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return Provider<HomeProvider>(
        create: (_) => HomeProvider(),
        builder: (context, child) {
          return Consumer<HomeProvider>(
            builder: (context, homeProvider, child) {
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
                              SizedBox(height: 10),
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
                              if (context.watch<HomeProvider>().task_state ==
                                  TaskStates.task_title) ...[
                                TaskTextField(
                                  controller: context
                                      .watch<HomeProvider>()
                                      .titleController,
                                  focusNode: context
                                      .watch<HomeProvider>()
                                      .titleFocus,
                                  hintText: 'Do math homework',
                                  onSubmitted: (String value) {
                                    print("the task is compoleted");
                                    if (value.isNotEmpty) {
                                      print("done task");
                                      homeProvider.changeCurrentStateOfTask(
                                        TaskStates.task_description,
                                      );
                                      print(homeProvider.titleController.text);
                                      print(
                                        context
                                            .watch<HomeProvider>()
                                            .task_state,
                                      );
                                    }
                                  },
                                ),
                              ] else if (context
                                      .watch<HomeProvider>()
                                      .task_state ==
                                  TaskStates.task_description) ...[
                                Text(
                                  context
                                      .watch<HomeProvider>()
                                      .titleController
                                      .text,
                                ),
                              ],

                              SizedBox(height: 20),
                              Text(
                                ' Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Color.fromRGBO(175, 175, 175, 1),
                                ),
                              ),
                              SizedBox(height: 35),
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
            },
          );
        },
      );
    },
  );
}

/// -------------------Task Priority----------------------------------------------------------------------------------->>>

void showTaskPriorityDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return Provider<HomeProvider>(
        create: (_) => HomeProvider(),
        builder: (context, child) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 340,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(54, 54, 54, 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    // textDirection: TextDirection.ltr,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(height: 10),
                      //---- Header-------------------------------------------------------------->>
                      const Text(
                        ' Task Priority',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
                      // //------------------------------------------------------------------------------------
                      Divider(
                        color: Color.fromRGBO(151, 151, 151, 1),
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        width: 280,
                        child: GridView.builder(
                          itemCount: 11,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color.fromRGBO(39, 39, 39, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    SvgPicture.asset('assets/icons/flag.svg'),
                                    Text(
                                      index.toString(),
                                      style: TextStyle(
                                        color: Color.fromRGBO(
                                          255,
                                          255,
                                          255,
                                          0.87,
                                        ),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 53,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(54, 54, 54, 1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Color.fromRGBO(134, 135, 231, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              height: 53,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(134, 135, 231, 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

///-----------Category section-------------------------------------------------------------------------------------->>
///
void showCategoryDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return Provider<HomeProvider>(
        create: (_) => HomeProvider(),
        builder: (context, child) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 558,
                  width: 327,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(54, 54, 54, 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //---- Header-------------------------------------------------------------->>
                        const Text(
                          ' Choose Category',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        // //------------------------------------------------------------------------------------
                        Divider(
                          color: Color.fromRGBO(151, 151, 151, 1),
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 425,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 3,
                                  crossAxisSpacing: 3,
                                ),
                            itemCount: 11,
                            itemBuilder: (context, index) {
                              return CategoryTile();
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewCategory(),
                              ),
                            );
                          },
                          child: Container(
                            height: 48,
                            width: 289,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color.fromRGBO(134, 135, 231, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Add Category',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

///---------------calender------------------------------------------------------------------>>>
///
void showCalenderDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return Provider<HomeProvider>(
        create: (_) => HomeProvider(),
        builder: (context, child) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 475,
                  width: 327,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(54, 54, 54, 1),
                    borderRadius: BorderRadius.circular(4),

                  ),
                  child: Column(
                    children: [
                      //---- Header-------------------------------------------------------------->>\
                      DatePickerTheme(
                        data: DatePickerThemeData(
                          backgroundColor: Color(0xff363636),
                          headerBackgroundColor: Colors.white,
                          headerForegroundColor: Colors.white,
                          dayBackgroundColor:WidgetStatePropertyAll(Color.fromRGBO(39, 39, 39, 1)),
                          dayShape: WidgetStatePropertyAll<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            )
                          ),
                          dayForegroundColor: WidgetStatePropertyAll<Color>(
                            Colors.white,
                          ),
                          dayStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                          ),
                          weekdayStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                          ),
                         ///---YearStyle-----------------------------
                          yearBackgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                          yearStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),

                        ),
                        child: CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.utc(2030),
                          onDateChanged: (time) {},
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 48,
                              width: 153,
                              decoration: BoxDecoration(
                                color:   Color.fromRGBO(54, 54, 54, 1),

                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(child: Text('Cancel', style: TextStyle(
                                color:  Color.fromRGBO(134, 135, 231, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),)),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 48,
                            width: 153,
                            decoration: BoxDecoration(
                              color:  Color.fromRGBO(134, 135, 231, 1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(child: Text('Choose Time', style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
