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
// ─── Toolbar row ──────────────────────────────────────────────────────────────

class ToolbarRow extends StatelessWidget {
  const ToolbarRow();

  @override
  Widget build(BuildContext context) {


    return Row(
      children: [
        ToolbarIconButton(icon: Icons.timer_outlined, onTap: () {}),
        const SizedBox(width: 18),
        ToolbarIconButton(icon: Icons.sell_outlined, onTap: () {}),
        const SizedBox(width: 18),
        ToolbarIconButton(icon: Icons.flag_outlined, onTap: () {}),
        const Spacer(),
        // Send button
        GestureDetector(
          onTap: () {
    // final p = context.read<AddTaskProvider>();
    // if (p.step == 1) {
    // p.submitTitle();
    // } else {
    // p.submitTask(context);
    // }
    },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.send,
              color: Color(0xFF7B6EF6),
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}


// ─── Reusable Task Text Field ─────────────────────────────────────────────────

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
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF3A3A3C), width: 0.8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onSubmitted: onSubmitted,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white38, fontSize: 16),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}

/// A tappable icon button used in the toolbar.
class ToolbarIconButton extends StatelessWidget {
  const ToolbarIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white54, size: 22),
    );
  }
}