import 'package:flutter/material.dart';
import 'package:todolist/view/common_widget.dart';
import 'package:todolist/view/settings.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 15,),
            //------Task Section-------------------------------------------->
            Row(children: [TaskSection(), TaskSection()]),
            SizedBox(height: 30,),
            //-----------Setting Section---------------------------------------->
            SectionLabel(label: 'Settings',),
            ProfileMenuItem(
                icon: Icons.settings,
                title: 'App Settings',
                ontap: (){
                  //nav to new Page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Settings();
                    },
                  ));
                },),
            SizedBox(height: 15,),
            SectionLabel(label: 'Account'),
            ProfileMenuItem(
                icon: Icons.person,
                title: 'Change account name',
                ontap: (){

showMyDialog(context);
                }
            ),
            ProfileMenuItem(
                icon: Icons.key,
                title: 'Change account password',
                ontap: (){
                },
            ),
            ProfileMenuItem(
                icon: Icons.camera_alt,
                title: 'Change account image',
                ontap: (){}
            ),
            SizedBox(height: 15,),
            SectionLabel(label: 'Uptodo'),
            ProfileMenuItem(
                icon: Icons.apps_sharp,
                title: 'About Us',
                ontap: (){
                }),
            ProfileMenuItem(
                icon: Icons.info_rounded,
                title: 'FAQ',
                ontap: (){}
            ),
            ProfileMenuItem(
                icon: Icons.help_outlined,
                title: 'help & Feedback',
                ontap: (){}),
            ProfileMenuItem(
                icon: Icons.thumb_up_outlined,
                title: 'Support US',
                ontap: (){}),
            logOutMenuItem(
              icon: Icons.logout,
              title: 'Log out',
              ontap: () {  },)





          ],
        ),
      ),
    );
  }
}

//----------------------------Alert Dialog Settings---> change Account---------------------------->
void showMyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap a button to close
    builder: (BuildContext context) {
      return
      Center(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Color.fromRGBO(54, 54, 54, 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Text('Change account name', style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color.fromRGBO(255, 255, 255, 0.87),
              ),),
              SizedBox(height: 4,),
              Divider(
                color: Color.fromRGBO(151, 151, 151, 1),
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 43,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color.fromRGBO(151, 151, 151, 1),
                  )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                         color:  Color.fromRGBO(153, 153, 153, 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(child: Text('Cancel', style: TextStyle(
                        color:  Color.fromRGBO(134, 135, 231, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),)),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color:  Color.fromRGBO(134, 135, 231, 1),
                          borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(child: Text('Edit', style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1)
                      ),)),
                    ),
                  ],
                ),
              )

            ],
          ),




        ),
      );

    },
  );
}



