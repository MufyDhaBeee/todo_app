import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todolist/view/home.dart';

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
    return Row(
      children: [
        ToolbarIconButton(image: SvgPicture.asset('assets/icons/timer.svg'), onTap: () {},),
        const SizedBox(width: 20),
         ToolbarIconButton(image: SvgPicture.asset('assets/icons/tag.svg'), onTap: () {}),
        const SizedBox(width: 20),
        ToolbarIconButton(image: SvgPicture.asset('assets/icons/flag.svg'), onTap: () {
          showTaskPriorityDialog(context);
        }),
        const Spacer(),
        // Send button
        GestureDetector(
          onTap: () {
            // switch(index){
            //   case 0:
            //     showAddTaskDescriptionDialog(context);
            //     index++
            //         break;
            //   case 2:
            //     calendarPopip()
            //         break
            //   case 3:


            //}
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
}


//---------- Reusable Task Text Field ------------------------------------------------------------------------->

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.onSubmitted,
  });

  final TextEditingController controller;
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
        controller: controller,

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


