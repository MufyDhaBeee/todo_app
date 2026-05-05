import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: Column(
        children: [
          // SizedBox(height: 20,),
          // ----- Header -------------------------------------------------------->
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 16),
            child: Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.87),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          //-circle avatar------------------------------------------------------------>
          CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage('assets/images/profile_pic.png'),
          ),
          const SizedBox(height: 12),
          //--Text---------------------------------------------------------->
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 16),
            child: Center(
              child: Text(
                'Martha Hays',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.87),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          //------Task Container-------------------------------------------->
          Row(children: [TaskSection(), TaskSection()]),
        ],
      ),
    );
  }
}

class TaskSection extends StatefulWidget {
  const TaskSection({super.key});

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
          height: 85,
          decoration: BoxDecoration(
            color: Color.fromRGBO(54, 54, 54, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text('10 Task left', style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}
