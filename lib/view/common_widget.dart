import 'package:flutter/material.dart';

class TaskSection extends StatefulWidget {

  const TaskSection({ super.key});

  @override
  State<TaskSection> createState() => _TaskSectionState();
}

class _TaskSectionState extends State<TaskSection> {
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
//---------------------Fab--------------------------------------------->
