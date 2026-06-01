import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/task_model.dart';
import 'package:todolist/model/task_states.dart';
import 'package:todolist/view/home.dart';
import 'package:todolist/viewmodel/task_provider.dart';

class TaskSection extends StatefulWidget {

  const TaskSection({ super.key});

  @override
  State<TaskSection> createState() => TaskSectionState();
}

class TaskSectionState extends State<TaskSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color.fromRGBO(54, 54, 54, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(child: Text('10 Task left', style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}

// -------------------SectionLabel--------------------------------------->

class SectionLabel extends StatelessWidget {
  final String label;
  const SectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only( right: 280),
      child: Text(label, style: TextStyle(
        color: Color.fromRGBO(175, 175, 175, 1),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback ontap;

  const ProfileMenuItem({super.key, required this.icon, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ListTile(
        leading: Icon(icon, color: Color.fromRGBO(255, 255, 255, 0.87), size: 22),
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.87),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(255, 255, 255, 0.87)),
        onTap: ontap,
      ),
    );
  }
}
//-----------------logout section----------------------------------------------->
class logOutMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback ontap;

  const logOutMenuItem({super.key, required this.icon, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ListTile(
        leading: Icon(icon, color: Color.fromRGBO(255, 73, 73, 1), size: 22),
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(255, 73, 73, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),


      ),
    );
  }
}
//-----Toolbar row (Add Task)---------------------------------------------------------------------------------->

class ToolbarRow extends StatelessWidget {
  const ToolbarRow();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context,taskProvider,child) {
        return Row(
          children: [
            ToolbarIconButton(image: SvgPicture.asset('assets/icons/timer.svg'), onTap: () {
              showCalenderDialog(context);
            },),
            const SizedBox(width: 20),
             ToolbarIconButton(image: SvgPicture.asset('assets/icons/tag.svg'), onTap: () {
               showCategoryDialog(context);
             }),
            const SizedBox(width: 20),
            ToolbarIconButton(image: SvgPicture.asset('assets/icons/flag.svg'), onTap: () {
              showTaskPriorityDialog(context);
            }),
            const Spacer(),
            // Send button
            GestureDetector(
              onTap: () {
                switch(taskProvider.task_state){

                  case TaskStates.task_title:
                    print(" current task title ${taskProvider.titleController.text}");
                    taskProvider.changeCurrentStateOfTask(TaskStates.task_description);

                  case TaskStates.task_description:
                    taskProvider.description = taskProvider.descController.text;
                    print(" current task description ${taskProvider.descController.text}");

                    showCalenderDialog(context);
                    taskProvider.changeCurrentStateOfTask(TaskStates.task_calendar);
                    // TODO: Handle this case.
                  // case TaskStates.task_calendar:
                  //   showTimerDialog(context);
                  //   taskProvider.changeCurrentStateOfTask(TaskStates.task_time);
                  //
                  //   // TODO: Handle this case.
                  // case TaskStates.task_time:
                  //   showTaskPriorityDialog(context);
                  //   taskProvider.changeCurrentStateOfTask(TaskStates.task_proirity);
                  //
                  // case TaskStates.task_proirity:
                  //   showCategoryDialog(context);
                  //   taskProvider.changeCurrentStateOfTask(TaskStates.task_category);
                  //
                  // case TaskStates.task_category:
                  //
                  //   taskProvider.addToTask(TaskModel(title: taskProvider.titleController.text, description: taskProvider.descController.text, createdAt: DateTime.now(), endedDate: DateTime.now(), priority: 0, category: "dsfds"));
default:
  print("something");
                }

        },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset('assets/icons/send.svg'
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}


//---------- Reusable Task Text Field ------------------------------------------------------------------------->

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
    required this.focusNode,
    required this.hintText,
    required this.onSubmitted,
  });

  final FocusNode focusNode;
  final String hintText;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(54, 54, 54, 1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
            color: const Color.fromRGBO(151, 151, 151, 1),
            width: 1,),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: TextField(

        focusNode: focusNode,
        onSubmitted: onSubmitted,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.87), fontSize: 18, fontWeight: FontWeight.w400),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}

/// A tappable icon button used in the toolbar----------------------------------->
//-------------------Add Task------------------------------------------------------------------------------------->
class ToolbarIconButton extends StatelessWidget {
  const ToolbarIconButton({
    super.key,
    required this.image,
    required this.onTap,
  });

 final SvgPicture  image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: image,
    );
  }
}
///-----------Category------------------------------------------------------>>>
//-----Reuseable category tile-------------------------------------->>>

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: Color.fromRGBO(204, 255, 128, 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: SvgPicture.asset('assets/icons/grocery.svg'),
          ),
        ),
        const SizedBox(height: 6),
        Text(
         "Grocery",
          style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],


    );
  }
}

///-----------Choose Timer-------------------------------------------------------------------------------------->>
///

Widget buildScrollTimer({
  required int currentValue,
  required int itemCount,
  int offSet = 0,
  bool isPeriod = false,
  required ValueChanged<int> onChanged,
}) {
  return Container(
    height: 64,
    width: 64,
    decoration: BoxDecoration(
      color: Color.fromRGBO(39, 39, 39, 1),
      borderRadius: BorderRadius.circular(4),
    ),
child: ListWheelScrollView.useDelegate(
    itemExtent: 32,
    perspective: 0.005,
    diameterRatio: 1.2,
    physics: FixedExtentScrollPhysics(),
    controller: FixedExtentScrollController(
      initialItem: isPeriod ? currentValue : (currentValue - offSet),
    ),
    onSelectedItemChanged: onChanged,
    childDelegate: ListWheelChildBuilderDelegate(
        childCount: itemCount,
        builder: (context, index) {
          String text;
          if (isPeriod){
            text = index == 0 ? 'AM' : 'PM';
          }else{
            int actualValue = index + offSet;
            text = actualValue.toString().padLeft(2, '0');
          }
          return Center(
            child: Text(text, style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(255, 255, 255, 0.87),
            ),),


    );}
),




  ));
}


// ---- Category Chip ------------------------------------------------------------------------------------

class CategoryChip extends StatelessWidget {
  late final String label;
  late final IconData icon;
  late final Color color;

  CategoryChip({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(128, 156, 255, 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 13),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
//-----Priority Badge-------------------------------------------------------------------------

class PriorityBadge extends StatelessWidget {
  final int priority;

  const PriorityBadge({required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(4),
        border: Border.all(
            width: 2,
            color:Color.fromRGBO(134, 135, 231, 1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.flag_outlined, color: Color.fromRGBO(255, 255, 255, 1), size: 13),
          const SizedBox(width: 3),
          Text(
            '$priority',
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
