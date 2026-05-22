import 'package:flutter/material.dart';
import 'package:todolist/view/common_widget.dart';
import 'package:todolist/view/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String accountName = 'Martha Hays';
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
                child:  Text(
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
            SizedBox(height: 15),
            //------Task Section-------------------------------------------->
            Row(children: [TaskSection(), TaskSection()]),
            SizedBox(height: 30),
            //-----------Setting Section---------------------------------------->
            SectionLabel(label: 'Settings'),
            ProfileMenuItem(
              icon: Icons.settings,
              title: 'App Settings',
              ontap: () {
                //nav to new Page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Settings();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            SectionLabel(label: 'Account'),
            ProfileMenuItem(
              icon: Icons.person,
              title: 'Change account name',
              ontap: () {
                showChangeAccountNameDialog( context: context, currentName: accountName,
                    onNameChanged: (newName) {
                  setState(() {
                    accountName = newName;
                  });
                    });
              },
            ),
            ProfileMenuItem(
              icon: Icons.key,
              title: 'Change account password',
              ontap: () {
                showChangeAccountPasswordDialog(context);
              },
            ),
            ProfileMenuItem(
              icon: Icons.camera_alt,
              title: 'Change account image',
              ontap: () {
                showCustomBottomSheet(context);
              },
            ),
            SizedBox(height: 15),
            SectionLabel(label: 'Uptodo'),
            ProfileMenuItem(
              icon: Icons.apps_sharp,
              title: 'About Us',
              ontap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.info_rounded,
              title: 'FAQ',
              ontap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.help_outlined,
              title: 'help & Feedback',
              ontap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.thumb_up_outlined,
              title: 'Support US',
              ontap: () {},
            ),
            logOutMenuItem(icon: Icons.logout, title: 'Log out', ontap: () {}),
          ],
        ),
      ),
    );
  }
}

///----------------------------Alert Dialog Settings---> change Account---------------------------->
void showChangeAccountNameDialog({ required BuildContext context, required String currentName, required Function(String) onNameChanged}) {
  final TextEditingController controller = TextEditingController(text: currentName);
//String accountName = 'Martha Hays';
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
                    height: 45,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color.fromRGBO(151, 151, 151, 1),
                      )
                    ),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(255, 255, 255, 0.87),
                          )
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 53,
                            width: 150,
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
                        SizedBox(width: 15,),
                        InkWell(
                          onTap: (){
                            onNameChanged(controller.text);
                            Navigator.pop(context);

                          },
                          child: Container(
                            height: 53,
                            width: 150,
                            decoration: BoxDecoration(
                                color:  Color.fromRGBO(134, 135, 231, 1),
                                borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(child: Text('Edit', style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)
                            ),)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

///---------------Change Account Password------------------------------------------------------------------------>>>


void showChangeAccountPasswordDialog(BuildContext context) {
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
                    Text('Change account password', style: TextStyle(
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
                      height: 10,
                    ),
                    /////-------Password----------------------------------------------------------->>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter old password', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),),
                       SizedBox(height: 10,),
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
                                hintText: ' ******',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text('Enter new password', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),),
                       SizedBox(height: 10,),
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
                                hintText: ' ******',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.87),
                                )
                            ),
                          ),
                        ),

                      ],
                    ),
                    //----------------------------------------------------------------------------->
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 53,
                              width: 150,
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
                          SizedBox(width: 15,),
                          Container(
                            height: 53,
                            width: 150,
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
            ),
          ),
        );
    },
  );
}
///--------------------Change Account Image----------------------------------------------------------------->
///
///

void showCustomBottomSheet (BuildContext context) {
  showModalBottomSheet(
    context : context,
    isDismissible: true,
    backgroundColor: Colors.transparent,
    builder: (context) => CustomBottomSheet(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    )
  );
}

//---------------customBottomSheet----------------------------------------------------->
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 250,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(54, 54, 54, 1),
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Change account Image', style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.87),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),),
            Divider(
              color: Color.fromRGBO(151, 151, 151, 1),
              indent: 15,
              endIndent: 15,
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text('Take picture', style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromRGBO(255, 255, 255, 0.87),
              ),),
              onTap: (){
              },
            ),
            ListTile(
              title: Text('Import from gallery', style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromRGBO(255, 255, 255, 0.87),
              ),),
            ),
            ListTile(
              title: Text('Import from Google Drive', style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromRGBO(255, 255, 255, 0.87),
              ),),
            ),

          ],
        ),
      ),
    );
  }
}




