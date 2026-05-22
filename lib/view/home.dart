import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task_model.dart';
import 'package:todolist/model/task_states.dart';
import 'package:todolist/view/category.dart';
import 'package:todolist/view/common_widget.dart';
import 'package:todolist/viewmodel/bottom_nav_provider.dart';
import 'package:todolist/viewmodel/task_provider.dart';

import '../viewmodel/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        print(taskProvider.tasks.isNotEmpty);
        print("WELCOME TO THE HOME PAGE");
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
          body: taskProvider.tasks.isNotEmpty
              // ?  EmptyHomePage()
              // : HomeScreenPage(),
              ? Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/search.svg'),
                        SizedBox(width: 10),
                        // TextField(
                        //   decoration: InputDecoration(
                        //     hintText: 'Search for your task...',
                        //     hintStyle: TextStyle(
                        //       color: Color.fromRGBO(175, 175, 175, 1),
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w600,
                        //     )
                        //   ),
                        // ),
                        Text(
                          'Search for your task...',
                          style: TextStyle(
                            color: Color.fromRGBO(175, 175, 175, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskProvider.tasks[index];
                        return Card(child: ListTile(title: Text(task.title!)));
                      },
                    ),
                  ],
                )
              : Padding(
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
          // ListView.builder(
          //   itemCount: taskProvider.tasks.length,
          //     itemBuilder: (context,index){
          //     final task=taskProvider.tasks[index];
          //       return ListTile(
          //         title: Text(task.title!),
          //       );
          // }),
        );
      },
    );
  }
}

//---------click fab button-------------------------------------------------------------------->>>
///-------------Add Task---------------------------------------------------------->>>
// parent page--------------------------------------------------------------->>>
class ShowTasks extends StatefulWidget {
  const ShowTasks({super.key});

  @override
  State<ShowTasks> createState() => _ShowTasksState();
}

class _ShowTasksState extends State<ShowTasks> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (_) => TaskProvider(),
      builder: (context, child) {
        return Consumer<TaskProvider>(
          builder: (context, taskProvider, child) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
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
                          if (taskProvider.task_state ==
                              TaskStates.task_title) ...[
                            TaskTextField(
                              controller: taskProvider.titleController,
                              focusNode: taskProvider.titleFocus,
                              hintText: 'Do math homework',
                              onSubmitted: (String value) {
                                print("the task is completed");
                                if (value.isNotEmpty) {
                                  print("done task");
                                  taskProvider.changeCurrentStateOfTask(
                                    TaskStates.task_description,
                                  );
                                  print(taskProvider.titleController.text);
                                  print(taskProvider.task_state);
                                }
                              },
                            ),
                          ] else if (taskProvider.task_state ==
                              TaskStates.task_description) ...[
                            TaskTextField(
                              controller: taskProvider.descController,
                              focusNode: taskProvider.descFocus,
                              hintText: 'Do math homework',
                              onSubmitted: (value) {},
                            ),
                            Text(taskProvider.titleController.text),
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
            );
          },
        );
      },
    );
  }
}

void showAddTaskDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return ChangeNotifierProvider<TaskProvider>(
        create: (_) => TaskProvider(),
        builder: (context, child) {
          return Consumer<TaskProvider>(
            builder: (context, taskProvider, child) {

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
                                if (taskProvider.task_state ==
                                    TaskStates.task_title) ...[
                                  TaskTextField(
                                    controller: taskProvider.titleController,
                                    focusNode: taskProvider.titleFocus,
                                    hintText: 'Do math homework',
                                    onSubmitted: (String value) {
                                      print("the task is completed");
                                      if (value.isNotEmpty) {
                                        print("done task");
                                        taskProvider.changeCurrentStateOfTask(
                                          TaskStates.task_description,
                                        );
                                        print(
                                          taskProvider.titleController.text,
                                        );
                                        print(taskProvider.task_state);
                                      }
                                    },
                                  ),
                                  Text(
                                    ' Description',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Color.fromRGBO(175, 175, 175, 1),
                                    ),
                                  ),
                                ] else if (taskProvider.task_state ==
                                    TaskStates.task_description) ...[
                                  Text(taskProvider.titleController.text,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                  Text(
                                    ' Description',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Color.fromRGBO(175, 175, 175, 1),
                                    ),
                                  ),
                                  TaskTextField(
                                    controller: taskProvider.descController,
                                    focusNode: taskProvider.descFocus,
                                    hintText: 'Add A description',
                                    onSubmitted: (value) {},
                                  ),
                                ],

                                SizedBox(height: 20),

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

///--------Empty Home Page-------------------------------------------------------------------------------------->
///
class EmptyHomePage extends StatefulWidget {
  const EmptyHomePage({super.key});

  @override
  State<EmptyHomePage> createState() => _EmptyHomePageState();
}

class _EmptyHomePageState extends State<EmptyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

///----------Home isNot Empty----------------------------------------------------------------------------------->

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        print('hey bloody fool');
        return ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            final task = taskProvider.tasks[index];
            return Container(
              height: 48,
              width: 327,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color.fromRGBO(29, 29, 29, 1),
                border: Border.all(
                  color: Color.fromRGBO(151, 151, 151, 1),
                  width: 0.8,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/search.svg'),
                  SizedBox(width: 10),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Search for your task...',
                  //     hintStyle: TextStyle(
                  //       color: Color.fromRGBO(175, 175, 175, 1),
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w600,
                  //     )
                  //   ),
                  // ),
                  Text(
                    'Search for your task...',
                    style: TextStyle(
                      color: Color.fromRGBO(175, 175, 175, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

/// -------------------Task Priority----------------------------------------------------------------------------------->>>

void showTaskPriorityDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return ChangeNotifierProvider<TaskProvider>(
        create: (_) => TaskProvider(),
        builder: (context, child) {
          return Consumer<TaskProvider>(
            builder: (context,taskProvider,child) {
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
                        children: [
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
                                return InkWell(
                                  onTap: (){
                                    taskProvider.taskPrority=index;
                                    print("this from priority side task adding function after ${taskProvider.taskPrority}");
                                    print(taskProvider.titleController.text);
                                    print(taskProvider.descController.text);
                                    print(taskProvider.dateTime);
                                    print(taskProvider.taskPrority);




                                   final taskModel= TaskModel(title: taskProvider.titleController.text, description: taskProvider.descController.text, createdAt: DateTime.now(), endedDate: taskProvider.dateTime, priority: taskProvider.taskPrority, category: "normal ")    ;
                                   print("taskModel current final ${taskModel.title}");
                                   taskProvider.addToTask(taskModel);
                                    Navigator.of(context).popUntil((route)=>route.isFirst);
                                  },
                                  child: Container(
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
            }
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
      return ChangeNotifierProvider<TaskProvider>(
        create: (_) => TaskProvider(),
        builder: (context, child) {
          return Consumer<TaskProvider>(
            builder: (context,taskProvider,child) {
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
                              headerHelpStyle: TextStyle(color: Colors.red),
                              backgroundColor: Color(0xff363636),
                              headerBackgroundColor: Colors.white,
                              headerForegroundColor: Colors.white,
                              dayBackgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(39, 39, 39, 1),
                              ),
                              dayShape: WidgetStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
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
                              yearBackgroundColor: WidgetStatePropertyAll<Color>(
                                Colors.white,
                              ),
                              yearStyle: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.87),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            child: CalendarDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2027),
                              onDateChanged: (datetime) {
                             taskProvider.dateTime=datetime.day;
                             print("this from calendar state of task ${taskProvider.dateTime} selected datetime is ${datetime.day}");
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 48,
                                  width: 153,
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
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                if(taskProvider.dateTime==0){
                                  taskProvider.dateTime=DateTime.now().day;
                                }
                                  print("this from calendar state of task ${taskProvider.dateTime} ");
                                  showTimerDialog(context);
                                },
                                child: Container(
                                  height: 48,
                                  width: 153,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(134, 135, 231, 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Choose Time',
                                      style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          );
        },
      );
    },
  );
}

///--------------------------Timer------------------------------------------------------------->>
///

void  showTimerDialog(BuildContext context) {

  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return ChangeNotifierProvider<TaskProvider>(
        create: (_) => TaskProvider(),
        builder: (context, child) {
          return Consumer<TaskProvider>(
            builder: (context,taskProvider,child) {
              return Material(
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 250,
                      width: 327,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(54, 54, 54, 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          //---- Header-------------------------------------------------------------->>
                          Text(
                            'Choose Time',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 255, 255, 0.87),
                            ),
                          ),
                          SizedBox(height: 8),
                          Divider(
                            thickness: 1.5,
                            color: Color.fromRGBO(151, 151, 151, 1),
                            indent: 10,
                            endIndent: 10,
                          ),
                          SizedBox(height: 10),
                          //---Scrollable Picker Row----------------------------------------------------------------------->
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildScrollTimer(
                                  currentValue: taskProvider.selectedHour,
                                  itemCount: 12,
                                  offSet: 1,
                                  onChanged: (val) => taskProvider.selectedHour = val + 1,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  ':',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.87),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 15),
                                buildScrollTimer(
                                  currentValue: taskProvider.selectedMinute,
                                  itemCount: 60,
                                  onChanged: (val) => taskProvider.selectedMinute = val,
                                  offSet: 0,
                                ),
                                SizedBox(width: 15),
                                buildScrollTimer(
                                  currentValue: taskProvider.selectedPeriod == 'AM' ? 0 : 1,
                                  itemCount: 2,
                                  isPeriod: true,
                                  onChanged: (val) =>
                                      taskProvider.selectedPeriod = val == 0 ? 'AM' : 'PM',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          //------------Action Button---------------------------------->>
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 48,
                                  width: 153,
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
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  showTaskPriorityDialog(context);
                                },
                                child: Container(
                                  height: 48,
                                  width: 153,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(134, 135, 231, 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          );
        },
      );
    },
  );
}
