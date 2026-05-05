import 'package:flutter/material.dart';
import 'package:todolist/view/Register.dart';
import 'package:todolist/view/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios_sharp, color: Color.fromRGBO(255, 255, 255, 1),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 255, 255, 0.87),
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 25),

                  //username
                  Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 0.87),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                      border: Border.all(
                        color: Color.fromRGBO(151, 151, 151, 1),
                        width: 2,
                      ),
                    ),
                    child: TextFormField(
                      decoration:  InputDecoration(
                        hintText: "Enter your Username",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  //password
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 0.87),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                      border: Border.all(
                        color: Color.fromRGBO(151, 151, 151, 1),
                        width: 2,
                      ),
                    ),
                    child: TextFormField(
                      decoration:  InputDecoration(
                        hintText: "••••••••••••",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  //login button
                  SizedBox(height: 100),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(136, 117, 255, 1),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Divider with "or"
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color.fromRGBO(151, 151, 151, 1),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color.fromRGBO(151, 151, 151, 1),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // login with google
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                      border: Border.all(
                        color: Color.fromRGBO(136, 117, 255, 1),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/google2.png',height: 24, width: 24,),
                        SizedBox(width: 10,),
                        Text('Login with Google', style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.87), fontSize: 16
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  //login with appe
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                      border: Border.all(
                        color: Color.fromRGBO(136, 117, 255, 1),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Image.asset('assets/icons/apple.png',height: 25, width: 25,),
                        SizedBox(width: 5,),
                        Text('Login with Appe', style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.87),
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 55,),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                      },
                      child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400,),
                            children: [
                                TextSpan(text: 'Don’t have an account? ', style: TextStyle(color: Color.fromRGBO(131, 129, 129, 0.8705882352941177))),
                                TextSpan(text: 'Register', style: TextStyle(color: Colors.white70)),
                            ]
                          )
                      ),
                    ),
                  )


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
